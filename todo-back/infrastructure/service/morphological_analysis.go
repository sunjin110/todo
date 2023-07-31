package service

import (
	"errors"
	"fmt"
	"todo-back/domain/service"

	"github.com/ikawaha/kagome-dict/ipa"
	"github.com/ikawaha/kagome/v2/tokenizer"
)

type morphologicalAnalysis struct {
	jpTokenizer *tokenizer.Tokenizer
}

func NewMorphologicalAnalysis() (service.MorphologicalAnalysis, error) {
	t, err := tokenizer.New(ipa.Dict(), tokenizer.OmitBosEos())
	if err != nil {
		return nil, fmt.Errorf("failed tokenizer new. err: %w", err)
	}
	return &morphologicalAnalysis{
		jpTokenizer: t,
	}, nil
}

func (ma *morphologicalAnalysis) TextSegmentation(lang service.MorphologicalLang, input string) ([]string, error) {
	if lang != service.JpMorphological {
		return nil, errors.New("not support yet")
	}

	return ma.jpTokenizer.Wakati(input), nil
}
