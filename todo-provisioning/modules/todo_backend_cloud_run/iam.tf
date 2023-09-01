
resource "google_cloud_run_v2_service_iam_member" "this" {
  project = google_cloud_run_v2_service.default.project
  location = google_cloud_run_v2_service.default.location
  name = google_cloud_run_v2_service.default.name
  role = "roles/run.invoker"
  member = "allUsers"
}