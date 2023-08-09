package convert

import (
	"todo-back/application/input"
	"todo-back/application/output"
	"todo-back/domain/model"
	"todo-back/domain/repository"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/user"
)

func ToModelGetUserInput(in *user.GetInput) *input.GetUser {
	if in == nil {
		return nil
	}
	return &input.GetUser{
		Session: *ToModelSession(in.Session),
		UserID:  model.UserID(in.Id.Id),
	}
}

func ToGrpcGetUserOutput(out *output.GetUser) *user.GetOutput {
	return &user.GetOutput{
		User: toGrpcUser(&out.User),
	}
}

func toGrpcUser(userModel *model.User) *user.User {
	if userModel == nil {
		return nil
	}

	return &user.User{
		Id: &user.UserId{
			Id: userModel.ID.String(),
		},
		Name:   userModel.Name,
		Email:  userModel.Email,
		Status: ToGrpcUserSignUpStatus(userModel.SignUpStatus),
	}
}

func ToModelListUserInput(in *user.ListInput) *input.UserList {
	if in == nil {
		return nil
	}
	return &input.UserList{
		Session: *ToModelSession(in.Session),
		Paging:  toRepositoryPaging(in.Paging),
		Sorting: toRepositoryUserSort(in.Sort),
		Filter:  toRepositoryUserFilter(in.Filter),
	}
}

func ToGrpcListUserOutput(out *output.ListUser) *user.ListOutput {
	if out == nil {
		return nil
	}

	users := make([]*user.User, 0, len(out.Users))
	for _, userModel := range out.Users {
		users = append(users, toGrpcUser(&userModel))
	}

	return &user.ListOutput{
		HasNext: out.HasNext,
		Users:   users,
	}
}

func toRepositoryUserSort(sort *user.UserSort) *repository.UserSort {
	if sort == nil {
		return nil
	}
	return &repository.UserSort{
		LastLogin:  toRepositorySortField(sort.LastLogin),
		CreateTime: toRepositorySortField(sort.CreateTime),
	}
}

func toRepositoryUserFilter(filter *user.UserFilter) *repository.UserFilter {
	if filter == nil {
		return nil
	}
	return &repository.UserFilter{
		ID:    toRepositoryFilterField(toModelUserID(filter.Id), nil),
		Name:  toRepositoryFilterField(filter.Name, filter.NameFilterKind),
		Email: toRepositoryFilterField(filter.Email, filter.EmailFilterKind),
	}
}

func toModelUserID(id *user.UserId) *model.UserID {
	if id == nil {
		return nil
	}
	return toPointer(model.UserID(id.Id))
}

func ToModelCreateUserInput(in *user.CreateInput) *input.CreateUser {
	return &input.CreateUser{
		Session: *ToModelSession(in.Session),
		User: input.CreateUserModel{
			Name:     in.User.Name,
			Email:    in.User.Email,
			Password: in.User.Password,
			Status:   *toModelUserSignUpStatus(&in.User.Status),
		},
	}
}

func ToModelUpdateUserInput(in *user.UpdateInput) *input.UpdateUser {
	return &input.UpdateUser{
		Session: *ToModelSession(in.Session),
		User: input.UpdateUserModel{
			ID:       model.UserID(in.User.Id.Id),
			Name:     in.User.Name,
			Email:    in.User.Email,
			Password: in.User.Password,
			Status:   toModelUserSignUpStatus(in.User.Status),
		},
	}
}

func ToModelDeleteUserInput(in *user.DeleteInput) *input.DeleteUser {
	return &input.DeleteUser{
		Session: *ToModelSession(in.Session),
		UserID:  *toModelUserID(in.Id),
	}
}
