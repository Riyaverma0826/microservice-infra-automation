output "lb_id" {
  value = azurerm_lb.load_balancer.id
}

output "lb_backend_pool_id" {
  value = azurerm_lb_backend_address_pool.backend_pool.id
}

output "lb_probe_id" {
  value = azurerm_lb_probe.lb_probe.id
}

output "frontend_ip_configuration_name" {
  value = var.frontend_ip_configuration_name
}
