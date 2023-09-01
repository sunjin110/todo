

resource "mongodbatlas_project_ip_access_list" "this" {
  project_id = var.mongoatlas_project_id
  cidr_block = "0.0.0.0/0"
  comment    = "とりあえず全部"
}