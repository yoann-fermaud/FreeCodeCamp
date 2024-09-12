require('dotenv').config()

const express = require('express');
const app = express();
const bodyParser = require('body-parser');


// console.log("Hello World")

// req is what the client sends to the server (request).
// res is what the server sends back to the client (response).

app.use(bodyParser.urlencoded({ extended: false }));

app.use("/public", express.static(__dirname + '/public'));

app.use((req, res, next) => {
    console.log(`${req.method} ${req.path} - ${req.ip}`);
    next();
});

app.get(
    "/now",
    (req, res, next) => {
      // adding a new property to req object
      // in the middleware function
      const timeStr = new Date().toString();
      req.time = timeStr;
      console.log('time: ' + timeStr);
      next();
    },
    (req, res) => {
        res.send({ "time": req.time });
    }
  );

app.get('/', (req, res) => {
//     res.send('Hello Express');
    res.sendFile(__dirname + "/views/index.html");
});

app.get("/json", (req, res) => {
    if (process.env.MESSAGE_STYLE === "uppercase"){
        res.json({
            message: "Hello json".toUpperCase()
        });
    } else {
        res.json({
            message: "Hello json"
        });
    }
});

// Echo server that responds with the word passed in the URL
app.get("/:word/echo", (req, res) => {
    res.json({ "echo": req.params.word });
});

app.get("/name", function(req, res) {
    var firstName = req.query.first;
    var lastName = req.query.last;
    // OR you can destructure and rename the keys
    var { first: firstName, last: lastName } = req.query;
    // Use template literals to form a formatted string
    res.json({
        name: `${firstName} ${lastName}`
    });
});

app.post("/name", (req, res) => {
    const firstName = req.body.first;
    const lastName = req.body.last;
    const fullName = `${firstName} ${lastName}`;
    res.json({ name: fullName });
});

 module.exports = app;
