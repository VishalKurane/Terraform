output "Function_App_Name" {
   value = azurerm_linux_function_app.FA.name
}

output "App_Service_Plan_Name" {
   value = azurerm_service_plan.ASP.name
}

output "Storage_Account_Name" {
   value = azurerm_storage_account.ST.name
}
