package convert

import (
	"time"
	"todo-back/application"
	"todo-back/domain/model"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/authentication"

	"google.golang.org/protobuf/types/known/timestamppb"
)

func ToSignUpInput(input *authentication.SignUpInput) *application.SignUpInput {
	return &application.SignUpInput{
		Name:     input.Name,
		Email:    input.Email,
		Password: input.Password,
	}
}

func ToGrpcSignUpOutput(output *application.SignUpOutput) *authentication.SignUpOutput {
	if output == nil {
		return nil
	}
	return &authentication.SignUpOutput{
		Session: ToGrpcSession(output.Session),
		Status:  ToGrpcUserSignUpStatus(output.Status),
	}
}

func ToSignOutInput(input *authentication.SignOutInput) *application.SignOutInput {
	return &application.SignOutInput{
		Session: *ToModelSession(input.Session),
	}
}

func ToGrpcSignOutOutput() *authentication.SignOutOutput {
	return &authentication.SignOutOutput{}
}

func ToSignInInput(input *authentication.SignInInput) *application.SignInInput {
	return &application.SignInInput{
		Email:    input.Email,
		Password: input.Password,
	}
}

func ToGrpcSignInOutput(output *application.SignInOutput) *authentication.SignInOutput {
	if output == nil {
		return nil
	}

	return &authentication.SignInOutput{
		Session: ToGrpcSession(&output.Session),
	}
}

func ToModelSession(session *authentication.Session) *model.Session {
	if session == nil {
		return nil
	}

	var expireTime *time.Time
	if session.ExpireTime != nil {
		et := session.ExpireTime.AsTime()
		expireTime = &et
	}

	return &model.Session{
		Session:    session.Session,
		ExpireTime: expireTime,
	}
}

func ToGrpcSession(session *model.Session) *authentication.Session {
	if session == nil {
		return nil
	}

	var expireTime *timestamppb.Timestamp
	if session.ExpireTime != nil {
		expireTime = timestamppb.New(*session.ExpireTime)
	}
	return &authentication.Session{
		Session:    session.Session,
		ExpireTime: expireTime,
	}
}

func ToGrpcUserSignUpStatus(status model.UserSignUpStatus) authentication.UserSignUpStatus {
	switch status {
	case model.SignUpAllowed:
		return authentication.UserSignUpStatus_SignupSignUpStatusAllowed
	case model.SignUpDenied:
		return authentication.UserSignUpStatus_SignupSignUpStatusDenied
	case model.SignUpWaitForAllow:
		return authentication.UserSignUpStatus_SignupSignUpStatusWaitForAllow
	default:
		return authentication.UserSignUpStatus_SignupSignUpStatusUnknown
	}
}

func toModelUserSignUpStatus(status *authentication.UserSignUpStatus) *model.UserSignUpStatus {
	if status == nil {
		return nil
	}
	switch status {
	case authentication.UserSignUpStatus_SignupSignUpStatusAllowed.Enum():
		return toPointer(model.SignUpAllowed)
	case authentication.UserSignUpStatus_SignupSignUpStatusDenied.Enum():
		return toPointer(model.SignUpDenied)
	case authentication.UserSignUpStatus_SignupSignUpStatusUnknown.Enum():
		return toPointer(model.SignUpDenied)
	case authentication.UserSignUpStatus_SignupSignUpStatusWaitForAllow.Enum():
		return toPointer(model.SignUpWaitForAllow)
	default:
		return toPointer(model.SignUpDenied)
	}
}
