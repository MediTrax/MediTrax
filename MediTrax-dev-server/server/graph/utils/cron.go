package utils

import (
	"crypto/ed25519"
	"crypto/rand"
	"crypto/sha256"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"log"
	"os"
	"time"

	"github.com/joho/godotenv"
	"github.com/robfig/cron/v3"
	"github.com/square/go-jose"
)

func init() {
	err := godotenv.Load(".env")

	if err != nil {
		log.Fatal("Error loading .env file")
	}

}

func ResetKeypair() {
	println("resetting key pair")
	if _, err := os.Stat(".private/keys.json"); err == nil {
		e := os.Remove(".private/keys.json")
		if e != nil {
			log.Fatal(e)
		}
	}
	if _, err := os.Stat(".public/keys.json"); err == nil {
		e := os.Remove(".public/keys.json")
		if e != nil {
			log.Fatal(e)
		}
	}
	publicJWKs := make([]jose.JSONWebKey, 0)
	privateJWKs := make([]jose.JSONWebKey, 0)
	for i := 0; i < 5; i++ {
		publicKey, privateKey, err := ed25519.GenerateKey(rand.Reader)
		if err != nil {
			panic(err)
		}
		hasher := sha256.New()
		hasher.Write(publicKey)
		keyThumbprint := hex.EncodeToString(hasher.Sum(nil))
		publicJWK := jose.JSONWebKey{Key: publicKey, KeyID: keyThumbprint, Algorithm: "Ed25519", Use: "sig"}
		publicJWKs = append(publicJWKs, publicJWK)
		privateJWK := jose.JSONWebKey{Key: privateKey, KeyID: keyThumbprint, Algorithm: "Ed25519", Use: "sig"}
		privateJWKs = append(privateJWKs, privateJWK)
	}
	jsonData, err := json.Marshal(privateJWKs)
	if err != nil {
		panic(err)
	}
	os.Mkdir(".private", os.ModePerm)
	if err := os.WriteFile(".private/keys.json", jsonData, 0644); err != nil {
		panic(err)
	}
	jsonData, err = json.Marshal(publicJWKs)
	if err != nil {
		panic(err)
	}
	os.Mkdir(".public", os.ModePerm)
	if err := os.WriteFile(".public/keys.json", jsonData, 0644); err != nil {
		panic(err)
	}
}

func StartCron(build string) {
	loc, _ := time.LoadLocation("Asia/Shanghai")
	option := cron.WithLocation(loc)
	c := cron.New(option)
	//addFormTeacherRoles()
	_, err := c.AddFunc("0 0 * * 0", func() {
		ResetKeypair()
	})
	if err != nil {
		fmt.Println(err)
		return
	}
	if build != "DEBUG" {
		// Do some cron job here
	}
	c.Start()
	fmt.Println("Started Cron")
	fmt.Println(time.Now())
	fmt.Println(c.Location())
}
