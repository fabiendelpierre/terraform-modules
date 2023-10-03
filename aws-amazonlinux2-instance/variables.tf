variable "arch" {
  type    = string
  default = "arm64"
}

variable "associate_public_ip_address" {
  type    = bool
  default = false
}

variable "iam_role_policy_arns" {
  type    = list(string)
  default = []
}

variable "instance_type" {
  type    = string
  default = "t4g.nano"
}

variable "key_pair_name" {
  type = string
}

variable "resource_name" {
  type = string
}

variable "root_block_device_size" {
  type    = number
  default = 8
}

variable "security_group_ids" {
  type    = list(string)
  default = []
}

variable "subnet_id" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "ubuntu_version" {
  type    = string
  default = "22"
}

variable "user_data_base64" {
  type    = string
  default = null
}
