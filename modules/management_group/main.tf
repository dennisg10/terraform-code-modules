resource "azurerm_management_group" "management_group" {
  for_each = var.management_groups

  //name                       = each.key
  display_name               = each.value.display_name
  parent_management_group_id = each.value.parent_management_group_id
}
