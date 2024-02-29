terraform {
  experiments = [module_variable_optional_attrs]

  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
    }
    vault = {
      source = "hashicorp/vault"
    }
  }
}
