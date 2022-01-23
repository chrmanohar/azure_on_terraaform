# Terraform Setting block
terraform {
    required_version = ">1.0.0"
    required_providers{
        azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" # Optional but recommended in production
    }   
    }
}

# Configure the Microsoft Azure provider

provider "azurerm"{
    features {}
}

# Create Resource Group
resource "azurerm_resource_group" "my_rg1"{
    location = "eastus"
    name = "my_rg"
}