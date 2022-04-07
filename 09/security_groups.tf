# security_groups.tf

resource "aws_security_group" "SSH-PORT-SG" {
  # id          = "${var.security_group_id}"
  name        = "SSH-${var.SSH_PORT}-SG"
  description = "Allow inbound traffic to ssh"
  vpc_id      = var.vpc_id

  ingress {
    from_port = var.SSH_PORT
    to_port   = var.SSH_PORT
    protocol  = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}

/*resource "aws_security_group" "allow_http_anywhere" {
  # id          = "${var.security_group_id}"
  name        = "allow_http_anywhere"
  description = "Allow all inbound traffic to http"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}*/