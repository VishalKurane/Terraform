provider "azurerm" {
  features {}
}

# data block is used to retrieve and reference information that already exists outside of Terraform's control, such as existing resources or infrastructure managed by another system or Terraform configuration. Unlike resource blocks, which create or manage infrastructure, data blocks are used for reading information.
data "azurerm_resource_group" "RG" {
  name = var.RG_NAME
  location = var.RG_LOCATION
}


# Create virtual network
resource "azurerm_virtual_network" "VNET" {
  name                = var.VNET_NAME
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
}

# Create subnet
resource "azurerm_subnet" "SUBNET" {
  name                 = var.SUBNET_NAME
  resource_group_name  = azurerm_resource_group.RG.name
  virtual_network_name = azurerm_virtual_network.VNET.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create network interface
resource "azurerm_network_interface" "NIC" {
  name                = var.NIC_NAME
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  ip_configuration {
    name                          = "nic_configuration_01"
    subnet_id                     = azurerm_subnet.SUBNET.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "example" {
  name                = var.VM_NAME
  resource_group_name = azurerm_resource_group.RG.name
  location            = azurerm_resource_group.RG.location
  size                = var.VM_SIZE 
  admin_username      = var.ADMIN_USERNAME
  network_interface_ids = [
    azurerm_network_interface.NIC.id,
  ]

  admin_ssh_key {
    username   = var.ADMIN_USERNAME
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.OS_DISK_STORAGE_ACCOUNT_TYPE
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}