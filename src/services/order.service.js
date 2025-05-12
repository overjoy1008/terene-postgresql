import db from "../models/db.js"

export async function getOrders() {
    const result = await db.query("SELECT * FROM orders ORDER BY order_id ASC")
    return result.rows
}

export async function insertOrder(order) {
    const {
        order_id,
        membership_number,
        nonmember_password,
        order_product,
        payment_status,
        date_info,
        stay_date_range,
        reserver_name,
        reserver_birthdate,
        reserver_contact,
        reserver_email,
        order_details,
        price,
        coupons
    } = order

    if (!order_id || !order_product || !payment_status || !date_info || !stay_date_range || !order_details || !price) {
        throw new Error("Required fields are missing")
    }

    // ✅ JSON 필드는 string이 들어오면 파싱
    const parseJSON = (input, fieldName) => {
        if (typeof input === "string") {
            try {
                return JSON.parse(input)
            } catch (err) {
                throw new Error(`${fieldName} is not valid JSON: ${err.message}`)
            }
        }
        return input
    }

    const parsedDateInfo = parseJSON(date_info, "date_info")
    const parsedStayDateRange = parseJSON(stay_date_range, "stay_date_range")
    const parsedOrderDetails = parseJSON(order_details, "order_details")
    const parsedPrice = parseJSON(price, "price")
    const parsedCoupons = coupons ? parseJSON(coupons, "coupons") : null

    const query = `
        INSERT INTO orders (
            order_id,
            membership_number,
            nonmember_password,
            order_product,
            payment_status,
            date_info,
            stay_date_range,
            reserver_name,
            reserver_birthdate,
            reserver_contact,
            reserver_email,
            order_details,
            price,
            coupons
        ) VALUES (
            $1, $2, $3, $4, $5, $6::jsonb, $7::jsonb, $8, $9, $10, $11, $12::jsonb, $13::jsonb, $14::jsonb
        )
    `

    const values = [
        order_id,
        membership_number || null,
        nonmember_password || null,
        order_product,
        payment_status,
        JSON.stringify(parsedDateInfo),
        JSON.stringify(parsedStayDateRange),
        reserver_name || null,
        reserver_birthdate || null,
        reserver_contact || null,
        reserver_email || null,
        JSON.stringify(parsedOrderDetails),
        JSON.stringify(parsedPrice),
        parsedCoupons ? JSON.stringify(parsedCoupons) : null
    ]

    await db.query(query, values)
}

export async function upsertOrder(order) {
    const {
        order_id,
        membership_number,
        nonmember_password,
        order_product,
        payment_status,
        date_info,
        stay_date_range,
        reserver_name,
        reserver_birthdate,
        reserver_contact,
        reserver_email,
        order_details,
        price,
        coupons
    } = order

    // ✅ JSON 필드는 string이 들어오면 파싱
    const parseJSON = (input, fieldName) => {
        if (typeof input === "string") {
            try {
                return JSON.parse(input)
            } catch (err) {
                throw new Error(`${fieldName} is not valid JSON: ${err.message}`)
            }
        }
        return input
    }

    const parsedDateInfo = parseJSON(date_info, "date_info")
    const parsedStayDateRange = parseJSON(stay_date_range, "stay_date_range")
    const parsedOrderDetails = parseJSON(order_details, "order_details")
    const parsedPrice = parseJSON(price, "price")
    const parsedCoupons = coupons ? parseJSON(coupons, "coupons") : null

    const query = `
        INSERT INTO orders (
            order_id,
            membership_number,
            nonmember_password,
            order_product,
            payment_status,
            date_info,
            stay_date_range,
            reserver_name,
            reserver_birthdate,
            reserver_contact,
            reserver_email,
            order_details,
            price,
            coupons
        ) VALUES (
            $1, $2, $3, $4, $5, $6::jsonb, $7::jsonb, $8, $9, $10, $11, $12::jsonb, $13::jsonb, $14::jsonb
        )
        ON CONFLICT (order_id) DO UPDATE SET
            membership_number = EXCLUDED.membership_number,
            nonmember_password = EXCLUDED.nonmember_password,
            order_product = EXCLUDED.order_product,
            payment_status = EXCLUDED.payment_status,
            date_info = EXCLUDED.date_info,
            stay_date_range = EXCLUDED.stay_date_range,
            reserver_name = EXCLUDED.reserver_name,
            reserver_birthdate = EXCLUDED.reserver_birthdate,
            reserver_contact = EXCLUDED.reserver_contact,
            reserver_email = EXCLUDED.reserver_email,
            order_details = EXCLUDED.order_details,
            price = EXCLUDED.price,
            coupons = EXCLUDED.coupons
    `

    const values = [
        order_id,
        membership_number || null,
        nonmember_password || null,
        order_product,
        payment_status,
        JSON.stringify(parsedDateInfo),
        JSON.stringify(parsedStayDateRange),
        reserver_name || null,
        reserver_birthdate || null,
        reserver_contact || null,
        reserver_email || null,
        JSON.stringify(parsedOrderDetails),
        JSON.stringify(parsedPrice),
        parsedCoupons ? JSON.stringify(parsedCoupons) : null
    ]

    await db.query(query, values)
}

export async function removeOrder(orderId) {
    await db.query("DELETE FROM orders WHERE order_id = $1", [orderId])
}
