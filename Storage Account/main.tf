provider "azurerm" {
  features {}
  subscription_id = "_______"       # Provide your Subscription ID
}

resource "azurerm_resource_group" "RG" {
  name = var.RG_NAME
  location = var.RG_LOCATION
}

resource "azurerm_storage_account" "STORAGE_ACCOUNT" {
  name                     = var.STORAGE_ACCOUNT_NAME
  resource_group_name      = azurerm_resource_group.RG.name
  location                 = azurerm_resource_group.RG.location
  account_tier             = var.STORAGE_ACCOUNT_TIER
  account_replication_type = var.STORAGE_ACCOUNT_REPLICATION_TYPE

  tags = {
    environment = var.TAG_ENVIRONMENT
  }
}