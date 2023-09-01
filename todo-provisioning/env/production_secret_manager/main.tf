
terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "~> 4.80.0"
    }
  }
}

provider "google" {
  project = "alma-project-110"
  region = "asia-northeast1"
}


resource "google_secret_manager_secret" "mongo_user_password" {
  secret_id = "TODO_DB_MONGO_PASSWORD"
  replication {
    automatic = true
  }
}
