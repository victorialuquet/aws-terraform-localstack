# RDS Module
module "rds" {
  source = "../../../modules/rds-postgres"

  name                = "led-pg"
  subnet_ids          = [aws_subnet.private_1.id, aws_subnet.private_2.id]
  security_group_ids  = [aws_security_group.rds.id]
  username            = "admin"
  instance_class      = "db.t3.micro"
  skip_final_snapshot = true
}

# ElastiCache Module
module "elasticache" {
  source = "../../../modules/elasticache-redis"

  name               = "led-redis"
  subnet_ids         = [aws_subnet.private_1.id, aws_subnet.private_2.id]
  security_group_ids = [aws_security_group.redis.id]
  node_type          = "cache.t3.micro"
}
