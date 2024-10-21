resource "azurerm_user_assigned_identity" "uami" {
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  name                = var.name

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}