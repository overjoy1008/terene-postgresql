// src/services/day.service.js
import db from "../models/db.js"

export async function getDays() {
    const result = await db.query("SELECT * FROM days ORDER BY date ASC")
    return result.rows
}

export async function addDay({ date, category, is_holiday, is_occupied, occupied_order_id }) {
    await db.query(
        `INSERT INTO days (date, category, is_holiday, is_occupied, occupied_order_id)
         VALUES ($1, $2, $3, $4, $5)
         ON CONFLICT (date) DO UPDATE SET
            category = EXCLUDED.category,
            is_holiday = EXCLUDED.is_holiday,
            is_occupied = EXCLUDED.is_occupied,
            occupied_order_id = EXCLUDED.occupied_order_id`,
        [date, category, is_holiday, is_occupied, occupied_order_id]
    )
}

export async function removeDay(date) {
    await db.query("DELETE FROM days WHERE date = $1", [date])
}
