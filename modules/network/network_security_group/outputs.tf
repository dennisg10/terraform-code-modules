output "nsg_name" {
  value       = [for nsg in azurerm_network_security_group.network_security_group : nsg.name]
  description = "The names of the Network Security Groups (NSGs)."
}

output "nsg_id" {
  value       = [for nsg in azurerm_network_security_group.network_security_group : nsg.id]
  description = "The resource IDs of the Network Security Groups (NSGs)."
}

output "nsg_map" {
  value       = zipmap([for nsg in azurerm_network_security_group.network_security_group : nsg.name], [for nsg in azurerm_network_security_group.network_security_group : nsg.id])
  description = "A map of NSG names to their respective resource IDs."
}

output "nsg_obj" {
  value       = azurerm_network_security_group.network_security_group
  description = "The entire Azure Network Security Group (NSG) objects."
}
