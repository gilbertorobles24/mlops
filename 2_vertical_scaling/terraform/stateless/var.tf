variable "region" {
  description = "The region Terraform deploys your instances"
  type        = string
  default     = "us-west-2"
}

variable "vpc_name" {
  default     = "mlopsenv_vpc"
  description = "VPC name"
  type        = string
}


######################## ROUTE53 ############################
variable "subdomain_1" {
  default     = "jupyter"
  description = "Prefix Subdomain for browser access."
  type        = string
}

variable "domain" {
  default     = "coolsite.online"
  description = "Domain name for browser access."
}


######################## EC2 ############################
variable "ec2_instance_name" {
  default     = "mlops_server"
  description = "EC2 instance name"
  type        = string
}

variable "ec2_instance_type" {
  default     = "t2.medium"
  description = "EC2 instance type"
  type        = string
}

variable "ec2_ssh_key_name" {
  default     = "mlopsenv_dev_key"
  description = "ec2 ssh key name"
  type        = string
}

variable "service_name" {
  default     = "mlopsenv"
  description = "name of project or service"
  type        = string
}



######################## ALB ############################
variable "alb_name" {
  default     = "mlopsenv_alb"
  description = "ALB name"
  type        = string
}

variable "tg_name" {
  default     = "demo-website-tg"
  description = "target group name"
  type        = string
}


######################## IAM ############################
variable "ec2_iam_role_name" {
  default     = "mlopsenv_role_tf"
  description = "ec2 iam role name"
  type        = string
}

variable "ec2_iam_access_policy_name" {
  default     = "mlopsenv_access_policy_tf"
  description = "ec2 access policy name"
  type        = string
}

variable "ec2_iam_policy_attachment_name" {
  default     = "mlopsenv_attachment_tf"
  description = "ec2 iam policy attachment name"
  type        = string
}

variable "ec2_iam_profile_name" {
  default     = "mlops_profile_tf"
  description = "ec2 iam profile name"
  type        = string
}


######################## SECURITY GROUPS ############################
variable "security_group_name" {
  default     = "mlopsenv_sg"
  description = "security group name"
  type        = string
}


######################## NETWORKING ############################
variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "enable_vpn_gateway" {
  description = "Enable a VPN gateway in your VPC."
  type        = bool
  default     = true
}

variable "public_subnet_count" {
  description = "Number of public subnets."
  type        = number
  default     = 2
}

variable "private_subnet_count" {
  description = "Number of private subnets."
  type        = number
  default     = 2
}

variable "public_subnet_cidr_blocks" {
  description = "Available cidr blocks for public subnets"
  type        = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
    "10.0.7.0/24",
    "10.0.8.0/24",
  ]
}

variable "private_subnet_cidr_blocks" {
  description = "Available cidr blocks for private subnets"
  type        = list(string)
  default = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
    "10.0.104.0/24",
    "10.0.105.0/24",
    "10.0.106.0/24",
    "10.0.107.0/24",
    "10.0.108.0/24",
  ]
}


variable "stateful_volume_name" {
  description = "retreive volume from stateful infrastrcture"
  type        = string
  default     = "mlopsenv_stateful_ebs"
}
