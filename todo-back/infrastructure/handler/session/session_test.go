package session

import (
	"encoding/hex"
	"fmt"
	"testing"

	. "github.com/smartystreets/goconvey/convey"
)

// go test -v -count=1 -timeout 30s -run ^Test_GenerateSignedSession$ todo-back/infrastructure/handler/session
func Test_GenerateSignedSession(t *testing.T) {
	Convey("Test_GenerateSignedSession", t, func() {

		result, err := GenerateSignedSession()
		So(err, ShouldBeNil)
		So(result, ShouldNotBeEmpty)
		fmt.Println("result is ", result)

	})
}

// Random : c2b27a296fc16284c1aed4945d85cfbb
// Signature : 3f93fa1c25d7c7b0d021cd89cf87514853f89f69cb83743be0431af30d73d197
// c2b27a296fc16284c1aed4945d85cfbb3f93fa1c25d7c7b0d021cd89cf87514853f89f69cb83743be0431af30d73d197

func Test_VerifyAndExtract(t *testing.T) {
	Convey("Test_VerifyAndExtract", t, func() {
		origin, ok := VerifyAndExtract("c2b27a296fc16284c1aed4945d85cfbb3f93fa1c25d7c7b0d021cd89cf87514853f89f69cb83743be0431af30d73d197")
		So(ok, ShouldBeTrue)
		So(hex.EncodeToString(origin), ShouldEqual, "c2b27a296fc16284c1aed4945d85cfbb")
	})
}

// go test -v -count=1 -timeout 30s -run ^Test_generateRandomBytes$ todo-back/infrastructure/handler/session
func Test_generateRandomBytes(t *testing.T) {
	Convey("Test_generateRandomBytes", t, func() {
		type test struct {
			name    string
			arg     int
			want    string
			wantErr error
		}

		tests := []test{
			{
				name: "success",
				arg:  16,
				// want: ,
			},
		}

		for _, tt := range tests {
			Convey(tt.name, func() {
				got, err := generateRandomBytes(tt.arg)
				if tt.wantErr != nil {
					So(err, ShouldBeError)
					So(err.Error(), ShouldEqual, tt.wantErr.Error())
					return
				}
				So(err, ShouldBeNil)
				So(got, ShouldNotBeEmpty)
				// So(hex.EncodeToString(got), ShouldEqual, string(tt.want))

			})
		}
	})
}
