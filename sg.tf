resource "aws_security_group" "main" {
  name        = "allow_rds_mysql_${var.COMPONENT}_${var.ENV}"
  description = "allow_rds_mysql_${var.COMPONENT}_${var.ENV}"
  vpc_id = data.terraform_remote_state.vpc.outputs.VPC_ID

  ingress {
    description = "MYSQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [data.terraform_remote_state.vpc.outputs.VPC_CIDR]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_rds_mysql_${var.COMPONENT}_${var.ENV}"
  }
}
