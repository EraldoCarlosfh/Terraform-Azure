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
resource "azurerm_resource_group" "example" {
  name     = var.resourcegroup_name
  location = var.region
}

# Create a service plain within the resource group
resource "azurerm_service_plan" "example" {
  name                = var.serviceplan_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Windows"
  sku_name            = "F1"
}

resource "azurerm_static_site" "example" {
  name                = upper("${var.app_name}")
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}

# Information output
output "static_site_url" {
  description = "URL static site."
  value       = azurerm_static_site.example.default_host_name
}