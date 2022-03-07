# Multi-Region-EKS-Application

Manual Setup & Components Installation through eksctl:

- Route 53 Health Checks & Alarms for Active/Passive setup.
- SNS & Custom Runtime Lambda Function for Scaling Application deployments in Secondary Region.
- Global Accelerator & Listener
- IAM Role for service accounts
- AWS Load Balancer Controller
- Cluster Autoscaler (In Primary Region ap-southeast-1)
- Karpenter (In Secondary Region ap-southeast-2)
- Route 53 HC (Alarm), Failover Lambda, SNS Topic
