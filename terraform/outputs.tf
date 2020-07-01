
output "instance_ip_addr_master" {
  value       = aws_instance.master.public_ip
  description = "The private IP address of the main server instance."
}

