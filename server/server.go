package main

import (
	"errors"
	"log"
	"time"

	"meditrax/graph/database"
	middlewares "meditrax/graph/middleware"
	graph "meditrax/graph/resolvers"
	"meditrax/graph/utils"

	"net/http"
	"os"

	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/handler/extension"
	"github.com/99designs/gqlgen/graphql/handler/lru"
	"github.com/99designs/gqlgen/graphql/handler/transport"
	"github.com/99designs/gqlgen/graphql/playground"
	"github.com/rs/cors"
)

const defaultPort = "8080"

func main() {
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
	srv.AddTransport(transport.MultipartForm{})

	// srv.SetQueryCache(lru.New[*ast.QueryDocument](1000))

	srv.Use(extension.Introspection{})
	srv.Use(extension.AutomaticPersistedQuery{
		Cache: lru.New[string](100),
	})
	srv.AddTransport(transport.MultipartForm{
		MaxUploadSize: 1e+9,
	})
	mux := http.NewServeMux()
	mux.Handle("/", playground.Handler("GraphQL playground", "/graphql"))
	mux.Handle("/graphql", middlewares.Middleware(srv))
	// mux.Handle("/files/", middlewares.Middleware(MinioHandler()))
	corsConfig := cors.New(cors.Options{
		AllowedOrigins:   []string{"*"},
		AllowCredentials: true,
		AllowedHeaders:   []string{"Authorization", "Origin", "X-Requested-With", "Content-Type", "Accept", "Access-Control-Allow-Origin"},
		Debug:            true,
	})
	handler := corsConfig.Handler(mux)
	log.Printf("connect to http://localhost:%s/ for GraphQL playground", port)

	log.Fatal(http.ListenAndServe(":"+port, handler))
}
