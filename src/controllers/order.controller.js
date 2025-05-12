import * as service from "../services/order.service.js"

export const getAllOrders = async (req, res) => {
    try {
        const data = await service.getOrders()
        res.json(data)
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}

export const insertOrder = async (req, res) => {
    try {
        const order = req.body
        if (!order.order_id || !order.order_product || !order.payment_status || !order.date_info || !order.stay_date_range || !order.order_details || !order.price) {
            return res.status(400).json({ error: "Required fields are missing" })
        }
        await service.insertOrder(order)
        res.status(201).json({ message: "Order inserted" })
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}

export const deleteOrder = async (req, res) => {
    try {
        const id = req.params.id
        await service.removeOrder(id)
        res.status(200).json({ message: `Deleted order ${id}` })
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}

export const upsertOrder = async (req, res) => {
    try {
        const id = req.params.id
        const order = { ...req.body, order_id: id }
        await service.upsertOrder(order)
        res.status(200).json({ message: "Order upserted" })
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}