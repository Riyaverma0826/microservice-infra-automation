variable "sql_database_name" {
  description = "The name of the SQL database"
  type        = string
}

variable "server_id" {
  description = "The ID of the SQL server where the database will be created"
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the SQL database"
  type        = string
  default     = "S0"
}

variable "max_size_gb" {
  description = "The maximum size of the SQL database in GB"
  type        = number
  default     = 10
}

variable "tags" {
  description = "A map of tags to assign to the SQL database"
  type        = map(string)
  default     = {}
}