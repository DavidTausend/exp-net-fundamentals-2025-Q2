# PEM Key (OpenSSH / .pem)
resource "tls_private_key" "nwbootcamp_pem" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "nwbootcamp_pem" {
  key_name   = "nwbootcampkey-pem"
  public_key = tls_private_key.nwbootcamp_pem.public_key_openssh

  tags = {
    Name = "nwbootcampkey-pem"
  }
}

resource "local_file" "pem_private_key" {
  content         = tls_private_key.nwbootcamp_pem.private_key_pem
  filename        = "${path.module}/nwbootcampkey-pem.pem"
  file_permission = "0600"
}

# PPK Key (for PuTTY)
resource "tls_private_key" "nwbootcamp_ppk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "nwbootcamp_ppk" {
  key_name   = "nwbootcampkey-ppk"
  public_key = tls_private_key.nwbootcamp_ppk.public_key_openssh

  tags = {
    Name = "nwbootcampkey-ppk"
  }
}

resource "local_file" "ppk_private_key_raw" {
  content         = tls_private_key.nwbootcamp_ppk.private_key_pem
  filename        = "${path.module}/nwbootcampkey-ppk-raw.pem"
  file_permission = "0600"
}