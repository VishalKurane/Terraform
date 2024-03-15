provider "azurerm" {
  features {}
}

# Create Resource Group
resource "azurerm_resource_group" "rg" {
  location = "${var.resource_group_location}"
  name     = "${var.resource_group_name}"
}

# Create virtual network
resource "azurerm_virtual_network" "my_terraform_network" {
  name                = "${var.resource_group_location}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Create subnet
resource "azurerm_subnet" "my_terraform_subnet" {
  name                 = "${var.subnet_name}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.my_terraform_network.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create network interface
resource "azurerm_network_interface" "my_terraform_nic" {
  name                = "${var.nic_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "my_nic_configuration"
    subnet_id                     = azurerm_subnet.my_terraform_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Create virtual machine
resource "azurerm_windows_virtual_machine" "main" {
  name                  = "${var.virtual_machine_name}"
  admin_username        = "${var.admin_username}"
  admin_password        = "${var.admin_password}"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.my_terraform_nic.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
}