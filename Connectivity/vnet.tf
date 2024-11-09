module "vnet01_rg" {
  source                  = "../modules/resource_group"
  resource_group_name     = "BOV-PLC-VirtualNetworks"
  resource_group_location = var.resource_group_location
  tags                    = var.tags

}

module "vnet01" {
  source                  = "../modules/network/virtual_network"
  resource_group_name     = module.vnet01_rg.name
  resource_group_location = module.vnet01_rg.location
  vnet_name               = var.vnet_name
  vnet_address_space      = var.vnet_address_space
  tags                    = var.tags
}


module "subnets" {
  source              = "../modules/network/subnet"
  resource_group_name = module.vnet01_rg.name
  vnet_name           = module.vnet01.virtual_network_name
  tags                = var.tags
  subnets             = local.subnets
  depends_on          = [module.special_subnets]
}


module "special_subnets" {
  source              = "../modules/network/subnet"
  resource_group_name = module.vnet01_rg.name
  vnet_name           = module.vnet01.virtual_network_name
  tags                = var.tags
  subnets             = local.special_subnets
}

