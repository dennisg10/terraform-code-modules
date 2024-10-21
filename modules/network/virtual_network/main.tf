resource "azurerm_virtual_network" "vnet" {
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  dns_servers         = var.dns_servers
  tags                = var.tags
}


resource "azurerm_subnet" "subnet" {
  for_each                                      = var.subnets
  resource_group_name                           = var.resource_group_name
  virtual_network_name                          = var.vnet_name
  name                                          = each.value.subnet_name
  address_prefixes                              = each.value.subnet_address_prefix
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
  depends_on = [azurerm_virtual_network.vnet]

}



/* OPTIONAL in seperate module???
resource "azurerm_network_security_group" "nsg" {
  for_each            = var.subnets
  name                = each.value.nsg_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  /*
  security_rule {
    priority                     = each.value.rule_priority
    name                         = each.value.rule_name
    description                  = each.value.description
    direction                    = each.value.rule_direction
    access                       = each.value.rule_access
    source_address_prefix        = each.value.source_address_prefix
    source_address_prefixes      = each.value.source_address_prefixes
    destination_address_prefix   = each.value.destination_address_prefix
    destination_address_prefixes = each.value.destination_address_prefixes
    protocol                     = each.value.rule_protocol
    source_port_range            = each.value.rule_source_port_range
    source_port_ranges           = each.value.rule_source_port_ranges
    destination_port_range       = each.value.rule_destination_port_range
    destination_port_ranges      = each.value.rule_destination_port_ranges
  }
  }
  */


