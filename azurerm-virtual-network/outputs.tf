output "vnet" {
  value = {
    id   = azurerm_virtual_network.main.id
    name = azurerm_virtual_network.main.name
  }
}

output "private_subnet" {
  value = {
    id       = azurerm_subnet.private.id
    name     = azurerm_subnet.private.name
    nsg_id   = azurerm_network_security_group.private.id
    nsg_name = azurerm_network_security_group.private.name
  }
}

output "public_subnet" {
  value = {
    id       = azurerm_subnet.public.id
    name     = azurerm_subnet.public.name
    nsg_id   = azurerm_network_security_group.public.id
    nsg_name = azurerm_network_security_group.public.name
  }
}
