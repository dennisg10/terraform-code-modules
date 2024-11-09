
module "route_table" {
  source                  = "../modules/network/route_table"
  resource_group_name     = module.vnet01_rg.name
  resource_group_location = module.vnet01_rg.location
  route_tables            = local.route_tables
}

module "special_route_table" {
  source                  = "../modules/network/route_table"
  resource_group_name     = module.vnet01_rg.name
  resource_group_location = module.vnet01_rg.location
  route_tables            = local.special_route_tables
}


resource "azurerm_subnet_route_table_association" "route_table_association" {
  for_each       = local.subnets
  subnet_id      = lookup(module.subnets.subnet_obj, each.key, null).id
  route_table_id = lookup(module.route_table.rt_obj, "general_rt", null).id

  depends_on = [
    module.route_table,
    module.special_route_table,
    module.subnets,
    module.special_subnets
  ]
}


resource "azurerm_subnet_route_table_association" "special_route_table_association" {
  for_each       = local.special_route_tables
  subnet_id      = try(lookup(module.special_subnets.subnet_obj, each.key, null).id, lookup(module.subnets.subnet_obj, each.key, null).id)
  route_table_id = lookup(module.special_route_table.rt_obj, each.key, null).id

  depends_on = [module.special_route_table]
}