resource "aws_db_security_group" "main" {
  name = "${var.COMPONENT}-${var.ENV}"

  ingress {
    cidr = data.terraform_remote_state.vpc.outputs.VPC_CIDR
  }
}
