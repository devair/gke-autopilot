resource "google_sql_database_instance" "my_instance" {
  provider = google-beta
  name             = "postgresql-instance"
  region           = var.region
  database_version = "POSTGRES_14"
  root_password    = "abcABC123!"
  project          = var.project_id
  
  depends_on = [data.google_compute_network.default]

  settings {
    tier      = "db-f1-micro"    
    disk_size = 10
    availability_type = "REGIONAL"    
    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = data.google_compute_network.default.id
      enable_private_path_for_google_cloud_services = true
    }          
  }
  # set `deletion_protection` to true, will ensure that one cannot accidentally delete this instance by
  # use of Terraform whereas `deletion_protection_enabled` flag protects this instance at the GCP level.
  deletion_protection = false

}

# Set up Database and Users
resource "google_sql_database" "my_database" {
  name     = "pedidos_db"
  project  = "k8s-fiap"
  instance = google_sql_database_instance.my_instance.name
}

resource "google_sql_user" "my_user" {
  name     = "docker"
  project  = "k8s-fiap"
  instance = google_sql_database_instance.my_instance.name
  password = "Docker123@"
}