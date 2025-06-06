resource "aws_network_interface" "public_eni" {
  subnet_id       = aws_subnet.public.id
  security_groups = [aws_security_group.allow_login.id]

  tags = {
    Name = "windows-server-public-nic"
  }
}

resource "aws_network_interface" "private_nic" {
  subnet_id       = aws_subnet.private.id
  security_groups = [aws_security_group.allow_login.id]

  tags = {
    Name = "windows-server-private-nic"
  }
}

resource "aws_eip" "windows_eip" {
  domain = "vpc"

  tags = {
    Name = "windows-eip"
  }
}

resource "aws_eip_association" "windows_eip_assoc" {
  allocation_id        = aws_eip.windows_eip.id
  network_interface_id = aws_network_interface.public_eni.id
}

