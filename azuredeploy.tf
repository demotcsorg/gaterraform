resource "azurerm_resource_group" "example" {
  name     = "rgname"
  location = "westeurope"
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
