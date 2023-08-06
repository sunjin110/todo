package cloudflare_test

import (
	"context"
	"errors"
	"os"
	"testing"
	"time"
	"todo-back/infrastructure/cloudflare"

	. "github.com/smartystreets/goconvey/convey"
)

// source .env.sh && go test -timeout 30s -run ^Test_WorkersKVClient_Insert$ todo-back/infrastructure/cloudflare
func Test_WorkersKVClient_Insert(t *testing.T) {
	Convey("Test_WorkersKVClient_Insert", t, func() {
		type args struct {
			namespaceID string
			key         string
			value       []byte
		}
		type initArgs struct {
			cloudflareApiToken  string
			cloudflareAccountID string
		}
		type test struct {
			name        string
			args        args
			initArgs    initArgs
			initWantErr error
			wantErr     error
		}

		tests := []test{
			{
				name: "invalid api token",
				initArgs: initArgs{
					cloudflareApiToken:  "invalid api token",
					cloudflareAccountID: "invalid account id",
				},
				wantErr: errors.New("failed workersKV insert, namespaceID: , key: , err: Could not route to /client/v4/accounts/invalid%20account%20id/storage/kv/namespaces/values/, perhaps your object identifier is invalid? (7003)"),
			},
			{
				name: "success",
				initArgs: initArgs{
					cloudflareApiToken:  os.Getenv("TODO_SESSION_KV_ACCESS_TOKEN"),
					cloudflareAccountID: os.Getenv("CLOUDFLARE_ACCOUNT_ID"),
				},
				args: args{
					namespaceID: os.Getenv("TODO_SESSION_NAMESPACE_IDENTIFIER"),
					key:         "test_key",
					value:       []byte("test_value"),
				},
			},
		}

		for _, tt := range tests {
			Convey(tt.name, func() {
				client, err := cloudflare.NewWorkersKVClient(tt.initArgs.cloudflareApiToken, tt.initArgs.cloudflareAccountID)
				if tt.initWantErr != nil {
					So(err, ShouldBeError)
					So(err.Error(), ShouldEqual, tt.initWantErr.Error())
					return
				}
				So(err, ShouldBeNil)
				err = client.Insert(context.Background(), tt.args.namespaceID, tt.args.key, tt.args.value)
				if tt.wantErr != nil {
					So(err, ShouldBeError)
					So(err.Error(), ShouldEqual, tt.wantErr.Error())
					return
				}
				So(err, ShouldBeNil)
			})
		}
	})
}

// source .env.sh && go test -timeout 30s -run ^Test_WorkersKVClient_InsertWithTTL$ todo-back/infrastructure/cloudflare
func Test_WorkersKVClient_InsertWithTTL(t *testing.T) {
	Convey("Test_WorkersKVClient_Insert", t, func() {
		type args struct {
			namespaceID string
			key         string
			value       string
			ttl         time.Time
		}
		type initArgs struct {
			cloudflareApiToken  string
			cloudflareAccountID string
		}
		type test struct {
			name        string
			args        args
			initArgs    initArgs
			initWantErr error
			wantErr     error
		}

		tests := []test{
			{
				name: "invalid api token",
				initArgs: initArgs{
					cloudflareApiToken:  "invalid api token",
					cloudflareAccountID: "invalid account id",
				},
				wantErr: errors.New("failed workersKV insertWithTTL, namespaceID: , key: , err: Could not route to /client/v4/accounts/invalid%20account%20id/storage/kv/namespaces/bulk, perhaps your object identifier is invalid? (7003)"),
			},
			{
				name: "success",
				initArgs: initArgs{
					cloudflareApiToken:  os.Getenv("TODO_SESSION_KV_ACCESS_TOKEN"),
					cloudflareAccountID: os.Getenv("CLOUDFLARE_ACCOUNT_ID"),
				},
				args: args{
					namespaceID: os.Getenv("TODO_SESSION_NAMESPACE_IDENTIFIER"),
					key:         "test_key_with_ttl",
					value:       "test_value_with_ttl",
					ttl:         time.Now().Add(60 * time.Second),
				},
			},
		}

		for _, tt := range tests {
			Convey(tt.name, func() {
				client, err := cloudflare.NewWorkersKVClient(tt.initArgs.cloudflareApiToken, tt.initArgs.cloudflareAccountID)
				if tt.initWantErr != nil {
					So(err, ShouldBeError)
					So(err.Error(), ShouldEqual, tt.initWantErr.Error())
					return
				}
				So(err, ShouldBeNil)
				err = client.InsertWithTTL(context.Background(), tt.args.ttl, tt.args.namespaceID, tt.args.key, tt.args.value)
				if tt.wantErr != nil {
					So(err, ShouldBeError)
					So(err.Error(), ShouldEqual, tt.wantErr.Error())
					return
				}
				So(err, ShouldBeNil)
			})
		}
	})
}
