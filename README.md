This project aimed to build and deploy an application on a Kubernetes cluster using a fully automated CI/CD pipeline. The following technologies were utilized:

Docker: For containerizing the application. 
Minikube: As the local Kubernetes cluster. 
Helm: For packaging and deploying the application. ArgoCD: For managing Kubernetes manifests. 
GitLab CI/CD: For automating the build and deploy process. 
ArgoCD: To manage infrastructure configuration and application updates in one system.

Environment Setup Docker Configuration Installed Docker and verified the setup by running a simple container. 
Created a docker-compose.yml file and enabled Docker Swarm mode. 
Configured sensitive data using secrets.



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


![Screenshot 2024-12-02 at 23 23 00](https://github.com/user-attachments/assets/51263df4-6b0c-4dcb-88cc-b6200d310cd3)
![Screenshot 2024-12-02 at 21 28 27](https://github.com/user-attachments/assets/7806fde3-4559-433d-bbda-32a3e1ae069d)
<img width="1450" alt="Screenshot 2024-12-02 at 21 14 26" src="https://github.com/user-attachments/assets/e34a7e18-42ec-4efa-8e5f-944692ad25c9">
![Screenshot 2024-12-02 at 21 13 21](https://github.com/user-attachments/assets/866ac8de-78e8-4d41-b730-3199e0c2bd49)
<img width="1086" alt="Screenshot 2024-11-29 at 17 40 57" src="https://github.com/user-attachments/assets/fe6dec98-3a78-42d9-b4de-962b6a882407">
<img width="1666" alt="Screenshot 2024-11-28 at 02 05 19" src="https://github.com/user-attachments/assets/50f1e29b-2007-4f03-8038-620c29776dff">
<img width="1342" alt="Screenshot 2024-11-28 at 00 01 13" src="https://github.com/user-attachments/assets/a55a2f77-c870-42ff-af1a-674fe6d78996">
<img width="528" alt="Screenshot 2024-11-27 at 23 54 10" src="https://github.com/user-attachments/assets/e3025eca-2c64-47a4-8322-fd2cddc92a9b">
![Screenshot 2024-11-27 at 23 47 01](https://github.com/user-attachments/assets/59961e0a-f72f-4721-a092-a8309ad60d98)
![Screenshot 2024-11-27 at 23 46 49](https://github.com/user-attachments/assets/39127c9a-19cb-4ecf-8f9d-4144d515563c)
![Screenshot 2024-11-27 at 23 46 23](https://github.com/user-attachments/assets/09960c97-4a17-4517-b6f0-ab012ee77020)
<img width="1470" alt="Screenshot 2024-11-27 at 23 45 38" src="https://github.com/user-attachments/assets/b05dd6cf-62fa-4c8d-afe1-a74faef1b18c">
<img width="1728" alt="Screenshot 2024-11-27 at 23 45 30" src="https://github.com/user-attachments/assets/0c33e611-531d-42e2-b544-32e148ff154e">
<img width="908" alt="Screenshot 2024-11-27 at 23 19 53" src="https://github.com/user-attachments/assets/d474f446-e4d0-4f49-bfa9-6ac00b0630b4">


This was my first exposure to Kubernetes, Helm, and ArgoCD. The project provided hands-on experience with managing namespaces, secrets, and CI/CD pipelines. Future Work Resolve the GitLab Runner connectivity issue. Explore additional CI/CD tools and cloud-based Kubernetes clusters for enhanced scalability. Visual Placeholder: Insert a diagram summarizing the CI/CD pipeline flow.

Thank you for reviewing this case study. I am eager to learn more and contribute as part of Codeway team.
