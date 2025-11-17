variable "public_ip_name" { 
  description = "The name of the public IP address"
  type        = string
}

variable "location" {
  description = "The location of the public IP address"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the public IP address will be created"
  type        = string
}

variable "allocation_method" {
  description = "The allocation method of the public IP address"
  type        = string
  default     = "Dynamic"
}

variable "sku" {
  description = "The SKU of the public IP address"
  type        = string
  default   = "Basic"
}

variable "tags" {
  description = "A map of tags to assign to the public IP address"
  type        = map(string)
  default     = {}
}   