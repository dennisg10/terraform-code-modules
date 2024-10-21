output "virtual_network_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "The name of the virtual network (VNET)."
}

output "virtual_network_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The resource ID of the virtual network (VNET)."
}

output "virtual_network_address_space" {
  value       = azurerm_virtual_network.vnet.address_space
  description = "The address space of the virtual network (VNET)."
}

output "subnet_name" {
  value       = [for s in azurerm_subnet.subnet : s.name]
  description = "The names of the subnets."
}

output "subnet_id" {
  value       = [for s in azurerm_subnet.subnet : s.id]
  description = "The resource IDs of the subnets."
}

output "subnet_address_prefix" {
  value       = [for s in azurerm_subnet.subnet : s.address_prefixes]
  description = "The address prefixes of the subnets."
}

output "subnet_map" {
  value       = zipmap([for subnet in azurerm_subnet.subnet : subnet.name], [for subnet in azurerm_subnet.subnet : subnet.id])
  description = "A map of subnet names to their respective resource IDs."
}

output "subnet_ids_map" {
  value       = azurerm_subnet.subnet
  description = "The entire Azure subnet objects, including all attributes."
}
