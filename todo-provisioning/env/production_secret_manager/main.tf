
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.80.0"
    }
  }

  backend "gcs" {
    bucket = "todo-terraform-secret-manager-production"
  }
}

provider "google" {
  project = "alma-project-110"
  region  = "asia-northeast1"
}

locals {
  tfstate_bucket_name = "todo-terraform-secret-manager-production"
}

resource "google_secret_manager_secret" "mongo_user_password" {
  secret_id = "TODO_DB_MONGO_PASSWORD_PRODUCTION"
  replication {
    automatic = true
  }
  labels = {
    env = "production"
  }
}

resource "google_secret_manager_secret" "todo_password_hash_secret" {
  secret_id = "TODO_PASSWORD_HASH_SECRET_PRODUCTION"
  replication {
    automatic = true
  }
  labels = {
    env = "production"
  }
}

resource "google_secret_manager_secret" "todo_session_secret_key" {
  secret_id = "TODO_SESSION_SECRET_KEY_PRODUCTION"
  replication {
    automatic = true
  }
  labels = {
    env = "production"
  }
}
