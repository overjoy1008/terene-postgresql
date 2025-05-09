import db from "../models/db.js"

export async function getCoupons() {
    const result = await db.query("SELECT * FROM coupons ORDER BY id ASC")
    return result.rows
}

import db from "../models/db.js"

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
            JSON.parse(coupon.conditions_json) // 유효한지 확인
            conditionsJSON = coupon.conditions_json
        } catch {
            throw new Error("conditions_json is not valid JSON")
        }
    }

    // 4. allowed_members가 문자열인 경우 JSON으로 감싼다 (TEXT[] 컬럼용)
    let allowedMembers = null
    if (Array.isArray(coupon.allowed_members)) {
        allowedMembers = JSON.stringify(coupon.allowed_members)
    } else if (typeof coupon.allowed_members === "string") {
        try {
            const parsed = JSON.parse(coupon.allowed_members)
            if (!Array.isArray(parsed)) throw new Error()
            allowedMembers = coupon.allowed_members
        } catch {
            // 쉼표로 구분된 문자열이라면 수동으로 배열 처리
            const manuallyParsed = coupon.allowed_members
                .split(",")
                .map((v) => v.trim())
                .filter((v) => v.length > 0)
            allowedMembers = JSON.stringify(manuallyParsed)
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
