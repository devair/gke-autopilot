data "google_compute_network" "default" {
  name    = "default"
  project = var.project_id
}

data "google_sql_database_instance" "postgres" {
  name       = "postgresql-instance"
  project    = var.project_id
  depends_on = [google_sql_database_instance.my_instance]
}

output "postgres_ip_address" {
  description = "Postgres private ip"
  value       = google_sql_database_instance.my_instance.ip_address.0.ip_address

  depends_on = [google_sql_database_instance.my_instance]
}