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
variable "details" {
  type        = string
  description = "Set details security group"
  default     = "Allow ssh http and https traffic"
}