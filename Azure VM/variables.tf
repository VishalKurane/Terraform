variable "resource_group_name" {
    default = "My_Resource_Group"
  type = string
}

variable "resource_group_location" {
  default = "eastus"
}

variable "subnet_name" {
  default = "My_Subnet"
  type = string
}

variable "nic_name" {
  default = "My_Network_Interface"
  type = string
}

variable "virtual_machine_name" {
  default = "VirtualMachine1"
  type = string
}

variable "admin_username" {
  default = "vishal"
  type = string
}

variable "admin_password" {
  default = "vishal@123"
  type = string
}