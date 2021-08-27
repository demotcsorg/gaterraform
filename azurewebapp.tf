resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "westeurope"
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
