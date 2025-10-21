variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "infonavit-qa"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "eastus2"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key file"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
