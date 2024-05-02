terraform {
  backend "gcs" {
    bucket = "gke-bucket"
    prefix = "terraform/state"
  }

  required_providers {
    google = {
      source  = "hashicorp/google-beta"
      version = "5.27.0"
    }
  }
}