
output "mongo_uri" {
  sensitive = true
  value     = format("mongodb+srv://%s:%s@%s/?retryWrites=true&w=majority", var.user_name, var.user_password, trimprefix(mongodbatlas_advanced_cluster.db.connection_strings[0].standard_srv, "mongodb+srv://"))
}
