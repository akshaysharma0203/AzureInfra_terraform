module "resource_group" {
  source = "../../resources/resourcegroup"
  regname = "${var.rgname}"
  reglocation = "${var.rglocation}"
  environment = "${var.environment}"
}

module "vnet" {
  source = "../../resources/vnet"
  environment = var.environment
  vnet_name = "${var.name_of_vnet}"
  vnet_count = "${var.number_of_vnet}"
  subnet_count = "${var.number_of_subnet}"
  vnet_location = "${var.rglocation}"
  vnet_address_space = "${var.vnet_address_range}"
  regname = "${module.resource_group.resource_group_name}"
  subnet_address_space = "${var.subnet_address_range}"
  system_networks = "${var.networks}"
  system_subnets = "${var.subnets}"
 # subnet_key = "${var.subnetkey}"
}
