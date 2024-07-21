variable "region" {
  type = string
  description = "Azure Region where all these resources will be provisioned"
  default = "Central US"
}

variable "app_name" {
  type = string
  default = "dotnetapp-devops"
}

variable "resourcegroup" {
  type = string
  default = "devops"
}

variable "serviceplan" {
  type = string
  default = "dotnet-sp"
}