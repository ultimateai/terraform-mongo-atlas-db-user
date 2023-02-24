resource "mongodbatlas_database_user" "test" {
  for_each = var.environments
  username           = "${var.service_name}_${each.value}_test"
  password           = random_password.password[each.key].result
  project_id         = "61a669f144e0644f25cf662f"
  auth_database_name = "admin"

  dynamic "roles" {
    for_each = var.databases_names
    content {
      role_name     = "readWrite"
      database_name = roles.value
    }
    
  }

}

resource "vault_generic_secret" "test" {
  for_each = var.environments

  path = "secret/${var.chapter}/${each.value}/${var.service_name}"

  data_json = <<EOT
{
  "MONGO_PASSWORD": "${random_password.password[each.value].result}",
}
EOT
}

resource "random_password" "password" {
  for_each = var.environments
  length = 16
  special = false
}