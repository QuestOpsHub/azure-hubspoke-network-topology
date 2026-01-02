#--------
# Locals
#--------
helpers = {
  project           = "questopshub"
  project_short     = "qoh"
  sub_project       = "project01"
  sub_project_short = "p01"
  environment       = "dev"
  region            = "centralus"
  region_short      = "cus"
  deployment        = "spoke"
  deployment_short  = "sp"
  source            = "terraform"
  cost_center       = "6001"
  reason            = "JIRA-12345"
  created_by        = "veera-bhadra"
  team              = "infrateam"
  owner             = "veera-bhadra"
}

#----------------
# Resource Group
#----------------
resource_group = {
  default = {
    name = "rg"
  },
}

#-----------------
# Virtual Network
#-----------------
virtual_network = {
  default = {
    name           = "vnet-network"
    resource_group = "default"
    address_space  = ["24.0.0.0/16"]
    subnets = {
      default = {
        name              = "default"
        address_prefixes  = ["24.0.1.0/24"]
        service_endpoints = ["Microsoft.KeyVault", "Microsoft.Storage"]
      },
    }
  }
}

#------------------------
# User Assigned Identity
#------------------------
user_assigned_identity = {
  default = {
    name           = "id"
    resource_group = "default"
  },
}

#-----------------
# Storage Account
#-----------------
storage_account = {
  default = {
    name                     = "st"
    resource_group           = "default"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    is_hns_enabled           = false
    nfsv3_enabled            = true
    identity = {
      type     = "UserAssigned"
      identity = "default"
    }
    network_rules = {
      default_action      = "Allow" # @todo Set back to Deny
      bypass              = ["AzureServices", "Metrics"]
      ip_rules            = []
      private_link_access = {}
    }
  },
}