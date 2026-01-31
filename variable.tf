variable "aws_instance" {
  type        = string
  description = "Name of the AWS instance"
  default     = "aws_instance_test"
}

variable "aws_instance_type" {
  type        = string
  description = "Type of the AWS instance"
  default     = "t3.micro"
  
}

variable "aws_count" {
  type        = number
  description = "Number of AWS instances to create"
  default     = 3
  
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the AWS instance"
  default     = "ami-087d1c9a513324697"
  
}

variable "ubuntu_key" {
  type        = string
  description = "Name of the Ubuntu key pair"
  default     = "ubuntu"
}

variable "volume_size" {
    type        = number
    description = "Size of the root volume in GB"
    default     = 50
  
}

variable "volume_type" {
    type        = string
    description = "Type of the root volume"
    default     = "gp3"
  
}
