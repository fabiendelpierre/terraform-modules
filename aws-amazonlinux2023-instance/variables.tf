variable "arch" {
  type    = string
  default = "arm64"
  description = "Choose an AMI for AMD64 (x86_64) or ARM64 (aarch64) architecture"
}

variable "associate_public_ip_address" {
  type    = bool
  default = false
  description = "Associate a public IP address with the instance (required for instances in a public subnet)"
}

variable "iam_role_policy_arns" {
  type    = list(string)
  default = []
  description = "A list of IAM policy ARNs to attach to the instance role"
}

variable "instance_type" {
  type    = string
  default = "t4g.nano"
  description = "The instance type to use"
}

variable "key_pair_name" {
  type    = string
  default = null
  description = "The name of the key pair to use for the instance -- required for SSH access"
}

variable "resource_name" {
  type = string
  description = "Value to use for the instance's Name tag"
}

variable "root_block_device_size" {
  type    = number
  default = 8
  description = "The size of the root block device in GB"
}

variable "security_group_ids" {
  type    = list(string)
  default = []
  description = "A list of pre-existing security group IDs to attach to the instance"
}

variable "subnet_id" {
  type = string
  description = "The ID of the subnet in which to launch the instance"
}

variable "tags" {
  type    = map(string)
  default = {}
  description = "A map of tags to apply to the instance and associated resources"
}

variable "user_data_base64" {
  type    = string
  default = null
  description = "value to use for the instance's user data"
}

variable "register_with_session_manager" {
  type        = bool
  default     = false
  description = "Whether to register the instance with AWS Systems Manager Session Manager"
}
