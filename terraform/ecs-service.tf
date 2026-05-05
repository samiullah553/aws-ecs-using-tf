resource "aws_ecs_service" "backend" {
  name                = "backend-service"
  launch_type         = "FARGATE"
  platform_version    = "LATEST"
  cluster             = aws_ecs_cluster.cluster.id
  task_definition     = aws_ecs_task_definition.TD.arn
  scheduling_strategy = "REPLICA"
  desired_count       = 2
  depends_on          = [aws_lb_listener.listener]



  load_balancer {
    target_group_arn = aws_lb_target_group.TG.arn
    container_name   = "my-backend-app"
    container_port   = 80
  }

  network_configuration {
    assign_public_ip = true
    subnets          = [aws_subnet.subnet-1.id, aws_subnet.subnet-2.id]
    security_groups  = [aws_security_group.SG.id]
  }
}
