output "todo_sessions_api_token" {
  value = cloudflare_api_token.todo_sessions.value
}

output "todo_session_workers_kv_id" {
  value = cloudflare_workers_kv_namespace.todo_sessions.id
}
