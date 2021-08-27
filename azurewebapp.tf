resource "azurerm_resource_group" "example" {
  name     = "rgdemo"
  location = "eastus"
}

module "web_app" {
  source = "innovationnorway/web-app/azurerm"

  name = "exampleforTF"

  resource_group_name = azurerm_resource_group.example.name

  runtime = {
    name    = "dotnetcore"
    version = "2.2"
  }
}
