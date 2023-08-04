
resource "cloudflare_workers_kv_namespace" "todo_sessions" {
  account_id = var.cloudflare_account_id
  title      = "todo-sessions-${var.env_namespace}"
}
