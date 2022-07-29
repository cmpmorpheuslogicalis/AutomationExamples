###############################################################################
# Modules 
###############################################################################
module "resource_group" {
  source                         = "./modules/resource_group"
  rg_name                           = var.resource_group.rg_name
  rg_location                       = var.resource_group.rg_location
}

module "network" {
  source                         = "./modules/networking"
  vnet_name                      = var.networking.vnet_name
  vnet_rg_name                   = module.resource_group.rg_name
  vnet_location                  = module.resource_group.rg_location
  vnet_address_space             = var.networking.vnet_address_space
  snet_vm_address_prefixes       = var.networking.snet_vm_address_prefixes

  depends_on = [
    module.resource_group
  ]
}

module "virtual_machine" {
  source                         = "./modules/virtual_machine"
  vm_name                        = var.virtual_machine.vm_name
  nic_rg                         = module.resource_group.rg_name
  nic_location                   = module.resource_group.rg_location
  nic_snet                       = module.network.snet_id
  
  depends_on = [
    module.network
  ]
}