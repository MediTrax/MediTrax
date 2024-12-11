package tests

import (
	"encoding/json"
	"fmt"
	"meditrax/graph/utils"
	"testing"

	"github.com/99designs/gqlgen/client"
	"github.com/stretchr/testify/require"
)

func TestActivityLogWithAddFunction(t *testing.T) {
	c := client.New(NewServer())
	user := CreateUserAndLogin(t, c) // 创建并登录用户

	t.Run("Add Activity Logs", func(t *testing.T) {
		// 使用 AddActivityLogs 添加测试数据
		changes1 := []utils.ChangeLog{
			{Field: "Status", From: "Pending", To: "Active"},
		}
		changes2 := []utils.ChangeLog{
			{Field: "Name", From: "Old Name", To: "New Name"},
		}

		err := utils.AddActivityLogs(user.ID, "CREATE", "User created a new record", "Record", changes1)
		require.NoError(t, err, "Failed to add activity log 1")

		err = utils.AddActivityLogs(user.ID, "UPDATE", "User updated a field", "Profile", changes2)
		require.NoError(t, err, "Failed to add activity log 2")
	})

	t.Run("Query Activity Logs", func(t *testing.T) {
		var response struct {
			GetActivityLog []struct {
				LogID         string `json:"logId"`
				ActivityType  string `json:"activityType"`
				Description   string `json:"description"`
				ChangedObject string `json:"changedObject"`
				ChangedField  string `json:"changedField"`
				From          string `json:"from"`
				To            string `json:"to"`
				Timestamp     string `json:"timestamp"`
			}
		}

		// 查询活动日志
		c.MustPost(`query {
			getActivityLog {
				logId
				activityType
				description
				changedObject
				changedField
				from
				to
				timestamp
			}
		}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))

		// 验证返回的日志条数
		require.Equal(t, 2, len(response.GetActivityLog))

		// 验证第一条日志的内容
		require.Equal(t, "CREATE", response.GetActivityLog[0].ActivityType)
		require.Equal(t, "User created a new record", response.GetActivityLog[0].Description)
		require.Equal(t, "Record", response.GetActivityLog[0].ChangedObject)
		require.Equal(t, "Status", response.GetActivityLog[0].ChangedField)
		require.Equal(t, "Pending", response.GetActivityLog[0].From)
		require.Equal(t, "Active", response.GetActivityLog[0].To)

		// 验证第二条日志的内容
		require.Equal(t, "UPDATE", response.GetActivityLog[1].ActivityType)
		require.Equal(t, "User updated a field", response.GetActivityLog[1].Description)
		require.Equal(t, "Profile", response.GetActivityLog[1].ChangedObject)
		require.Equal(t, "Name", response.GetActivityLog[1].ChangedField)
		require.Equal(t, "Old Name", response.GetActivityLog[1].From)
		require.Equal(t, "New Name", response.GetActivityLog[1].To)
	})
	t.Run("Get Health Assessment Questions Access Denied", func(t *testing.T) {
		var deniedResponse struct {
			GetActivityLog []struct {
				LogID         string `json:"logId"`
				ActivityType  string `json:"activityType"`
				Description   string `json:"description"`
				ChangedObject string `json:"changedObject"`
				ChangedField  string `json:"changedField"`
				From          string `json:"from"`
				To            string `json:"to"`
				Timestamp     string `json:"timestamp"`
			}
		}
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		// 无效令牌
		err := c.Post(`query {
			getActivityLog {
				logId
				activityType
				description
				changedObject
				changedField
				from
				to
				timestamp
			}
		}`, &deniedResponse)
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
	})
	DeleteUser(t, c, user)
}
