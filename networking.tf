# Create a Recource Group 
resource "azurerm_resource_group" "test6" {
  name     = "test6"
  location = "west europe"
}

# Create a Vnet
resource "azurerm_virtual_network" "testnetwork" {
   name                = "testnetwork"
   address_space       = ["10.0.0.0/16"]
   resource_group_name = azurerm_resource_group.test6.name
   location            = azurerm_resource_group.test6.location
 }
 
 # Create First Subnet
resource "azurerm_subnet" "testsub" {
   name                 = "testsub"
   resource_group_name  = azurerm_resource_group.test6.name
   virtual_network_name = azurerm_virtual_network.testnetwork.name
   address_prefixes     = ["10.0.1.0/24"]
 }
 # Create second Subnet
 resource "azurerm_subnet" "testsub2" {
   name                 = "testsub2"
   resource_group_name  = azurerm_resource_group.test6.name
   virtual_network_name = azurerm_virtual_network.testnetwork.name
   address_prefixes     = ["10.0.2.0/24"]
 }
 