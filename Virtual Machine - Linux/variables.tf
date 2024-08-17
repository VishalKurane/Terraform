variable "RG_NAME" {
    default = "My_Resource_Group"
  type = string
}

variable "RG_LOCATION" {
  default = "eastus"
}

variable "VNET_NAME" {
  default = "My-VNET"
}

variable "SUBNET_NAME" {
  default = "My_Subnet"
  type = string
}

variable "NIC_NAME" {
  default = "My_Network_Interface"
  type = string
}

variable "VM_NAME" {
  default = "VirtualMachine02"
  type = string
}

variable "ADMIN_USERNAME" {
  default = "vishal"
  type = string
}

variable "ADMIN_PASSWORD" {
  default = "vishal@123"
  type = string
}

variable "VM_SIZE" {
  default = "Standard_F2"
}


variable "OS_DISK_STORAGE_ACCOUNT_TYPE" {
  default = "Standard_LRS"
}

