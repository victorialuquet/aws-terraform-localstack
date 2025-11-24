# RDS Module
module "rds" {
  source = "../../../modules/rds-postgres"

  name               = "led-pg-prd"
  subnet_ids         = [aws_subnet.private_1.id, aws_subnet.private_2.id]
  security_group_ids = [aws_security_group.rds.id]
  username           = "admin"

  # Cloud settings
  instance_class      = "db.t3.small"
  skip_final_snapshot = false
}

# ElastiCache Module
module "elasticache" {
  source = "../../../modules/elasticache-redis"

  name               = "led-redis-prd"
  subnet_ids         = [aws_subnet.private_1.id, aws_subnet.private_2.id]
  security_group_ids = [aws_security_group.redis.id]

  # Cloud settings
  node_type = "cache.t3.small"
}
