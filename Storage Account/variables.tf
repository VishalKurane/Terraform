variable "RG_NAME" {
    default = "My_Resource_Group"
    type = string
}

variable "RG_LOCATION" {
  default = "eastus"
}

variable "STORAGE_ACCOUNT_NAME" {
  default = "saeastus01"
}

variable "STORAGE_ACCOUNT_TIER" {
  default = "Standard"
}

variable "STORAGE_ACCOUNT_REPLICATION_TYPE" {
  default = "LRS"
}

variable "TAG_ENVIRONMENT" {
  default = "Stage"
}

