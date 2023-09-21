# Azure-k8s-infra-ops
Azure-k8s-infra-ops

# DevOps Project README

## Table of Contents
1. [Introduction](#introduction)
2. [Problem Statement](#problem-statement)
3. [Approach](#approach)
4. [Assumptions](#assumptions)
5. [Prerequisites](#prerequisites)
6. [Project Structure](#project-structure)
7. [Instructions](#instructions)
   - [Docker Image Creation](#docker-image-creation)
   - [Terraform Infrastructure Setup](#terraform-infrastructure-setup)
   - [Jenkins CI/CD Pipeline](#jenkins-cicd-pipeline)
   - [Code Scanning](#code-scanning)
8. [Documentation](#documentation)
9. [Contact Information](#contact-information)

---

## 1. Introduction <a name="introduction"></a>

This README document provides instructions and guidelines for implementing a DevOps project on the Azure cloud platform. The project involves creating a Docker image for a Java application, setting up infrastructure using Terraform, creating a Kubernetes cluster, configuring Jenkins CI/CD pipelines, and performing code scanning for standards and vulnerabilities.

## 2. Problem Statement <a name="problem-statement"></a>

### 2.1. Docker Image Creation
1. Write a Dockerfile for a Java application.
2. Package the Java application into a Docker image.
3. Build the Docker image.
4. Push the Docker image to Azure Container Registry (ACR) using Terraform.

### 2.2. Terraform Infrastructure Setup
1. Write Terraform code to create a 3-tier network and its components.
2. Create a Kubernetes cluster using Terraform.

### 2.3. Jenkins CI/CD
1. Configure Jenkins CI on a separate cluster with build agents.
2. Create Dockerfiles for build agents required for the above project.
3. Create separate CI and CD pipelines.
4. Trigger CI when a Pull Request is Merged in Source Control Management (SCM).
5. Trigger CD from a JIRA release task.

### 2.4. Code Scanning
1. Scan the code for standards and vulnerabilities.
2. Perform code scanning before creating the Docker images.

### 2.5. Project Modularity and Reusability
1. Ensure the pipeline is modular and parameterized for future reusability.

### 2.6. Documentation
1. Prepare a README for the DevOps team to implement this project.
2. List all assumptions.
3. Code should be well-documented, and all variables used should be documented.

### 2.7. Git Repository
1. Upload all project files to an appropriate folder in a Git repository and share the link.

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


---


## Project compltion Daywise Agenda

The project is structured as follows:

### Day 1

- Created a simple Java application named "manik-calc."
- Set up an Azure account.
- Used Terraform to provision an Azure Container Registry (ACR) and an Azure Kubernetes Service (AKS) cluster.
- Configured Visual Studio Code (VSCode) with GitHub integration and connected it to the AKS cluster.
- Deployed the "manik-calc" application to the AKS cluster.
- Conducted testing to ensure the setup is working as expected.

### Day 2

- Focused on setting up a Jenkins cluster on the AKS.
- Installed Helm on the AKS cluster.
- Launched Jenkins using Helm.
- Exposed Jenkins through a Load Balancer service.
- Started basic testing jobs within Jenkins.
- Addressed permission issues between Jenkins and AKS.
- Removed the default agent in Jenkins.
- Configured a pod as a Jenkins slave using the Kubernetes plugin.

### Day 3

- Built several Docker images required for the CI/CD pipeline, including:
  - `manik-calculator`
  - `docker:dind` (Docker in Docker)
  - `docker-devops-tools` (including `kubectl` and `helm`)
  - `docker-maven`
- Pushed these Docker images to the Azure Container Registry (ACR) created by Terraform on Day 1.

- Created a new repository for the `manik-calculator` application and integrated it with the Jenkins job. Encountered and resolved some issues related to image pushing, ensuring the CI process is functioning correctly.

- Moved on to setting up Continuous Deployment (CD). Initially, performed manual deployments of the application to the Kubernetes cluster. Later, introduced a DevOps tool Docker container in the CD pipeline. This container includes `kubectl` and `helm`, ensuring that future deployments are automated.

- Achieved the primary goal of the project, running a Jenkins cluster on the AKS platform, with all CI/CD jobs functioning as expected.

- As a final step, decoupled the project into three separate repositories:
  1. **Terraform OPS Repository:** [GitHub Repository](https://github.com/manikcloud/Azure-k8s-infra-ops)
  2. **CICD Git Flow Repository:** [GitHub Repository](https://github.com/manikcloud/AzureK8s-CICD-Flow)
  3. **Application Repository:** Seperate repository for the `manik-calculator` application, decoupled from Terraform: [GitHub Repository](https://github.com/manikcloud/microservices-calculator)

### Upcoming Steps: Code Scanning and Commenting

- In the next phase of this project, we will focus on enhancing the code quality and documentation by adding code scanning and automated commenting to the CI/CD pipeline.

#### Code Scanning
- Building upon the earlier requirement (2.4. Code Scanning), we will integrate code scanning tools, such as SonarQube, and static code analysis tools like PMD or JaCoCo, into the CI pipeline.

- As specified in the project requirements, we will perform code scanning before creating the Docker images to ensure that the code adheres to standards and is free from vulnerabilities.

- SonarQube will provide detailed code quality reports, including code smell, security vulnerabilities, and maintainability metrics.

- PMD or JaCoCo plugins will analyze the codebase for style violations, potential bugs, and test coverage.

#### Automated Commenting
- Additionally, to meet the requirement for project modularity and reusability (2.5. Project Modularity and Reusability), we will ensure that the pipeline is modular and parameterized for future reusability.

- Modularization will make it easier to integrate code scanning and commenting components seamlessly into the CI/CD pipeline and any future projects.

- Automated commenting helps developers quickly identify and address code-related issues during the development process, enhancing project maintainability.

- We will write Groovy scripts to connect these scanning and commenting tools to our pipeline, making them an integral and reusable part of our DevOps process.

Please note that these enhancements will further improve the overall quality and maintainability of the project. Take the time you need to write the necessary scripts and configurations to implement these features effectively.



