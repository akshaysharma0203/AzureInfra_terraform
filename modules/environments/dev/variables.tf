variable "environment" {}
#variable "subnetkey" {}
variable "rgname" {
   type = string
   default = "rg"
   description = "name of the dev/prod/qa resource group"
}

variable "rglocation" {
   type = string
   default = "eastus"
   description = "resource group location"
}

variable "number_of_vnet" {
   type = string
   default = 1
   description = "number of vnets need to be created"
}

variable "number_of_subnet" {
   type =  string
   default = 3
   description = "number of subnets required in each vnet"
}

variable "name_of_vnet" {
    type  = string
    default = "learn_azure_vnet"
    description = "name of the virtual network"
}

variable "vnet_address_range" {
    type = list
    default = ["192.168.0.0./16","192.169.0.0/16"]
    description = "vnet address range"
}

variable "subnet_address_range" {
   type = map
   default = {
      1 = "192.168.173.0/24"
      2 = "192.168.174.0/24" 
      3 = "192.168.175.0/24"
   }
   description = "subnet ranges"
}

variable "networks" {
  type = map(object({
    vnetname = string
    vnetrange = string })
    )
  default = {
      httpd = {
         vnetname = "virNet1",
	 vnetrange = "192.168.0.0/16"
      },
      http = {
         vnetname = "virNet2",
	 vnetrange = "192.169.0.0/16"
      }
  }
}

variable "subnets" {
  default = {
    virNet1 = [
	    {
	      snetname = "sNet1"
	      snetrange = "192.168.173.0/24"
	    },
	    {
	      snetname = "sNet2"
	      snetrange = "192.168.174.0/24"
	    }
	 ],
     virNet2 = [
	   {
	     snetname = "sNet1"
	     snetrange = "192.169.175.0/24"
	   }
	 ]
    }
}


