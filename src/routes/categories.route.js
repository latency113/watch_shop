const express = require('express');
const app = express.Router();
const controller = require('../controllers/categories.controller');

// define routes here
app.get("/", controller.get);
app.get("/:id",controller.getById);
app.post("/",controller.create);
app.put("/:id",controller.update);


module.exports = app;