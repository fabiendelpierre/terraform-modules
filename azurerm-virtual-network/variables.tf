variable "vnet_cidr_block" {
  type        = string
  description = "Should be a size /23 at minimum"
}

variable "location" {
  type    = string
  default = "us-east-1"
}

variable "resource_group_name" {
  type = string
}

variable "resource_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
