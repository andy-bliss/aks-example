output "resource_group_name" {
  description = "Resource group containing the AKS cluster, ACR and network"
  value       = azurerm_resource_group.aks_rg.name
}

output "aks_cluster_name" {
  description = "Name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "acr_name" {
  description = "Name of the Azure container registry"
  value       = azurerm_container_registry.aks_acr.name
}

output "acr_login_server" {
  description = "Login server of the Azure container registry, e.g. myacr.azurecr.io"
  value       = azurerm_container_registry.aks_acr.login_server
}
