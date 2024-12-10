# Resource Group
variable "ResourceGroupName" {
  default = "RG-test"
}
variable "locationName" {
  default = "East US"
}

##############################################################
# Resource - Storage Account
variable "SA_Name" {
  default = "satest01"
}
variable "SA_Tier" {
  default = "Standard"
}
variable "SA_Replication_Type" {
  default = "LRS"
}

##############################################################
# Resource - App Service Plan
variable "ASP_Name" {
  default = "ASP-Test-001"
}
variable "ASP_Operating_System" {
  default = "Linux"
}
variable "ASP_SKU_Name" {
  default = "Y1"
}

###############################################################
# Resource - Function App
variable "FA_Name" {
  default = "FA-Test-001"
}


###############################################################
# Resource - Application Insight
variable "App_Insight_Name" {
  default = "AI-test"
}
# Resource Group
variable "AI_ResourceGroupName" {
  default = "RG-test"
}