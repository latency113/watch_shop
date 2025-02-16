const express = require('express');
const app = express.Router();
// import product.controller
const controller = require('../controllers/detail.controller')

// define routes here
// match GET localhost:4000/products
app.get("/", controller.get);
  
// match GET localhost:4000/products/[id]
app.get("/:id", controller.getById);
  
app.post("/", controller.create);

app.delete("/:id", controller.delete);


module.exports = app;