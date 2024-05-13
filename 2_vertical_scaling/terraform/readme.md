# Scalable AWS Self-Hosted Jupyter Lab ML Environment: Terraform Infrastructure
This directory outlines the infrastructure as code to provision the required resources.

Updates: Since module 1, this is meant to be an upgraded version, with added lambda function vertical autoscaling.
- 1. Instead of crashing when CPU utilization reaches maximum level, it will now notify the user of the high computing power requirements, save all progress, stop the instance, and start up again with an upgraded instance type of higher computing power.
- 2. Notifications will be sent via AWS SNS from CloudWatch CPU Usage alarms.
- 3. CloudWatch Alarm triggers Lambda function to upgrade instance at 90% CPU utilization to prevent crash and loss of progress.

Additional Updates:
- All names are now parametrized in the var.tf file. In order to personalize or change infrastructure, just change the var.tf file.
- Files can now be inserted into completely different infrastructures and fit in by simply changing name or type variable. This aids modularity and reusability of the code.
- The stateful component of the infrastructure has additional backup safety as the environment data and progress is now accessible publicly on GitHub. No longer fully dependent on EBS Block Snapshots for EC2 storage recovery.
