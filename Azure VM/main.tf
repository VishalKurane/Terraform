# Configure the Remote Backend Mechanism
terraform {
  backend "azurerm" {
    # Specify the existing resource group on Azure cloud
    resource_group_name  = "${VAR.REMOTE_BACKEND_RG}"

    # Specify the existing Storage account on Azure cloud
    storage_account_name = "${VAR.REMOTE_BACKEND_STORAGE_ACCOUNT}"

    # Specify the existing Container name in which we will store the terraform.tfstate file
    container_name = "${VAR.REMOTE_BACKEND_CONATINER_NAME}"

    # Provide what should be the name of .tfstate file
    key = "${VAR.REMOTE_BACKEND_TFSTATE_FILE_NAME}"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create Resource Group
resource "azurerm_resource_group" "RG" {
  location = "${var.RG_LOCATION}"
  name     = "${var.RG_NAME}"
}

# Create virtual network
resource "azurerm_virtual_network" "VNET" {
  name                = "${var.VNET_NAME}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
}

# Create subnet
resource "azurerm_subnet" "my_terraform_subnet" {
  name                 = "${var.SUBNET_NAME}"
  resource_group_name  = azurerm_resource_group.RG.name
  virtual_network_name = azurerm_virtual_network.VNET.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create network interface
resource "azurerm_network_interface" "NIC" {
  name                = "${var.NIC_NAME}"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  ip_configuration {
    name                          = "nic_configuration_01"
    subnet_id                     = azurerm_subnet.my_terraform_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Create virtual machine
resource "azurerm_windows_virtual_machine" "VM" {
  name                  = "${var.VM_NAME}"
  admin_username        = "${var.ADMIN_USERNAME}"
  admin_password        = "${var.ADMIN_PASSWORD}"
  location              = azurerm_resource_group.RG.location
  resource_group_name   = azurerm_resource_group.RG.name
  network_interface_ids = [azurerm_network_interface.NIC.id]
  size                  = "${var.VM_SIZE}"

  os_disk {
    name                 = "${VAR.OS_DISK_NAME}"
    caching              = "ReadWrite"
    storage_account_type = "${var.OS_DISK_STORAGE_ACCOUNT_TYPE}"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
}