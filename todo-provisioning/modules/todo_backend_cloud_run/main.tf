resource "google_cloud_run_v2_service" "default" {
  name     = var.name
  location = var.location
  ingress = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = var.image

      env {
        name = "TODO_SERVER_ADDRESS"
        value = ":8080"
      }

      env {
        name = "TODO_SERVER_MAX_CONNECTION_AGE"
        value = "300"
      }

      env {
        name = "TODO_SERVER_MAX_CONNECTION_IDLE"
        value = "300"
      }

      env {
        name = "TODO_PASSWORD_HASH_SECRET"
        value_source {
          secret_key_ref {
            secret = var.todo_password_hash_secret_id
          }
        }
      }

      env {
        name = "TODO_MONGO_DB_URI"
        value = var.mongo_uri
      }

      env {
        name = "TODO_MONGO_DB_NAME"
        value = var.mongo_db_name
      }

      env {
        name = "TODO_CLOUDFLARE_ACCOUNT_ID"
        value = var.cloudflare_account_id
      }

      env {
        name = "TODO_SESSION_SECRET_KEY"
        value_source {
          secret_key_ref {
            secret = var.todo_session_secret_key_id
          }
        }
      }

      env {
        name = "TODO_SESSION_DURATION"
        value = "360"
      }

      env {
        name = "TODO_SESSION_NAMESPACE_IDENTIFIER"
        value = var.todo_session_namespace_identifier
      }

      env {
        name = "TODO_SESSION_KV_ACCESS_TOKEN"
        value = var.todo_session_kv_access_token
      }
    }
  }
}

