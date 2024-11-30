package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.
// Code generated by github.com/99designs/gqlgen version v0.17.55

import (
	"context"
	"fmt"
	"meditrax/graph/database"
	middlewares "meditrax/graph/middleware"
	"meditrax/graph/model"
	"meditrax/graph/utils"
	"strings"

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
		created_at=time::now(),
		updated_at=time::now();`, map[string]interface{}{
			"username":    username,
			"phoneNumber": phoneNumber,
			"password":    password,
			"role":        role,
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
		`UPDATE $user_id SET last_login=time::now();`, map[string]interface{}{
			"user_id": user.ID,
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

	// delete related data entries
	for _, tableName := range utils.UserRelatedTables {
		_, err = database.DB.Query(
			`DELETE $table_name WHERE user_id = $id;`,
			map[string]interface{}{
				"table_name": tableName,
				"id":         user.ID,
			},
		)
		if err != nil {
			return nil, fmt.Errorf("failed to delete related data from table %s: %w", tableName, err)
		}
	}
	// detete family members that relate to this user
	_, err = database.DB.Query(
		`DELETE $table_name WHERE related_user_id = $id;`,
		map[string]interface{}{
			"table_name": "family_member",
			"id":         user.ID,
		},
	)
	if err != nil {
		return nil, fmt.Errorf("failed to delete related data from table family member related to user: %w", err)
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
    SELECT * FROM user WHERE phone_number=$phone_number;`,
		map[string]interface{}{
			"phone_number": phoneNumber,
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

	// TODO: 在这里实现发送短信的逻辑
	// 暂时只返回成功消息，实际项目中需要集成短信服务

	// 创建响应
	response := &model.RequestPasswordResetResponse{
		Message: fmt.Sprintf("Password reset code %s has been sent to your phone %s", resetCode, phoneNumber),
	}

	return response, nil
}

// ResetPassword is the resolver for the resetPassword field.
func (r *mutationResolver) ResetPassword(ctx context.Context, token string, newPassword string) (*model.ResetPasswordResponse, error) {
	// Retrieve password reset request using the token
	data, err := database.DB.Select("passwordChange:" + token)
	if err != nil {
		// Token not found or an error occurred
		return nil, fmt.Errorf("invalid or expired token")
	}
	passwordReset, err := surrealdb.SmartUnmarshal[model.PasswordChange](data, nil)
	if err != nil {
		// Unmarshal error, invalid data
		return nil, fmt.Errorf("invalid token data")
	}

	// Update the user's password in the database
	_, err = database.DB.Query("UPDATE $id SET password=crypto::argon2::generate($password);", map[string]interface{}{
		"id":       passwordReset.User,
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

// AddFamilyMember is the resolver for the addFamilyMember field.
func (r *mutationResolver) AddFamilyMember(ctx context.Context, relatedUserID string, relationship string, accessLevel string) (*model.AddFamilyMemberResponse, error) {
	// TODO
	user := middlewares.ForContext(ctx)
	if user == nil {
		return nil, fmt.Errorf("access denied")
	}

	result, err := database.DB.Query(
		`SELECT * FROM user:$related_id LIMIT 1;`,
		map[string]interface{}{
			"related_id": relatedUserID,
		},
	)
	if err != nil {
		return nil, err
	}
	related_users, err := surrealdb.SmartUnmarshal[[]model.User](result, nil)
	if err != nil {
		return nil, err
	}
	if len(related_users) < 1 {
		return nil, fmt.Errorf("error, can not find user with given related user id")
	}

	related := related_users[0]

	// finally, send the create reminder query
	result, err = database.DB.Query(
		`CREATE ONLY family_member:ulid()
		SET user_id: $user_id,
		related_user_id: $related_id,
		relationship: $relationship,
		access_level: $access_level,
		created_at: time::now()
		`,
		map[string]interface{}{
			"user_id":      user.ID,
			"related_id":   related.ID,
			"relationship": relationship,
			"access_level": accessLevel,
		},
	)
	if err != nil {
		return nil, err
	}

	// unmarshal the results of the CREATE query
	member, err := surrealdb.SmartUnmarshal[model.FamilyMember](result, nil)
	if err != nil {
		return nil, err
	}

	// create response
	response := &model.AddFamilyMemberResponse{
		MemberID: member.ID,
		Message:  "new family member added successfully",
	}
	return response, nil
}

// UpdateFamilyMember is the resolver for the updateFamilyMember field.
func (r *mutationResolver) UpdateFamilyMember(ctx context.Context, memberID string, relationship *string, accessLevel *string) (*model.UpdateFamilyMemberResponse, error) {
	user := middlewares.ForContext(ctx)
	if user == nil {
		return nil, fmt.Errorf("access denied")
	}

	// check legality of the member id
	if !utils.MatchID(memberID, "family_member") {
		return nil, fmt.Errorf("illegal member id")
	}

	// Initialize a map to hold the update values
	updateValues := map[string]interface{}{"id": memberID, "user_id": user.ID}

	// Prepare the fields to be updated
	updateFields := []string{}
	if relationship != nil {
		updateValues["relationship"] = *relationship
		updateFields = append(updateFields, "relationship = $relationship")
	}
	if accessLevel != nil {
		updateValues["access_level"] = *accessLevel
		updateFields = append(updateFields, "access_level = $access_level")
	}

	// Construct the final query with the medicationID in quotes
	query := fmt.Sprintf("UPDATE $id SET %s WHERE user_id=$user_id;", strings.Join(updateFields, ", "))

	// send the UPDATE query
	result, err := database.DB.Query(query, updateValues)
	if err != nil {
		return nil, err
	}

	// unmarshal the results and check for errors
	results, err := surrealdb.SmartUnmarshal[[]model.FamilyMember](result, nil)
	if err != nil {
		return nil, err
	}
	if len(results) == 0 {
		return nil, fmt.Errorf("invalid id. no associated family member object found")
	}

	// create response
	response := &model.UpdateFamilyMemberResponse{
		MemberID: results[0].ID,
		Message:  "Family member updated successfully",
	}

	// Return the response with the medication ID and a success message
	return response, nil
}

// DeleteFamilyMember is the resolver for the deleteFamilyMember field.
func (r *mutationResolver) DeleteFamilyMember(ctx context.Context, memberID string) (*model.DeleteFamilyMemberResponse, error) {
	user := middlewares.ForContext(ctx)
	if user == nil {
		return nil, fmt.Errorf("access denied")
	}

	// check legality of the provided id
	if !utils.MatchID(memberID, "family_member") {
		return nil, fmt.Errorf("illegal family member id")
	}

	// Execute the query
	result, err := database.DB.Query(
		`DELETE $id WHERE user_id=$user_id RETURN BEFORE;`,
		map[string]interface{}{
			"id":      memberID,
			"user_id": user.ID,
		},
	)
	if err != nil {
		return nil, err // Return the error if the query fails
	}

	// unmarshal results and check for errors
	results, err := surrealdb.SmartUnmarshal[[]model.FamilyMember](result, nil)
	if err != nil {
		return nil, err
	}
	if len(results) == 0 {
		return nil, fmt.Errorf("invalid id, no associated family member object found")
	}

	// create response
	response := &model.DeleteFamilyMemberResponse{
		Message: fmt.Sprintf("Family member %s with related member id %s deleted successfully", results[0].ID, results[0].RelatedUserID),
	}

	// Return the response with the medication ID and a success message
	return response, nil
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

// GetFamilyMembers is the resolver for the getFamilyMembers field.
func (r *queryResolver) GetFamilyMembers(ctx context.Context) ([]*model.FamilyMemberDetail, error) {
	user := middlewares.ForContext(ctx)
	if user == nil {
		return nil, fmt.Errorf("access denied")
	}

	// Fetch treatment schedules for the user
	result, err := database.DB.Query(`SELECT * FROM family_member WHERE user_id=$userID;`, map[string]interface{}{
		"userID": user.ID,
	})
	if err != nil {
		return nil, err
	}

	members, err := surrealdb.SmartUnmarshal[[]*model.FamilyMember](result, nil)
	if err != nil {
		return nil, err
	}

	var record_details []*model.FamilyMemberDetail
	for _, member := range members {
		recordDetail := &model.FamilyMemberDetail{
			MemberID:      member.ID,
			RelatedUserID: member.RelatedUserID,
			Relationship:  member.Relationship,
			AccessLevel:   member.AccessLevel,
		}
		record_details = append(record_details, recordDetail)
	}

	return record_details, nil
}
