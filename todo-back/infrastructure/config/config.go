package config

import "time"

type Config struct {
	Server             ServeConfig
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

type ServeConfig struct {
	Addr              string
	MaxConnectionAge  time.Duration
	MaxConnectionIdle time.Duration
}
