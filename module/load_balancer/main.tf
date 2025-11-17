resource "azurerm_lb" "load_balancer" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = var.lb_public_ip_id
  }

  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name            = var.backend_address_pool_name
  loadbalancer_id = azurerm_lb.load_balancer.id
}

resource "azurerm_lb_probe" "lb_probe" {
  name            = var.lb_probe_name
  loadbalancer_id = azurerm_lb.load_balancer.id
  protocol        = var.protocol
  port            = var.backend_port
}

resource "azurerm_lb_rule" "lb_rule" {
  name                           = var.lb_rule_name
  loadbalancer_id                = azurerm_lb.load_balancer.id
  protocol                       = var.protocol
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  
  probe_id                       = azurerm_lb_probe.lb_probe.id
}
