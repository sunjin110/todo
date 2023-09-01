# terraform {
#   required_providers {
#     cloudflare = {
#       source  = "cloudflare/cloudflare"
#       version = "~> 4"
#     }
#   }
# }

# resource "cloudflare_record" "this" {
#   count = length(google_cloud_run_domain_mapping.this.status[0].resource_records)

#   name    = google_cloud_run_domain_mapping.this.status[0].resource_records[count.index].name
#   proxied = true
#   ttl     = 1
#   type    = google_cloud_run_domain_mapping.this.status[0].resource_records[count.index].type
#   value   = google_cloud_run_domain_mapping.this.status[0].resource_records[count.index].rrdata
#   zone_id = var.zone_id
# }