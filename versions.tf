terraform {

  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
    }
    vault = {
      source = "hashicorp/vault"
    }
  }
}