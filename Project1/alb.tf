# Create a security group for the ALB
resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Security group for the Application Load Balancer"
  vpc_id      = aws_vpc.vpc.id  # Associate with the VPC where the ALB is located

  # Ingress rules for ALB (allow HTTP and HTTPS traffic)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP traffic from anywhere (0.0.0.0/0)
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTPS traffic from anywhere (0.0.0.0/0)
  }

  # Egress rules for ALB (allow all outbound traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]  # Allow outbound traffic to anywhere
  }

  tags = {
    Name = "alb-sg"
  }
}
resource "aws_alb" "alb"{
    name="terraform-alb"
    internal=false
    load_balancer_type="application"
    security_groups=[aws_security_group.alb_sg.id]
    subnets=[aws_subnet.public.id]
    tags={
        Name="terraform-alb"
    }
}
resource "aws_lb_target_group" "web_tg" {
name = "web-target-group"
port = 80
protocol = "HTTP"
vpc_id = aws_vpc.vpc.id
}
resource "aws_lb_listener" "web_listener" {
load_balancer_arn = aws_alb.alb.arn
port = 80
protocol = "HTTP"
default_action {
type = "forward"
target_group_arn = aws_lb_target_group.web_tg.arn
}
}