"use strict";

const express = require("express");
const router = express.Router();
const {
  signIn,
  deleteUser,
} = require("../../../controllers/userController.js");

// /user
router.post("/signIn", signIn);
router.delete("/deleteUser/:userId", deleteUser);

module.exports = router;
