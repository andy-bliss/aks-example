data "azurerm_client_config" "current" {}

locals {
  # ACR names are globally unique across Azure. Append a short, stable hash of the
  # subscription ID so the name is unique per subscription but identical on every run.
  acr_name_suffix = substr(sha256(data.azurerm_client_config.current.subscription_id), 0, 6)
}

resource "azurerm_container_registry" "aks_acr" {
  name                = "${var.acr_name_prefix}${local.acr_name_suffix}"
  resource_group_name = azurerm_resource_group.aks_rg.name
  location            = azurerm_resource_group.aks_rg.location
  tags                = var.tags

  sku           = var.acr_sku
  admin_enabled = false # Best practice is to use AAD instead of admin creds
}
