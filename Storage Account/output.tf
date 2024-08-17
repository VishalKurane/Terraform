output "RG-Name" {
  value = azurerm_resource_group.RG.name
}

output "RG-LOCATION" {
  value = azurerm_resource_group.RG.location
}

output "STORAGE-ACCOUNT-NAME" {
  value = azurerm_storage_account.STORAGE_ACCOUNT.name
}
