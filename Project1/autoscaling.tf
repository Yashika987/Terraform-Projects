resource "aws_autoscaling_group" "web" {
launch_configuration = aws_launch_configuration.web.id
min_size = 1
max_size = 3
desired_capacity = 2
vpc_zone_identifier = [aws_subnet.public.id]
tag {
key = "Name"
value = "web-instance"
propagate_at_launch = true
}
}