package convert

import (
	"todo-back/application"
	"todo-back/domain/model"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/authentication"

	"google.golang.org/protobuf/types/known/timestamppb"
)

func ToSignInInput(input *authentication.SignInInput) *application.SignInInput {
	return &application.SignInInput{
		Email:    input.Email,
		Password: input.Password,
	}
}

func ToGrpcSignInOutput(output *application.SignInOutput) *authentication.SignInOutput {
	return &authentication.SignInOutput{
		Session: ToGrpcSession(&output.Session),
	}
}

func ToGrpcSession(session *model.Session) *authentication.Session {
	var expireTime *timestamppb.Timestamp
	if session.ExpireTime != nil {
		expireTime = timestamppb.New(*session.ExpireTime)
	}
	return &authentication.Session{
		Session:    session.Session,
		ExpireTime: expireTime,
	}
}
