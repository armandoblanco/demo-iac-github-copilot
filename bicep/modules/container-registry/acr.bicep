targetScope = 'resourceGroup'

param acrName string
param sku string
param location string
param tags object = {}

resource acr 'Microsoft.ContainerRegistry/registries@2023-01-01-preview' = {
  name: acrName
  location: location
  sku: {
    name: sku
  }
  tags: tags
}
