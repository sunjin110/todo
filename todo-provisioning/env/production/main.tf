
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
      source  = "hashicorp/google"
      version = "~> 4.80.0"
    }
  }
}

locals {
  db_user_name = "production-todo-db"
  db_name      = "todo"
}

module "todo_sessions" {
  source                = "../../modules/todo_sessions"
  cloudflare_account_id = var.cloudflare_account_id
  env_namespace         = "production"
}

module "todo_db" {
  source                 = "../../modules/todo_db"
  name                   = local.db_user_name
  env                    = "production"
  mongoatlas_project_id  = "64edb35143d369529cc27fa8"
  user_name              = "production_todo_db_user"
  user_password          = var.mongo_user_password
  user_use_database_name = local.db_name
}

module "todo_backend_repository" {
  source        = "../../modules/gcp_docker_repository"
  region        = "asia-northeast1"
  env           = "production"
  description   = "todo backend repository (production)"
  repository_id = "todo-backend-production"
}

module "todo_backend" {
  source                            = "../../modules/todo_backend_cloud_run"
  name                              = "todo-backend-production"
  location                          = "asia-northeast1"
  image                             = "asia-northeast1-docker.pkg.dev/alma-project-110/todo-backend-production/todo-back:v1"
  todo_session_namespace_identifier = module.todo_sessions.todo_session_workers_kv_id
  todo_session_kv_access_token      = module.todo_sessions.todo_sessions_api_token
  mongo_uri                         = module.todo_db.mongo_uri
  mongo_db_name                     = local.db_name
  cloudflare_account_id             = var.cloudflare_account_id
  todo_password_hash_secret_id      = "TODO_PASSWORD_HASH_SECRET_PRODUCTION"
  todo_session_secret_key_id        = "TODO_SESSION_SECRET_KEY_PRODUCTION"
}
