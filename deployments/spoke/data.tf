#-----------------
# Storage Account
#-----------------
data "azurerm_storage_account" "storage_account" {
  provider            = azurerm.hub
  name                = "stp01tfbackend9434"
  resource_group_name = "rg-p01-tf-backend"
}

data "azurerm_client_config" "current" {}