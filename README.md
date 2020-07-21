# AzureInfra_terraform

This repository consists of code which is used to create the infra on Azure using Terraform.
It uses some of the  important concepts of Terraform. We will discuss all these concepets one by one. Before that we will look into the infra architecture which is being created by this code.





# Terraform Concepts
1. Using one module's output variable as input variable in another module. Refer: variable resource_group_name (module resourcegroup) as input in virtualnet module (vnet).
  ==>   regname = "${module.resource_group.resource_group_name}"
2. Using for_each

3. Using Locals, flatten function and for_each together to access complex data structure like map of objects : map(objects) or map of list maps: map(list(map))
   ==> It is complex to figure out the way how a variable can be used to create multiple subnets using a single subnet resource definition.
  ```
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
  ```
4. using count() and split() function
