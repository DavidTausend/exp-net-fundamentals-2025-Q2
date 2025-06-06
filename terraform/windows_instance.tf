# Your IP for RDP access
data "http" "my_ip" {
  url = "https://checkip.amazonaws.com"
}

resource "aws_security_group" "allow_login" {
  name        = "allow-login"
  description = "Allow RDP + internal VPC access"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow RDP from my IP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.my_ip.response_body)}/32"]
  }

  ingress {
    description = "Allow all traffic within VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.200.123.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-login"
  }
}

resource "aws_instance" "windows" {
  ami           = "ami-05e885aafb1fdb4dd"
  instance_type = "t3.micro"
  key_name      = aws_key_pair.nwbootcamp_pem.key_name

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.public_eni.id
  }

  network_interface {
    device_index         = 1
    network_interface_id = aws_network_interface.private_nic.id
  }

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  tags = {
    Name = "win2025-instance"
  }

  depends_on = [
    aws_eip_association.windows_eip_assoc
  ]
}