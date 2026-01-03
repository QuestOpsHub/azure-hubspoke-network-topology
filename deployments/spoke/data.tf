#-----------------
# Storage Account
#-----------------
data "azurerm_storage_account" "storage_account" {
  provider            = azurerm.hub
  name                = "stqohp01tfbackend9274"
  resource_group_name = "rg-qoh-p01-tf-backend"
}

data "azurerm_client_config" "current" {}