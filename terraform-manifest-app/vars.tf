variable "region" {
  type = string
  description = "Azure Region where all these resources will be provisioned"
  default = "Central US"
}

variable "app_name" {
  description = "The name of the static site application."
  type = string
  default = "site-cldsystem"
}

variable "resourcegroup" {
  description = "The name of the resource group."
  type = string
  default = "project_devops-rg"
}

variable "serviceplan" {
  description = "The name of the service plan."
  type = string
  default = "project_devops-sp"
}