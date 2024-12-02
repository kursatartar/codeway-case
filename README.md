DevOps Case Study: CI/CD Implementation for Kubernetes Cluster This repository documents the steps and processes followed to complete the given DevOps case study. The focus was on implementing a CI/CD pipeline for deploying an application to a Kubernetes cluster, utilizing Helm, ArgoCD, and GitLab CI/CD.

Table of Contents Introduction Environment Setup Docker Configuration Kubernetes with Minikube Helm Integration CI/CD Implementation GitLab Configuration Challenges and Troubleshooting ArgoCD Deployment Observations and Learnings Future Work

Introduction This project aimed to build and deploy an application on a Kubernetes cluster using a fully automated CI/CD pipeline. The following technologies were utilized:

Docker: For containerizing the application. Minikube: As the local Kubernetes cluster. Helm: For packaging and deploying the application. ArgoCD: For managing Kubernetes manifests. GitLab CI/CD: For automating the build and deploy process. Environment Setup Docker Configuration Installed Docker and verified the setup by running a simple container. Created a docker-compose.yml file and enabled Docker Swarm mode. Configured sensitive data using secrets:



Kubernetes with Minikube

Installed Minikube with Docker as the driver:

sudo minikube start --driver=docker

Verified the installation:

kubectl version kubectl get nodes Enabled the Minikube dashboard for visual inspection of the cluster:

minikube dashboard

Helm Integration Installed Helm and created a custom chart:



Configured values.yaml for environment-specific variables. Deployed the application:

helm upgrade --install chart-case ./chart-case

CI/CD Implementation GitLab Configuration Configured GitLab CI/CD pipeline:

Defined jobs in .gitlab-ci.yml for build and deploy stages. Used External Secrets for secure variable management.

Challenges and Troubleshooting GitLab Runner Issue: The GitLab Runner could not connect to the Kubernetes API. Despite attempts with: bash

export KUBECONFIG=/path/to/kubeconfig

The deployment phase was unsuccessful due to network and configuration complexities.

ArgoCD Deployment Created a namespace for ArgoCD:

kubectl create namespace argocd Deployed the ArgoCD manifests:

kubectl apply -n argocd -f application.yaml

Retrieved the initial admin password:

kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d

This was my first exposure to Kubernetes, Helm, and ArgoCD. The project provided hands-on experience with managing namespaces, secrets, and CI/CD pipelines. Future Work Resolve the GitLab Runner connectivity issue. Explore additional CI/CD tools and cloud-based Kubernetes clusters for enhanced scalability. Visual Placeholder: Insert a diagram summarizing the CI/CD pipeline flow.

Thank you for reviewing this case study. I am eager to learn more and contribute as part of Codeway team.
