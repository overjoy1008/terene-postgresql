import * as service from "../services/coupon.service.js"

export const getAllCoupons = async (req, res) => {
    try {
        const data = await service.getCoupons()
        res.json(data)
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}

export const insertCoupon = async (req, res) => {
    try {
        const coupon = req.body
        if (!coupon.id || !coupon.name || !coupon.display || !coupon.discount_type || !coupon.discount_value || !coupon.scope) {
            return res.status(400).json({ error: "Required fields are missing" })
        }
        await service.addCoupon(coupon)
        res.status(201).json({ message: "Coupon inserted" })
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}

export const deleteCoupon = async (req, res) => {
    try {
        const id = req.params.id
        await service.removeCoupon(id)
        res.status(200).json({ message: `Deleted coupon ${id}` })
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}

export const upsertCoupon = async (req, res) => {
    try {
        const id = req.params.id
        const coupon = { ...req.body, id }
        await service.addCoupon(coupon)
        res.status(200).json({ message: "Coupon upserted" })
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}
