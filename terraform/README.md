# Terraform - Despliegue de VM Linux en Azure (Infonavit QA)

Este directorio contiene la configuración de Terraform para desplegar una máquina virtual Linux (Ubuntu LTS) en Azure para el entorno de QA de Infonavit.

## Requisitos Previos

1. **Terraform instalado**: Versión 1.0 o superior
   ```bash
   terraform version
   ```

2. **Azure CLI instalado y autenticado**:
   ```bash
   az login
   ```

3. **Clave SSH pública**: Por defecto se usa `~/.ssh/id_rsa.pub`
   - Si no tienes una, créala con: `ssh-keygen -t rsa -b 4096`

## Recursos Desplegados

- **Resource Group**: `infonavit-qa` en la región `eastus2`
- **Virtual Network**: Red virtual con subnet
- **Public IP**: IP pública estática para la VM
- **Network Security Group**: Grupo de seguridad con puerto 22 (SSH) abierto
- **Network Interface**: Interfaz de red asociada a la VM
- **Linux Virtual Machine**: Ubuntu 22.04 LTS con autenticación por SSH

## Uso

### 1. Inicializar Terraform

```bash
cd terraform
terraform init
```

Este comando descarga los proveedores necesarios (Azure) y prepara el directorio de trabajo.

### 2. Revisar el Plan de Despliegue

```bash
terraform plan
```

Este comando muestra los recursos que se crearán sin aplicar cambios reales.

### 3. Aplicar la Configuración

```bash
terraform apply
```

Se te pedirá confirmación antes de crear los recursos. Escribe `yes` para continuar.

### 4. Conectarse a la VM

Una vez completado el despliegue, verás la IP pública de la VM en los outputs:

```bash
ssh azureuser@<IP_PUBLICA>
```

O usa el string de conexión mostrado en el output `ssh_connection_string`.

## Variables Personalizables

Puedes personalizar las variables en el archivo `variables.tf` o pasarlas al ejecutar:

```bash
terraform apply -var="vm_size=Standard_B4ms" -var="admin_username=miusuario"
```

Variables disponibles:
- `resource_group_name`: Nombre del grupo de recursos (default: `infonavit-qa`)
- `location`: Región de Azure (default: `eastus2`)
- `vm_size`: Tamaño de la VM (default: `Standard_B2s`)
- `admin_username`: Usuario administrador (default: `azureuser`)
- `ssh_public_key_path`: Ruta a la clave pública SSH (default: `~/.ssh/id_rsa.pub`)

## Outputs

Después del despliegue, se mostrarán:
- `public_ip_address`: Dirección IP pública de la VM
- `vm_name`: Nombre de la máquina virtual
- `resource_group_name`: Nombre del grupo de recursos
- `ssh_connection_string`: Comando SSH completo para conectarse

## Destruir Recursos

Para eliminar todos los recursos creados:

```bash
terraform destroy
```

**⚠️ ADVERTENCIA**: Este comando eliminará permanentemente todos los recursos.

## Notas de Seguridad

- La VM solo permite autenticación por SSH (sin contraseñas)
- El NSG permite conexiones SSH desde cualquier IP (0.0.0.0/0)
- En producción, considera restringir el acceso SSH a IPs específicas
- No se incluyen secretos ni contraseñas en este código

## Estructura de Archivos

- `main.tf`: Configuración principal de recursos
- `variables.tf`: Definición de variables
- `outputs.tf`: Valores de salida después del despliegue
- `README.md`: Este archivo
