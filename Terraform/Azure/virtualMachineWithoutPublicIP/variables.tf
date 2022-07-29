variable "subscription_id"{
  type = string
} 

variable "tenant_id"{
  type = string
} 

variable "client_id"{
  type = string
} 

variable "client_secret"{
  type = string
} 

variable "resource_group" {
  description = "Variables for resource_group module"
  type = object({
    rg_location                       = string
    rg_name                           = string
  })
  default = {
    rg_location                       = "East US"
    rg_name                           = "morpheus_teste_app"
  }
}

variable "networking" {
  description = "Variables for networking module"
  type = object({
    vnet_address_space                = list(string)
    snet_vm_address_prefixes          = list(string)
    vnet_name                         = string
  })
  default = {
    vnet_address_space                = ["10.0.0.0/16"]
    snet_vm_address_prefixes          = ["10.0.1.0/24"]
    vnet_name                         = "vnet_morpheus_teste_app"
  }
}

variable "virtual_machine" {
  description = "Variables for virtual_machine module"
  type = object({
    vm_name                           = string
 })
 default = {
    vm_name                           = "VMmorpheustesteApp"
  }
}