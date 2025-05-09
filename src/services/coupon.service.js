import db from "../models/db.js"

export async function getCoupons() {
    const result = await db.query("SELECT * FROM coupons ORDER BY id ASC")
    return result.rows
}

export async function addCoupon(coupon) {
    // 1. discount_value를 숫자로 변환
    const discountValue = Number(coupon.discount_value)
    if (isNaN(discountValue)) throw new Error("discount_value must be a number")

    // 2. enabled를 boolean으로 안전하게 처리
    const enabled =
        coupon.enabled === true || coupon.enabled === "true" ? true : false

    // 3. conditions_json이 객체면 JSON.stringify, 문자열이면 그대로, 그 외는 null
    let conditionsJSON = null
    if (typeof coupon.conditions_json === "object" && coupon.conditions_json !== null) {
        conditionsJSON = JSON.stringify(coupon.conditions_json)
    } else if (typeof coupon.conditions_json === "string") {
        try {
            const parsed = JSON.parse(coupon.conditions_json)
            if (typeof parsed !== "object" || parsed === null) {
                throw new Error("conditions_json must be a valid JSON object")
            }
            conditionsJSON = coupon.conditions_json
        } catch (err) {
            throw new Error("conditions_json is not valid JSON: " + err.message)
        }
    }

    // 4. allowed_members가 문자열인 경우 JSON으로 감싼다 (TEXT[] 컬럼용)
    let allowedMembers = null

    if (Array.isArray(coupon.allowed_members)) {
        allowedMembers = coupon.allowed_members // ✅ JS 배열이면 그대로 사용
    } else if (typeof coupon.allowed_members === "string") {
        const str = coupon.allowed_members.trim()

        // ✅ JSON 배열 문자열인 경우
        if (str.startsWith("[") && str.endsWith("]")) {
            try {
                const parsed = JSON.parse(str)
                if (Array.isArray(parsed)) allowedMembers = parsed
            } catch {
                throw new Error("allowed_members: Invalid JSON array string")
            }

        // ✅ PostgreSQL 배열 문자열인 경우: "{A,B,C}"
        } else if (str.startsWith("{") && str.endsWith("}")) {
            const inner = str.slice(1, -1)
            allowedMembers = inner
                .split(",")
                .map((s) => s.trim().replace(/^"(.*)"$/, "$1")) // 큰따옴표 제거
                .filter((s) => s.length > 0)

        // ✅ 그냥 쉼표로 나열된 일반 문자열인 경우: "A, B, C"
        } else {
            allowedMembers = str
                .split(",")
                .map((s) => s.trim())
                .filter((s) => s.length > 0)
        }
    }

    const query = `
        INSERT INTO coupons (
            id, name, description, display,
            discount_type, discount_value, scope,
            type, allowed_members, code,
            conditions_json, start_date, end_date, enabled
        ) VALUES (
            $1, $2, $3, $4,
            $5, $6, $7,
            $8, $9, $10,
            $11, $12, $13, $14
        )
        ON CONFLICT (id) DO UPDATE SET
            name = EXCLUDED.name,
            description = EXCLUDED.description,
            display = EXCLUDED.display,
            discount_type = EXCLUDED.discount_type,
            discount_value = EXCLUDED.discount_value,
            scope = EXCLUDED.scope,
            type = EXCLUDED.type,
            allowed_members = EXCLUDED.allowed_members,
            code = EXCLUDED.code,
            conditions_json = EXCLUDED.conditions_json,
            start_date = EXCLUDED.start_date,
            end_date = EXCLUDED.end_date,
            enabled = EXCLUDED.enabled
    `

    const values = [
        coupon.id,
        coupon.name,
        coupon.description || null,
        coupon.display,
        coupon.discount_type,
        discountValue,
        coupon.scope,
        coupon.type || null,
        allowedMembers,
        coupon.code || null,
        conditionsJSON,
        coupon.start_date || null,
        coupon.end_date || null,
        enabled,
    ]

    await db.query(query, values)
}


export async function removeCoupon(id) {
    await db.query("DELETE FROM coupons WHERE id = $1", [id])
}
