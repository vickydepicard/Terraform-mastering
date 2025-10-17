output "instance_id" {
  value = aws_instance.lab_devopsakademy_server.id
}

output "public_ip" {
  value = aws_instance.lab_devopsakademy_server.public_ip
}
