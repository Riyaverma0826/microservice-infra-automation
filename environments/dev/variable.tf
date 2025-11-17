variable "resource_groups" {
  description = "A map of resource group configurations"
  type = map(object({
    rg_name  = string
    location = string
    tags     = map(string)
  }))
}

variable "storage_accounts" {
  description = "A map of storage account configurations"
  type = map(object({
    sa_name                  = string
    account_tier             = string
    resource_group_key       = string
    location                 = string
    account_replication_type = string
    tags                     = map(string)
  }))
}

variable "vnets" {
  description = "A map of virtual network configurations"
  type = map(object({
    vnet_name          = string
    address_space      = list(string)
    resource_group_key = string
    location           = string
    tags               = map(string)
  }))
}

variable "subnets" {
  description = "A map of subnet configurations"
  type = map(object({
    subnet_name        = string
    address_prefixes   = list(string)
    vnet_key           = string
    resource_group_key = string
    location           = string
  }))
}

variable "public_ips" {
  description = "A map of public IP configurations"
  type = map(object({
    public_ip_name     = string
    resource_group_key = string
    location           = string
    allocation_method  = string
    tags               = map(string)
  }))
}

variable "nsgs" {
  type = map(object({
    nsg_name           = string
    location           = string
    resource_group_key = string
    tags               = map(string)
    security_rule = object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    })
  }))
}

variable "nic" {
  description = "A map of network interface configurations"
  type = map(object({
    nic_name           = string
    resource_group_key = string
    subnet_key         = string
    public_ip_key      = string
    tags               = map(string)
  }))
}


variable "vms" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_key   = string
    nic_key              = string
    admin_username       = string
    admin_password       = string
    publisher            = string
    offer                = string
    sku                  = string
    version              = string
    size                 = string
    caching              = string
    storage_account_type = string
  }))
}

variable "aks_clusters" {
  description = "A map of AKS cluster configurations"
  type = map(object({
    aks_cluster_name   = string
    resource_group_key = string
    location           = string
    dns_prefix         = string
    agent_pool_name    = string
    agent_count        = number
    vm_size            = string
    tags               = map(string)
  }))
}

variable "key_vaults" {
  description = "A map of Key Vault configurations"
  type = map(object({
    key_vault_name     = string
    location           = string
    resource_group_key = string
    tags               = map(string)
  }))
}

variable "sql_servers" {
  description = "A map of SQL server configurations"
  type = map(object({
    sql_server_name              = string
    resource_group_key           = string
    location                     = string
    administrator_login          = string
    administrator_login_password = string
    server_version               = string
    tags                         = map(string)
  }))
}

variable "sql_databases" {
  description = "A map of SQL database configurations"
  type = map(object({
    sql_database_name = string
    sql_server_key    = string
    max_size_gb       = number
    sku_name          = string
    tags              = map(string)
  }))
}

variable "load_balancers" {
  type = map(object({
    lb_name                        = string
    resource_group_key             = string
    location                       = string
    sku                            = string
    backend_address_pool_name      = string
    frontend_ip_configuration_name = string
    lb_public_ip_id                = string
    frontend_port                  = number
    backend_port                   = number
    lb_probe_name                  = string
    lb_rule_name                   = string
    protocol                       = string
    tags                           = map(string)
  }))
}


variable "application_gateways" {
  description = "A map of Application Gateway configurations"
  type = map(object({
    app_gw_name                   = string
    sku_name                      = string
    resource_group_key            = string
    location                      = string
    gateway_ip_configuration_name = string
    public_ip_key                 = string
    subnet_key                    = string
    frontend_port_name            = string
    backend_address_pool_name     = string
    http_settings_name            = string
    listener_name                 = string
    rule_name                     = string
    tags                          = map(string)
  }))
}

variable "acrs" {
  description = "A map of Azure Container Registry configurations"
  type = map(object({
    acr_name           = string
    resource_group_key = string
    location           = string
    sku                = string
    tags               = map(string)
  }))
}

variable "log_analytics_workspaces" {
  description = "A map of Log Analytics Workspace configurations"
  type = map(object({
    name               = string
    resource_group_key = string
    location           = string
    sku                = string
    retention_in_days  = number
    tags               = map(string)
  }))
}

variable "bastion_hosts" {
  description = "A map of Bastion Host configurations"
  type = map(object({
    name               = string
    resource_group_key = string
    location           = string
    subnet_key         = string
    public_ip_key      = string
    ip_configuration = object({
      name = string
    })
    tags = map(string)
  }))
}

