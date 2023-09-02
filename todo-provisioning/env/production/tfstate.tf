


resource "google_storage_bucket" "tfstate" {
  name          = local.tfstate_bucket_name
  location      = "asia-northeast1"
  storage_class = "REGIONAL"
  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      num_newer_versions = 5
    }
  }
}