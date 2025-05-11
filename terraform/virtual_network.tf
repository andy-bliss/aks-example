# Virtual Network
resource "azurerm_virtual_network" "aks_vnet" {
  name                = var.virtual_network_name
  resource_group_name = azurerm_resource_group.aks_rg.name
  location            = azurerm_resource_group.aks_rg.location
  tags = var.tags

  address_space       = var.virtual_network_address_space
}
