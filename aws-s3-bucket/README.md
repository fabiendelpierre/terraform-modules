# Example usage

```
module "s3" {
  source = "github.com/fabiendelpierre/terraform-modules.git//aws-s3-bucket"

  bucket_name = "foo"

  tags = {
    bar = "baz"
  }
}
```
