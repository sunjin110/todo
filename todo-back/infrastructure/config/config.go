package config

import "time"

type Config struct {
	PasswordHashSecret string
	Session            SessionConfig
	MongoDB            MongoDB
}

type SessionConfig struct {
	SessionSecretKey    string
	SessionDuration     time.Duration
	CloudFlareApiToken  string
	CloudFlareAccountID string
	NamespaceID         string
}

type MongoDB struct {
	URI string
	DB  string
}
