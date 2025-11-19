# Default VPC
data "aws_vpc" "default" {
  default = true
}

# Key Pair
resource "aws_key_pair" "my_key" {
  key_name   = "terra-key-ec2"
  public_key = file("terra-key-ec2.pub")
}

# Security Group
resource "aws_security_group" "my_security_group" {
  name        = "automation-sg"
  description = "Allow SSH, HTTP inbound and all outbound traffic"
  vpc_id      = data.aws_vpc.default.id

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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
 }
}

# EC2 Instance
resource "aws_instance" "my_instance" {
  ami                    = "ami-02b8269d5e85954ef"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  user_data              = file("install_nginx.sh")

  root_block_device {
    volume_size = 15
    volume_type = "gp3" 
 }

  tags = {
    Name = "HelloWorld"
  }
}
