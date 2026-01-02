#--------
# Locals
#--------
helpers = {
  project          = "project01"
  project_short    = "p01"
  environment      = "prod"
  region           = "centralus"
  region_short     = "cus"
  deployment       = "hub"
  deployment_short = "hub"
  source           = "terraform"
  cost_center      = "6001"
  reason           = "JIRA-12345"
  created_by       = "veera-bhadra"
  team             = "infrateam"
  owner            = "veera-bhadra"
}

#----------------
# Resource Group
#----------------
resource_group = {
  "default" = {
    name = "rg"
  },
}

#-----------------
# Virtual Network
#-----------------
virtual_network = {
  "default" = {
    name           = "vnet"
    resource_group = "default"
    address_space  = ["11.0.0.0/16"]
    subnets = {
      default = {
        name             = "default"
        address_prefixes = ["11.0.0.0/20"]
      }
    }
  }
}