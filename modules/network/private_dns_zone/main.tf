resource "azurerm_private_dns_zone" "private_dns_zone" {
  for_each = var.private_dns_zones
  name                = each.value
  resource_group_name = var.resource_group_name
}


/*
resource "azurerm_private_dns_zone_virtual_network_link" "private_dns-zone_link" {
  name                  = "_link"
  resource_group_name   = azurerm_resource_group.private_dns_zone_name.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.name
  virtual_network_id    = azurerm_virtual_network.example.id
}
*/