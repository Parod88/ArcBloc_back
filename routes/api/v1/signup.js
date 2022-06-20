"use strict";

const express = require("express");
const router = express.Router();
const { signUp } = require("../../../controllers/loginController.js");

router.post("/", signUp);

module.exports = router;
