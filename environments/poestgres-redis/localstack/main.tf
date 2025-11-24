# RDS Module
module "rds" {
  source = "../../../modules/rds-postgres"

  name                 = "led-pg"
  db_subnet_group_name = aws_db_subnet_group.rds.name
  security_group_ids   = [aws_security_group.rds.id]
  username             = "admin"
  instance_class       = "db.t3.micro"
  skip_final_snapshot  = true
}

# ElastiCache Module
module "elasticache" {
  source = "../../../modules/elasticache-redis"

  name               = "led-redis"
  subnet_group_name  = aws_elasticache_subnet_group.redis.name
  security_group_ids = [aws_security_group.redis.id]
  node_type          = "cache.t3.micro"
}
