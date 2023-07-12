resource "aws_mq_broker" "this" {
  broker_name                = "mq-broker-506-red"
  engine_type                = "ActiveMQ"
  engine_version             = "5.15.9"
  host_instance_type         = "mq.t2.micro"
  publicly_accessible        = true

  user {
    username = "root"
    password = random_password.this.result
  }
}

resource "random_password" "this" {
  length           = 12
}
