resource "aws_instance" "example" {
  ami           = "ami-ff"  # Amazon Linux 2 AMI for us-east-1
  instance_type = "t2.micro"

  tags = {
            Name = "ExampleInstance"
  }


            vpc_security_group_ids = [aws_security_group.allow_ssh.id]
}


resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Be cautious, opens SSH to the world
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

