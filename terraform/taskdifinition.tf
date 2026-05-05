resource "aws_ecs_task_definition" "TD" {
  family                   = "my-app"
  requires_compatibilities = ["FARGATE"]
  # execution_role_arn       = aws_iam_role.iam-role.arn
  execution_role_arn = aws_iam_role.ecs_execution_role.arn
  network_mode       = "awsvpc"
  cpu                = 1024
  memory             = 2048

  container_definitions = jsonencode([
    {
      name      = "my-backend-app"
      image     = "nginx:latest"
      cpu       = 1024
      memory    = 2048
      essential = true

      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

data "aws_ecs_task_definition" "TD" {
  task_definition = aws_ecs_task_definition.TD.family
}
