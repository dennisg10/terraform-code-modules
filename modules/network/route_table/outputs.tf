output "rt_name" {
  value       = [for rt in azurerm_route_table.route_table : rt.name]
  description = "The names of the Azure Route Tables."
}

output "rt_id" {
  value       = [for rt in azurerm_route_table.route_table : rt.id]
  description = "The IDs of the Azure Route Tables."
}

output "rt_obj" {
  value       = azurerm_route_table.route_table
  description = "The entire Azure Route Table objects."
}
