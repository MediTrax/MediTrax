package utils

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"

	"github.com/square/go-jose"
	"github.com/square/go-jose/jwt"
)

func GetJWKS() (*jose.JSONWebKeySet, error) {
	publicJWKs := make([]jose.JSONWebKey, 0)
	res, err := http.Get("https://appleid.apple.com/auth/keys")
	if err != nil {
		return nil, err
	}
	defer res.Body.Close()
	if res.StatusCode != 200 {
		return nil, fmt.Errorf("error getting token")
	}
	resBody, err := ioutil.ReadAll(res.Body)
	if err != nil {
		return nil, err
	}

	if err := json.Unmarshal(resBody, &publicJWKs); err != nil {
		return nil, err
	}
	JWKS := &jose.JSONWebKeySet{Keys: publicJWKs}
	return JWKS, nil
}

func VerifyToken(token string) (string, string, error) {
	parsedJWT, err := jwt.ParseSigned(token)
	if err != nil {
		return "", "", fmt.Errorf("failed to parse JWT")
	}
	if len(parsedJWT.Headers) <= 0 {
		return "", "", fmt.Errorf("token error")
	}
	publicJWKs := make([]jose.JSONWebKey, 0)
	dat, err := os.ReadFile(".public/keys.json")
	if err != nil {
		return "", "", err
	}
	if err := json.Unmarshal(dat, &publicJWKs); err != nil {
		return "", "", err
	}
	JWKS := jose.JSONWebKeySet{Keys: publicJWKs}
	publicJWK := JWKS.Key(parsedJWT.Headers[0].KeyID)
	if len(publicJWK) == 0 {
		return "", "", fmt.Errorf("key error, login again")
	}
	allClaims := make(map[string]interface{})
	if err := parsedJWT.Claims(publicJWK[0].Key, &allClaims); err != nil {
		return "", "", err
	}
	if !allClaims["email_verified"].(bool) {
		return "", "", fmt.Errorf("email not verified")
	}
	return allClaims["sub"].(string), allClaims["email"].(string), nil
}
