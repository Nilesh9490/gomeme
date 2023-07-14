#Security Group 
resource "aws_security_group" "sg" {
  vpc_id      = var.vpc_id
  name        = "${terraform.workspace}-ec2SecurityGroup"
  description = "security group that allows ssh connection"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "${terraform.workspace}-SecurityGroup"
  }
}


output "security_group_id" {
  value = aws_security_group.sg.id
}


resource "aws_key_pair" "ssh_key_name" {
  key_name   = "${terraform.workspace}-ssh_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}


resource "aws_instance" "jumphost-ec2" {
  ami = var.ami2                              
  instance_type = var.instance_type2
  subnet_id     = element(var.public_subnets, 0)
  key_name                    = aws_key_pair.ssh_key_name.key_name
  associate_public_ip_address = true
  security_groups             = [aws_security_group.sg.id]
   tags = {
      Name = "JumpHost"
  }
}

resource "aws_instance" "ec2" {
  count  = length(var.instance_names)
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = var.instance_type
  subnet_id     = element(var.private_subnets, 0)
  #key_name                    = aws_key_pair.ssh_key_name.key_name
  iam_instance_profile        = "${terraform.workspace}-ram_metrix_role"
  user_data = file("Script/install.sh")
  security_groups             = [aws_security_group.sg.id]
  # associate_public_ip_address = true

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = var.ebs_block_device_size
  }

  tags = {
    
    Name = "${terraform.workspace}-${var.instance_names[count.index]}"
  }
}
