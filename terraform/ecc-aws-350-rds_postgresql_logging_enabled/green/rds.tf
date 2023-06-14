resource "random_password" "this" {
  length           = 12
  special          = true
  number           = true
  override_special = "!#$%*()-_=+[]{}:?"
}

resource "aws_db_instance" "this" {
  identifier                      = "database-350-green"
  engine                          = "postgres"
  engine_version                  = "13.3"
  instance_class                  = "db.t3.micro"
  allocated_storage               = 10
  storage_type                    = "gp2"
  db_name                         = "green350"
  username                        = "root"
  password                        = random_password.this.result
  multi_az                        = false
  skip_final_snapshot             = true
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  parameter_group_name            = aws_db_parameter_group.this.id

  tags = {
    Name = "350_db_instance_green"
  }
}

resource "aws_db_parameter_group" "this" {
  name   = "parameter-group-350-green"
  family = "postgres13"

  parameter {
    name  = "log_statement"
    value = "all"
  }

  parameter {
    name  = "log_min_duration_statement"
    value = "1"
  }
}
