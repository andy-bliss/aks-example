resource "azurerm_container_registry" "aks_acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.aks_rg.name
  location            = azurerm_resource_group.aks_rg.location
  tags = var.tags

  sku                 = var.acr_sku
  admin_enabled       = false  # Best practice is to use AAD instead of admin creds
}

