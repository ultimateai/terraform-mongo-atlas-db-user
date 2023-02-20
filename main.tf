resource "mongodbatlas_database_user" "test" {
  username           = var.service_name
  password           = "test"
  project_id         = "61a669f144e0644f25cf662f"
  auth_database_name = "admin"

  dynamic "roles" {
    for_each = var.databases_names
    content {
      role_name     = "readWrite"
      database_name = "DB_NAME"
    }
    
  }

}

resource "random_password" "password" {
  length = 16
  special = false
}