#--------------------
# Required Providers
#--------------------
variable "subscription_id" {}

variable "client_id" {}

variable "client_secret" {}

variable "tenant_id" {}

#--------
# Locals
#--------
variable "helpers" {}

#----------------
# Resource Group
#----------------
variable "resource_group" {}

#-----------------
# Virtual Network
#-----------------
variable "virtual_network" {}

#---------------------------------------
# Hub <-> Spoke Virtual Network Peering
#---------------------------------------
variable "hub_spoke_peering" {}

#------------------------
# User Assigned Identity
#------------------------
variable "user_assigned_identity" {}

#-----------------
# Storage Account
#-----------------
variable "storage_account" {}