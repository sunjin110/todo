terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4"
    }
  }
}

resource "cloudflare_workers_kv_namespace" "todo_sessions" {
  account_id = var.cloudflare_account_id
  title      = "todo-sessions-${var.env_namespace}"
}
