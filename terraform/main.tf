provider "aws" {
  region = var.region
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file("~/.ssh/mykey.pub")
}

resource "aws_security_group" "allow_http_custom" {
  name        = "${var.project_name}-sg"
  description = "Allow HTTP and custom ports"

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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

resource "aws_instance" "app" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  security_groups        = [aws_security_group.allow_http_custom.name]
  associate_public_ip_address = true

  user_data              = file("user_data.sh")

  tags = {
    Name = var.project_name
  }

  provisioner "file" {
    source      = "../dockerproject"
    destination = "/home/ec2-user/"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/mykey")
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "cd /home/ec2-user/dockerproject",
      "docker-compose up -d"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/mykey")
      host        = self.public_ip
    }
  }
}
