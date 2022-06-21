resource "aws_db_instance" "main" {
  identifier           = "${var.COMPONENT}-${var.ENV}"
  allocated_storage    = 10
  engine               = var.ENGINE
  engine_version       = var.ENGINE_VERSION
  instance_class       = var.INSTANCE_CLASS
  name                 = var.NAME
  username             = jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)["RDS_USERNAME"]
  password             = jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)["RDS_PASSWORD"]
  parameter_group_name = aws_db_parameter_group.main.name
  skip_final_snapshot  = var.SKIP_FINAL_SNAPSHOT
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.main.id]
}




