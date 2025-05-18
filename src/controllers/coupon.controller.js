export const insertCoupon = async (req, res) => {
    try {
        const coupon = req.body
        if (
            !coupon.id || !coupon.priority || !coupon.name || !coupon.description ||
            !coupon.discount_type || !coupon.discount_value || !coupon.scope
        ) {
            return res.status(400).json({ error: "Required fields are missing" })
        }

        await service.adjustPriorities(coupon.priority)
        await service.addCoupon(coupon)
        res.status(201).json({ message: "Coupon inserted" })
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}

export const upsertCoupon = async (req, res) => {
    try {
        const id = req.params.id
        const coupon = { ...req.body, id }

        await service.adjustPriorities(coupon.priority, id)
        await service.addCoupon(coupon)
        res.status(200).json({ message: "Coupon upserted" })
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}
