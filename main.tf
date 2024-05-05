provider "azurerm" {
  features {}
}

resource "azurerm_shared_image_gallery" "this" {
  name                = "Windows-gallery-image"
  resource_group_name = "shadab-rg"
  location            = "East US"
  description         = "Windows Gallery"
}

resource "azurerm_gallery_image" "this" {
  name                = "packer-ubuntu22-dev"
  resource_group_name = "shadab-rg"
  gallery_name        = azurerm_gallery.this.name
  location            = "East US"
  description         = "Windows Image"
}
