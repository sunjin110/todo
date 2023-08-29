
terraform {
    required_providers {
      mongodbatlas = {
        source = "mongodb/mongodbatlas"
        version = "1.11.0"
      }
    }
}

resource "mongodbatlas_advanced_cluster" "db" {
  project_id = var.mongoatlas_project_id
  name = var.name
  cluster_type = "SHARDED"
  backup_enabled = false

  replication_specs {
    region_configs {
      electable_specs {
        instance_size = "M0"
        node_count = 1
      }
      analytics_specs {
        instance_size = "M0"
        node_count = 1
      }
      provider_name = "GCP"
      priority = 10
      region_name = "asia-northeast1-b"
    }
  }

  labels {
    key = "env"
    value = var.env
  }
}
