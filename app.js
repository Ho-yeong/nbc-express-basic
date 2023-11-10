const express = require('express');
const dotenv = require('dotenv');

dotenv.config();

const app = express();
const port = 3000;
let seq = 0;

app.get('/', (req, res) => {

  console.log(++seq);
  res.json({ message: "Hello World!", today: process.env.TODAY });
})


app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
