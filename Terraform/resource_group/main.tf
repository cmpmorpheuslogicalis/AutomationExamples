# Create a Resource Group
resource "azurerm_resource_group" "rg1" {
  name = var.rg_name
  location = var.rg_location
}