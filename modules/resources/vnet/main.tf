resource "azurerm_virtual_network" "httpd_vnet" {
  resource_group_name = var.regname
  location = var.vnet_location
  for_each = var.system_networks
  name = "${each.value.vnetname}-${var.environment}-${var.vnet_location}"
  address_space = [each.value.vnetrange]
}

locals {
   network_subnets = flatten([
     for resource in keys(var.system_subnets) : [
        for subnet in var.system_subnets[resource] : {
	  resource = resource
	  snetname = subnet.snetname
	  snetrange = subnet.snetrange
	}
      ]
   ])

subnets_map = {
    for s in local.network_subnets: "${s.resource}:${s.snetname}" => s
  }

}


resource "azurerm_subnet" "subnet" {
  resource_group_name =  var.regname
  for_each = local.subnets_map
  virtual_network_name =  "${split(":",each.key)[0]}-${var.environment}-${var.vnet_location}"
  name = each.value.snetname
  address_prefix = each.value.snetrange
  
}


