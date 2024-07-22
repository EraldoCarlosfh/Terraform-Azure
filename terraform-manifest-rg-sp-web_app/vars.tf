variable "region" {
  description = "Azure Region where all these resources will be provisioned"
  type = string
  default = "Central US"
}

variable "resourcegroup_name" {
  description = "The name of the resource group."
  type = string
  default = "project_devops-rg"
}

variable "serviceplan_name" {
  description = "The name of the service plan."
  type = string
  default = "project_devops-sp"
}

variable "app_name" {
  description = "The name of the static site application."
  type = string
  default = "site-cldsystem"
}