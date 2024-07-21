# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.70.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
data "azurerm_resource_group" "current" {
  name = var.resourcegroup
}

# Create a service plain within the resource group
data "azurerm_service_plan" "current" {
  name = var.serviceplan
  resource_group_name = data.azurerm_resource_group.current.name
}

resource "azurerm_windows_web_app" "example" {
  name                = upper("${var.app_name}-${terraform.workspace}")
  resource_group_name = data.azurerm_resource_group.current.name
  location            = data.azurerm_resource_group.current.location
  service_plan_id     = data.azurerm_service_plan.current.id

  site_config {
    always_on = false
    application_stack {
      current_stack = "node"
      node_version = "~20"
    }
  }
}