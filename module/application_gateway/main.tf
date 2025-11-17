resource "azurerm_application_gateway" "app_gateway" {
  name                = var.app_gw_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = var.sku_capacity
  }
  gateway_ip_configuration {
    name      = var.gateway_ip_configuration_name
    subnet_id = var.subnet_id
  }
  frontend_port {
    name = var.frontend_port_name
    port = var.frontend_port
  }
  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = var.public_ip_address_id
  }
  backend_address_pool {
    name = var.backend_address_pool_name
  }
  backend_http_settings {
    name                  = var.http_settings_name
    cookie_based_affinity = var.cookie_based_affinity
    port                  = var.backend_http_settings_port
    protocol              = var.backend_http_settings_protocol
  }
  http_listener {
    name                           = var.listener_name
    frontend_ip_configuration_name = var.frontend_ip_configuration_name
    frontend_port_name             = var.frontend_port_name
    protocol                       = var.http_listener_protocol
  }
request_routing_rule {
  name                       = var.rule_name
  rule_type                  = "Basic"
  http_listener_name         = var.listener_name
  backend_address_pool_name  = var.backend_address_pool_name
  backend_http_settings_name = var.http_settings_name
  priority                   = 100
}


  tags = var.tags
}
