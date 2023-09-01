variable "cloudflare_account_id" {
  type = string
}

variable "todo_session_namespace_identifier" {
  type = string
}

variable "todo_session_kv_access_token" {
  type = string
}

variable "name" {
  type = string
}

variable "location" {
  type = string
  default = "asia-northeast1"
}

variable "image" {
  type = string
}

variable "mongo_uri" {
  type = string
}

variable "mongo_db_name" {
  type = string
}