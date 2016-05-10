# Configure the Azure Provider
provider "azure" {
  publish_settings = "${file(var.azure_settings_file)}"
}
