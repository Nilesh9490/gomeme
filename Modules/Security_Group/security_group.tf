#Security Group 
resource "aws_security_group" "sg" {
  vpc_id      = var.vpc_id
  name        = "${terraform.workspace}-SecurityGroup"
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

