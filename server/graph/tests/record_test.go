package tests

import (
	"testing"

	"github.com/99designs/gqlgen/client"
)

func TestHealthMetric(t *testing.T) {
	c := client.New(NewServer())
	user := CreateUserAndLogin(t, c)

	DeleteUser(t, c, user)
}
