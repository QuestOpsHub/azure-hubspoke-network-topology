#--------
# Locals
#--------
helpers = {
  project           = "questopshub"
  project_short     = "qoh"
  sub_project       = "project01"
  sub_project_short = "p01"
  environment       = "prod"
  region            = "centralus"
  region_short      = "cus"
  deployment        = "hub"
  deployment_short  = "hub"
  source            = "terraform"
  cost_center       = "6001"
  reason            = "jira-12345"
  created_by        = "veera-bhadra"
  team              = "platform-team"
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
    name           = "vnet"
    resource_group = "default"
    address_space  = ["20.0.0.0/16"]
    subnets = {
      default = {
        name              = "default"
        address_prefixes  = ["20.0.1.0/24"]
        service_endpoints = ["Microsoft.KeyVault", "Microsoft.Storage"]
      },
      firewall = {
        name             = "AzureFirewallSubnet"
        address_prefixes = ["20.0.2.0/26"]
      },
      management = {
        name             = "AzureFirewallManagementSubnet"
        address_prefixes = ["20.0.2.64/26"]
      },
      vgw-er = {
        name             = "GatewaySubnet"
        address_prefixes = ["20.0.3.0/26"]
      },
      bastion = {
        name             = "AzureBastionSubnet"
        address_prefixes = ["20.0.4.0/26"]
      },
    }
  },
}