
terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.11.0"
    }
  }
}

resource "mongodbatlas_advanced_cluster" "db" {
  project_id                     = var.mongoatlas_project_id
  name                           = var.name
  cluster_type                   = "REPLICASET"
  backup_enabled                 = false
  termination_protection_enabled = false

  replication_specs {
    region_configs {
      electable_specs {
        instance_size = "M0"
        node_count    = 0
      }
      provider_name         = "TENANT"
      backing_provider_name = "GCP"
      priority              = 7
      region_name           = "NORTHEASTERN_ASIA_PACIFIC"
    }
  }

  labels {
    key   = "env"
    value = var.env
  }
}
