output "AKS_Custer_Name" {
  value = azurerm_kubernetes_cluster.AKS.name
}

output "AKS_Custer_DNS" {
  value = azurerm_kubernetes_cluster.AKS.dns_prefix_private_cluster
}
