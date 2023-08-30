
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4"
    }

    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.11.0"
    }

    google = {
        source = "hashicorp/google"
        version = "~> 4.80.0"
    }
  }
}

variable "cloudflare_api_token" {
  type = string
}

variable "cloudflare_account_id" {
  type = string
}

variable "mongo_atlas_public_key" {
  type = string
}

variable "mongo_atlas_private_key" {
  type = string
}

variable "mongo_user_password" {
  type = string
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "mongodbatlas" {
  public_key  = var.mongo_atlas_public_key
  private_key = var.mongo_atlas_private_key
}

provider "google" {
  project = "alma-project-110"
  region = "ap-northeast1"
}

module "todo_sessions" {
  source                = "../../modules/todo_sessions"
  cloudflare_account_id = var.cloudflare_account_id
  env_namespace         = "production"
}

module "todo_db" {
  source                = "../../modules/todo_db"
  name                  = "production-todo-db"
  env                   = "production"
  mongoatlas_project_id = "64edb35143d369529cc27fa8"
  user_name = "production_todo_db_user"
  user_password = var.mongo_user_password
  user_use_database_name = "todo"
}

output "todo_session_api_token" {
  sensitive = true
  value     = module.todo_sessions.todo_sessions_api_token
}