# ssh key
resource "aws_key_pair" "dev_key" {
  key_name   = "mlopsenv_dev_key"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "local_dev_key" {
  content         = tls_private_key.rsa.private_key_pem
  filename        = "../ansible/mlopsenv_dev_key.pem"
  file_permission = "600"
}
