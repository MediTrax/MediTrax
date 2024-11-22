package tests

import (
	"errors"
	"meditrax/graph/database"
	middlewares "meditrax/graph/middleware"
	graph "meditrax/graph/resolvers"
	"meditrax/graph/utils"
	"net/http"
	"os"
	"time"

	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/handler/extension"
	"github.com/99designs/gqlgen/graphql/handler/lru"
	"github.com/99designs/gqlgen/graphql/handler/transport"
)

const defaultPort = "8080"

func NewServer() http.Handler {
	if _, err := os.Stat(".private/keys.json"); errors.Is(err, os.ErrNotExist) {
		utils.ResetKeypair()
	}
	database.Connect()
	port := os.Getenv("PORT")
	build := os.Getenv("BUILD_NUMBER")
	if port == "" {
		port = defaultPort
	}
	if build == "" {
		build = "DEBUG"
	}
	c := graph.Config{Resolvers: &graph.Resolver{}}
	srv := handler.New(graph.NewExecutableSchema(c))

	srv.AddTransport(transport.Websocket{
		KeepAlivePingInterval: 10 * time.Second,
	})
	srv.AddTransport(transport.Options{})
	srv.AddTransport(transport.GET{})
	srv.AddTransport(transport.POST{})

	srv.Use(extension.Introspection{})
	srv.Use(extension.AutomaticPersistedQuery{
		Cache: lru.New[string](100),
	})
	srv.AddTransport(transport.MultipartForm{
		MaxUploadSize: 1e+9,
	})

	return middlewares.Middleware(srv)
}
