variable "zone" {
  type        = string
  description = "Set availability zone"
  default     = "us-east-1b"
}
variable "ebs_size" {
  type        = number
  description = "Set size volume"
  default = 10
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