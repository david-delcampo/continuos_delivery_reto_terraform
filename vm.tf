resource "azure_instance" "vm" {
    name = "${var.resource_prefix}vm" 
    hosted_service_name = "${azure_hosted_service.service.name}"
    image = "Ubuntu Server 12.04.5 LTS"
    size = "Basic_A0"
    storage_service_name = "${azure_storage_service.storage.name}"
    location = "North Europe"
    username = "smrzuser"
    password = "${var.user_smrz_password}"

    endpoint {
        name = "SSH"
        protocol = "tcp"
        public_port = "${var.port_ssh}"
        private_port = 22
    }

    endpoint {
        name = "HTTPS"
        protocol = "tcp"
        public_port = "${var.port_https}"
        private_port = 443
    }
   
    provisioner "file" {
        source = "bundle.tar.gz"
        destination = "/home/${azure_instance.vm.username}/bundle.tar.gz"
        connection {
            user = "${azure_instance.vm.username}"
            password = "${azure_instance.vm.password}"
            port = "${var.port_ssh}"
        }
    }    
    
    provisioner "remote-exec" {
        inline = [
          "tar -xvf /home/${azure_instance.vm.username}/bundle.tar.gz", 
          "cd /home/${azure_instance.vm.username}/deploy/",  
          "chmod u+x ./dms.sh",
          "sudo ./dms.sh"
        ]
        connection {
          user = "${azure_instance.vm.username}"
          password = "${azure_instance.vm.password}"
          port = "${var.port_ssh}"
        }      
    }
}