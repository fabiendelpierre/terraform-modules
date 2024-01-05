# Example usage

```
module "vnet" {
  source = "github.com/fabiendelpierre/terraform-modules.git//azurerm-virtual-network"

  resource_group_name = "my-resource-group"
  location            = "East US"

  resource_name   = "bobby-mc-networks"
  vnet_cidr_block = "10.0.0.0/23"

  tags = {}
}
```
