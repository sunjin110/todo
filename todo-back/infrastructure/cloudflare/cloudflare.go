package cloudflare

import (
	"context"
	"errors"
	"fmt"

	"github.com/cloudflare/cloudflare-go"
)

type WorkersKVClient interface {
	Get(ctx context.Context, namespaceID string, key string) ([]byte, error)
	Insert(ctx context.Context, namespaceID string, key string, value []byte) error
	Delete(ctx context.Context, namespaceID string, key string) error
}

type workersKVClient struct {
	api               *cloudflare.API
	resourceContainer *cloudflare.ResourceContainer
}

func NewWorkersKVClient(cloudflareApiToken string, cloudflareAccountID string) (WorkersKVClient, error) {
	api, err := cloudflare.NewWithAPIToken(cloudflareApiToken)
	if err != nil {
		return nil, fmt.Errorf("failed new workers kv client. err: %w", err)
	}
	return &workersKVClient{
		api: api,
		resourceContainer: &cloudflare.ResourceContainer{
			Level:      cloudflare.AccountRouteLevel,
			Identifier: cloudflareAccountID,
		},
	}, nil
}

func (w workersKVClient) Get(ctx context.Context, namespaceID string, key string) ([]byte, error) {
	b, err := w.api.GetWorkersKV(ctx, w.resourceContainer, cloudflare.GetWorkersKVParams{
		NamespaceID: namespaceID,
		Key:         key,
	})

	if err != nil {
		return nil, fmt.Errorf("failed get Workers KV. namespaceID: %s, key: %s, err: %w", namespaceID, key, err)
	}
	return b, nil
}

func (w *workersKVClient) Insert(ctx context.Context, namespaceID string, key string, value []byte) error {
	response, err := w.api.WriteWorkersKVEntry(ctx, w.resourceContainer, cloudflare.WriteWorkersKVEntryParams{
		NamespaceID: namespaceID,
		Key:         key,
		Value:       value,
	})
	if err != nil {
		return fmt.Errorf("failed workersKV insert, namespaceID: %s, key: %s, err: %w", namespaceID, key, err)
	}
	if response.Success {
		return nil
	}

	err = aggregateErr(response.Errors)
	return fmt.Errorf("failed workersKV insert, namespaceID: %s, key: %s, err: %w", namespaceID, key, err)
}

func (w *workersKVClient) Delete(ctx context.Context, namespaceID string, key string) error {
	response, err := w.api.DeleteWorkersKVEntry(ctx, w.resourceContainer, cloudflare.DeleteWorkersKVEntryParams{
		NamespaceID: namespaceID,
		Key:         key,
	})
	if err != nil {
		return fmt.Errorf("failed workersKV delete, namespaceID: %s, key: %s, err: %w", namespaceID, key, err)
	}

	if response.Success {
		return nil
	}

	err = aggregateErr(response.Errors)
	return fmt.Errorf("failed workersKV delete, namespaceID: %s, key: %s, err: %w", namespaceID, key, err)
}

func aggregateErr(errs []cloudflare.ResponseInfo) error {
	errorList := make([]error, 0, len(errs))
	for _, errInfo := range errs {
		err := fmt.Errorf("code: %d, message: %s", errInfo.Code, errInfo.Message)
		errorList = append(errorList, err)
	}
	return errors.Join(errorList...)
}
