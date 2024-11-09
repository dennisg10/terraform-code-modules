
module "fw-pipprefix" {
  source              = "../../../../modules/network/public_ip_prefix"
  name                = "azurefw-pip-prefix"
  resource_group_name = module.vnet01_rg.name
  location            = module.vnet01_rg.location
  prefix_length       = 30
}

module "afw-pip01" {
  source                  = "../../../../modules/network/public_ip"
  name                    = "azurefw-pip01"
  resource_group_name     = module.vnet01_rg.name
  resource_group_location = module.vnet01_rg.location
  sku                     = "Standard"
  allocation_method       = "Static"
  public_ip_prefix_id     = module.fw-pipprefix.id

}
module "afw-pip02" {
  source                  = "../../../../modules/network/public_ip"
  name                    = "azurefw-pip02"
  resource_group_name     = module.vnet01_rg.name
  resource_group_location = module.vnet01_rg.location
  sku                     = "Standard"
  allocation_method       = "Static"
  public_ip_prefix_id     = module.fw-pipprefix.id

}

module "firewall" {
  source              = "../../../../modules/network/firewall"
  name                = "res-fw-plc-we"
  resource_group_name = module.vnet01_rg.name
  location            = module.vnet01_rg.location
  firewall_policy_id  = module.fw-policy.id

  ip_configuration = [
    {
      name                 = "ipc01"
      subnet_id            = module.special_subnets.subnet_obj["AzureFirewallSubnets"].id
      public_ip_address_id = module.afw-pip01.id
    },
    {
      name                 = "ipc02"
      public_ip_address_id = module.afw-pip02.id
    }
  ]

}

/*
locals {
  ip_configuration = [
    {
      name                 = "ipc01"
      subnet_id            = module.special_subnets.subnet_obj["AzureFirewallSubnets"].id
      public_ip_address_id = module.afw-pip01.id
    },
    {
      name                 = "ipc02"
      subnet_id            = module.special_subnets.subnet_obj["AzureFirewallSubnets"].id
      public_ip_address_id = module.afw-pip02.id
    }
  ]

  management_ip_configuration = [
    {
      name      = "ipc0221"
      subnet_id = module.special_subnets.subnet_obj["AzureFirewallManagementSubnets"].id

    }
  ]
}
*/
