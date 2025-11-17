variable "sql_server_name" {
  description = "The name of the SQL server"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the SQL server will be created"
  type        = string
}

variable "location" {
  description = "The location of the SQL server"
  type        = string
}

variable "server_version" {
  description = "The version of the SQL server"
  type        = string
  default     = "12.0"
}

variable "administrator_login" {
  description = "The administrator login for the SQL server"
  type        = string
}

variable "administrator_login_password" {
  description = "The administrator login password for the SQL server"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "A map of tags to assign to the SQL server"
  type        = map(string)
  default     = {}
}