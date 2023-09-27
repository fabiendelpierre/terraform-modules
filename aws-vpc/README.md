# Example usage

```
module "vpc" {
  source = "<path-to-this-module>"

  vpc_cidr_block = "10.0.1.0/24"
  region         = "us-east-1"
  resource_name  = "foo"

  tags = {
    bar = "baz"
  }
}
```
