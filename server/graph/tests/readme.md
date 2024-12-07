after pulling from github, please delte the .public folder.
to use tests, run `go test meditrax/graph/tests -coverprofile coverage.out.tmp -coverpkg=meditrax/graph/resolvers`
then, to visualize, do
```
cat coverage.out.tmp | grep -v "generated.go" > coverage.out
go tool cover -func=coverage.out
```
Could also use
```
go tool cover -html=coverage.out
```
for better visualization++

Please ensure you are connected to the internet and able to access the surrealist database