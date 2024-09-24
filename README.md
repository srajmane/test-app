# DevOps Orchestration assessment

The repo containes:
- Backend Api dummy application
- Data Api dummy application
- Health check dummy script

## Objective:
Update the backend and orchestrate migrating the 2 apps and script to kubernetes clusters following best practices using the technologies in the instructions

### Tasks:
- Add a new backend api:
  - ```/download_external_logs``` makes a call to external service's api.
  - The external download API is dummy api, _you may leave it blank,_ however it requires $EXTERNAL_INTGERATION_KEY to authenticate
  - the external api has multiple enviroments so the integration key varies by enviroment
- Update the health check to fit the new archeticture
- Create helmchart for the stack
- Deployment via Ansible
- Monitoring Kubernetes Applications - Demonstrate how to monitor the node and Pod and containers resource utilization
- How to display only resource utilization for Pods with specific label (k8s-app=kube-Devops)


#### Submission Guidelines:
- Add the nessasory folder(s) and file(s).
- If needed you may change the code structure or content or add technolgies, but its **not** part of the assessment
- Ensure you include the necessary documentations with the relevant commands used.
- Use Git


## Solution:

### Add New backend api
- Added external backend api only, not able to update health_check.sh file.

### Helm Chart Deployment using Ansible
- Prerequisites: Install k8s, helm and docker on your machine.

- Created Dockerfile to containerize the test-app and built docker image
  ```
  docker build -t test-app:latest .
  ```
- Push the docker image to respective repository.
  
- Create a helm chart using below command
  ```
  helm create test-app
  ```
- Added required helm chart file like values.yaml, Chart.yaml and templates folder.

- Created anisble folder and invetory.yaml file.

- Deploy helm chart using ansible
  ```
  ansible-playbook -i inventory.yml ansible/deploy.yml
  ```
- This will deploy helm chart in your kubernets cluster.

### Monitoring Kubernetes Applications
- Monitor the node resource utilization
  ```
  kubectl top node
  kubectl top node <node-name> #Specific Node
  ```

- Monitor the pod resource utilization
  ```
  kubectl top pod   # default namespace
  kubectl top pod --all-namespaces  # all namespace
  kubectl top pod --namespace <namespace-name> # specific namespace

  ```

- Monitor the container resource utilization
  ```
  kubectl top pod <pod-name> -containers   #  Running container from specific pod
  kubectl top pod -n <namespace> -containers  # running containers in pods in a specific namespace:
  ```

- Resource utilization for Pods with specific label (k8s-app=kube-Devops)
  ```
  kubectl top pod -l k8s-app=kube-Devops
  ```

