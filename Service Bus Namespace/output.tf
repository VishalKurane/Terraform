output "ServiceBus_Name" {
  value = azurerm_servicebus_namespace.ServiceBus_Name.name
}

output "Queue_Name" {
  value = azurerm_servicebus_queue.sb_queue.name
}