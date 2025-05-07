// src/routes/customer.routes.js
import express from "express"
import * as controller from "../controllers/customer.controller.js"

const router = express.Router()

router.get("/", controller.getAllCustomers)
router.post("/", controller.insertCustomer)
router.delete("/:id", controller.deleteCustomer)
router.put("/:id", controller.upsertCustomer)

export default router
