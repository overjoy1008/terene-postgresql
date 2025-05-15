// src/app.js
import express from "express"
import cors from "cors"
import holidayRoutes from "./routes/holiday.routes.js"
import customerRoutes from "./routes/customer.routes.js"
import couponRoutes from "./routes/coupon.routes.js"
import orderRoutes from "./routes/order.routes.js"

const app = express()
app.use(express.json())

// ✅ CORS 미들웨어 먼저 설정
app.use(cors({
    origin: "*", // 또는 origin: ["https://glad-button-137794.framer.app"]
    methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
    allowedHeaders: ["Content-Type", "Authorization"],
}))

// ✅ preflight OPTIONS 요청을 명시적으로 허용
app.options("/*", cors())

// ✅ 라우터 설정
app.use("/api/holidays", holidayRoutes)
app.use("/api/customers", customerRoutes)
app.use("/api/coupons", couponRoutes)
app.use("/api/orders", orderRoutes)

export default app
