#!/bin/bash

set -e

RESOURCE_GROUP=$1
TEMPLATE_FILE=$2
PARAMETERS_FILE=$3

az deployment sub create \
  --name "deployment-$(date +%Y%m%d%H%M%S)" \
  --location eastus2 \
  --template-file $TEMPLATE_FILE \
  --parameters @$PARAMETERS_FILE \
  --resource-group $RESOURCE_GROUP
