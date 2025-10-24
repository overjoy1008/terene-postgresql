// src/controllers/v3.controller.js

import * as service from "../services/v3.service.js"

const ID_FIELDS = {
    // orders: "order_id",
    // payments: "payment_id",
    // settlements: "settlement_id",
    // cancellations: "cancellation_id",
    // refunds: "refund_id",
    // mileages: "mileage_id",
    // coupon_definitions: "coupon_definition_id",
    // coupon_instances: "coupon_instance_id",
    // customers: "membership_number",

    locations: "name",
    admin_contacts: "admin_id",
    employees: "id",
    attendance: ["date", "location", "employee_id"], // Composite key
    managements: ["date", "location"],
    days_category: "eng_name",
    days_design: "object",
    days: "date_id",
    refund_policy: ["start_dday", "end_dday"],
    additional_services: "id",
    memberships: "name",
    settings: "id",
}

export const getAll = (type) => async (req, res) => {
    try {
        const data = await service.getAll(type)
        res.json(data)
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}

export const getById = (type) => async (req, res) => {
    try {
        const id = req.params.id
        const idField = ID_FIELDS[type]
        if (Array.isArray(idField)) {
            const ids = id.split(',')
            if (ids.length !== idField.length) {
                return res.status(400).json({ error: `Expected ${idField.length} keys: ${idField.join(', ')}` })
            }
            const data = await service.getById(type, idField, ids)
            if (!data) return res.status(404).json({ error: "Not found" })
            res.json(data)
        } else {
            const data = await service.getById(type, idField, id)
            if (!data) return res.status(404).json({ error: "Not found" })
            res.json(data)
        }
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}

export const insertOrUpdate = (type) => async (req, res) => {
    try {
        const idField = ID_FIELDS[type]
        const data = req.body
        if (Array.isArray(idField)) {
            const missingFields = idField.filter(field => !data[field])
            if (missingFields.length > 0) {
                return res.status(400).json({ error: `Missing fields: ${missingFields.join(', ')}` })
            }
        } else {
            if (!data[idField]) {
                return res.status(400).json({ error: `${idField} is required` })
            }
        }
        await service.insertOrUpdate(type, data, idField)
        res.status(200).json({ message: "Insert/Update successful" })
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}

export const deleteById = (type) => async (req, res) => {
    try {
        const id = req.params.id
        const idField = ID_FIELDS[type]
        if (Array.isArray(idField)) {
            const ids = id.split(',')
            if (ids.length !== idField.length) {
                return res.status(400).json({ error: `Expected ${idField.length} keys: ${idField.join(', ')}` })
            }
            await service.deleteById(type, idField, ids)
        } else {
            await service.deleteById(type, idField, id)
        }
        res.status(200).json({ message: `Deleted ${id}` })
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}
