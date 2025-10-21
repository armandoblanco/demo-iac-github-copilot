# Terraform Configuration for Azure Linux VM

This Terraform configuration deploys a Linux virtual machine (Ubuntu LTS) on Azure with SSH access.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed (version ~> 3.0)
- Azure subscription and credentials configured
- SSH key pair generated (default location: `~/.ssh/id_rsa.pub`)

## Azure Authentication

Before running Terraform, authenticate with Azure using one of the following methods:

### Azure CLI (Recommended)
```bash
az login
```

### Service Principal
```bash
export ARM_CLIENT_ID="<service-principal-app-id>"
export ARM_CLIENT_SECRET="<service-principal-password>"
export ARM_SUBSCRIPTION_ID="<subscription-id>"
export ARM_TENANT_ID="<tenant-id>"
```

## Resources Created

This configuration creates the following Azure resources:

- Resource Group: `infonavit-qa` (eastus2)
- Virtual Network and Subnet
- Public IP Address
- Network Security Group (SSH port 22 open)
- Network Interface
- Linux Virtual Machine (Ubuntu 22.04 LTS)

## Usage

### 1. Initialize Terraform

Navigate to the terraform directory and initialize:

```bash
cd terraform
terraform init
```

### 2. Review the Deployment Plan

Preview the resources that will be created:

```bash
terraform plan
```

### 3. Apply the Configuration

Deploy the infrastructure:

```bash
terraform apply
```

Type `yes` when prompted to confirm the deployment.

### 4. Get the Public IP

After deployment, Terraform will output the public IP address:

```bash
terraform output public_ip_address
```

### 5. Connect via SSH

Use the provided SSH connection string:

```bash
ssh azureuser@<public-ip-address>
```

Or use the output:

```bash
terraform output ssh_connection_string
```

## Configuration Variables

You can customize the deployment by modifying variables in `variables.tf` or by passing them via command line:

```bash
terraform apply -var="vm_size=Standard_D2s_v3" -var="admin_username=myuser"
```

Available variables:

- `resource_group_name`: Name of the resource group (default: `infonavit-qa`)
- `location`: Azure region (default: `eastus2`)
- `vm_size`: VM size (default: `Standard_B2s`)
- `admin_username`: Admin username (default: `azureuser`)
- `ssh_public_key_path`: Path to SSH public key (default: `~/.ssh/id_rsa.pub`)

## Security

- Only SSH (port 22) is open in the Network Security Group
- Password authentication is disabled; only SSH key authentication is allowed
- No secrets or passwords are stored in the configuration

## Cleanup

To destroy all resources created by this configuration:

```bash
terraform destroy
```

Type `yes` when prompted to confirm the destruction.
