resource "aws_security_group" "terra-sg" {
  name = "terra-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
  }
}

resource "aws_instance" "ec2" {
  ami                    = var.amis["aws"]
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.terra-sg.id]
  tags = {
    Name = "aws-ec2-instance"
  }
  lifecycle {
    ignore_changes = [tags]
  }
}