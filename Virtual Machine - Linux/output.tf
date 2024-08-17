output "RESOURCE-GROUP-NAME" {
  value = azurerm_resource_group.RG.name
}

output "VNET" {
  value = azurerm_virtual_network.VNET.name
}

output "SUBNET-NAME" {
  value = azurerm_subnet.SUBNET.name
}

output "VM-NAME" {
  value = azurerm_windows_virtual_machine.VM.name
}

output "ADMIN-USERNAME" {
  value = azurerm_windows_virtual_machine.VM.admin_username
}