variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the ACR will be created"
  type        = string
}

variable "location" {
  description = "The location of the Azure Container Registry"
  type        = string
}

variable "sku" {
  description = "The SKU of the Azure Container Registry"
  type        = string
  default     = "Basic"
}

variable "admin_enabled" {
  description = "Specifies whether the admin user is enabled"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the Azure Container Registry"
  type        = map(string)
  default     = {}
}

