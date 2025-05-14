import db from "../models/db.js"

export async function getOrders() {
    const result = await db.query("SELECT * FROM orders ORDER BY order_id ASC")
    return result.rows
}

export async function insertOrder(order) {
    const {
        order_id,
        membership_number,
        order_product,
        payment_status,
        payment_timeline,
        stay_timeline,
        start_date,
        end_date,
        reserver_name,
        reserver_birthdate,
        reserver_contact,
        reserver_email,
        order_details,
        adult,
        child,
        final_price,
        receipt,
        coupons
    } = order

    if (!order_id || !order_product || !payment_status || !payment_timeline || !stay_timeline || !order_details || !receipt || !start_date || !end_date || final_price === undefined || adult === undefined || child === undefined) {
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

    const parsedPaymentTimeline = parseJSON(payment_timeline, "payment_timeline")
    const parsedStayTimeline = parseJSON(stay_timeline, "stay_timeline")
    const parsedOrderDetails = parseJSON(order_details, "order_details")
    const parsedReceipt = parseJSON(receipt, "receipt")
    const parsedCoupons = coupons ? parseJSON(coupons, "coupons") : null

    const query = `
        INSERT INTO orders (
            order_id,
            membership_number,
            order_product,
            start_date,
            end_date,
            reserver_name,
            reserver_birthdate,
            reserver_contact,
            reserver_email,
            payment_status,
            payment_timeline,
            stay_status,
            stay_timeline,
            adult,
            child,
            order_details,
            final_price,
            receipt,
            coupons
        ) VALUES (
            $1, $2, $3, $4, $5, $6, $7, $8, $9,
            $10, $11::jsonb, 'before_checkin', $12::jsonb,
            $13, $14, $15::jsonb, $16, $17::jsonb, $18::jsonb
        )
    `

    const values = [
        order_id,
        membership_number || null,
        order_product,
        start_date,
        end_date,
        reserver_name,
        reserver_birthdate,
        reserver_contact,
        reserver_email,
        payment_status,
        JSON.stringify(parsedPaymentTimeline),
        JSON.stringify(parsedStayTimeline),
        adult,
        child,
        JSON.stringify(parsedOrderDetails),
        final_price,
        JSON.stringify(parsedReceipt),
        parsedCoupons ? JSON.stringify(parsedCoupons) : null
    ]

    await db.query(query, values)
}

export async function upsertOrder(order) {
    const {
        order_id,
        membership_number,
        order_product,
        payment_status,
        payment_timeline,
        stay_timeline,
        start_date,
        end_date,
        reserver_name,
        reserver_birthdate,
        reserver_contact,
        reserver_email,
        order_details,
        adult,
        child,
        final_price,
        receipt,
        coupons
    } = order

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

    const parsedPaymentTimeline = parseJSON(payment_timeline, "payment_timeline")
    const parsedStayTimeline = parseJSON(stay_timeline, "stay_timeline")
    const parsedOrderDetails = parseJSON(order_details, "order_details")
    const parsedReceipt = parseJSON(receipt, "receipt")
    const parsedCoupons = coupons ? parseJSON(coupons, "coupons") : null

    const query = `
        INSERT INTO orders (
            order_id,
            membership_number,
            order_product,
            start_date,
            end_date,
            reserver_name,
            reserver_birthdate,
            reserver_contact,
            reserver_email,
            payment_status,
            payment_timeline,
            stay_status,
            stay_timeline,
            adult,
            child,
            order_details,
            final_price,
            receipt,
            coupons
        ) VALUES (
            $1, $2, $3, $4, $5, $6, $7, $8, $9,
            $10, $11::jsonb, 'before_checkin', $12::jsonb,
            $13, $14, $15::jsonb, $16, $17::jsonb, $18::jsonb
        )
        ON CONFLICT (order_id) DO UPDATE SET
            membership_number = EXCLUDED.membership_number,
            order_product = EXCLUDED.order_product,
            start_date = EXCLUDED.start_date,
            end_date = EXCLUDED.end_date,
            reserver_name = EXCLUDED.reserver_name,
            reserver_birthdate = EXCLUDED.reserver_birthdate,
            reserver_contact = EXCLUDED.reserver_contact,
            reserver_email = EXCLUDED.reserver_email,
            payment_status = EXCLUDED.payment_status,
            payment_timeline = EXCLUDED.payment_timeline,
            stay_timeline = EXCLUDED.stay_timeline,
            adult = EXCLUDED.adult,
            child = EXCLUDED.child,
            order_details = EXCLUDED.order_details,
            final_price = EXCLUDED.final_price,
            receipt = EXCLUDED.receipt,
            coupons = EXCLUDED.coupons
    `

    const values = [
        order_id,
        membership_number || null,
        order_product,
        start_date,
        end_date,
        reserver_name,
        reserver_birthdate,
        reserver_contact,
        reserver_email,
        payment_status,
        JSON.stringify(parsedPaymentTimeline),
        JSON.stringify(parsedStayTimeline),
        adult,
        child,
        JSON.stringify(parsedOrderDetails),
        final_price,
        JSON.stringify(parsedReceipt),
        parsedCoupons ? JSON.stringify(parsedCoupons) : null
    ]

    await db.query(query, values)
}

export async function removeOrder(orderId) {
    await db.query("DELETE FROM orders WHERE order_id = $1", [orderId])
}
