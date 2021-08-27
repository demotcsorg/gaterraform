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

  name = "example"

  resource_group_name = azurerm_resource_group.example.name

  runtime = {
    name    = "dotnetcore"
    version = "2.2"
  }
}
