package main

import (
	"fmt"
	"log"
	"time"

	"meditrax/graph"
	"meditrax/graph/database"

	"net/http"
	"os"

	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/handler/extension"
	"github.com/99designs/gqlgen/graphql/handler/transport"
	"github.com/99designs/gqlgen/graphql/playground"
)

const defaultPort = "8080"

func main() {
	fmt.Println("Starting...")

	database.Connect()

	port := os.Getenv("PORT")
	if port == "" {
		port = defaultPort
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

	srv.Use(extension.Introspection{})

	// srv.SetQueryCache(lru.New[*ast.QueryDocument](1000))

	http.Handle("/", playground.Handler("GraphQL playground", "/query"))
	http.Handle("/query", srv)

	log.Printf("connect to http://localhost:%s/ for GraphQL playground", port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
