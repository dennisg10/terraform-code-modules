resource "azurerm_route_table" "route_table" {
  for_each                      = var.route_tables
  name                          = each.value.rt_name
  resource_group_name           = var.resource_group_name
  location                      = var.resource_group_location
  tags                          = var.tags
  bgp_route_propagation_enabled = lookup(each.value, "bgp_propagation", false)

  dynamic "route" {
    for_each = lookup(each.value, "route", [])
    content {
      name                   = lookup(route.value, "name", null)
      address_prefix         = lookup(route.value, "address_prefix", null)
      next_hop_type          = lookup(route.value, "next_hop_type", null)
      next_hop_in_ip_address = lookup(route.value, "next_hop_in_ip_address", null)
    }
  }
  depends_on = []
}

