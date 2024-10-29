package database

import (
	"fmt"
	"log"
	"os"
	"time"

	"github.com/joho/godotenv"
	"github.com/surrealdb/surrealdb.go"
)

var DB *surrealdb.DB

func Connect() {
	fmt.Println("Setting up databse...")

	fmt.Println("Loading env file...")
	err := godotenv.Load(".env")

	if err != nil {
		log.Fatal("Error loading .env file")
	}

	fmt.Println("Establishing connection to database... source: ")
	fmt.Println(os.Getenv("SURREALDB_URL"))
	DB, err = surrealdb.New(os.Getenv("SURREALDB_URL")+"/rpc", surrealdb.WithTimeout(60*time.Second))
	if err != nil {
		panic(err)
	}

	fmt.Println("Signing into database...")
	if _, err = DB.Signin(map[string]interface{}{
		"user": os.Getenv("SURREALDB_USER"),
		"pass": os.Getenv("SURREALDB_PASSWORD"),
		"NS":   os.Getenv("SURREALDB_NS"),
		"DB":   os.Getenv("SURREALDB_DB"),
	}); err != nil {
		panic(err)
	}

	fmt.Println("Sign in complete!")
	if _, err = DB.Use(os.Getenv("SURREALDB_NS"), os.Getenv("SURREALDB_DB")); err != nil {
		panic(err)
	}

	fmt.Println("Database setup complete!")
}
