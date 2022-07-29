###############################################################################
# Network Interface Card 
###############################################################################
resource "azurerm_network_interface" "nic" {
  name                = "nic-morpheus"
  location            = var.nic_location
  resource_group_name = var.nic_rg

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.nic_snet
    private_ip_address_allocation = "Dynamic"
    # private_ip_address            = "10.0.1.1/24"
  }

}

###############################################################################
# Linux Virtual Machine 
###############################################################################
resource "azurerm_linux_virtual_machine" "vm" {
  name                  = var.vm_name
  location              = azurerm_network_interface.nic.location
  resource_group_name   = azurerm_network_interface.nic.resource_group_name
  size                  = "Standard_B2ms"
  admin_username        = "adminuser"
  admin_password        = "P@$$w0rd1234!"
  network_interface_ids  = [azurerm_network_interface.nic.id]

  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  lifecycle {
    ignore_changes = [
      identity,
      tags
    ]
  }
}