resource "azurerm_mssql_database" "sql_database" {
  name       = var.sql_database_name
  server_id  = var.server_id
  sku_name   = var.sku_name
  max_size_gb = var.max_size_gb

  tags = var.tags
}