resource "aws_lb_target_group" "TG" {
  name        = "ecs-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "TG"
  }
}
