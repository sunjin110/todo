package service

type MorphologicalLang string

const (
	JpMorphological = "jp"
)

type MorphologicalAnalysis interface {
	TextSegmentation(lang MorphologicalLang, input string) ([]string, error)
}
