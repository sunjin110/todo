package service_test

import (
	"testing"
	domain_service "todo-back/domain/service"
	"todo-back/infrastructure/service"

	. "github.com/smartystreets/goconvey/convey"
)

// go test -v -count=1 -timeout 30s -run ^Test_morphologicalAnalysis_Tokenize$ todo-back/infrastructure/service
func Test_morphologicalAnalysis_TextSegmentation(t *testing.T) {
	Convey("Test_morphologicalAnalysis_Tokenize", t, func() {
		type test struct {
			name    string
			input   string
			outputs []string
		}

		tests := []test{
			{
				name:  "a",
				input: "すもももももももものうち",
				outputs: []string{
					"すもも", "も", "もも", "も", "もも", "の", "うち",
				},
			},
		}

		svc, err := service.NewMorphologicalAnalysis()
		So(err, ShouldBeNil)

		for _, tt := range tests {
			Convey(tt.name, func() {
				got, _ := svc.TextSegmentation(domain_service.JpMorphological, tt.input)
				So(got, ShouldResemble, tt.outputs)
			})
		}
	})
}
