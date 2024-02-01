# IAM Role Master's ARN
output "master_arn" {
  value = aws_iam_role.eks_role.arn
}

# IAM Role Worker's ARN
output "worker_arn" {
  value = aws_iam_role.ec2_role.arn
}