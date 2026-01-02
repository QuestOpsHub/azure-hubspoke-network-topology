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
  reason            = "JIRA-12345"
  created_by        = "veera-bhadra"
  team              = "infrateam"
  owner             = "veera-bhadra"
}

#----------------
# Resource Group
#----------------
resource_group = {
  network = {
    name = "rg-network"
  },
}

#-----------------
# Virtual Network
#-----------------
virtual_network = {
  default = {
    name           = "vnet"
    resource_group = "network"
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

#------------------
# Private Dns Zone
#------------------
private_dns_zone = {
  sqlServer = {
    name           = "privatelink.database.windows.net"
    resource_group = "network"
    virtual_network_ids = [
      {
        name    = "dns-vnet-qoh-hub-jumpbox-cus-link"
        vnet_id = "/subscriptions/ba143abd-03c0-43fc-bb1f-5bf74803b418/resourceGroups/rg-qoh-hub-jumpbox-cus/providers/Microsoft.Network/virtualNetworks/vnet-qoh-hub-jumpbox-cus"
      }
    ]
  },
  blob = {
    name           = "privatelink.blob.core.windows.net"
    resource_group = "network"
    virtual_network_ids = [
      {
        name    = "dns-vnet-qoh-hub-jumpbox-cus-link"
        vnet_id = "/subscriptions/ba143abd-03c0-43fc-bb1f-5bf74803b418/resourceGroups/rg-qoh-hub-jumpbox-cus/providers/Microsoft.Network/virtualNetworks/vnet-qoh-hub-jumpbox-cus"
      }
    ]
  },
  vault = {
    name           = "privatelink.vaultcore.azure.net"
    resource_group = "network"
    virtual_network_ids = [
      {
        name    = "dns-vnet-qoh-hub-jumpbox-cus-link"
        vnet_id = "/subscriptions/ba143abd-03c0-43fc-bb1f-5bf74803b418/resourceGroups/rg-qoh-hub-jumpbox-cus/providers/Microsoft.Network/virtualNetworks/vnet-qoh-hub-jumpbox-cus"
      }
    ]
  },
  registry = {
    name           = "privatelink.azurecr.io"
    resource_group = "network"
    virtual_network_ids = [
      {
        name    = "dns-vnet-qoh-hub-jumpbox-cus-link"
        vnet_id = "/subscriptions/ba143abd-03c0-43fc-bb1f-5bf74803b418/resourceGroups/rg-qoh-hub-jumpbox-cus/providers/Microsoft.Network/virtualNetworks/vnet-qoh-hub-jumpbox-cus"
      }
    ]
  },
  dataFactory = {
    name           = "privatelink.datafactory.azure.net"
    resource_group = "network"
    virtual_network_ids = [
      {
        name    = "dns-vnet-qoh-hub-jumpbox-cus-link"
        vnet_id = "/subscriptions/ba143abd-03c0-43fc-bb1f-5bf74803b418/resourceGroups/rg-qoh-hub-jumpbox-cus/providers/Microsoft.Network/virtualNetworks/vnet-qoh-hub-jumpbox-cus"
      }
    ]
  },
  MongoDB = {
    name           = "privatelink.mongo.cosmos.azure.com"
    resource_group = "network"
    virtual_network_ids = [
      {
        name    = "dns-vnet-qoh-hub-jumpbox-cus-link"
        vnet_id = "/subscriptions/ba143abd-03c0-43fc-bb1f-5bf74803b418/resourceGroups/rg-qoh-hub-jumpbox-cus/providers/Microsoft.Network/virtualNetworks/vnet-qoh-hub-jumpbox-cus"
      }
    ]
  },
  Sql = {
    name           = "privatelink.documents.azure.com"
    resource_group = "network"
    virtual_network_ids = [
      {
        name    = "dns-vnet-qoh-hub-jumpbox-cus-link"
        vnet_id = "/subscriptions/ba143abd-03c0-43fc-bb1f-5bf74803b418/resourceGroups/rg-qoh-hub-jumpbox-cus/providers/Microsoft.Network/virtualNetworks/vnet-qoh-hub-jumpbox-cus"
      }
    ]
  },
}