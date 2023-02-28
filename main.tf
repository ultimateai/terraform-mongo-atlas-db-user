resource "mongodbatlas_database_user" "mongo_user" {
  username           = var.user_name
  password           = random_password.mongo_password.result
  project_id         = var.mongo_project_id
  auth_database_name = "admin"

  dynamic "roles" {
    for_each = var.databases_names
    content {
      role_name     = "readWrite"
      database_name = roles.value
    }
    
  }
}

# data "vault_generic_secret" "vault_secret" {
#   path = var.vault_path
# }

resource "vault_kv_secret_v2" "secret" {
  mount = var.vault_path
  name = "test_rob"
  data_json = jsonencode(
  {
    zip = "zap",
    foo = "bar"
  }
  )
}

resource "vault_generic_secret" "vault_secret" {
  path = var.vault_path
  data_json = <<EOT
{
  "MONGO_PASSWORD": "${random_password.mongo_password.result}"
}
EOT
}

resource "random_password" "mongo_password" {
  length = 16
  special = false
}