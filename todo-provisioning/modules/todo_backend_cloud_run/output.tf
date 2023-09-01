
output "domain" {
  value = trimprefix(google_cloud_run_v2_service.default.uri, "https://")
}

output "status" {
  value = google_cloud_run_domain_mapping.this.status[0].resource_records
}