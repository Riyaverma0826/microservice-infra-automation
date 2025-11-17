module "rgs" {
  for_each            = var.resource_groups
  source              = "../../module/resource_group"
  resource_group_name = each.value.rg_name
  location            = each.value.location
  tags                = each.value.tags
}

module "storage_account" {
  for_each                 = var.storage_accounts
  source                   = "../../module/storage_account"
  depends_on               = [module.rgs]
  storage_account_name     = each.value.sa_name
  resource_group_name      = module.rgs[each.value.resource_group_key].rg_name
  location                 = module.rgs[each.value.resource_group_key].rg_location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  tags                     = each.value.tags
}

module "virtual_network" {
  for_each            = var.vnets
  source              = "../../module/virtual_network"
  depends_on          = [module.rgs]
  vnet_name           = each.value.vnet_name
  address_space       = each.value.address_space
  resource_group_name = module.rgs[each.value.resource_group_key].rg_name
  location            = module.rgs[each.value.resource_group_key].rg_location
  tags                = each.value.tags
}

module "subnet" {
  for_each            = var.subnets
  source              = "../../module/subnet"
  depends_on          = [module.rgs, module.virtual_network]
  subnet_name         = each.value.subnet_name
  location            = each.value.location
  resource_group_name = module.rgs[each.value.resource_group_key].rg_name
  vnet_name           = module.virtual_network[each.value.vnet_key].vnet_name
  address_prefixes    = each.value.address_prefixes
}

module "public_ip" {
  for_each            = var.public_ips
  source              = "../../module/public_ip"
  depends_on          = [module.rgs]
  public_ip_name      = each.value.public_ip_name
  resource_group_name = module.rgs[each.value.resource_group_key].rg_name
  location            = module.rgs[each.value.resource_group_key].rg_location
  allocation_method   = each.value.allocation_method
  tags                = each.value.tags
}

module "nsg" {
  for_each            = var.nsgs
  source              = "../../module/nsg"
  nsg_name            = each.value.nsg_name
  resource_group_name = module.rgs[each.value.resource_group_key].rg_name
  location            = module.rgs[each.value.resource_group_key].rg_location

  tags = each.value.tags
}

module "nic" {
  for_each = var.nic
  source   = "../../module/nic"

  name                = each.value.nic_name
  location            = module.rgs[each.value.resource_group_key].rg_location
  resource_group_name = module.rgs[each.value.resource_group_key].rg_name

  ip_configuration = {
    name                 = "${each.value.nic_name}-ipconfig" # auto name
    subnet_id            = module.subnet[each.value.subnet_key].subnet_id
    public_ip_address_id = module.public_ip[each.value.public_ip_key].public_ip_id
  }

  tags = each.value.tags
}




module "vms" {
  source               = "../../module/virtual_machine"
  for_each             = var.vms
  depends_on           = [module.subnet, module.nic, module.rgs]
  name                 = each.value.name
  location             = each.value.location
  resource_group_name  = module.rgs[each.value.resource_group_key].rg_name
  network_interface_id = module.nic[each.value.nic_key].id
  admin_username       = each.value.admin_username
  admin_password       = each.value.admin_password
  publisher            = each.value.publisher
  offer                = each.value.offer
  sku                  = each.value.sku

  image_version        = "v1.0"
  size                 = each.value.size
  caching              = each.value.caching
  storage_account_type = each.value.storage_account_type
}


module "aks" {
  for_each = var.aks_clusters
  source   = "../../module/aks"

  aks_cluster_name    = each.value.aks_cluster_name
  resource_group_name = module.rgs[each.value.resource_group_key].rg_name
  location            = module.rgs[each.value.resource_group_key].rg_location
  dns_prefix          = each.value.dns_prefix

  agent_pool_name = each.value.agent_pool_name
  agent_count     = each.value.agent_count
  vm_size         = each.value.vm_size

  tags = each.value.tags
}


module "key_vault" {
  for_each            = var.key_vaults
  source              = "../../module/key_vault"
  depends_on          = [module.rgs]
  key_vault_name      = each.value.key_vault_name
  resource_group_name = module.rgs[each.value.resource_group_key].rg_name
  location            = module.rgs[each.value.resource_group_key].rg_location
  tags                = each.value.tags
}

module "load_balancer" {
  for_each = var.load_balancers
  source   = "../../module/load_balancer"

  lb_name             = each.value.lb_name
  resource_group_name = module.rgs[each.value.resource_group_key].rg_name
  location            = module.rgs[each.value.resource_group_key].rg_location
  sku                 = each.value.sku

  lb_public_ip_id = module.public_ip[each.value.lb_public_ip_id].public_ip_id

  backend_address_pool_name      = each.value.backend_address_pool_name
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
  lb_probe_name                  = each.value.lb_probe_name
  protocol                       = each.value.protocol
  lb_rule_name                   = each.value.lb_rule_name
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port

  tags = each.value.tags
}



module "application_gateway" {
  for_each                      = var.application_gateways
  source                        = "../../module/application_gateway"
  depends_on                    = [module.rgs]
  app_gw_name                   = each.value.app_gw_name
  resource_group_name           = module.rgs[each.value.resource_group_key].rg_name
  location                      = module.rgs[each.value.resource_group_key].rg_location
  sku_name                      = each.value.sku_name
  public_ip_address_id          = module.public_ip[each.value.public_ip_key].public_ip_id
  subnet_id                     = module.subnet[each.value.subnet_key].subnet_id
  gateway_ip_configuration_name = each.value.gateway_ip_configuration_name
  frontend_port_name            = each.value.frontend_port_name
  backend_address_pool_name     = each.value.backend_address_pool_name
  http_settings_name            = each.value.http_settings_name
  listener_name                 = each.value.listener_name
  rule_name                     = each.value.rule_name
  tags                          = each.value.tags
}

module "acr" {
  for_each            = var.acrs
  source              = "../../module/acr"
  depends_on          = [module.rgs]
  acr_name            = each.value.acr_name
  resource_group_name = module.rgs[each.value.resource_group_key].rg_name
  location            = module.rgs[each.value.resource_group_key].rg_location
  sku                 = each.value.sku
  tags                = each.value.tags
}

module "sql_server" {
  for_each = var.sql_servers

  source                       = "../../module/sql_server"
  depends_on                   = [module.rgs]
  sql_server_name              = each.value.sql_server_name
  resource_group_name          = module.rgs[each.value.resource_group_key].rg_name
  location                     = module.rgs[each.value.resource_group_key].rg_location
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  server_version               = each.value.server_version
  tags                         = each.value.tags
}

module "sql_database" {
  for_each = var.sql_databases

  source            = "../../module/sql_database"
  depends_on        = [module.sql_server]
  sql_database_name = each.value.sql_database_name
  server_id         = module.sql_server[each.value.sql_server_key].sql_server_id
  sku_name          = each.value.sku_name
  max_size_gb       = each.value.max_size_gb
  tags              = each.value.tags
}

module "log_analytics" {
  for_each            = var.log_analytics_workspaces
  source              = "../../module/log_analytics"
  depends_on          = [module.rgs]
  name                = each.value.name
  location            = module.rgs[each.value.resource_group_key].rg_location
  resource_group_name = module.rgs[each.value.resource_group_key].rg_name
  sku                 = each.value.sku
  retention_in_days   = each.value.retention_in_days
  tags                = each.value.tags
}

module "bastion" {
  for_each   = var.bastion_hosts
  source     = "../../module/bastion"
  depends_on = [module.rgs, module.subnet, module.public_ip]

  name                = each.value.name
  location            = module.rgs[each.value.resource_group_key].rg_location
  resource_group_name = module.rgs[each.value.resource_group_key].rg_name

  ip_configuration = {
    name         = each.value.ip_configuration.name
    subnet_id    = module.subnet[each.value.subnet_key].subnet_id
    public_ip_id = module.public_ip[each.value.public_ip_key].public_ip_id
  }

  tags = each.value.tags
}


