---
title: Terraform Command Basics
description: Learn Terraform Commands like init, validate, plan, apply and destroy
---


- Understand basic Terraform Commands
1. terraform init
2. terraform validate
3. terraform plan
4. terraform apply
5. terraform destroy      


# Get Azure Regions
az account list-locations -o table

# Azure CLI Login
az login

# List Subscriptions
az account list

# Set Specific Subscription (if we have multiple subscriptions)
az account set --subscription="SUBSCRIPTION_ID"
```t
# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" # Optional but recommended in production
    }    
  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
# Create Resource Group 
resource "azurerm_resource_group" "my_demo_rg1" {
  location = "eastus"
  name = "my-demo-rg1"  
}
```

## Step-03: Terraform Core Commands
```t
# Terraform Initialize
terraform init

# Terraform Validate
terraform validate

# Terraform Plan to Verify what it is going to create / update / destroy
terraform plan

# Terraform Apply to Create Resources
terraform apply 
```


# Delete Terraform files 
rm -rf .terraform*
rm -rf terraform.tfstate*
```

