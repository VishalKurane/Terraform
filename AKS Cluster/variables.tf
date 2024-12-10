# Resource Group
variable "ResourceGroupName" {
  default = "RG-test"
}

# Location
variable "locationName" {
  default = "East US"
}

# Aks Cluster Name
variable "AKS_Name" {
  default = "AKS-test"
}

# Node Pool Name
variable "Node_Pool_Name" {
  default = "nodepool01"
}