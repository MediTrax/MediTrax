package middlewares

import (
	"context"
	"encoding/json"
	"meditrax/graph/database"
	"meditrax/graph/model"
	"net/http"
	"os"
	"strings"

	"github.com/square/go-jose"
	"github.com/square/go-jose/jwt"
	"github.com/surrealdb/surrealdb.go"
)

var userCtxKey = &contextKey{"user"}

type contextKey struct {
	name string
}

// Middleware decodes the share session cookie and packs the session into context
func Middleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		println("middleware is forwarding")

		// Check if the Authorization header is present
		if len(r.Header["Authorization"]) > 0 {
			authHeader := r.Header["Authorization"][0]

			if authHeader != "" {
				// Extract the token from the Authorization header
				token := strings.TrimPrefix(authHeader, "Bearer ")
				if token != "" {
					// Parse the JWT token
					parsedJWT, err := jwt.ParseSigned(token)
					if err != nil {
						// Return an error if JWT parsing fails
						err, _ := json.Marshal(map[string]string{"message": "Failed to parse JWT"})
						http.Error(w, string(err), http.StatusForbidden)
						return
					}

					// Verify that the JWT has headers
					if len(parsedJWT.Headers) <= 0 {
						err, _ := json.Marshal(map[string]string{"message": "Token Error"})
						http.Error(w, string(err), http.StatusForbidden)
						return
					}

					// Load public keys from a JSON file
					publicJWKs := make([]jose.JSONWebKey, 0)
					dat, err := os.ReadFile(".public/keys.json")
					if err != nil {
						http.Error(w, err.Error(), http.StatusForbidden)
						return
					}
					if err := json.Unmarshal(dat, &publicJWKs); err != nil {
						http.Error(w, err.Error(), http.StatusForbidden)
						return
					}

					// Create a JSON Web Key Set from the loaded public keys
					JWKS := jose.JSONWebKeySet{Keys: publicJWKs}
					publicJWK := JWKS.Key(parsedJWT.Headers[0].KeyID)
					if len(publicJWK) == 0 {
						err, _ := json.Marshal(map[string]string{"message": "key error, login again"})
						http.Error(w, string(err), http.StatusForbidden)
						return
					}

					// Extract claims from the JWT
					allClaims := make(map[string]interface{})
					if err := parsedJWT.Claims(publicJWK[0].Key, &allClaims); err != nil {
						http.Error(w, err.Error(), http.StatusForbidden)
						return
					}

					// Fetch user data from the database using the subject claim
					var user model.User
					data, err := database.DB.Select(allClaims["sub"].(string))
					if err != nil {
						http.Error(w, err.Error(), http.StatusForbidden)
						return
					}

					// Unmarshal the user data into a User struct
					user, err = surrealdb.SmartUnmarshal[model.User](data, nil)
					if err != nil {
						http.Error(w, err.Error(), http.StatusForbidden)
						return
					}

					println("user context stored")
					// Add the user to the request context
					ctx := context.WithValue(r.Context(), userCtxKey, &user)

					// Call the next handler with the updated context
					r = r.WithContext(ctx)
					next.ServeHTTP(w, r)
					return
				}
			}
		}
		println("user not added to context")
		// If no valid Authorization header is found, continue without adding user to context
		next.ServeHTTP(w, r)
	})
}

// ForContext finds the user from the context. REQUIRES Middleware to have run.
func ForContext(ctx context.Context) *model.User {
	raw, _ := ctx.Value(userCtxKey).(*model.User)
	return raw
}
