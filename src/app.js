import express from "express"
// import reservationRoutes from "./routes/reservation.routes.js"
import holidayRoutes from "./routes/holiday.routes.js"

const app = express()
app.use(express.json())

// app.use("/api/reservations", reservationRoutes)
app.use("/api/holidays", holidayRoutes)

export default app
