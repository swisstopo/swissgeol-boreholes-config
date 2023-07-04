# Kubernetes Deployment

## Connect to Kubernetes Cluster

## Prerequisites

1. Create secret and access key for your [AWS account](https://us-east-1.console.aws.amazon.com/iamv2/home?region=us-east-1#/security_credentials?section=IAM_credentials)
2. Download, install and configure [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
3. Download, install and configure [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/#install-nonstandard-package-tools)

## Deploy Application

Use the following commands to delete and configure the bdms application on the cluster.

Valid actions are `delete` and `configure`.
Valid contexts are `prod`, `dev` and `int`.

```bash
# Delete all the resources in the namespace. Use with caution!
.\bdms-app.ps1 -action delete -context dev

# Configure the application on the cluster
.\bdms-app.ps1 -action configure -context dev
```
