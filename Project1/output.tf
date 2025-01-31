output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.vpc.id
}

output "subnet_ids" {
  description = "The IDs of the created subnets"
  value       = aws_subnet.public[*].id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.internet_gateway.id
}

output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_alb.alb.dns_name
}

output "alb_arn" {
  description = "The ARN of the ALB"
  value       = aws_alb.alb.arn
}

output "asg_name" {
  description = "The name of the Auto Scaling Group"
  value       = aws_autoscaling_group.web.name
}

output "instance_security_group_id" {
  description = "The ID of the security group for instances"
  value       = aws_security_group.alb_sg.id
}
output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = aws_vpc.vpc.arn
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public.id
}

output "public_subnet_arn" {
  description = "The ARN of the public subnet"
  value       = aws_subnet.public.arn
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = aws_subnet.private.id
}

output "private_subnet_arn" {
  description = "The ARN of the private subnet"
  value       = aws_subnet.private.arn
}

