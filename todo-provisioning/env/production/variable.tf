
variable "cloudflare_api_token" {
  type = string
  sensitive = true
}

variable "cloudflare_account_id" {
  type = string
  sensitive = true
}

variable "mongo_atlas_public_key" {
  type = string
  sensitive = true
}

variable "mongo_atlas_private_key" {
  type = string
  sensitive = true
}

variable "mongo_user_password" {
  type = string
  sensitive = true
}
