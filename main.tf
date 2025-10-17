provider "aws" {
  region = var.region
}

resource "aws_instance" "lab_devopsakademy_server" {
  ami           = "ami-0360c520857e3138f"
  instance_type = var.instance_type

  tags = {
    Name = "lab_devopsakademy_server"
  }
}
