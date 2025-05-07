import db from "../models/db.js"

export async function getCustomers() {
    const result = await db.query("SELECT * FROM customers ORDER BY id ASC")
    return result.rows
}

export async function addCustomer(customer) {
    const query = `
        INSERT INTO customers (
            id, password, nationality, lastname, firstname,
            phone, email, address,
            occupation_category, occupation_detail,
            recommender_affiliation, recommender_name
        ) VALUES (
            $1, $2, $3, $4, $5,
            $6, $7, $8,
            $9, $10,
            $11, $12
        )
        ON CONFLICT (id) DO UPDATE SET
            password = EXCLUDED.password,
            nationality = EXCLUDED.nationality,
            lastname = EXCLUDED.lastname,
            firstname = EXCLUDED.firstname,
            phone = EXCLUDED.phone,
            email = EXCLUDED.email,
            address = EXCLUDED.address,
            occupation_category = EXCLUDED.occupation_category,
            occupation_detail = EXCLUDED.occupation_detail,
            recommender_affiliation = EXCLUDED.recommender_affiliation,
            recommender_name = EXCLUDED.recommender_name
    `
    const values = [
        customer.id, customer.password, customer.nationality,
        customer.lastname, customer.firstname,
        customer.phone, customer.email, customer.address,
        customer.occupation_category, customer.occupation_detail,
        customer.recommender_affiliation, customer.recommender_name
    ]
    await db.query(query, values)
}

export async function removeCustomer(id) {
    await db.query("DELETE FROM customers WHERE id = $1", [id])
}
