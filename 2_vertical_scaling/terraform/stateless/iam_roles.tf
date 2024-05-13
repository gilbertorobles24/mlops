######### EC2 TO S3 IAM ROLE #########
# Define an IAM role for EC2 instance to access AWS services.
resource "aws_iam_role" "ec2_iam_role_tf" {
  # Specify the name of the IAM role.
  name = "${var.ec2_iam_role_name}"

  # Define the trust policy allowing EC2 instances to assume this role.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

# Define an IAM policy granting permissions required for MLOps environment.
resource "aws_iam_policy" "iam_access_policy_tf" {
  # Specify the name and description of the IAM policy.
  name        = "${var.ec2_iam_access_policy_name}"
  path        = "/"
  description = "Policy to provide permissions to the MLOps environment instance"

  # Define the permissions granted by the IAM policy.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*",
          "s3-object-lambda:*",
          "logs:*",
          "cloudwatch:GenerateQuery",
          "ec2:*",
          "ssm:*",
          "ssmmessages:*",
          "ec2messages:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

# Attach the IAM policy to the IAM role.
resource "aws_iam_policy_attachment" "policy_attach_tf" {
  # Specify the name of the IAM policy attachment.
  name = "${var.ec2_iam_policy_attachment_name}"
  # Specify the IAM role to attach the policy to.
  roles = [aws_iam_role.ec2_iam_role_tf.name]
  # Specify the ARN of the IAM policy to attach.
  policy_arn = aws_iam_policy.iam_access_policy_tf.arn
}

# Define an IAM instance profile and associate it with the IAM role.
resource "aws_iam_instance_profile" "iam_profile_tf" {
  # Specify the name of the IAM instance profile.
  name = "${var.ec2_iam_profile_name}"
  # Specify the IAM role to associate with the instance profile.
  role = aws_iam_role.ec2_iam_role_tf.name
}
