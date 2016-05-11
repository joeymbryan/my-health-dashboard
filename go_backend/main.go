package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/joho/godotenv"
	"github.com/julienschmidt/httprouter"

	"./database"
)

func index(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	fmt.Fprint(w, "Welcome!\n")
}

func main() {

  //load environment variables
	err := godotenv.Load("go_env_vars.env")
	if err != nil {
		log.Fatal("Error loading .env file")
	}

  //setup db access
	db, err := database.New()
	if err != nil {
		log.Fatal(err)
	}
  defer db.Close()

  // Causes operations which require a new connection to block instead of failing.
	db.SetMaxOpenConns(10)

	fmt.Printf("Hello, world.\n")
	router := httprouter.New()
	router.POST("/api/v1/user/:user_id", index)

	go log.Fatal(http.ListenAndServe(":8080", router))
}
