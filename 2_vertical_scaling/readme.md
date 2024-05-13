# Scaling ML Environment

In the previous section, I built an ML Jupyter Notebook environment hosted on AWS using Terraform. However, quickly the limitations of CPU crashed the system when I got to the unsupervised methods sections, running sklearn models like K-means. A t2.micro is clearly not enough computing power for even these low requirements models. Thus, vertical scaling is required.

This section will cover using:
- AWS CloudWatch to track my current CPU Usage, 
- AWS SNS to send me notifications on my usage when it reaches a critical threshold
- AWS Lambda Python function triggered by CloudWatch Alarm to safely prevent EC2 crash. Rather, notify, stop instance, retain current progress, and reload the instance with upgraded computing power.

Unfortunately there is no way to automate vertical scaling for instances, as there is for horizontal scaling (i.e. spawning multiple parallel instances to load balance incoming traffic). Scaling computing power requires the temporary stopping of an instance, if one wishes to optimize cost by scaling up and down, as opposed to using an unnecessarily large instance on all the time in case of peak demand.

My service closely resembles that of AWS Sage Maker as a ML environment based on Jupyter Lab with scalable computing power on EC2 instances.

The final product will allow the user to self manage ML EC2 instances based on dynamic requirements and auto-shut-down unused instances for cost saving.
