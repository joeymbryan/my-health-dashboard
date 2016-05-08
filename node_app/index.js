var express = require('express');
var BBPromise = require('bluebird');
var mysql = require('mysql');
var _ = require('lodash');
var app = express();


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

app.get('/', (req, res, next) => {
  BBPromise.using(getSqlConnection(), conn => {

  })
  .catch(next);
});

app.use((err, req, res, next) => {
  console.log('err: ' + err + '\n\nreq: ' + req + '\n\nres: ' + '\n\nnext: ' + next);
});

app.listen(3000);
