resource "azurerm_resource_group" "example" {
  name     = "rgname"
  location = "eastus"
}

module "web_app" {
  source = "innovationnorway/web-app/azurerm"

  name = "exampleforTF"

  resource_group_name = "rgdemo"

  runtime = {
    name    = "dotnetcore"
    version = "2.2"
  }
}
