package main

import (
	"log"

	"meditrax/graph"
	"meditrax/graph/database"

	"net/http"
	"os"

	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"
)

const defaultPort = "8080"

func main() {
	// if _, err := os.Stat(".private/keys.json"); errors.Is(err, os.ErrNotExist) {
	// 	resetKeypair()
	// }
	database.Connect()

	port := os.Getenv("PORT")
	if port == "" {
		port = defaultPort
	}

	c := graph.Config{Resolvers: &graph.Resolver{}}
	srv := handler.New(graph.NewExecutableSchema(c))

	// srv.SetQueryCache(lru.New[*ast.QueryDocument](1000))

	http.Handle("/", playground.Handler("GraphQL playground", "/query"))
	http.Handle("/query", srv)

	log.Printf("connect to http://localhost:%s/ for GraphQL playground", port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
