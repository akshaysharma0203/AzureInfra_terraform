provider "azurerm" {
 
   version = "=2.0.0"
   features {}

}

module "dev" {
  source = "./modules/environments/dev"
  environment = "dev"
}

