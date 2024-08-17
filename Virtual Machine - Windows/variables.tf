variable "REMOTE_BACKEND_RG" {
    type = string
}

variable "REMOTE_BACKEND_STORAGE_ACCOUNT" {
    type = string
}

variable "REMOTE_BACKEND_CONATINER_NAME" {
    type = string
}

variable "REMOTE_BACKEND_TFSTATE_FILE_NAME" {
    type = string
}

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
  default = "VirtualMachine1"
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
  default = "Standard_DS1_v2"
}

variable "OS_DISK_NAME" {
  default = "myOsDisk"
}

variable "OS_DISK_STORAGE_ACCOUNT_TYPE" {
  default = "Standard_LRS"
}

