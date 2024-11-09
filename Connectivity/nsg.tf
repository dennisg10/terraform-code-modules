
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


module "network_security_groups" {
  source                  = "../modules/network/network_security_group"
  resource_group_name     = module.vnet01_rg.name
  resource_group_location = module.vnet01_rg.location
  nsgs                    = local.nsgs
}

