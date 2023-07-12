resource "aws_ecs_cluster" "this" {
  name = "906-ecs-cluster-green"
}

resource "aws_ecs_task_definition" "this" {
  family                   = "906_ecs_task_definition_green"
  network_mode             = "host"
  requires_compatibilities = ["EC2"]
  container_definitions    = <<DEFINITION
[
  {
    "name": "mysql",
    "image": "mysql",
    "cpu": 1,
    "memory": 5,
    "ReadonlyRootFilesystem": true
  }
]
DEFINITION
}

resource "aws_ecs_service" "this" {
  name            = "906_ecs_service_green"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = 1
}
