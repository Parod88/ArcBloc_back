"use strict";

const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

const hashPassword = function (password) {
  return bcrypt.hashSync(password, 8);
};
const signIn = async (req, res, next) => {
  const {
    email,
    name,
    lastName,
    password,
    passwordConfirm,
    phoneNumber,
    location,
  } = req.body;

  const user = await prisma.user.findUnique({ where: { email: `${email}` } });

  try {
    if (user) {
      res.status(400).json({
        message: "Email already exists",
      });
      return;
    }

    if (password !== passwordConfirm) {
      res.status(400).json({
        message: "Passwords don't match",
      });
      return;
    }

    const hashedPassword = hashPassword(password);

    const newUser = await prisma.user.create({
      data: {
        name,
        email,
        last_name: lastName,
        phone_number: Number(phoneNumber),
        location: Number(location),
        password: `${hashedPassword}`,
        typeOf_subscription: 0,
        is_architect: false,
        is_client: false,
      },
    });

    res.status(201).json(newUser);
  } catch (error) {
    res.status(400).json({
      info: "User registration process failed",
      message: `${error}`,
    });
    next(error);
  }
};

module.exports = {
  signIn,
};
