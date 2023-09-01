
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "mongodbatlas" {
  public_key  = var.mongo_atlas_public_key
  private_key = var.mongo_atlas_private_key
}

provider "google" {
  project = "alma-project-110"
  region = "asia-northeast1"
}
