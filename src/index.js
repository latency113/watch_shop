const express = require('express');
const app = express();
require('dotenv').config();
const port = process.env.PORT || 3000;
const bodyParser = require('body-parser');
const cors = require("cors");



const productRoute = require('./routes/product.route');
const categoriesRoute = require('./routes/categories.route');
const authRoute = require("./routes/auth.route");
const userRoute = require("./routes/user.route");
const orderRoute = require("./routes/order.route");
const orderDetailRoute = require("./routes/detail.route");


app.use('/images', express.static('images'));
// CORS cross origin resource sharing
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", (req, res) => {
    res.send("Sawasdee");
});

app.use("/products", productRoute);
app.use("/categories", categoriesRoute);
app.use("/auths", authRoute);
app.use("/users", userRoute);
app.use("/orders", orderRoute);
app.use("/details", orderDetailRoute);
 
app.listen(port, () => {
    console.log("App stared at port: " + port);
});