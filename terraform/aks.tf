resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  resource_group_name = azurerm_resource_group.aks_rg.name
  location            = azurerm_resource_group.aks_rg.location
  tags = var.tags

  dns_prefix          = var.aks_dns_prefix
  kubernetes_version  = var.aks_kubernetes_version
  node_resource_group = var.aks_node_resource_group_name

  default_node_pool {
    name            = var.aks_default_node_pool_name
    vm_size         = var.aks_default_node_pool_vm_size
    os_sku          = var.aks_default_node_pool_os_sku
    os_disk_size_gb = var.aks_default_node_pool_os_disk_size_gb

    auto_scaling_enabled = true
    min_count            = var.aks_default_node_pool_minimum_node_count
    max_count            = var.aks_default_node_pool_maximum_node_count
    zones                = var.aks_default_node_pool_availability_zones
    vnet_subnet_id       = azurerm_subnet.aks_subnet.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }
}
