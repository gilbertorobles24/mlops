# retreive ebs volume from stateful infrastructure
data "aws_ebs_volume" "stateful_volume" {
  most_recent = true

  filter {
    name   = "volume-type"
    values = ["gp3"]
  }

  filter {
    name   = "tag:Name"
    values = ["${var.stateful_volume_name}"]
  }
}

# attach volume to ephemeral ec2 instance
resource "aws_volume_attachment" "stateful" {
  device_name = "/dev/xvda"
  volume_id   = data.aws_ebs_volume.stateful_volume.id
  instance_id = aws_instance.ec2_server.id
}
