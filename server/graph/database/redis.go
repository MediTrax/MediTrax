package database

import (
	"github.com/redis/go-redis/v9"
)

var Rdb *redis.Client

func init() {
	// err := godotenv.Load(".env")

	// if err != nil {
	// 	log.Fatal("Error loading .env file")
	// }

	// redisUrl := os.Getenv("REDIS_URL") //"redis://<user>:<pass>@localhost:6379/<db>"
	// opt, err := redis.ParseURL(redisUrl)
	// if err != nil {
	// 	panic(err)
	// }

	// Rdb = redis.NewClient(opt)
}
