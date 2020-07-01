
variable "profile" {
  default = "default"
}


variable "instance_type_master" {
  default = "t2.micro"
}

variable "region" {
  default = "us-east-1"
}


variable "image_id" {
  default     = "ami-085925f297f89fce1"
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
}


