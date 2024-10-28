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
	err := godotenv.Load(".env")

	if err != nil {
		log.Fatal("Error loading .env file")
	}

	DB, err = surrealdb.New(os.Getenv("SURREALDB_URL"), surrealdb.WithTimeout(60*time.Second))
	if err != nil {
		panic(err)
	}

	if _, err = DB.Signin(map[string]interface{}{
		"user": os.Getenv("SURREALDB_USER"),
		"pass": os.Getenv("SURREALDB_PASSWORD"),
		"NS":   os.Getenv("SURREALDB_NS"),
		"DB":   os.Getenv("SURREALDB_DB"),
	}); err != nil {
		panic(err)
	}

	if _, err = DB.Use("syj", "syj"); err != nil {
		panic(err)
	}

	fmt.Println("Database setup complete!")
}
