
resource "azurerm_subnet" "subnet" {
  for_each = { for subnet in var.subnets : subnet.subnet_name => subnet if subnet.deploy }

  resource_group_name                           = var.resource_group_name
  virtual_network_name                          = var.vnet_name
  name                                          = each.value.subnet_name
  address_prefixes                              = [each.value.subnet_address_prefix[0]]
  service_endpoints                             = lookup(each.value, "service_endpoints", [])
  service_endpoint_policy_ids                   = lookup(each.value, "service_endpoint_policy_ids", null)
  private_endpoint_network_policies             = lookup(each.value, "private_endpoint_network_policies", null)
  private_link_service_network_policies_enabled = lookup(each.value, "private_link_service_network_policies_enabled", null)

  dynamic "delegation" {
    for_each = each.value.service_delegation == true ? [1] : []
    content {
      name = "delegation"
      service_delegation {
        name    = lookup(each.value, "service_delegation_name", null)
        actions = lookup(each.value, "service_delegation_actions", null)
      }
    }
  }

  depends_on = []
}


