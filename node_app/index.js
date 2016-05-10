var express = require('express');
var BBPromise = require('bluebird');
var bodyParser = require('body-parser');
var mysql = require('mysql');
var _ = require('lodash');
require('dotenv').config();

var app = express();
app.use(bodyParser.json());


// promisify here instead of dynamically, a lot faster
BBPromise.promisifyAll(mysql);
BBPromise.promisifyAll(require('mysql/lib/Connection').prototype);
BBPromise.promisifyAll(require('mysql/lib/Pool').prototype);

// setup connection to db
var pool = mysql.createPool({
  host     : process.env.DB_HOST,
  user     : process.env.DB_USER,
  password : process.env.DB_PASSWORD,
  port     : process.env.DB_PORT,
  database : process.env.DB_NAME,
});

// nifty wrap to clean up resources
function getSqlConnection() {
  return pool.getConnectionAsync().disposer(function(conn) {
      conn.release();
  });
}

app.post('/:userId', (req, res, next) => {
  console.log(req.body);
  BBPromise.using(getSqlConnection(), conn => {

  })
  .catch(next);
});

app.use((err, req, res, next) => {
  console.log('err: ' + err + '\n\nreq: ' + req + '\n\nres: ' + '\n\nnext: ' + next);
});

app.listen(3000);
