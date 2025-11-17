variable "lb_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "sku" {
  type = string
}

variable "lb_public_ip_id" {
  type = string
}

variable "backend_address_pool_name" {
  type = string
}

variable "frontend_ip_configuration_name" {
  type = string
}

variable "lb_probe_name" {
  type = string
}

variable "protocol" {
  type = string
}

variable "lb_rule_name" {
  type = string
}

variable "frontend_port" {
  type = number
}

variable "backend_port" {
  type = number
}

variable "tags" {
  type = map(string)
}
