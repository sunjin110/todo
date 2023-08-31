resource "google_cloud_run_v2_service" "default" {
  name     = var.name
  location = var.location
  ingress = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = var.image
    }
  }
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

