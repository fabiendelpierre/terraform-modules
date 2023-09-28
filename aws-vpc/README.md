# Example usage

```
module "vpc" {
  source = "github.com/fabiendelpierre/terraform-modules.git//aws-vpc"

  vpc_cidr_block = "10.0.1.0/24"
  region         = "us-east-1"
  resource_name  = "foo"

  igw   = false
  natgw = false

  tags = {
    bar = "baz"
  }
}
```
