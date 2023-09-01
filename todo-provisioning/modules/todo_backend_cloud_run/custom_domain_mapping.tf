
# うまくいかない preview版だからとか、grpcだからとか色々ありそうなので、安定化を待つ
# resource "google_cloud_run_domain_mapping" "this" {
#   location = google_cloud_run_v2_service.default.location
#   name     = var.endpoint_url

#   metadata {
#     namespace = var.google_project_id # project id
#   }

#   spec {
#     route_name = google_cloud_run_v2_service.default.name
#   }
# }

