"use strict";

const express = require("express");
const router = express.Router();
const isAuth = require("../../../middlewares/auth.js");
const {
  signIn,
  deleteUser,
} = require("../../../controllers/userController.js");

// /user
router.post("/signIn", signIn);
router.delete("/deleteUser/:userId", isAuth, deleteUser);

module.exports = router;
