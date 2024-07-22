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

# Create a static site
resource "azurerm_static_site" "example" {
  name                = upper("${var.app_name}")
  resource_group_name = data.azurerm_resource_group.current.name
  location            = data.azurerm_resource_group.current.location 
  # connection {
  #   type                      = "AzureDevOps"
  #   branch                    = "main"
  #   url                       = var.azure_devops_repo_url
  #   azure_devops_account_name = var.azure_devops_account_name
  #   azure_devops_project_name = var.azure_devops_project_name
  #   azure_devops_token        = var.azure_devops_token
  #   host                      = "dev.azure.com"
  #   build {
  #     app_location      = "/"     # Path to app files
  #     api_location      = ""     # Path to api files
  #     output_location   = "/" # Path to generated static files
  #   }
  # }
}

# Information output
output "static_site_url" {
  description = "A URL do site estático."
  value       = azurerm_static_site.example.default_host_name
}