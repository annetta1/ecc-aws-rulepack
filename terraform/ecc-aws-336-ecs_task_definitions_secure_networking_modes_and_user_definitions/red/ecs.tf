resource "aws_ecs_cluster" "this" {
  name = "ecc-aws-336-ecs_task_definitions_secure_networking_modes_and_user_definitions"
}

resource "aws_ecs_task_definition" "this" {
  family                   = "336_ecs_task_definition_red"
  network_mode             = "host"
  requires_compatibilities = ["EC2"]
  container_definitions    = <<DEFINITION
[
  {
    "name": "mysql",
    "image": "mysql",
    "cpu": 1,
    "memory": 5,
    "essential": true,
    "privileged": false,
    "user": "root" 
  }
]
DEFINITION
}

resource "aws_ecs_service" "this" {
  name            = "336_ecs_service_red"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = 1
}