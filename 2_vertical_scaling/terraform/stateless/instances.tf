# ec2 instances
resource "aws_instance" "ec2_server" {
  # latest Amazon Linux 2023 AMI
  ami           = data.aws_ami.amazon-linux-2023.id
  instance_type = "${var.ec2_instance_type}"

  vpc_security_group_ids      = [aws_security_group.default.id]
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true

  key_name = "${var.ec2_ssh_key_name}"

  iam_instance_profile = aws_iam_instance_profile.iam_profile_tf.name

  tags = {
    Name              = "${var.ec2_instance_name}"
    ansible_group_tag = "grs"
    Service           = "${var.service_name}"
  }
}
