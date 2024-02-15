# This project is about creating EKS cluster with Terraform Modules & cluster autoscaler .

## Description : 
This project will create VPC with 6 subnets , 1 Internet Gateway,2 Nat Gateway, 1 Security Group, EKS cluster with 2 worker nodes .

## Architecture Diagram :

![EKS-Clust-Terraform](https://github.com/akashzakde/EKS-Cluster-Using-Terraform-Modules/assets/64258131/c6c28081-a42e-497f-95aa-6a1066c3dc23)

### Prerequisites :
- Download & install AWS CLI (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- Download & install Terraform binary (https://developer.hashicorp.com/terraform/install)
- Download & install GitBash binary (https://git-scm.com/downloads)
- Download & install kubectl binary (https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/#install-kubectl-binary-with-curl-on-windows)
### Steps for creating EKS cluster :
- Open GitBash terminal.
- Configure AWS CLI using Access key & Secret Key.
- Clone this git repo using command "git clone https://github.com/akashzakde/EKS-Cluster-Using-Terraform-Modules.git"
- Go inside "EKS-Cluster-Using-Terraform-Modules" folder & run "terraform init" command.
- After terraform init command ,execute "terraform validate" , "terraform plan" and finally run "terraform apply"
- Please wait for 5-6 mins to create VPC & EKS cluster.
- Once all the resources are created , you can update kube config file using command : "aws eks update-kubeconfig --region Region-Code--name Cluster-Name"
- Now its time to create cluster autoscaler deployment using command : `kubectl apply -f autoscaler-manifests.yaml` **NOTE:Before executing this command please ensure you have added autoscaler role arn , cluster name as mentioned in the file itself via comments**
- Once you apply the manifests , you can check deployment status using command : `kubectl get deploy -n kube-system`
- Now its time to test cluster autoscaler , create nginx deployment with : `kubectl apply -f webserver-nginx.yaml` & watch pending pods will get start running on new worker nodes added by our cluster autoscaler .
- also you can run "kubectl get nodes" command to check current list of nodes , you would be surprised that cluster autoscaler has added new worker nodes to adjust our pending pods .
