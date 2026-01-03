#--------
# Locals
#--------
helpers = {
  project          = "questopshub"
  project_short    = "qoh"
  environment      = "dev"
  region           = "centralus"
  region_short     = "cus"
  deployment       = "spoke"
  deployment_short = "sp"
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
  network = {
    name = "rg-network"
  },
  app-linux = {
    name = "rg-app-linux"
  },
  app-windows = {
    name = "rg-app-windows"
  },
  func-linux = {
    name = "rg-func-linux"
  },
  func-windows = {
    name = "rg-func-windows"
  },
  kv = {
    name = "rg-kv"
  },
  cosmosdb = {
    name = "rg-cosmosdb"
  },
}

#-----------------
# Virtual Network
#-----------------
virtual_network = {
  network = {
    name           = "vnet-network"
    resource_group = "network"
    address_space  = ["24.0.0.0/16"]
    subnets = {
      default = {
        name              = "default"
        address_prefixes  = ["24.0.1.0/24"]
        service_endpoints = ["Microsoft.KeyVault", "Microsoft.Storage"]
      },
    }
  },
}

#---------------------------------------
# Hub <-> Spoke Virtual Network Peering
#---------------------------------------
hub_spoke_peering = {
  hub_vnet                           = "network"
  spoke_vnet                         = "network"
  peer1_allow_virtual_network_access = true
  peer1_allow_forwarded_traffic      = true
  peer1_allow_gateway_transit        = true
  peer1_use_remote_gateways          = false
  peer2_allow_virtual_network_access = true
  peer2_allow_forwarded_traffic      = true
  peer2_allow_gateway_transit        = false
  peer2_use_remote_gateways          = false
}

#---------------
# User Identity
#---------------
user_assigned_identity = {
  app-linux = {
    name           = "id-app-linux"
    resource_group = "app-linux"
  },
  app-windows = {
    name           = "id-app-win"
    resource_group = "app-windows"
  },
  func-linux = {
    name           = "id-func-linux"
    resource_group = "func-linux"
  },
  func-windows = {
    name           = "id-func-win"
    resource_group = "func-windows"
  },
  st-func-linux = {
    name           = "id-st-func-linux"
    resource_group = "func-linux"
  },
  st-func-windows = {
    name           = "id-st-func-win"
    resource_group = "func-windows"
  },
  cosmon = {
    name           = "id-cosmon"
    resource_group = "cosmosdb"
  },
}

#-----------------
# Storage Account
#-----------------
storage_account = {
  # Storage Account used by the Linux Function App(s)
  st-func-linux = {
    name                     = "st-func-linux"
    resource_group           = "func-linux"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    is_hns_enabled           = false
    nfsv3_enabled            = true
    identity = {
      type     = "UserAssigned"
      identity = "st-func-linux"
    }
    blob_properties = {
      cors_rule = {
        allowed_headers    = ["*"]
        allowed_methods    = ["GET"]
        allowed_origins    = ["https://*.lightmetrics.co", "https://*.detroitconnect.com", "http://localhost:4300"]
        exposed_headers    = ["x-ms-meta-*"]
        max_age_in_seconds = "200"
      }
      versioning_enabled = true
    }
    queue_properties = {
      cors_rule = {
        allowed_headers    = ["*"]
        allowed_methods    = ["GET", "OPTIONS"]
        allowed_origins    = ["https://myhost.com"]
        exposed_headers    = ["*"]
        max_age_in_seconds = "200"
      }
    }
    share_properties = {
      cors_rule = {
        allowed_headers    = ["*"]
        allowed_methods    = ["GET"]
        allowed_origins    = ["https://myhost.com"]
        exposed_headers    = ["x-ms-meta-*"]
        max_age_in_seconds = "200"
      }
    }
    network_rules = {
      default_action      = "Allow" # @todo Set back to Deny
      bypass              = ["AzureServices", "Metrics"]
      ip_rules            = []
      private_link_access = {}
    }
  },
  # Storage Account used by the Windows Function App(s)
  st-func-windows = {
    name                     = "st-func-win"
    resource_group           = "func-windows"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    is_hns_enabled           = false
    nfsv3_enabled            = true
    identity = {
      type     = "UserAssigned"
      identity = "st-func-windows"
    }
    blob_properties = {
      cors_rule = {
        allowed_headers    = ["*"]
        allowed_methods    = ["GET"]
        allowed_origins    = ["https://*.lightmetrics.co", "https://*.detroitconnect.com", "http://localhost:4300"]
        exposed_headers    = ["x-ms-meta-*"]
        max_age_in_seconds = "200"
      }
      versioning_enabled = true
    }
    queue_properties = {
      cors_rule = {
        allowed_headers    = ["*"]
        allowed_methods    = ["GET", "OPTIONS"]
        allowed_origins    = ["https://myhost.com"]
        exposed_headers    = ["*"]
        max_age_in_seconds = "200"
      }
    }
    share_properties = {
      cors_rule = {
        allowed_headers    = ["*"]
        allowed_methods    = ["GET"]
        allowed_origins    = ["https://myhost.com"]
        exposed_headers    = ["x-ms-meta-*"]
        max_age_in_seconds = "200"
      }
    }
    network_rules = {
      default_action      = "Allow" # @todo Set back to Deny
      bypass              = ["AzureServices", "Metrics"]
      ip_rules            = []
      private_link_access = {}
    }
  },
}