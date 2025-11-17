variable "aks_cluster_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "agent_pool_name" {
  type    = string
  default = "default"
}

variable "agent_count" {
  type    = number
  default = 1
}

variable "vm_size" {
  type    = string
  default = "Standard_DS2_v2"
}

variable "tags" {
  type    = map(string)
  default = {}
}
