output "eks_role_arn" {
  description = "The ARN of the IAM role for EKS"
  value       = aws_iam_role.eks_role.arn
}

output "eks_vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.eks_vpc.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = aws_subnet.private_subnet.id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.eks_igw.id
}

output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.eks_public_route_table.id
}

output "route_table_association_id" {
  description = "The ID of the route table association"
  value       = aws_route_table_association.public_association.id
}
