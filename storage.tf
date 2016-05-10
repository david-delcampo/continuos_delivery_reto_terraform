resource "azure_storage_service" "storage" {
    name = "${var.resource_prefix}storage" 
    location = "North Europe"
    description = "Storage to keep the Vhd for vm"
    account_type = "Standard_LRS"
}
