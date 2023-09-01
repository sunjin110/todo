
output "domain" {
  value = trimprefix(google_cloud_run_v2_service.default.uri, "https://")
}