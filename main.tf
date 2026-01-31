/* ------------------------------------
   data veriable use Configuration
   ----------------------------------*/

data "aws_vpc" "vpc" {
    default = true
  }

data "aws_subnet" "subnet" {
  vpc_id            = data.aws_vpc.vpc.id
  availability_zone = "ap-south-1a"
}

data "aws_key_pair" "ubuntu_key" {
  key_name = var.ubuntu_key
}

# resource "tls_private_key" "name" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "aws_key_pair" "ubuntu_key" {
#   key_name   = "ubuntu-key"
#   public_key = tls_private_key.name.public_key_openssh
#   }

# resource "local_file" "private_key" {
#   content  = tls_private_key.name.private_key_pem
#   filename = "ubuntu-key.pem"
# }

/* ------------------------------------
   Create EC2 Instance
   ----------------------------------*/

resource "aws_instance" "ubuntu" {
  count = var.aws_count
  ami           = var.ami_id
  instance_type = var.aws_instance_type
  key_name      = var.ubuntu_key
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = {
    Name = "ubunut_instance_${count.index + 1}"
  }
}

/* ------------------------------------
   Attach EBS Volume to EC2 Instance 
   ----------------------------------*/

resource "aws_ebs_volume" "aws_ebs_volume" {
  availability_zone = aws_instance.ubuntu[count.index].availability_zone
  count             = var.aws_count
  size              = 10
  type              = "gp3"
}


resource "aws_volume_attachment" "ebs_att" {
  count = var.aws_count
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.aws_ebs_volume[count.index].id
  instance_id = aws_instance.ubuntu[count.index].id
}

