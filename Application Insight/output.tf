output "instrumentation_key" {
  value = nonsensitive(azurerm_application_insights.AI.instrumentation_key)
}

output "app_id" {
  value = azurerm_application_insights.AI.app_id
}