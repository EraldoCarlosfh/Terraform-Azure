# Configuração do Provider a ser utilizado e sua versão
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.70.0"
    }
  }
}

# Configuraões de acesso ao Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Criação do grupo de recursos
resource "azurerm_resource_group" "example" {
  name     = var.resourcegroup_name
  location = var.region
}

# Criação do plano de serviço associado ao grupo de recursos
resource "azurerm_service_plan" "example" {
  name                = var.serviceplan_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Windows"
  sku_name            = "F1"
}

# Criação site estático
resource "azurerm_static_site" "example" {
  name                = upper("${var.app_name}")
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}

# Informação de Saída
output "static_site_url" {
  description = "URL static site."
  value       = azurerm_static_site.example.default_host_name
}