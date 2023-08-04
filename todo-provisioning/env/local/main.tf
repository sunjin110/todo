
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
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
  api_token = var.cloudlare_api_token
}

module "todo" {
  source                = "../../todo"
  cloudflare_account_id = var.cloudflare_account_id_local
  env_namespace         = "local"
}
