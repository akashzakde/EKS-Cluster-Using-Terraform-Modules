# Creating IAM role for Master Node
resource "aws_iam_role" "eks_role" {
  # Role name
  name = "eks-cluster"

  # Role for EKS cluster to assume this role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "EKS-Cluster-role"
  }
}

# Attaching Policy to IAM role
resource "aws_iam_role_policy_attachment" "eks-policy1" {
  # Policy arn to you want to apply & this policy is aws policy for eks cluster
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  #The role the policy should be applied to eks_cluster
  role = aws_iam_role.eks_role.name
}

resource "aws_iam_role_policy_attachment" "eks-policy2" {
  # Policy arn to you want to apply & this policy is aws policy for eks cluster
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  #The role the policy should be applied to eks_cluster
  role = aws_iam_role.eks_role.name
}

# Creating IAM role for Worker Node
resource "aws_iam_role" "ec2_role" {
  # Role name
  name = "ec2_role"

# Role for EKS cluster to assume this role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "EC2-role"
  }
}
# Attaching Policy to IAM role
resource "aws_iam_role_policy_attachment" "ec2-policy1" {
  # Policy arn to you want to apply & this policy is aws policy for ec2 
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  #The role these policy should be applied to ec2 machines
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_role_policy_attachment" "ec2-policy2" {
  # Policy arn to you want to apply & this policy is aws policy for ec2 
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  #The role these policy should be applied to ec2 machines
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_role_policy_attachment" "ec2-policy3" {
  # Policy arn to you want to apply & this policy is aws policy for ec2 
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  #The role these policy should be applied to ec2 machines
  role = aws_iam_role.ec2_role.name
}

# Creating EKS Cluster
resource "aws_eks_cluster" "eks" {
  name = "EKS"
  # attach role which was created earlier
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = true
    subnet_ids = [
      var.public_subnet_az1_id,
      var.public_subnet_az2_id
    ]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.eks-policy1,
    aws_iam_role_policy_attachment.eks-policy1
  ]
}

# Creating Worker Node Group
resource "aws_eks_node_group" "eks-node-group" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "eks-node-group"
  node_role_arn   = aws_iam_role.ec2_role.arn
  subnet_ids      = [
                    var.private_app_subnet_az1_id, 
                    var.private_app_subnet_az2_id
                    ]
  remote_access {
  ec2_ssh_key               = var.key_name
  source_security_group_ids = var.source_security_group_ids
  }

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 2
  }

  #Type of AMI associated with the EKS node group 
  #Valid Values: AL2_x86_64 | AL2_x86_64_GPU | AL2_ARM_64
  ami_type = "AL2_x86_64"

  #The capacity type of your managed node group.
  #Valid Values: ON_DEMAND | SPOT
  capacity_type = "ON_DEMAND"

  #Disk size in GiB for worker nodes
  disk_size = 50

  #Force version update if existing pods are unable to be drained due to a pod disruption budget issue.
  force_update_version = false

  # EC2 Instance type for worker node
  instance_types = ["t3.medium"]

  labels = {
    role = "ec2_role"
  }
  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.ec2-policy1,
    aws_iam_role_policy_attachment.ec2-policy2,
    aws_iam_role_policy_attachment.ec2-policy1,
  ]
}