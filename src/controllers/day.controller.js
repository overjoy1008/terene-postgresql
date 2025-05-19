// src/controllers/day.controller.js
import * as service from "../services/day.service.js"

export const getAllDays = async (req, res) => {
    try {
        const data = await service.getDays()
        res.json(data)
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}

export const insertDay = async (req, res) => {
    try {
        const { date, category, is_holiday, checkin, checkout } = req.body

        if (!date || !category || is_holiday === undefined) {
            return res.status(400).json({ error: "date, category, and is_holiday are required" })
        }

        await service.addDay({ date, category, is_holiday, checkin, checkout })
        res.status(201).json({ message: "Day inserted" })
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}

export const deleteDay = async (req, res) => {
    try {
        const date = req.params.date
        await service.removeDay(date)
        res.status(200).json({ message: `Deleted day on ${date}` })
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}

export const upsertDay = async (req, res) => {
    try {
        const date = req.params.date
        const { category, is_holiday, is_occupied, occupied_order_id } = req.body

        if (!category || is_holiday === undefined || is_occupied === undefined) {
            return res.status(400).json({ error: "category, is_holiday, and is_occupied are required" })
        }

        await service.addDay({ date, category, is_holiday, is_occupied, occupied_order_id })
        res.status(200).json({ message: "Day upserted" })
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}
