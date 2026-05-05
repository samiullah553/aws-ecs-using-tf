resource "aws_lb" "ecs-lb" {
  name               = "ecs-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.SG.id]
  subnets            = [aws_subnet.subnet-1.id, aws_subnet.subnet-2.id]

  tags = {
    Name = "ecs-lb"
  }

}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.ecs-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.TG.id
  }
}
