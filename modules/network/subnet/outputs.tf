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

output "subnet_ids_map" {
  value       = azurerm_subnet.subnet
  description = "A map of the subnet objects, including their IDs."
}

output "subnet_obj" {
  value       = azurerm_subnet.subnet
  description = "The entire Azure subnet objects."
}
