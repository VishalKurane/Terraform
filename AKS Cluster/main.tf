provider "azurerm" {
  features {}
  subscription_id = "_______"       # Provide your Subscription ID
}

data "azurerm_resource_group" "RG" {
  name     = var.ResourceGroupName
}

resource "azurerm_kubernetes_cluster" "AKS" {
  name                = var.AKS_Name
  location            = var.locationName
  resource_group_name = data.azurerm_resource_group.RG.name
  dns_prefix          = var.AKS_Name

  default_node_pool {
    name       = var.Node_Pool_Name
    node_count = 1
    vm_size    = "Standard_D2pls_v6"
  }

  identity {
    type = "SystemAssigned"
  }

}

