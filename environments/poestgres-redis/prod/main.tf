# RDS Module
module "rds" {
  source = "../../modules/rds"

  name                 = "led-pg-prd"
  db_subnet_group_name = aws_db_subnet_group.rds.name
  security_group_ids   = [aws_security_group.rds.id]
  username             = "admin"

  # Production settings
  instance_class      = "db.t3.small"
  skip_final_snapshot = false
}

# ElastiCache Module
module "elasticache" {
  source = "../../modules/elasticache"

  name               = "led-redis-prd"
  subnet_group_name  = aws_elasticache_subnet_group.redis.name
  security_group_ids = [aws_security_group.redis.id]

  # Production settings
  node_type = "cache.t3.small"
}
