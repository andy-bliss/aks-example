# Subnet
resource "azurerm_subnet" "aks_subnet" {
  name                 = var.aks_subnet_name
  resource_group_name  = azurerm_resource_group.aks_rg.name

  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = var.aks_subnet_address_prefixes
}
