"use strict";

const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");

const comparePassword = (unHashedPassword, hashedPassword) =>
  bcrypt.compare(unHashedPassword, hashedPassword);

const signUp = async (req, res, next) => {
  try {
    const { email, password } = req.body;
    const user = await prisma.user.findUnique({ where: { email } });
    if (!user || !comparePassword(password, user.password)) {
      res.status(401).json({ error: "Invalid credentials" });
      return;
    }
    console.log(user.password, password);

    jwt.sign(
      { email },
      process.env.JWT_SECRET,
      {
        expiresIn: "480m",
      },
      (error, jwtToken) => {
        if (error) {
          next(error);
          return;
        }
        res.json({ token: jwtToken, results: user });
      }
    );
  } catch (error) {
    res.status(500).send({
      info: "An error occurred.",
      message: `${error}`,
      query: req.body,
    });
    next(error);
  }
};

module.exports = {
  signUp,
};
