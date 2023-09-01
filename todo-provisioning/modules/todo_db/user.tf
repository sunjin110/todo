

resource "mongodbatlas_database_user" "user" {
  username           = var.user_name
  password           = var.user_password
  project_id         = var.mongoatlas_project_id
  auth_database_name = "admin"
  roles {
    role_name     = "readWrite"
    database_name = var.user_use_database_name
  }

  roles {
    role_name     = "readAnyDatabase"
    database_name = "admin"
  }
}
