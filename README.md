# This project is about creating EKS cluster with Terraform Modules

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
- Once all the resources are created , you can update kube config file using command : "aws eks update-kubeconfig --region <region-code> --name <Cluster-Name>"
- Now you can run "kubectl get nodes" command to check connectivity with your new EKS cluster & host your application !
