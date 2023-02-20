data "google_secret_manager_secret_version" "atlas_private_key" {
  provider = google-beta
  project  = "ultimateai-terraform-admin"
  secret   = "atlas_private_key"
}

data "google_secret_manager_secret_version" "atlas_public_key" {
  provider = google-beta
  project  = "ultimateai-terraform-admin"
  secret   = "atlas_public_key"
}
