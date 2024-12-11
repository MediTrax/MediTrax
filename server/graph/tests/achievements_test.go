package tests

import (
	"encoding/json"
	"fmt"
	"math/rand"
	"testing"

	"github.com/99designs/gqlgen/client"
	"github.com/stretchr/testify/require"
)

func TestAchievement(t *testing.T) {
	c := client.New(NewServer())
	user := CreateUserAndLogin(t, c)

	var badgeId1 string
	var badgeId2 string
	var assessmentId1 string
	var assessmentId2 string

	t.Run("Create Achievement Badges", func(t *testing.T) {
		var response struct {
			CreateAchievementBadge struct {
				BadgeID string
				Message string
			}
		}

		// 创建第一个徽章
		c.MustPost(`mutation create_badge {
			createAchievementBadge(
				name: "First Badge",
				description: "Awarded for completing the first task.",
				iconUrl: "https://example.com/first_badge.png"
			) {
				badgeId
				message
			}
		}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, "Achievement badge created successfully", response.CreateAchievementBadge.Message)
		badgeId1 = response.CreateAchievementBadge.BadgeID

		// 创建第二个徽章
		c.MustPost(`mutation create_badge {
			createAchievementBadge(
				name: "Second Badge",
				description: "Awarded for achieving a milestone.",
				iconUrl: "https://example.com/second_badge.png"
			) {
				badgeId
				message
			}
		}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, "Achievement badge created successfully", response.CreateAchievementBadge.Message)
		badgeId2 = response.CreateAchievementBadge.BadgeID

		require.NotEqual(t, badgeId1, badgeId2)
	})

	t.Run("Award Achievement", func(t *testing.T) {
		var response struct {
			AwardAchievement struct {
				UserAchievementID string
				Message           string
			}
		}

		// 奖励第一个徽章
		c.MustPost(`mutation award_achievement($badgeId: String!) {
			awardAchievement(badgeId: $badgeId) {
				userAchievementId
				message
			}
		}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)), client.Var("badgeId", badgeId1))
		assessmentId1 = response.AwardAchievement.UserAchievementID
		require.Equal(t, "Achievement awarded successfully", response.AwardAchievement.Message)

		// 奖励第二个徽章
		c.MustPost(`mutation award_achievement($badgeId: String!) {
			awardAchievement(badgeId: $badgeId) {
				userAchievementId
				message
			}
		}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)), client.Var("badgeId", badgeId2))
		assessmentId2 = response.AwardAchievement.UserAchievementID
		require.Equal(t, "Achievement awarded successfully", response.AwardAchievement.Message)
	})

	t.Run("Get Achievement Badges", func(t *testing.T) {
		var response struct {
			GetAchievementBadges []struct {
				BadgeID     string
				Name        string
				Description string
				IconURL     string
			}
		}
		c.MustPost(`query get_badges {
			getAchievementBadges {
				badgeId
				name
				description
				iconUrl
			}
		}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))

		require.Equal(t, badgeId1, response.GetAchievementBadges[len(response.GetAchievementBadges)-2].BadgeID)
		require.Equal(t, "First Badge", response.GetAchievementBadges[len(response.GetAchievementBadges)-2].Name)
		require.Equal(t, badgeId2, response.GetAchievementBadges[len(response.GetAchievementBadges)-1].BadgeID)
		require.Equal(t, "Second Badge", response.GetAchievementBadges[len(response.GetAchievementBadges)-1].Name)
	})

	t.Run("Get User Achievements", func(t *testing.T) {
		var response struct {
			GetUserAchievements []struct {
				BadgeID           string
				UserAchievementID string
				EarnedAt          string
			}
		}
		c.MustPost(`query get_user_achievements {
			getUserAchievements {
				badgeId
				userAchievementId
				earnedAt
			}
		}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))

		require.Equal(t, assessmentId1, response.GetUserAchievements[0].BadgeID)
		require.Equal(t, assessmentId2, response.GetUserAchievements[1].BadgeID)
	})

	t.Run("Invalid Award Achievement", func(t *testing.T) {
		var response struct {
			AwardAchievement struct {
				UserAchievementID string
				Message           string
			}
		}
		var errMsg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}

		err := c.Post(`mutation award_achievement($badgeId: String!) {
            awardAchievement(badgeId: $badgeId) {
                userAchievementId
                message
            }
        }`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)), client.Var("badgeId", "invalid_badgeId"))

		// 检查 err 是否为 nil
		if err == nil {
			t.Fatalf("expected an error but got none")
		}

		// 解析错误消息
		json.Unmarshal(json.RawMessage(err.Error()), &errMsg)

		// 检查 errMsg 是否为空
		if len(errMsg) == 0 {
			t.Fatalf("error message slice is empty")
		}

		// 验证错误信息
		require.Equal(t, "invalid badge ID", errMsg[0].Message)
	})

	DeleteUser(t, c, user)
}

func TestPoints(t *testing.T) {
	c := client.New(NewServer())
	user := CreateUserAndLogin(t, c)

	var points1, points2 float64

	t.Run("Award points", func(t *testing.T) {
		var response struct {
			EarnPoints struct {
				UpdatedPoints float64
				Message       string
			}
		}

		points1 = rand.Float64() * 100.0

		c.MustPost(`mutation add_points($pointsEarned: Float!){
			earnPoints(pointsEarned:$pointsEarned, reason:"earned_reason"){
				updatedPoints,
				message
			}
		}`, &response, client.Var("pointsEarned", points1),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, fmt.Sprintf("%f points successfully added to user", points1), response.EarnPoints.Message)
		require.Equal(t, points1, response.EarnPoints.UpdatedPoints)

		points2 = rand.Float64() * 100.0

		c.MustPost(`mutation add_points($pointsEarned: Float!){
			earnPoints(pointsEarned:$pointsEarned, reason:"another reason"){
				updatedPoints,
				message
			}
		}`, &response, client.Var("pointsEarned", points2),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, fmt.Sprintf("%f points successfully added to user", points2), response.EarnPoints.Message)
		println(points1)
		println(points2)
		require.Equal(t, points1+points2, response.EarnPoints.UpdatedPoints)
	})

	t.Run("Query points history", func(t *testing.T) {
		var response struct {
			GetUserPointRecords []struct {
				RecordID     string
				PointsEarned float64
				Reason       string
				EarnedAt     string
			}
		}

		c.MustPost(`query{
			getUserPointRecords{
				recordId,
				pointsEarned,
				reason,
				earnedAt
			}
		}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))

		require.Equal(t, 2, len(response.GetUserPointRecords))
	})

	t.Run("Error responses", func(t *testing.T) {
		var response struct {
			EarnPoints struct {
				UpdatedPoints float64
				Message       string
			}
		}
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}

		err := c.Post(`mutation add_points($pointsEarned: Float!){
			earnPoints(pointsEarned:$pointsEarned, reason:"earned_reason"){
				updatedPoints,
				message
			}
		}`, &response, client.Var("pointsEarned", 1.0))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)

		err = c.Post(`mutation add_points($pointsEarned: Float!){
			earnPoints(pointsEarned:$pointsEarned, reason:"earned_reason"){
				updatedPoints,
				message
			}
		}`, &response, client.Var("pointsEarned", -0.5),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "earned points must be positive number", err_msg[0].Message)

		var response_query struct {
			GetUserPointRecords []struct {
				RecordID     string
				PointsEarned float64
				Reason       string
				EarnedAt     string
			}
		}

		err = c.Post(`query{
			getUserPointRecords{
				recordId,
				pointsEarned,
				reason,
				earnedAt
			}
		}`, &response_query)
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
	})

	DeleteUser(t, c, user)
}
