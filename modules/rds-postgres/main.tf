# KMS key for DB secrets encryption
resource "aws_kms_key" "db_key" {
  description         = "Key used to encrypt DB instance secrets"
  enable_key_rotation = var.kms_key_rotation

  tags = {
    Name = "${var.name}-kms"
  }
}

# Network config for RDS
resource "aws_db_subnet_group" "rds" {
  name       = "${var.name}-db-subnet-group"
  subnet_ids = [aws_subnet.private_1.id, aws_subnet.private_2.id]

  tags = {
    Name = "${upper(var.name)} DB Subnet Group"
  }
}

# RDS PostgreSQL Instance
# TODO: maintenance window config, etc
resource "aws_db_instance" "postgres" {
  identifier = var.name

  allocated_storage             = var.allocated_storage
  apply_immediately             = var.apply_immediately
  db_name                       = "${var.name}-db"
  engine                        = "postgres"
  engine_version                = var.engine_version
  instance_class                = var.instance_class
  manage_master_user_password   = true
  master_user_secret_kms_key_id = aws_kms_key.db_key.key_id
  username                      = var.username
  parameter_group_name          = var.parameter_group_name

  # TODO: add storage encryption settings

  # Network configuration - uses existing resources
  db_subnet_group_name   = aws_db_subnet_group.rds.name
  vpc_security_group_ids = var.security_group_ids
  publicly_accessible    = var.publicly_accessible

  # Backup configuration
  skip_final_snapshot = var.skip_final_snapshot

  tags = {
    Name = var.name
  }
}
