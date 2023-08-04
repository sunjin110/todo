
terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 4"
    }
  }
}

variable "cloudflare_api_token_local" {
  type = string
}

variable "cloudflare_account_id_local" {
  type = string
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token_local
}

module "todo" {
  source                = "../../modules/todo_sessions"
  cloudflare_account_id = var.cloudflare_account_id_local
  env_namespace         = "local"
}