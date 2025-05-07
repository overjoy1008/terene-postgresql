import * as service from "../services/customer.service.js"

export const getAllCustomers = async (req, res) => {
    try {
        const data = await service.getCustomers()
        res.json(data)
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}

export const insertCustomer = async (req, res) => {
    try {
        const customer = req.body
        if (!customer.id || !customer.password || !customer.nationality) {
            return res.status(400).json({ error: "Required fields are missing" })
        }
        await service.addCustomer(customer)
        res.status(201).json({ message: "Customer inserted" })
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}

export const deleteCustomer = async (req, res) => {
    try {
        const id = req.params.id
        await service.removeCustomer(id)
        res.status(200).json({ message: `Deleted customer with id ${id}` })
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}

export const upsertCustomer = async (req, res) => {
    try {
        const id = req.params.id
        const customer = { ...req.body, id }

        await service.addCustomer(customer)
        res.status(200).json({ message: "Customer upserted" })
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}
