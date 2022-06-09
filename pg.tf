resource "aws_db_parameter_group" "main" {
  name   = "${var.COMPONENT}-${var.ENV}-mysql"
  family = "mysql${var.ENGINE_VERSION}"
}
