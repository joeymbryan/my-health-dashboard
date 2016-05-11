// Package database handles connecting and writing to the database.
package database

import (
	"database/sql"
	//"fmt"
	//"log"
	"os"

  "github.com/go-sql-driver/mysql"
)

// DB houses the connection to the db
type DB struct {
	conn *sql.DB // database connection
}

// New sets up a new db connection and returns it
func New() (DB, error) {
  config := mysql.Config{User: os.Getenv("DB_USER"), Passwd: os.Getenv("DB_PASSWORD"), DBName: os.Getenv("DB_NAME")}
	conn, err := sql.Open("mysql", config.FormatDSN())
	return DB{conn}, err
}

// Close closes the db connection
func (db DB) Close() error {
	return db.conn.Close()
}

// SetMaxOpenConns sets the number of open connections to
// db allowed, should be less than the configured value
func (db DB) SetMaxOpenConns(n int) {
	db.conn.SetMaxOpenConns(n)
}

/*Insert inserts a POST body into the database*/
func (db DB) Insert() (err error){
  // Prepare bulk insert statement
  /*txn, err := db.conn.Begin()

  if err != nil {
    return
  }
	_, err := txn.Prepare(mysql.CopyIn("data_raw", "serial", "type", "data", "time", "device"))

  if (err) {
    log.Fatal(err)
  }
*/
  return
}
