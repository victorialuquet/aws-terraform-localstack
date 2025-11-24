# ElastiCache Subnet Group
resource "aws_elasticache_subnet_group" "redis" {
  name       = "${var.name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${upper(var.name)} Subnet Group"
  }
}

# ElastiCache Redis Cluster
resource "aws_elasticache_cluster" "redis" {
  cluster_id           = var.name
  engine               = "redis"
  engine_version       = var.engine_version
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  port                 = 6379

  # Network configuration
  subnet_group_name  = aws_elasticache_subnet_group.redis.name
  security_group_ids = var.security_group_ids

  tags = {
    Name = var.name
  }
}
