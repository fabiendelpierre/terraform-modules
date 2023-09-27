variable "vpc_cidr_block" {
  type        = string
  description = "Should be a size /23 at minimum"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "resource_name" {
  type = string
}

variable "deactivate" {
  type        = bool
  default     = false
  description = "Set to true to destroy resources that cost money (the NAT gateway and the Elastic IP attached to it)"
}

variable "tags" {
  type    = map(string)
  default = {}
}
