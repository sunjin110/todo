output "todo_session_api_token" {
  sensitive = true
  value     = module.todo_sessions.todo_sessions_api_token
}

output "backend_domain" {
  value = module.todo_backend.domain
}

# output "backend_status" {
#   value = module.todo_backend.status
# }