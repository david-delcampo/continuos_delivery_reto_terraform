resource "azure_hosted_service" "service" {
    name = "${var.resource_prefix}service" 
    location = "North Europe"
    ephemeral_contents = false
    description = "Service developed for app-smrz"
    label = "app-smrz-service"
}