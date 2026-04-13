# Security Groups

# Definition of the security group resource for the EMR main node.
resource "aws_security_group" "main_security_group" {
  
  name = "${var.project}-emr-main-security-group-${var.environment}"
  
  description = "Allow inbound traffic for EMR main node."
  
  vpc_id = var.vpc_id
  
  tags = var.tags

  # Option to revoke security rules when deleting the security group.
  revoke_rules_on_delete = true

  # Inbound rule to allow SSH traffic (port 22) from anywhere.
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule to allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Definition of the security group resource for the EMR core (worker) nodes.
resource "aws_security_group" "core_security_group" {
  
  name = "${var.project}-emr-core-security-group-${var.environment}"

  description = "Allow inbound outbound traffic for EMR core nodes."
  
  vpc_id = var.vpc_id
  
  tags = var.tags

  revoke_rules_on_delete = true

  # Inbound rule to allow all inbound traffic within the security group itself
  ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    self        = true
  }

  # Outbound rule to allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
