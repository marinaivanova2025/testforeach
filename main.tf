terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.37.0"
    }

  }

  required_version = "~> 1.2"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  for_each = tomap({
    a_group       = "eastus"
    another_group = "westus2"
  })
  name     = each.key
  location = each.value
}

output "resource_group_names" {
  value = [for rg in azurerm_resource_group.rg : rg.name]
}