terraform {
  required_version = ">=1.2.0"

  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.45.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 4.45.0"
    }
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
      version = "~> 1.8.0"
    }
  }
}