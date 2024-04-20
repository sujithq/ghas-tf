resource "azurerm_resource_group" "this" {
  location = "westeurope"
  name     = "rg-ghas-tf"
  tags     = local.tags
}

resource "azurerm_network_security_group" "example" {
  name                = "nsg-ghas-tf"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  tags                = azurerm_resource_group.this.tags

  security_rule {
    name                       = "allow-all"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "1433" # Typically used for SQL Server
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
