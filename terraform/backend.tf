terraform {
  backend "azurerm" {
    # Authenticate to the state blob with Entra ID (your az login) rather than a storage account key
    use_azuread_auth = true
  }
}
