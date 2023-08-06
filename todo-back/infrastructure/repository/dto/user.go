package dto

import "todo-back/domain/model"

type User struct {
	ID           string `bson:"_id"`
	Name         string `bson:"name"`
	Email        string `bson:"email"`
	PasswordHash string `bson:"pwd_hash"`
	SignUpStatus string `bson:"sign_up_status"`
	CreateTime   int64  `bson:"ct"`
	LastLogin    *int64 `bson:"lt"`
}

func (u *User) ToModel() *model.User {
	if u == nil {
		return nil
	}
	return &model.User{
		ID:           model.UserID(u.ID),
		Name:         u.Name,
		Email:        u.Email,
		PasswordHash: u.PasswordHash,
		SignUpStatus: model.UserSignUpStatus(u.SignUpStatus),
		CreateTime:   *convertUnixToTime(&u.CreateTime),
		LastLogin:    convertUnixToTime(u.LastLogin),
	}
}

func NewUser(userModel model.User) User {
	return User{
		ID:           userModel.ID.String(),
		Name:         userModel.Name,
		Email:        userModel.Email,
		PasswordHash: userModel.PasswordHash,
		SignUpStatus: userModel.SignUpStatus.String(),
		CreateTime:   *convertTimeToUnix(&userModel.CreateTime),
		LastLogin:    convertTimeToUnix(userModel.LastLogin),
	}
}
