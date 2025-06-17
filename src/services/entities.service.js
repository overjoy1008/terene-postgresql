import db from "../models/db.js"

const TABLE_MAP = {
    orders: "orders_250618",
    payments: "order_payments_250618",
    settlements: "order_settlements_250618",
    cancellations: "order_cancellations_250618",
    refunds: "order_refunds_250618",
    mileages: "mileages_250618",
    coupon_definitions: "coupon_definitions_250618",
    coupon_instances: "coupon_instances_250618",
}

// 자동 변환 도우미
function parseField(value) {
    if (value === null || value === undefined) return null

    // Boolean
    if (value === "true") return true
    if (value === "false") return false

    // JSON
    if (typeof value === "string" && value.trim().startsWith("{") || value.trim().startsWith("[")) {
        try {
            return JSON.parse(value)
        } catch {
            return value // fallback
        }
    }

    // Numeric
    const number = parseFloat(value)
    if (!isNaN(number) && value.trim().match(/^[0-9.\-]+$/)) {
        return number
    }

    // Timestamp → 그대로 문자열로 처리
    return value
}

function sanitizeData(data) {
    const sanitized = {}
    for (const key in data) {
        sanitized[key] = parseField(data[key])
    }
    return sanitized
}

export async function getAll(type) {
    const table = TABLE_MAP[type]
    if (!table) throw new Error("Invalid entity type")
    const result = await db.query(`SELECT * FROM ${table}`)
    return result.rows
}

export async function getById(type, idField, idValue) {
    const table = TABLE_MAP[type]
    if (!table) throw new Error("Invalid entity type")
    const result = await db.query(`SELECT * FROM ${table} WHERE ${idField} = $1`, [idValue])
    return result.rows[0] || null
}

export async function insertOrUpdate(type, rawData, idField) {
    const table = TABLE_MAP[type]
    if (!table) throw new Error("Invalid entity type")

    const data = sanitizeData(rawData)
    const keys = Object.keys(data)
    const values = Object.values(data)
    const placeholders = keys.map((_, i) => `$${i + 1}`).join(", ")
    const updates = keys.map((key) => `${key} = EXCLUDED.${key}`).join(", ")

    const query = `
        INSERT INTO ${table} (${keys.join(", ")})
        VALUES (${placeholders})
        ON CONFLICT (${idField}) DO UPDATE SET ${updates}
    `
    await db.query(query, values)
}

export async function deleteById(type, idField, idValue) {
    const table = TABLE_MAP[type]
    if (!table) throw new Error("Invalid entity type")
    await db.query(`DELETE FROM ${table} WHERE ${idField} = $1`, [idValue])
}
