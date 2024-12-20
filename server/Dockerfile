FROM golang:latest AS builder
ADD . /app
WORKDIR /app
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o /main .

FROM alpine
RUN apk add --no-cache ca-certificates openssl tzdata
ENV MONGODB_USERNAME=MONGODB_USERNAME MONGODB_PASSWORD=MONGODB_PASSWORD MONGODB_ENDPOINT=MONGODB_ENDPOINT
COPY --from=builder /main ./
COPY ./doc /doc
ENTRYPOINT ["./main"]