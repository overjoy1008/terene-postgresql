import db from "../models/db.js"

export async function getAllReservations() {
    const result = await db.query("SELECT * FROM reservations")
    return result.rows
}

export async function createReservation({ name, contact, people }) {
    await db.query(
        "INSERT INTO reservations (name, contact, people) VALUES ($1, $2, $3)",
        [name, contact, people]
    )
}
