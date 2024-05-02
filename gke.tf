variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

# GKE cluster
resource "google_container_cluster" "primary" {
  name     = "${var.project_id}-gke"
  location = var.region
  project  = var.project_id

  # Enabling Autopilot for this cluster
  enable_autopilot = true

  # Enabling cluster deletion
  deletion_protection = false
}