variable "name" {
  description = "The name of the Log Analytics Workspace"
  type        = string
}

variable "location" {
  description = "The location/region where the Log Analytics Workspace will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Log Analytics Workspace"
  type        = string
}

variable "sku" {
  description = "The SKU of the Log Analytics Workspace"
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "The number of days to retain data in the Log Analytics Workspace"
  type        = number
  default     = 30
}

variable "tags" {
  description = "A map of tags to assign to the Log Analytics Workspace"
  type        = map(string)
  default     = {}
}

