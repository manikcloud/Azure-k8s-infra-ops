# Azure Kubernetes Infrastructure Operations

## Introduction

This repository contains Terraform scripts to automate the deployment of a 3-tier network infrastructure and its components in Azure. It also provides automation to provision Azure Kubernetes Service (AKS) clusters.

## Features

- Automated provisioning of a 3-tier VNet in Azure
- Azure Container Registry (ACR) setup
- AKS cluster provisioning
- SSH key generation
- Helm charts for Jenkins

## Getting Started

### Prerequisites

- Terraform 
- Azure CLI

### Clone the Repository

To clone the repository, run:

```
git clone https://github.com/manikcloud/Azure-k8s-infra-ops/
```
### Deploy the Infrastructure
Navigate to the terraform-root directory to deploy the 3-tier VNet, ACR, and AKS:

```

cd Azure-k8s-infra-ops/terraform-root/
terraform init
terraform apply
```

### Deploy Helm Charts
Navigate to the helm-charts directory to deploy Jenkins using Helm:

### 2.8. Cloud Platform
1. The cloud platform for this project is Azure.

---
## 3. Resoution Approach <a name="approach"></a>

To resolve the problem statement, follow these high-level steps:

### 3.1. Docker Image Creation
- Write a Dockerfile for the Java application.
- Use Docker to package the application into an image.
- Build the Docker image.
- Use Terraform to push the image to Azure ACR.

### 3.2. Terraform Infrastructure Setup
- Write Terraform code to define the 3-tier network and its components.
- Use Terraform to provision a Kubernetes cluster in Azure.
- **Terraform code:** [GitHub Repository](https://github.com/manikcloud/Azure-k8s-infra-ops/tree/tf-module)

### 3.3. Jenkins CI/CD
- Configure Jenkins on a separate cluster.
- Create Dockerfiles for build agents.
- Set up CI and CD pipelines with Jenkins.
- Trigger CI when Pull Requests are merged.
- Trigger CD from JIRA release tasks.

### 3.4. Code Scanning
- Integrate code scanning tools into the CI/CD pipelines.
- Perform code scanning before creating Docker images.

### 3.5. Project Modularity and Reusability
- Modularize the CI/CD pipelines.
- Parameterize pipeline configurations for reusability.

### 3.6. Documentation
- Create a detailed README document with step-by-step instructions.
- List all assumptions made during the project.

### 3.7. Git Repository
- Organize and upload project files to a Git repository.

## 4. Assumptions <a name="assumptions"></a>

- The Java application source code is available.
- Access to an Azure subscription with appropriate permissions.
- Docker and Terraform are installed on the local machine.
- Jenkins is set up and accessible on a separate cluster.
- JIRA is used for issue tracking and release management.
- Code scanning tools are integrated into the CI/CD pipelines.
- Necessary credentials and secrets are securely managed.

## 5. Prerequisites <a name="prerequisites"></a>

Before starting the project, ensure you have the following prerequisites:

- Azure subscription and access credentials.
- Docker installed locally.
- Terraform installed locally.
- Access to Jenkins on a separate cluster.
- Java application source code.
- JIRA for issue tracking and release management.
- Code scanning tools integrated into the CI/CD pipelines.
```
cd ../helm-charts/charts/jenkins/
helm install my-jenkins .
```


### Directory Structure
- `terraform-root`: Contains Terraform scripts for infrastructure provisioning.
- `'modules'`: Terraform modules for ACR, AKS, and VNet.
- `helm-chart's`: Contains Helm charts for Jenkins.

## CI/CD Integration

When code is pushed to this repository, it triggers the CI/CD pipeline hosted in [AzureK8s-CICD-Flow](https://github.com/manikcloud/AzureK8s-CICD-Flow). The pipeline takes care of building the application, running tests, and deploying it to the Kubernetes cluster.

### Linked Repositories

1. **Infrastructure**: The [Azure-k8s-infra-ops](https://github.com/manikcloud/Azure-k8s-infra-ops/) repository contains Terraform scripts to provision the infrastructure components like VNet, AKS, and ACR in Azure.
  
2. **CI/CD Pipeline**: The [AzureK8s-CICD-Flow](https://github.com/manikcloud/AzureK8s-CICD-Flow) repository hosts the CI/CD pipeline, which builds, tests, and deploys this application.

### Development Story

The development process starts with infrastructure setup using [Azure-k8s-infra-ops](https://github.com/manikcloud/Azure-k8s-infra-ops/). Once the infrastructure is provisioned, code pushes to this repository trigger the CI/CD pipeline in [AzureK8s-CICD-Flow](https://github.com/manikcloud/AzureK8s-CICD-Flow).
