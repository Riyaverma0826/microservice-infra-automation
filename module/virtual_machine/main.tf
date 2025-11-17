resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  network_interface_ids = [var.network_interface_id]
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  size                = var.size
  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = "v1.0"
  }
  os_disk {
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }
}