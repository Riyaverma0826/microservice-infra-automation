variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string  
}

variable "resource_group_name" {
  description = "The name of the resource group where the storage account will be created"
  type        = string
}

variable "location" {
  description = "The location of the storage account"
  type        = string
}

variable "account_tier" {
  description = "The performance tier of the storage account"
  type        = string
  default     = "Standard"
}
variable "account_replication_type" {
  description = "The replication type of the storage account"
  type        = string
  default     = "LRS"
}

variable "tags" {
  description = "A map of tags to assign to the storage account"
  type        = map(string)
  default     = {}
}