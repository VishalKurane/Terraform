output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "virtual_network_name" {
  value = azurerm_virtual_network.my_terraform_network.name
}

output "subnet_name" {
  value = azurerm_subnet.my_terraform_subnet.name
}

output "virtual_machine_name" {
  value = azurerm_windows_virtual_machine.main.name
}

output "admin_username" {
  value     = azurerm_windows_virtual_machine.main.admin_username
}