# terraform {
#   required_providers {
#     azurerm = {
#       source = "hashicorp/azurerm"
#       version = "3.102.0"
#     }
#   }
# }


# provider "azurerm" {
#     features {}
# }

# # Create a resource group
# resource "azurerm_resource_group" "packer" {
#     name     = "shadab-rg"
#     location = "East US"
# }

# # Create a VM image gallery
# resource "azurerm_image_gallery" "gallery" {
#     name                = "packer_gallery"
#     resource_group_name = azurerm_resource_group.packer.name
#     location            = azurerm_resource_group.packer.location
#     description         = "Gallery of Packer images"
# }



locals {
  integrate_env = var.config.env == "dev" ? { "this" : true } : {}
  example_map = {
    key1 = lookup(var.config,"dev",{}) ? { value = "data1", keu = { key = "1" } } : { value = "data1", keu = { key = "1" } }
    key2 = {}
    key3 = {}
  }
  filtered_map = { for k, v in local.example_map : k => v if length(v) > 0 }
}

variable "config" {
}
output "filtered_map_output" {
  value = local.filtered_map
}
