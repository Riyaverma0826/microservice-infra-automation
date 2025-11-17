variable "key_vault_name" {
  description = "The name of the Key Vault"
  type        = string
}

variable "location" {
  description = "The location of the Key Vault"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Key Vault will be created"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Key Vault"
  type        = map(string)
}