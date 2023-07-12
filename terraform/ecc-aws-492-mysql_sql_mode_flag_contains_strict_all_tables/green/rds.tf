resource "random_password" "this" {
  length           = 12
  special          = true
  override_special = "!#$%*()-_=+[]{}:?"
}

resource "aws_db_instance" "this" {
  identifier                      = "database-492-green"
  engine                          = "mysql"
  engine_version                  = "8.0.28"
  instance_class                  = "db.t3.micro"
  allocated_storage               = 10
  storage_type                    = "gp2"
  db_name                         = "green492"
  username                        = "root"
  password                        = random_password.this.result
  skip_final_snapshot             = true
  parameter_group_name            = aws_db_parameter_group.this.id

  depends_on = [aws_db_parameter_group.this]
}

resource "aws_db_parameter_group" "this" {
  name   = "parameter-group-492-green"
  family = "mysql8.0"

  parameter {
    apply_method = "pending-reboot"
    name  = "sql_mode"
    value = "ALLOW_INVALID_DATES,STRICT_ALL_TABLES,IGNORE_SPACE"
  }

}
