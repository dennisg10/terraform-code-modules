output "vm_obj" {
  description = "The entire object of the Azure Linux Virtual Machine resource."
  value       = azurerm_linux_virtual_machine.linux_virtual_machine
}

output "vm_id" {
  description = "The ID of the Azure Linux Virtual Machine resource."
  value       = azurerm_linux_virtual_machine.linux_virtual_machine.id
}

output "nic_obj" {
  description = "The entire object of the Azure Network Interface resource."
  value       = azurerm_network_interface.network_interface
}
