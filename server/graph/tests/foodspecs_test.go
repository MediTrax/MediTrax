package tests

import (
	"encoding/json"
	"fmt"
	"testing"

	"github.com/99designs/gqlgen/client"
	"github.com/stretchr/testify/require"
)

var MOCK = true

func TestFoodSpecs(t *testing.T) {
	c := client.New(NewServer())
	user := CreateUserAndLogin(t, c)

	t.Run("Get Food Specs", func(t *testing.T) {
		var response struct {
			Get1 struct {
				Specs []struct {
					Name    string
					Value   float64
					Unit    string
					HowHigh float64
				}
				HowRecommend float64
			}
			Get2 struct {
				Specs []struct {
					Name    string
					Value   float64
					Unit    string
					HowHigh float64
				}
				HowRecommend float64
			}
		}

		if MOCK {
			c.MustPost(`query get_food_specs{
				get1:getMockFoodSpecs(food:"牛肉"){
					howRecommend,
					specs{
						name,
						value,
						unit,
						howHigh
					}
				}
				get2:getMockFoodSpecs(food:"牛肉"){
					howRecommend,
					specs{
						name,
						value,
						unit,
						howHigh
					}
				}
			}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))

		} else {
			c.MustPost(`query get_food_specs{
				get1:getFoodSpecs(food:"牛肉"){
					howRecommend,
					specs{
						name,
						value,
						unit,
						howHigh
					}
				}
				get2:getFoodSpecs(food:"牛肉"){
					howRecommend,
					specs{
						name,
						value,
						unit,
						howHigh
					}
				}
			}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		}

		require.Equal(t, 5, len(response.Get1.Specs))
		require.Equal(t, 5, len(response.Get2.Specs))
		require.LessOrEqual(t, 0.0, response.Get1.HowRecommend)
		require.LessOrEqual(t, 0.0, response.Get1.HowRecommend)
		require.GreaterOrEqual(t, 1.0, response.Get1.HowRecommend)
		require.GreaterOrEqual(t, 1.0, response.Get2.HowRecommend)
		for _, spec := range append(response.Get1.Specs, response.Get2.Specs...) {
			require.LessOrEqual(t, 0.0, spec.HowHigh)
			require.GreaterOrEqual(t, 1.0, spec.HowHigh)
			require.NotEmpty(t, spec.Unit)
			require.NotEmpty(t, spec.Name)
			require.Positive(t, spec.Value)
		}
	})

	t.Run("Error responses", func(t *testing.T) {
		var response struct {
			Get struct {
				Specs []struct {
					Name    string
					Value   float64
					Unit    string
					HowHigh float64
				}
				HowRecommend float64
			}
		}
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}

		var err error

		if MOCK {
			err = c.Post(`query{
				get:getMockFoodSpecs(food:"牛肉"){
					howRecommend,
					specs{
						name,
						value,
						unit,
						howHigh
					}
				}
			}`, &response)

		} else {
			err = c.Post(`query{
				get:getFoodSpecs(food:"牛肉"){
					howRecommend,
					specs{
						name,
						value,
						unit,
						howHigh
					}
				}
			}`, &response)
		}
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
	})

	DeleteUser(t, c, user)
}

func TestFoodRecommend(t *testing.T) {
	c := client.New(NewServer())
	user := CreateUserAndLogin(t, c)

	t.Run("Get Food Recommendations", func(t *testing.T) {
		var response struct {
			Get1 struct {
				Name string
			}
			Get2 struct {
				Name string
			}
		}

		if MOCK {
			c.MustPost(`query get_food_recommendation{
				get1:getMockFoodRecommendation{
					name
				}
				get2:getMockFoodRecommendation{
					name
				}
			}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		} else {
			c.MustPost(`query get_food_recommendation{
				get1:getFoodRecommendation{
					name
				}
				get2:getFoodRecommendation{
					name
				}
			}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		}
		require.NotEmpty(t, response.Get1.Name)
		require.NotEmpty(t, response.Get2.Name)
	})

	t.Run("Error response", func(t *testing.T) {
		var response struct {
			Get struct {
				Name string
			}
		}
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}

		var err error

		if MOCK {
			err = c.Post(`query get_food_recommendation{
				get1:getMockFoodRecommendation{
					name
				}
				get2:getMockFoodRecommendation{
					name
				}
			}`, &response)
		} else {
			err = c.Post(`query get_food_recommendation{
				get1:getFoodRecommendation{
					name
				}
				get2:getFoodRecommendation{
					name
				}
			}`, &response)
		}
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
	})

	DeleteUser(t, c, user)
}
