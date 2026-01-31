output "aws_instance_public_ip" {
    description = "The AWS instance public IP"
    value       = aws_instance.ubuntu.*.public_ip
  
}
