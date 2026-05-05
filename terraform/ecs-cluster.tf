resource "aws_ecs_cluster" "cluster" {
  name = "my-app-cluster"

  tags = {
    Name = "my-cluster"
  }
}

