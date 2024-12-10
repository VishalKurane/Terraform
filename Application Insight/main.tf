provider "azurerm" {
  features {}
  subscription_id = "_______"       # Provide your Subscription ID
}

data "azurerm_resource_group" "RG" {
  name     = var.ResourceGroupName
} 


resource "azurerm_log_analytics_workspace" "LA" {
  name                = var.Log_Analytics_Name
  location            = var.locationName
  resource_group_name = data.azurerm_resource_group.RG.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  daily_quota_gb      = 5
}

resource "azurerm_application_insights" "AI" {
  name                = var.App_Insight_Name
  location            = var.locationName
  resource_group_name = data.azurerm_resource_group.RG.name
  workspace_id        = azurerm_log_analytics_workspace.LA.id
  application_type    = "web"

  depends_on = [ azurerm_log_analytics_workspace.LA ]
}

