# Launch Configuration for Auto Scaling Group
resource "aws_launch_configuration" "web" {
  name          = "web-lc"
  image_id      = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  key_name      = "DevOps"
  lifecycle {
    create_before_destroy = true
  }
}