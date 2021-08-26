#backend
terraform {
  backend "azurerm" {
    resource_group_name  = "rgname"
    storage_account_name = "storageaccoutnisarg"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
