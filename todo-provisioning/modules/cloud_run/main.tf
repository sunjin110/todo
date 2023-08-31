resource "google_cloud_run_v2_job" "default" {
  name     = var.name
  location = var.location

  template {
    template {
      containers {
        # image = "us-docker.pkg.dev/cloudrun/container/hello"
        image = var.image
      }
    }
  }

  lifecycle {
    ignore_changes = [
      launch_stage,
    ]
  }
}

variable "name" {
  type = string
}

variable "location" {
  type = string
  default = "ap-northeast1"
}

variable "image" {
  type = string
}

