provider "azurerm" {
  features {}
  subscription_id = "_______"       # Provide your Subscription ID
}

data "azurerm_resource_group" "RG" {
  name     = var.ResourceGroupName
}


resource "azurerm_servicebus_namespace" "ServiceBus_Name" {
  name                = var.ServiceBus_Name
  location            = var.locationName
  resource_group_name = data.azurerm_resource_group.RG.name
  sku                 = "Basic"
}

resource "azurerm_servicebus_queue" "sb_queue" {
  name         = var.Queue_Name
  namespace_id = azurerm_servicebus_namespace.ServiceBus_Name.id
  partitioning_enabled = false
  max_size_in_megabytes = 1024
  
  depends_on = [ azurerm_servicebus_namespace.ServiceBus_Name ]
}
