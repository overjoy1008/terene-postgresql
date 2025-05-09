import db from "../models/db.js"

export async function getCoupons() {
    const result = await db.query("SELECT * FROM coupons ORDER BY id ASC")
    return result.rows
}

export async function addCoupon(coupon) {
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
        coupon.id, coupon.name, coupon.description, coupon.display,
        coupon.discount_type, coupon.discount_value, coupon.scope,
        coupon.type || null,
        coupon.allowed_members || null,
        coupon.code || null,
        coupon.conditions_json || null,
        coupon.start_date || null,
        coupon.end_date || null,
        coupon.enabled === "true" || coupon.enabled === true // <- 문자열일 수도 있음
    ]
    await db.query(query, values)
}

export async function removeCoupon(id) {
    await db.query("DELETE FROM coupons WHERE id = $1", [id])
}
