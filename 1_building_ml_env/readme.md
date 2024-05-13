# Jupyter Labs Infrastructure

The terraform code in this directory provisions a Jupyter Lab ML-ready environment, which is automatically configured by Ansible. This environment features a private domain to log in to, via Route53, a VPC as a security layer, and ephemeral resources that can be destroyed and restarted with no loss of data, for cost optimization.
