variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

variable "rg_name" {
  default = "morpheus_terraform_teste"
  description = "Nome do grupo de recursos a ser criado"
}

variable "rg_location" {
  default = "East US"
  description = "Local onde o grupo de recursos ficará"
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

# Create a Resource Group
resource "azurerm_resource_group" "rg1" {
  name = var.rg_name
  location = var.rg_location
}
