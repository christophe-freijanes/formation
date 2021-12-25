variable "instance_type" {
  type        = string
  description = "Set aws instance type"
  default     = "t2.nano"
}
variable "key_name" {
  type        = string
  description = "Set key name"
  default = "devops-freijac"
}
variable "aws_common_tag" {
  type        = map
  description = "Set aws tag"
  default = {
    Name = "ec2-freijac"
  }
}
variable "security_group_name" {
  type        = string
  description = "Set Security group name"
}
variable "ssh_key_path" {
  type        = string
  description = "Set ssh key path"
  default = "./devops-freijac.pem"
}
variable "product" {
  type        = string
  description = "Set product"
  default     = "app"
}
variable "environment" {
  type        = string
  description = "Set env"
  default     = "dev"
}
variable "zone" {
  type        = string
  description = "Set availability zone"
  default     = "us-east-1b"
}