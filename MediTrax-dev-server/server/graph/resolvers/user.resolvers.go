package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.
// Code generated by github.com/99designs/gqlgen version v0.17.55

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"math/rand"
	"meditrax/graph/custom"
	"meditrax/graph/database"
	middlewares "meditrax/graph/middleware"
	"meditrax/graph/model"
	"meditrax/graph/utils"
	"strings"
	"time"

	"github.com/aliyun/alibaba-cloud-sdk-go/services/dysmsapi"
	surrealdb "github.com/surrealdb/surrealdb.go"
)

// RefreshToken is the resolver for the refreshToken field.
func (r *mutationResolver) RefreshToken(ctx context.Context, accessToken string, refreshToken string, device string) (*model.Token, error) {
	result, err := database.DB.Query("SELECT * FROM token WHERE accessToken=$accessToken AND refreshToken=$refreshToken;", map[string]string{
		"accessToken":  accessToken,
		"refreshToken": refreshToken,
	})
	if err != nil {
		return nil, err
	}

	results, err := surrealdb.SmartUnmarshal[[]model.Token](result, nil)
	if err != nil {
		return nil, err
	}
	if len(results) <= 0 {
		return nil, fmt.Errorf("token not found")
	}
	token := results[0]
	// Retrieve the user associated with the token
	var user model.User
	data, err := database.DB.Select(token.User)
	if err != nil {
		return nil, err
	}
	user, err = surrealdb.SmartUnmarshal[model.User](data, nil)
	if err != nil {
		return nil, err
	}
	// Generate a new token
	newToken, err := utils.HandleLogin(&user, ctx)
	if err != nil {
		return nil, err
	}
	// Delete the old token
	database.DB.Delete(token.ID)
	return newToken, nil
}

// CreateUser is the resolver for the createUser field.
func (r *mutationResolver) CreateUser(ctx context.Context, phoneNumber string, password string, username string, role string) (*model.CreateUserResponse, error) {
	// panic(fmt.Errorf("waiting to be implemented"))
	// Check for unique phoneNumber and username
	result, err := database.DB.Query(`
	SELECT * FROM user WHERE name=$name OR phoneNumber=$phoneNumber;`, map[string]interface{}{
		"name":        username,
		"phoneNumber": phoneNumber,
	})

	if err != nil {
		return nil, err
	}
	//check the result of the query
	users, err := surrealdb.SmartUnmarshal[[]model.User](result, nil)
	if err != nil {
		return nil, err
	}
	if len(users) > 0 {
		return nil, fmt.Errorf("phoneNumber and username should be unique")
	}

	// Create the new user
	result, err = database.DB.Query(
		`CREATE ONLY user:ulid()
		SET name=$username,
		phoneNumber=$phoneNumber,
		password=crypto::argon2::generate($password),
		role=$role,
		points=0.0,
		createdAt=<datetime>$now,
		updatedAt=<datetime>$now;
		`, map[string]interface{}{
			"username":    username,
			"phoneNumber": phoneNumber,
			"password":    password,
			"role":        role,
			"now":         time.Now().UTC(),
		})
	if err != nil {
		return nil, err
	}

	newUser, err := surrealdb.SmartUnmarshal[model.User](result, nil)
	if err != nil {
		return nil, err
	}

	response := &model.CreateUserResponse{
		UserID:  newUser.ID,
		Message: fmt.Sprintf("User %s created successfully", newUser.Name),
	}

	return response, nil
}

// LoginUser is the resolver for the loginUser field.
func (r *mutationResolver) LoginUser(ctx context.Context, phoneNumber string, password string) (*model.LoginUserResponse, error) {
	//panic(fmt.Errorf("waiting to be implemented"))
	// // Fetch the user based on phone number
	result, err := database.DB.Query(`SELECT * FROM user WHERE phoneNumber=$phoneNumber AND crypto::argon2::compare(password, $pass);`, map[string]interface{}{
		"phoneNumber": phoneNumber,
		"pass":        password,
	})
	if err != nil {
		return nil, err
	}

	users, err := surrealdb.SmartUnmarshal[[]model.User](result, nil)
	if err != nil {
		return nil, err
	}
	if len(users) <= 0 {
		return nil, fmt.Errorf("user not found")
	}

	user := users[0]
	if user.Password == "" {
		return nil, fmt.Errorf("user not available for password sign in, use other sign in methods instead")
	}

	token, err := utils.HandleLogin(&user, ctx)
	if err != nil {
		return nil, err
	}

	response := &model.LoginUserResponse{
		UserID:  user.ID,
		Token:   token,
		Message: "Login successful",
	}

	_, err = database.DB.Query(
		`UPDATE $userId SET lastLogin=<datetime>$now;`, map[string]interface{}{
			"userId": user.ID,
			"now":    time.Now().UTC(),
		})
	if err != nil {
		return nil, err
	}

	return response, nil
}

// UpdateUser is the resolver for the updateUser field.
func (r *mutationResolver) UpdateUser(ctx context.Context, name *string, phoneNumber *string, password *string) (*model.UpdateUserResponse, error) {
	// check if the user is registed
	user := middlewares.ForContext(ctx)
	if user == nil {
		return nil, fmt.Errorf("access denied")
	}

	// 初始化更新值map
	updateValues := map[string]interface{}{"id": user.ID}

	// 准备需要更新的字段
	updateFields := []string{}

	if name != nil {
		updateValues["name"] = *name
		updateFields = append(updateFields, "name = $name")
	}

	if phoneNumber != nil {
		// TODO:可以添加电话号码格式验证
		updateValues["phone_number"] = *phoneNumber
		updateFields = append(updateFields, "phone_number = $phone_number")
	}

	if password != nil {
		updateValues["password"] = password
		updateFields = append(updateFields, "password = $password")
	}

	// 如果没有要更新的字段，返回错误
	if len(updateFields) == 0 {
		return nil, fmt.Errorf("no fields to update")
	}

	// 构造更新查询
	query := fmt.Sprintf("UPDATE $id SET %s;", strings.Join(updateFields, ", "))

	// 执行更新查询
	result, err := database.DB.Query(query, updateValues)
	if err != nil {
		return nil, err
	}

	// 解析结果
	results, err := surrealdb.SmartUnmarshal[[]model.User](result, nil)
	if err != nil {
		return nil, err
	}
	if len(results) == 0 {
		return nil, fmt.Errorf("user not found")
	}

	// 创建响应
	response := &model.UpdateUserResponse{
		UserID:  results[0].ID,
		Message: "User updated successfully",
	}

	return response, nil
}

// DeleteUser is the resolver for the deleteUser field.
func (r *mutationResolver) DeleteUser(ctx context.Context) (*model.DeleteUserResponse, error) {
	// 检查用户是否已登录
	user := middlewares.ForContext(ctx)
	if user == nil {
		return nil, fmt.Errorf("access denied")
	}

	// 执行删除查询，RETURN BEFORE 会返回删除前的用户数据
	result, err := database.DB.Query(
		`DELETE $id RETURN BEFORE;`,
		map[string]interface{}{
			"id": user.ID,
		},
	)
	if err != nil {
		return nil, err
	}

	// 解析结果并检查错误
	results, err := surrealdb.SmartUnmarshal[[]model.User](result, nil)
	if err != nil {
		return nil, err
	}
	if len(results) == 0 {
		return nil, fmt.Errorf("user not found")
	}

	/* delete related data entries */
	// delete all objects with userId=user.ID
	for _, tableName := range utils.UserRelatedTables {
		_, err = database.DB.Query(
			`DELETE $table_name WHERE userId = $id;`,
			map[string]interface{}{
				"table_name": tableName,
				"id":         user.ID,
			},
		)
		if err != nil {
			return nil, fmt.Errorf("failed to delete related data from table %s: %w", tableName, err)
		}
	}
	// delete shared profile entries
	_, err = database.DB.Query(
		`DELETE profile_access WHERE to = $id OR from = $id;`,
		map[string]interface{}{
			"id": user.ID,
		},
	)
	if err != nil {
		return nil, fmt.Errorf("failed to delete from table profile_access where user is patient")
	}

	// 创建响应
	response := &model.DeleteUserResponse{
		Message: fmt.Sprintf("User %s with name %s deleted successfully", results[0].ID, results[0].Name),
	}

	return response, nil
}

// RequestPasswordReset is the resolver for the requestPasswordReset field.
func (r *mutationResolver) RequestPasswordReset(ctx context.Context, phoneNumber string) (*model.RequestPasswordResetResponse, error) {
	result, err := database.DB.Query(`
    SELECT * FROM user WHERE phoneNumber=$phoneNumber;`,
		map[string]interface{}{
			"phoneNumber": phoneNumber,
		})
	if err != nil {
		return nil, err
	}

	users, err := surrealdb.SmartUnmarshal[[]model.User](result, nil)
	if err != nil {
		return nil, err
	}
	if len(users) <= 0 {
		return nil, fmt.Errorf("user not found")
	}

	// 创建密码重置请求
	result2, err := database.DB.Query(
		`CREATE ONLY passwordChange:ulid() SET userId=$userId;`,
		map[string]interface{}{
			"userId": users[0].ID,
		})
	if err != nil {
		return nil, err
	}

	results2, err := surrealdb.SmartUnmarshal[model.PasswordChange](result2, nil)
	if err != nil {
		return nil, err
	}

	// 获取重置码
	resetCode := strings.Split(results2.ID, ":")[1]
	log.Printf(resetCode)
	// 使用提取部分的长度作为种子（确保每次生成不同）
	rand.Seed(time.Now().UnixNano() + int64(len(resetCode)))

	// 生成一个随机的 6 位数字验证码
	numericResetCode := fmt.Sprintf("%06d", rand.Intn(1000000)) // 0-999999

	// 更新数据库中的 resetCode 字段为生成的 6 位验证码
	_, err = database.DB.Query(
		`UPDATE $id SET resetCode=$resetCode;`,
		map[string]interface{}{
			"id":        results2.ID,
			"resetCode": numericResetCode,
		})
	if err != nil {
		return nil, fmt.Errorf("failed to update resetCode: %v", err)
	}
	resetCode = numericResetCode

	// 阿里云短信服务的凭证
	accessKeyId := "LTAI5tLD94gG1JJBs3GRGw5Q"           // 替换为你从阿里云获取的 AccessKeyId
	accessKeySecret := "8AdXowtI5gzvY7WHKxb5ebbw0FaWiZ" // 替换为你从阿里云获取的 AccessKeySecret

	// 创建阿里云短信客户端
	client, err := dysmsapi.NewClientWithAccessKey("cn-hangzhou", accessKeyId, accessKeySecret)
	if err != nil {
		log.Printf("Failed to create client: %v", err)
		return nil, err
	}

	// 创建短信请求参数
	request := dysmsapi.CreateSendSmsRequest()
	request.Scheme = "https"
	request.PhoneNumbers = phoneNumber                              // 接收短信的手机号码
	request.SignName = "Meditrax验证码"                                // 替换短信签名
	request.TemplateCode = "SMS_476405140"                          // 替换短信模板ID
	request.TemplateParam = fmt.Sprintf(`{"code":"%s"}`, resetCode) // 填入模板参数，代码作为示例

	// 发送短信
	response, err := client.SendSms(request)
	if err != nil {
		log.Printf("Failed to send SMS: %v", err)
		return nil, err
	}

	// 打印返回结果（可以根据需要进行日志记录）
	if response.Code != "OK" {
		log.Printf("Failed to send SMS: %s", response.Message)
		return nil, fmt.Errorf("SMS sending failed: %s", response.Message)
	}

	log.Printf("SMS sent successfully, requestId: %s", response.RequestId)

	// 创建响应
	responseMsg := &model.RequestPasswordResetResponse{
		Message: fmt.Sprintf("Password reset code %s has been sent to your phone %s", resetCode, phoneNumber),
	}

	return responseMsg, nil
}

// ResetPassword is the resolver for the resetPassword field.
func (r *mutationResolver) ResetPassword(ctx context.Context, resetCode string, newPassword string) (*model.ResetPasswordResponse, error) {
	// Retrieve password reset request using the resetCode
	result, err := database.DB.Query(`
    SELECT * FROM passwordChange WHERE resetCode = $resetCode;`,
		map[string]interface{}{
			"resetCode": resetCode,
		})
	if err != nil || result == nil {
		return nil, fmt.Errorf("invalid or expired resetcode")
	}

	// 确保 queryResult 是 []interface{} 类型
	rawResults, ok := result.([]interface{})
	if !ok || len(rawResults) == 0 {
		return nil, fmt.Errorf("invalid or expired resetcode")
	}

	// 获取第一条记录（rawResults[0] 是 map）
	rawRecord, ok := rawResults[0].(map[string]interface{})
	if !ok {
		return nil, fmt.Errorf("invalid or expired resetcode")
	}

	// 从记录中提取 "result" 字段
	rawData, ok := rawRecord["result"].([]interface{})
	if !ok || len(rawData) == 0 {
		return nil, fmt.Errorf("invalid or expired resetcode")
	}

	// 获取结果数组中的第一条记录
	recordData, ok := rawData[0].(map[string]interface{})
	if !ok {
		return nil, fmt.Errorf("invalid or expired resetcode")
	}

	// 将第一条记录反序列化为 PasswordChange
	recordJSON, err := json.Marshal(recordData)
	if err != nil {
		return nil, fmt.Errorf("failed to process resetcode data")
	}

	var passwordChange model.PasswordChange
	err = json.Unmarshal(recordJSON, &passwordChange)
	if err != nil {
		return nil, fmt.Errorf("invalid resetcode format")
	}

	// Update the user's password in the database
	_, err = database.DB.Query("UPDATE $id SET password=crypto::argon2::generate($password);", map[string]interface{}{
		"id":       passwordChange.User,
		"password": newPassword,
	})
	if err != nil {
		// Database query failed
		return nil, fmt.Errorf("failed to reset password: %v", err)
	}

	// Return success message
	return &model.ResetPasswordResponse{
		Message: "Password reset successfully",
	}, nil
}

// ShareProfile is the resolver for the shareProfile field.
func (r *mutationResolver) ShareProfile(ctx context.Context, phoneNumber string, accessLevel string, remarks string) (*model.ShareProfileResponse, error) {
	user := middlewares.ForContext(ctx)
	if user == nil {
		return nil, fmt.Errorf("access denied")
	}

	// First, find the target user by phone number
	result, err := database.DB.Query(`
        SELECT * FROM user 
        WHERE phoneNumber = $phone_number 
        LIMIT 1;
    `, map[string]interface{}{
		"phone_number": phoneNumber,
	})
	if err != nil {
		return nil, err
	}

	users, err := surrealdb.SmartUnmarshal[[]model.User](result, nil)
	if err != nil {
		return nil, err
	}

	if len(users) == 0 {
		return nil, fmt.Errorf("no user found with the provided phone number")
	}

	targetUser := users[0]

	// Prevent sharing with self
	if targetUser.ID == user.ID {
		return nil, fmt.Errorf("cannot share profile with yourself")
	}

	// Create the profile_access edge
	result, err = database.DB.Query(`
        LET $edge = (SELECT * FROM profile_access WHERE in = $from AND out = $to);
        IF $edge == [] THEN
            CREATE profile_access SET
                in = $from,
                out = $to,
                accessLevel = $accessLevel,
                remarks = $remarks,
                createdAt = <datetime>$now;
        END;
    `, map[string]interface{}{
		"from":        user.ID,
		"to":          targetUser.ID,
		"accessLevel": accessLevel,
		"remarks":     remarks,
		"now":         time.Now().UTC(),
	})
	if err != nil {
		return nil, err
	}

	// fmt.Println("profile shared successfully with", targetUser.Name, result)
	return &model.ShareProfileResponse{
		Message: fmt.Sprintf("Profile shared successfully with %s", targetUser.Name),
	}, nil
}

// UnshareProfile is the resolver for the unshareProfile field.
func (r *mutationResolver) UnshareProfile(ctx context.Context, targetUserID string) (*model.UnshareProfileResponse, error) {
	user := middlewares.ForContext(ctx)
	if user == nil {
		return nil, fmt.Errorf("access denied")
	}

	// Delete the profile_access edge between current user and target user
	_, err := database.DB.Query(`
        DELETE profile_access 
        WHERE in = $from_user 
        AND out = $to_user;
    `, map[string]interface{}{
		"from_user": user.ID,
		"to_user":   targetUserID,
	})
	if err != nil {
		return nil, err
	}

	return &model.UnshareProfileResponse{
		Message: fmt.Sprintf("Profile access removed for user %s", targetUserID),
	}, nil
}

// GetUser is the resolver for the getUser field.
func (r *queryResolver) GetUser(ctx context.Context) (*model.UserDetailResponse, error) {
	// Fetch the user details
	user := middlewares.ForContext(ctx)
	if user == nil {
		return nil, fmt.Errorf("access denied")
	}

	response := &model.UserDetailResponse{
		UserID:      user.ID,
		PhoneNumber: user.PhoneNumber,
		Name:        user.Name,
		Role:        user.Role,
		Points:      user.Points,
		CreatedAt:   user.CreatedAt,
		LastLogin:   &user.LastLogin,
	}
	return response, nil
}

// GetProfiles is the resolver for the getProfiles field.
func (r *queryResolver) GetProfiles(ctx context.Context) ([]*model.ProfileDetail, error) {
	user := middlewares.ForContext(ctx)
	if user == nil {
		return nil, fmt.Errorf("access denied")
	}

	// println("getting all profiles shares with the current user...")

	// Get all profiles shared with the current user (incoming edges)
	result, err := database.DB.Query(`
        SELECT in.* FROM profile_access 
        WHERE out = $userId;
    `, map[string]interface{}{
		"userId": user.ID,
	})
	if err != nil {
		return nil, err
	}

	results, err := surrealdb.SmartUnmarshal[[]map[string]interface{}](result, nil)
	if err != nil {
		return nil, err
	}

	// Create a slice to store all profiles
	var profiles []*model.ProfileDetail

	// Add current user's profile first
	profiles = append(profiles, &model.ProfileDetail{
		ID:          user.ID,
		Name:        user.Name,
		PhoneNumber: user.PhoneNumber,
		Role:        user.Role,
		CreatedAt:   user.CreatedAt,
	})

	// Add all profiles shared with the current user
	for _, result := range results {
		user := result["in"].(map[string]interface{})
		createdAt, err := custom.UnmarshalDateTime(user["createdAt"].(string))
		if err != nil {
			println("there was an error unmarshaling createdAt, skipping: %s", err.Error())
			continue
		}
		profiles = append(profiles, &model.ProfileDetail{
			ID:          user["id"].(string),
			Name:        user["name"].(string),
			PhoneNumber: user["phoneNumber"].(string),
			Role:        user["role"].(string),
			CreatedAt:   createdAt,
		})
	}

	return profiles, nil
}

// GetSharedProfiles is the resolver for the getSharedProfiles field.
func (r *queryResolver) GetSharedProfiles(ctx context.Context) ([]*model.ProfileDetail, error) {
	user := middlewares.ForContext(ctx)
	if user == nil {
		return nil, fmt.Errorf("access denied")
	}

	// Get all profiles that the current user has shared with others (outgoing edges)
	result, err := database.DB.Query(`
        SELECT out.* FROM profile_access 
        WHERE in = $userId;
    `, map[string]interface{}{
		"userId": user.ID,
	})
	if err != nil {
		return nil, err
	}

	results, err := surrealdb.SmartUnmarshal[[]map[string]interface{}](result, nil)
	if err != nil {
		return nil, err
	}

	// Create a slice to store all profiles
	var profiles []*model.ProfileDetail

	// Add current user's profile first
	profiles = append(profiles, &model.ProfileDetail{
		ID:          user.ID,
		Name:        user.Name,
		PhoneNumber: user.PhoneNumber,
		Role:        user.Role,
		CreatedAt:   user.CreatedAt,
	})

	// Add all profiles shared with the current user
	for _, result := range results {
		user := result["out"].(map[string]interface{})
		createdAt, err := custom.UnmarshalDateTime(user["createdAt"].(string))
		if err != nil {
			println("there was an error unmarshaling createdAt, skipping: %s", err.Error())
			continue
		}
		profiles = append(profiles, &model.ProfileDetail{
			ID:          user["id"].(string),
			Name:        user["name"].(string),
			PhoneNumber: user["phoneNumber"].(string),
			Role:        user["role"].(string),
			CreatedAt:   createdAt,
		})
	}

	return profiles, nil
}

// GetSharedMedicalRecords is the resolver for the getSharedMedicalRecords field.
func (r *queryResolver) GetSharedMedicalRecords(ctx context.Context, patientID string) ([]*model.MedicalRecordDetail, error) {
	user := middlewares.ForContext(ctx)
	if user == nil {
		return nil, fmt.Errorf("access denied")
	}
	if !utils.IsProfileShared(patientID, user.ID) {
		return nil, fmt.Errorf("access denied, user is not a family member of patient")
	}

	user, err := utils.GetUserByID(patientID)
	if err != nil {
		return nil, fmt.Errorf("error getting patient information: %e", err)
	}

	return utils.GetMedicalRecords(*user)
}

// GetSharedTreatmentSchedule is the resolver for the getSharedTreatmentSchedule field.
func (r *queryResolver) GetSharedTreatmentSchedule(ctx context.Context, patientID string) ([]*model.TreatmentScheduleDetail, error) {
	user := middlewares.ForContext(ctx)
	if user == nil {
		return nil, fmt.Errorf("access denied")
	}
	if !utils.IsProfileShared(patientID, user.ID) {
		return nil, fmt.Errorf("access denied, user is not a family member of patient")
	}

	user, err := utils.GetUserByID(patientID)
	if err != nil {
		return nil, fmt.Errorf("error getting patient information: %e", err)
	}

	return utils.GetTreatmentSchedules(*user)
}

// GetSharedMedications is the resolver for the getSharedMedications field.
func (r *queryResolver) GetSharedMedications(ctx context.Context, patientID string) ([]*model.MedicationDetail, error) {
	user := middlewares.ForContext(ctx)
	if user == nil {
		return nil, fmt.Errorf("access denied")
	}
	if !utils.IsProfileShared(patientID, user.ID) {
		return nil, fmt.Errorf("access denied, user is not a family member of patient")
	}

	user, err := utils.GetUserByID(patientID)
	if err != nil {
		return nil, fmt.Errorf("error getting patient information: %e", err)
	}

	return utils.GetMedications(*user)
}

// GetSharedHealthMetrics is the resolver for the getSharedHealthMetrics field.
func (r *queryResolver) GetSharedHealthMetrics(ctx context.Context, patientID string, startDate *time.Time, endDate *time.Time, metricType *string) ([]*model.HealthMetricDetail, error) {
	user := middlewares.ForContext(ctx)
	if user == nil {
		return nil, fmt.Errorf("access denied")
	}
	if !utils.IsProfileShared(patientID, user.ID) {
		return nil, fmt.Errorf("access denied, user is not a family member of patient")
	}

	user, err := utils.GetUserByID(patientID)
	if err != nil {
		return nil, fmt.Errorf("error getting patient information: %e", err)
	}

	return utils.GetHealthMetrics(*user, startDate, endDate, metricType)
}
