variable "region" {
  type = string
  description = "Azure Region where all these resources will be provisioned"
  default = "Central US"
}

variable "resourcegroup_name" {
  type = string
  default = "devops-rg"
}

variable "serviceplan_name" {
  type = string
  default = "devops-sp"
}