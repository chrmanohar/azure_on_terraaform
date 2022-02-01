# Step-1 Resource group
resource "azurerm_resource_group" "resourcegroup" {
  name     = "myrg"
  location = "East US"
}

# Step-2 Create vertuval network

resource "azurerm_virtual_network" "myvn" {
  name                = "myvnt"
  address_space       = ["10.152.0.0/16"]
  location            = azurerm_resource_group.resourcegroup.location
  resource_group_name = azurerm_resource_group.resourcegroup.name
}
# Step-3 Create Subnets
resource "azurerm_subnet" "mysubnet" {
  name                 = "my-subnet-1"
  virtual_network_name = azurerm_virtual_network.myvn.name
  resource_group_name  = azurerm_resource_group.resourcegroup.name
  address_prefixes     = ["10.152.0.0/24"]

}

# step-4 Create public IPs
resource "azurerm_public_ip" "mypublicip" {
  name                = "publicip-1"
  resource_group_name = azurerm_resource_group.resourcegroup.name
  location            = azurerm_resource_group.resourcegroup.location
  allocation_method   = "Static"
  domain_name_label   = "app-${random_string.random.id}"
}

# Step-5 Create Network Interface
resource "azurerm_network_interface" "networkif" {
  name                = "mymetwork"
  location            = azurerm_resource_group.resourcegroup.location
  resource_group_name = azurerm_resource_group.resourcegroup.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mypublicip.id
  }

}
