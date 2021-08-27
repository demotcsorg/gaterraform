provider "azurerm" {
  version = "=2.0.0"
  features {}
}

#backend
terraform {
  backend "azurerm" {
    resource_group_name  = "rgname"
    storage_account_name = "storageaccoutnisarg"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}



resource "azurerm_resource_group" "example" {
  name     = "rgname"
  location = "uksouth"
}

module "web_app" {
  source = "innovationnorway/web-app/azurerm"

  name = "exampleforTFdotnet"

  resource_group_name = azurerm_resource_group.example.name

  runtime = {
    name    = "dotnetcore"
    version = "2.2"
  }
  
  plan = {
    sku_size = "B1"
  }
}
