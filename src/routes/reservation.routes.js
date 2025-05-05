import express from "express"
import * as controller from "../controllers/reservation.controller.js"

const router = express.Router()

router.get("/", controller.getReservations)
router.post("/", controller.postReservation)

export default router
