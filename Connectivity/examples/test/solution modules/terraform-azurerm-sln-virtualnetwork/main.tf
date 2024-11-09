module "vnet-rg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = "${var.customer_prefix}-${var.environment_prefix}-${var.resource_group_name}"
  resource_group_location = var.resource_group_location
  tags                    = var.tags
}

module "vnet" {
  source                  = "../../modules/network/virtual_network"
  resource_group_name     = module.vnet-rg.name
  resource_group_location = module.vnet-rg.location
  vnet_name               = var.vnet_name
  vnet_address_space      = var.vnet_address_space
  dns_servers             = var.dns_servers
  tags                    = var.tags
}


module "subnets" {
  source              = "../../modules/network/subnet"
  resource_group_name = module.vnet-rg.name
  vnet_name           = module.vnet.virtual_network_name
  subnets             = local.subnets
}

module "special_subnets" {
  source              = "../../modules/network/subnet"
  resource_group_name = module.vnet-rg.name
  vnet_name           = module.vnet.virtual_network_name
  subnets             = local.special_subnets
  depends_on          = [module.subnets]
}

module "network_security_groups" {
  source                  = "../../modules/network/network_security_group"
  resource_group_name     = module.vnet-rg.name
  resource_group_location = module.vnet-rg.location
  nsgs                    = local.nsgs
}

resource "azurerm_subnet_network_security_group_association" "nsg_vnet_association" {

  for_each                  = local.nsgs
  network_security_group_id = lookup(module.network_security_groups.nsg_obj, each.key, null).id
  subnet_id                 = try(lookup(module.special_subnets.subnet_obj, each.key, null).id, lookup(module.subnets.subnet_obj, each.key, null).id)
  depends_on = [
    module.network_security_groups,
    module.subnets,
    module.special_subnets
  ]
}
