
# provider "azurerm" {
#     features {}
# }

# # Create a resource group
# resource "azurerm_resource_group" "packer" {
#     name     = "ETN-ES-EAS-DEVSECOPS-PACKER"
#     location = "East US"
# }

# # Create a VM image gallery
# resource "azurerm_image_gallery" "gallery" {
#     name                = "packer_gallery"
#     resource_group_name = azurerm_resource_group.packer.name
#     location            = azurerm_resource_group.packer.location
#     description         = "Gallery of Packer images"
# }

# # Create a VM image definitions
# resource "azurerm_shared_image" "windows-2022" {
#     # confidential_vm_enabled = ""
#     # accelerated_network_support_enabled = ""
#     # architecture = ""
#     # confidential_vm_supported = ""
#     # disk_types_not_allowed = ""
#     # eula = ""
#     # max_recommended_memory_in_gb = ""
#     # specialized = ""
#     # max_recommended_vcpu_count = ""
#     # min_recommended_vcpu_count = ""
#     # min_recommended_memory_in_gb = ""
#     # privacy_statement_uri = ""
#     # trusted_launch_supported = ""
#     # trusted_launch_enabled = ""
#     # end_of_life_date = ""
#     # id = ""
#     # provider = try(azurerm,null)
#     name                = "WindowsTest1"
#     resource_group_name = azurerm_resource_group.packer.name
#     location            = azurerm_resource_group.packer.location
#     gallery_name        = azurerm_image_gallery.gallery.name
#     description         = "VM image definition"
#     os_type             = "Windows"
#     os_state            = "Generalized"
#     publisher           = "MicrosoftWindowsServer"
#     offer               = "WindowsServer"
#     sku                 = "2022-Datacenter"
#     hyper_v_generation  = "v1"
# }
variable "example_map" {
  type = map(any)
  default = {
    key1 = { value = "data1" }
    key2 = { }
    key3 = {}
  }
}

locals {
  filtered_map = { for k, v in var.example_map : k => v if length(compact([for _, value in v : value])) > 0 }
}

output "filtered_map_output" {
  value = local.filtered_map
}
