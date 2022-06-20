"use strict";

const express = require("express");
const router = express.Router();
const { signIn } = require("../../../controllers/userController.js");

// /user
router.post("/signIn", signIn);

module.exports = router;
