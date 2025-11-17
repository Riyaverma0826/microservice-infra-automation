variable "app_gw_name" {
  description = "The name of the application gateway"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the application gateway will be created"
  type        = string
}

variable "location" {
  description = "The location of the application gateway"
  type        = string
}

variable "sku_name" {
  description = "The SKU name of the application gateway"
  type        = string
  default     = "Standard_v2"
}

variable "sku_tier" {
  description = "The SKU tier of the application gateway"
  type        = string
  default     = "Standard_v2"
}

variable "sku_capacity" {
  description = "The capacity of the application gateway"
  type        = number
  default     = 2
}


variable "gateway_ip_configuration_name" {
  description = "The name of the gateway IP configuration"
  type        = string
  default     = "appGatewayIpConfig"
}

variable "subnet_id" {
  description = "The ID of the subnet for the application gateway"
  type        = string
}

variable "frontend_ip_configuration_name" {
  description = "The name of the frontend IP configuration"
  type        = string
  default     = "appGatewayFrontendIP"
}

variable "public_ip_address_id" {
  description = "The ID of the public IP address for the application gateway"
  type        = string
}

variable "frontend_port" {
  description = "The frontend port number"
  type        = number
  default     = 80
}

variable "http_settings_name" {
  description = "The name of the backend HTTP settings"
  type        = string
  default     = "appGatewayBackendHttpSettings"
}

variable "cookie_based_affinity" {
  description = "The cookie based affinity setting for the backend HTTP settings"
  type        = string
  default     = "Disabled"
}

variable "backend_http_settings_port" {
  description = "The port for the backend HTTP settings"
  type        = number
  default     = 80
}

variable "backend_http_settings_protocol" {
  description = "The protocol for the backend HTTP settings"
  type        = string
  default     = "Http"
}

variable "listener_name" {
  description = "The name of the HTTP listener"
  type        = string
  default     = "appGatewayHttpListener"
}

variable "http_listener_protocol" {
  description = "The protocol for the HTTP listener"
  type        = string
  default     = "Http"
}

variable "frontend_port_name" {
  description = "The name of the frontend port for the HTTP listener"
  type        = string
  default     = "appGatewayFrontendPort"
}

variable "rule_name" {
  description = "The name of the request routing rule"
  type        = string
  default     = "appGatewayRequestRoutingRule"
}

variable "rule_type" {
  description = "The type of the request routing rule"
  type        = string
  default     = "Basic"
}

variable "backend_address_pool_name" {
  description = "The name of the backend address pool for the request routing rule"
  type        = string
  default     = "appGatewayBackendPool"
}


variable "tags" {
  description = "A map of tags to assign to the application gateway"
  type        = map(string)
  default     = {}
}