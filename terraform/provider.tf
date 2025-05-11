# Configure the Azure provider
provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.28.0" # Use a tested version, i.e. 4.28.x
    }
  }

  required_version = ">= 1.10.0"
}