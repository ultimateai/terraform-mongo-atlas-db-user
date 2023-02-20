terraform {
  required_version = ">= 1.3.7"
}

provider "mongodbatlas" {
  public_key  = data.google_secret_manager_secret_version.atlas_public_key.secret_data
  private_key = data.google_secret_manager_secret_version.atlas_private_key.secret_data
}
