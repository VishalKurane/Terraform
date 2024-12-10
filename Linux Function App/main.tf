provider "azurerm" {
  features {}
  subscription_id = "_______"       # Provide your Subscription ID
}

data "azurerm_resource_group" "RG" {
  name     = var.ResourceGroupName
}


# data "azurerm_application_insights" "AI" {
#   name     = var.App_Insight_Name
#   resource_group_name = var.AI_ResourceGroupName
# }



resource "azurerm_storage_account" "ST" {
  name                     = var.SA_Name
  resource_group_name      = var.ResourceGroupName
  location                 = var.locationName
  account_tier             = var.SA_Tier
  account_replication_type = var.SA_Replication_Type
}

resource "azurerm_service_plan" "ASP" {
  name                = var.ASP_Name
  resource_group_name = var.ResourceGroupName
  location            = var.locationName
  os_type             = var.ASP_Operating_System
  sku_name            = var.ASP_SKU_Name
}

resource "azurerm_linux_function_app" "FA" {
  name                = var.FA_Name
  resource_group_name = var.ResourceGroupName
  location            = var.locationName

  storage_account_name       = azurerm_storage_account.ST.name
  storage_account_access_key = azurerm_storage_account.ST.primary_access_key
  service_plan_id            = azurerm_service_plan.ASP.id

  depends_on = [ azurerm_service_plan.ASP, azurerm_service_plan.ASP ]

  # app_settings = {
  #   "APPINSIGHTS_INSTRUMENTATIONKEY" = data.azurerm_application_insights.AI.instrumentation_key
  # }


  site_config {
    application_stack {
      python_version = "3.11"
    }
  }

  
  
}