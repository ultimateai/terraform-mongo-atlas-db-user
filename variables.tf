variable "user_name" {
  description = "Name of the service this user is for"
  type        = string
}

variable "databases_roles" {
  description = "List of databases this user needs access to"
  type = list(object({
    database   = string
    collection = optional(string)
    role       = string
  }))
}

variable "vault_path" {
  description = "Vault's secret path"
  type        = string
}

variable "mongo_project_id" {
  description = "Mongo project ID"
  type        = string
}
