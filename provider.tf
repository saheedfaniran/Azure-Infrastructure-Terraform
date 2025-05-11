provider "azurerm" {
  subscription_id = "bc897bbf-093e-4d97-a2e6-993c21dc2cb5"
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
}
#Azurerm provider file stating Azure as the cloud provider and the Hashicorp Azurerm version