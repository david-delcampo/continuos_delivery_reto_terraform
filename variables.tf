variable "azure_settings_file" { 
  description = "The settings file available from https://manage.windowsazure.com/publishsettings"  
}

variable "resource_prefix" { 
  description = "Prefix to be added to the resources"
  default = "smrz"
}

variable "user_smrz_password" { 
  description = "The password for the smrzuser"  
}

variable "port_ssh" { 
  description = "Port number for external public access using ssh"  
  default = 7310
}

variable "port_https" { 
  description = "Port number for external public access using https"  
  default = 7610
}