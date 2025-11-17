resource "azurerm_bastion_host" "bastion" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = var.ip_configuration.name
    subnet_id            = var.ip_configuration.subnet_id
    public_ip_address_id = var.ip_configuration.public_ip_id
  }

  tags = var.tags
}
