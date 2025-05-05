import * as service from "../services/reservation.service.js"

export const getReservations = async (req, res) => {
    try {
        const data = await service.getAllReservations()
        res.json(data)
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}

export const postReservation = async (req, res) => {
    try {
        await service.createReservation(req.body)
        res.status(201).json({ message: "Reservation added" })
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}
