import db from "../models/db.js"

export async function getCoupons() {
    const result = await db.query("SELECT * FROM coupons ORDER BY id ASC")
    return result.rows
}

export async function addCoupon(coupon) {
    const discountValue = Number(coupon.discount_value)
    if (isNaN(discountValue)) throw new Error("discount_value must be a number")

    const enabled =
        coupon.enabled === true || coupon.enabled === "true" ? true : false

    // ✅ conditions_json: JSON 배열로 처리
    let conditionsJSON = null
    if (Array.isArray(coupon.conditions_json)) {
        conditionsJSON = JSON.stringify(coupon.conditions_json)
    } else if (typeof coupon.conditions_json === "string") {
        try {
            const parsed = JSON.parse(coupon.conditions_json)
            if (!Array.isArray(parsed)) {
                throw new Error("conditions_json must be a JSON array")
            }
            conditionsJSON = coupon.conditions_json
        } catch (err) {
            throw new Error("conditions_json is not valid JSON array: " + err.message)
        }
    }

    // ✅ allowed_members 파싱
    let allowedMembers = null
    if (Array.isArray(coupon.allowed_members)) {
        allowedMembers = coupon.allowed_members
    } else if (typeof coupon.allowed_members === "string") {
        const str = coupon.allowed_members.trim()

        if (str.startsWith("[") && str.endsWith("]")) {
            try {
                const parsed = JSON.parse(str)
                if (Array.isArray(parsed)) allowedMembers = parsed
            } catch {
                throw new Error("allowed_members: Invalid JSON array string")
            }
        } else if (str.startsWith("{") && str.endsWith("}")) {
            const inner = str.slice(1, -1)
            allowedMembers = inner
                .split(",")
                .map((s) => s.trim().replace(/^"(.*)"$/, "$1"))
                .filter((s) => s.length > 0)
        } else {
            allowedMembers = str
                .split(",")
                .map((s) => s.trim())
                .filter((s) => s.length > 0)
        }
    }

    const query = `
        INSERT INTO coupons (
            id, name, description,
            discount_type, discount_value, scope,
            type, allowed_members, code,
            conditions_json, enabled
        ) VALUES (
            $1, $2, $3,
            $4, $5, $6,
            $7, $8, $9,
            $10, $11
        )
        ON CONFLICT (id) DO UPDATE SET
            name = EXCLUDED.name,
            description = EXCLUDED.description,
            discount_type = EXCLUDED.discount_type,
            discount_value = EXCLUDED.discount_value,
            scope = EXCLUDED.scope,
            type = EXCLUDED.type,
            allowed_members = EXCLUDED.allowed_members,
            code = EXCLUDED.code,
            conditions_json = EXCLUDED.conditions_json,
            enabled = EXCLUDED.enabled
    `

    const values = [
        coupon.id,
        coupon.name,
        coupon.description || null,
        coupon.discount_type,
        discountValue,
        coupon.scope,
        coupon.type || null,
        allowedMembers,
        coupon.code || null,
        conditionsJSON,
        enabled,
    ]

    await db.query(query, values)
}

export async function removeCoupon(id) {
    await db.query("DELETE FROM coupons WHERE id = $1", [id])
}
