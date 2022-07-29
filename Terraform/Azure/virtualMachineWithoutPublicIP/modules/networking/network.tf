###############################################################################
# Virtual Network 
###############################################################################
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.vnet_location
  resource_group_name = var.vnet_rg_name
  address_space       = var.vnet_address_space
}

###############################################################################
# Subnets 
###############################################################################
resource "azurerm_subnet" "snet" {
  name                 = "Subnet_Terraform_Morpheus"
  resource_group_name  = var.vnet_rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.snet_vm_address_prefixes
}