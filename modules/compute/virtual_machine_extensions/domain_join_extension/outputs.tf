
output "vm_obj" {
  description = "The Virtual Machine object"
  value       = azurerm_windows_virtual_machine.windows_virtual_machine
}

output "nic_obj" {
  description = "The vNIC object"
  value       = azurerm_network_interface.network_interface
}
