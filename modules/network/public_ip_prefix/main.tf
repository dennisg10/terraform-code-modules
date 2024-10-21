resource "azurerm_public_ip_prefix" "public_ip_prefix" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  prefix_length       = var.prefix_length
  sku                 = var.sku
}
