variable "region" {
  description = "La région AWS utilisée"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Type d'instance EC2"
  default     = "t2.micro"
}
