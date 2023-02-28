# Terraform-mongo-service-user

Terraform module for creating a mongo user and the associated secrets (user, password) in vault

## Provider configuration

In your calling terraform code, add make sure to add the proper vault-provider and mongo-atlas configuration: 

```
terraform {
  required_version = ">=1.2.0"

  required_providers {
    ...
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
      version = "~> 1.8.0"
    }
    vault = {
      source = "hashicorp/vault"
      version = "3.13.0"
    }
  }
}

provider "vault" {
  address = "http://vault.common.int.ultimate.ai/"
  auth_login_userpass {
    username = "your_user"
    password = data.google_secret_manager_secret_version.vault_user.secret_data
  }
}

provider "mongodbatlas" {
  public_key  = data.google_secret_manager_secret_version.your_atlas_public_key.secret_data
  private_key = data.google_secret_manager_secret_version.your_atlas_private_key.secret_data
}

```

Plus the data.tf

```
data "google_secret_manager_secret_version" "atlas_private_key" {
  provider = google-beta
  project  = gcp_project
  secret   = private_key_secret_name
}

data "google_secret_manager_secret_version" "atlas_public_key" {
  provider = google-beta
  project  = gcp_project
  secret   = public_key_secret_name
}

data "google_secret_manager_secret_version" "vault_terraform_pass" {
  provider = google-beta
  project  = gcp_project
  secret   = vault_user_password
}
```

## How to use

```
module "create_mongo_user_test" {
  source        = "git@github.com:ultimateai/terraform-mongo-service-user.git?ref=main"
  vault_path = "secret/${var.vault_chapter}/${var.vault_environment}/${var.vault_service_name}"
  user_name = var.vault_service_name
  mongo_project_id = var.mongo_project_id
  databases_names = ["db-first","db-second"]
}
```

Vault_path: Were the secret will be stored. In order NOT to remove existing secrets, final path will be vault_path-mongo-credentials
user_name: Mongo user name, which normally coincides with the service_name
mongo_project_id = The id of the project to create the user
databases_names = List of the databases to which the user will have ReadWrite access to

