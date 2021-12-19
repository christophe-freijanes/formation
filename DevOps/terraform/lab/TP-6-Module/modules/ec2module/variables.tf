variable "instancetype" {
  type        = string
  description = "Set aws instance type"
  default     = "t2.nano"
}
variable "sg_name" {
  type        = string
  description = "Set Security Group name"
  default     = "sg-freijac"
}
variable "aws_common_tag" {
  type        = map
  description = "Set aws tag"
  default = {
    Name = "ec2-freijac"
  }
}