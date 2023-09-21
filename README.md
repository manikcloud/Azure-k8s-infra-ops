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

```
cd ../helm-charts/charts/jenkins/
helm install my-jenkins .
```


### Directory Structure
- `terraform-root`: Contains Terraform scripts for infrastructure provisioning.
- `'modules'`: Terraform modules for ACR, AKS, and VNet.
- `helm-chart's`: Contains Helm charts for Jenkins.
