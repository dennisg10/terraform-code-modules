resource "azurerm_public_ip" "public_ip" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = var.allocation_method
  public_ip_prefix_id = var.public_ip_prefix_id
  sku                 = var.sku
}
