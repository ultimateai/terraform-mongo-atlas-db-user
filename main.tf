resource "mongodbatlas_database_user" "mongo_user" {
  username           = var.user_name
  password           = random_password.mongo_password.result
  project_id         = var.mongo_project_id
  auth_database_name = "admin"

  dynamic "roles" {
    for_each = var.databases_roles
    content {
      role_name     = roles.value.role
      database_name = roles.value.database
    }

  }
}


resource "vault_generic_secret" "vault_secret" {
  path      = "${var.vault_path}-mongo-credentials"
  data_json = <<EOT
{
  "MONGO_USER": "${var.user_name}",
  "MONGO_PASSWORD": "${random_password.mongo_password.result}"
}
EOT
}

resource "random_password" "mongo_password" {
  length  = 16
  special = false
}