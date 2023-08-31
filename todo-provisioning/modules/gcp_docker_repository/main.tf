resource "google_artifact_registry_repository" "this" {
  location      = var.region
  repository_id = var.repository_id
  description   = var.description
  format        = "DOCKER"

  labels = {
    env = var.env
  }

  docker_config {
    immutable_tags = false
  }
}

variable "env" {
  type = string
}

variable "region" {
  type = string
  default = "asia-northeast1"
}

variable "description" {
  type = string
  default = "Created by terrafrom"
}

variable "repository_id" {
  type = string
}