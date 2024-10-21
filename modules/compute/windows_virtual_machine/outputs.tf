output "vm_obj" {
  value       = azurerm_windows_virtual_machine.windows_virtual_machine
  description = "The entire Azure Windows Virtual Machine object."
}

output "vm_id" {
  value       = azurerm_windows_virtual_machine.windows_virtual_machine.id
  description = "The ID of the Azure Windows Virtual Machine."
}

output "nic_obj" {
  value       = azurerm_network_interface.network_interface
  description = "The entire Azure Network Interface object."
}
