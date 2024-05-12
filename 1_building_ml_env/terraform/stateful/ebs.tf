# retrieve snapshot to make volume
data "aws_ebs_snapshot" "stateful_ebs_snapshot" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "volume-size"
    values = ["8"]
  }

  filter {
    name   = "tag:Name"
    values = ["${var.stateful_ebs_snapshot_name}"] # snapshot manually created from ec2 instance volume
  }
}

# make volume from snapshot
resource "aws_ebs_volume" "stateful_ebs" {
  availability_zone = "us-west-2a"
  snapshot_id       = data.aws_ebs_snapshot.stateful_ebs_snapshot.id
  size              = 8
  type              = "gp3"

  tags = {
    Name = "mlopsenv_stateful_ebs"
  }
}
