variable "service_name" {
  description = "Name of the service this user is for"
  type        = string
}

variable "databases_names" {
  description = "List of databases this user needs access to"
  type        = list(string)
}
