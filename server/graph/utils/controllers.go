package utils

import (
	"context"
	crand "crypto/rand"
	"encoding/base64"
	"encoding/json"

	"fmt"
	"math/rand"
	"meditrax/graph/database"
	"meditrax/graph/model"
	"os"

	"time"

	"github.com/square/go-jose/v3"
	"github.com/square/go-jose/v3/jwt"
	"github.com/surrealdb/surrealdb.go"
)

func HandleLogin(user *model.User, ctx context.Context) (*model.Token, error) {
	// Pick Random Signing Key
	privateJWKs := make([]jose.JSONWebKey, 0)
	dat, err := os.ReadFile(".private/keys.json")
	if err != nil {
		fmt.Println(err)
		return nil, err
	}
	if err := json.Unmarshal(dat, &privateJWKs); err != nil {
		fmt.Println(err)
		return nil, err
	}
	privateJWK := privateJWKs[rand.Intn(len(privateJWKs))]
	key := jose.SigningKey{Algorithm: jose.EdDSA, Key: privateJWK}

	var signerOpts = jose.SignerOptions{}
	signerOpts.WithType("JWT")
	signerOpts.WithHeader("kid", privateJWK.KeyID)

	rsaSigner, err := jose.NewSigner(key, &signerOpts)
	if err != nil {
		fmt.Println(err)
		return nil, err
	}
	builder := jwt.Signed(rsaSigner)
	// public claims
	timeNow := time.Now()
	pubClaims := jwt.Claims{
		Issuer:   "jomluz",
		Subject:  user.ID,
		Audience: jwt.Audience{"claims.syjmanagement.com"},
		IssuedAt: jwt.NewNumericDate(timeNow),
		Expiry:   jwt.NewNumericDate(timeNow.AddDate(0, 0, 1)),
	}
	// private claims, as payload is JSON use the generic json patterns
	privClaims := map[string]interface{}{
		"email": user.Email,
	}
	// Add the claims. Note Claims returns a Builder so can chain
	builder = builder.Claims(pubClaims).Claims(privClaims)
	// validate all ok, sign with the RSA key, and return a compact JWT
	rawJWT, err := builder.CompactSerialize()
	if err != nil {
		return nil, err
	}
	refreshToken, err := GenerateRandomString(32)
	if err != nil {
		return nil, err
	}
	data, err := database.DB.Create("token:ulid()", map[string]interface{}{
		"user":               user.ID,
		"accessToken":        rawJWT,
		"refreshToken":       refreshToken,
		"accessTokenExpiry":  timeNow.AddDate(0, 0, 1),
		"refreshTokenExpiry": timeNow.AddDate(0, 0, 30*3),
		"createdAt":          time.Now(),
		"updatedAt":          time.Now(),
	})
	if err != nil {
		return nil, err
	}
	createdToken, err := surrealdb.SmartUnmarshal[model.Token](data, nil)
	if err != nil {
		return nil, err
	}
	return &createdToken, nil
}

func GenerateRandomString(n int) (string, error) {
	b := make([]byte, n)
	_, err := crand.Read(b)
	// Note that err == nil only if we read len(b) bytes.
	if err != nil {
		return "", err
	}

	return base64.URLEncoding.EncodeToString(b), nil
}
