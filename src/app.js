// src/app.js
import express from "express"
import cors from "cors"
import holidayRoutes from "./routes/holiday.routes.js"
import customerRoutes from "./routes/customer.routes.js"
import couponRoutes from "./routes/coupon.routes.js"
import orderRoutes from "./routes/order.routes.js"

const app = express()
app.use(express.json())
app.use(cors({
    origin: "*",
    methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
    allowedHeaders: ["Content-Type", "Authorization"],
  }));

app.use("/api/holidays", holidayRoutes)
app.use("/api/customers", customerRoutes)
app.use("/api/coupons", couponRoutes)
app.use("/api/orders", orderRoutes)

export default app
