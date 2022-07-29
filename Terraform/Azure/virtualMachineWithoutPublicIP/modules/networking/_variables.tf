variable "vnet_rg_name"{
    description = ""
    type = string
}
variable "vnet_location"{
    description = ""
    type = string
}
variable "vnet_address_space"{
    description = ""
    type = list(string)
}
variable "snet_vm_address_prefixes"{
    description = ""
    type = list(string)
}

variable "vnet_name"{
    description = ""
    type = string
}