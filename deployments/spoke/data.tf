#-----------------
# Storage Account
#-----------------
data "azurerm_storage_account" "storage_account" {
  provider            = azurerm.hub
  name                = "stqohtfbackendcus7492"
  resource_group_name = "rg-qoh-tf-backend-cus"
}

data "azurerm_client_config" "current" {}