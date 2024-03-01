terraform {
  required_version = ">=1.3.0"

  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
    }
    vault = {
      source = "hashicorp/vault"
    }
  }
}
