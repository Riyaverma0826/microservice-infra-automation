variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "ip_configuration" {
  type = object({
    name                 = string
    subnet_id            = string
    public_ip_address_id = optional(string)
  })
}

variable "tags" {
  type = map(string)
  default = {}
}
