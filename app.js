var createError = require("http-errors");
var express = require("express");
var path = require("path");
var cookieParser = require("cookie-parser");
var logger = require("morgan");

var app = express();

// view engine setup
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "pug");

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

//Directory static files
app.use(express.static(path.join(__dirname, "public")));

//==================================================================
//Routes
//==================================================================

// Website routes
app.use("/", require("./routes/index"));

// Api routers
app.use("/api/v1/user", require("./routes/api/v1/users"));
app.use("/api/v1/signUp", require("./routes/api/v1/signup"));

//==================================================================
//Errors
//==================================================================
// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
});

module.exports = app;
