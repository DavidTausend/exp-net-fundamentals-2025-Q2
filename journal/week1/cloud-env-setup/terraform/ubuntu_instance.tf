resource "aws_network_interface" "ubuntu_private_eni" {
  subnet_id       = aws_subnet.public.id
  private_ips     = ["10.200.123.10"]
  security_groups = [aws_security_group.allow_login.id]

  tags = {
    Name = "ubuntu-private-eni"
  }
}

resource "aws_instance" "ubuntu" {
  ami           = "ami-014dd8ec7f09293e6"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.nwbootcamp_pem.key_name

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.ubuntu_private_eni.id
  }

  root_block_device {
    volume_size = 12
    volume_type = "gp3"
  }

  tags = {
    Name = "ubuntu-test-server"
  }
}