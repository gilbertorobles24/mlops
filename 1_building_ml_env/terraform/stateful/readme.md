# Stateful Infrastructure

This terraform infrastructure is a subset of the code required to run the Jupyter server previously created. Some infrastructure can remain ephemeral, or stateless. For example, iam roles, acm certificates, vpc components, etc. 

Ephemeral infrastructure can be replaced by terraform, whether by upgrade or failure and essentially go back to a functioning infrastructure.

The same is usually true about EC2 instances, but not about their storage volumes.

### EBS Block Storage Separation
This subset infrastructure separates EBS volumes and instance snapshots from the main infrastructure to allow for complete destruction of the main infrastructure while it is non-operational.

Now the VPC, ALB, ACM, and EC2 resources can all be completely destroyed when it is not needed, to save costs on idle services being maintained on AWS. This will not affect the sub-infrastructure storing all the progress and data.
Additionally, if an EC2 instance were to fail or for any reason reach an unrecoverable state, a previous backup can be spawned to replace it from a checkpoint.

