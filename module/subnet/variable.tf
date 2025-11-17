variable "subnet_name" {    
  description = "The name of the subnet"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the subnet will be created"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network where the subnet will be created"
  type        = string
}

variable "address_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
}   

variable "tags" {
  description = "A map of tags to assign to the subnet"
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "The location of the subnet"
  type        = string
}

