output "endpoint" {
  description = "Redis primary endpoint"
  value       = aws_elasticache_cluster.redis.cache_nodes[0].address
}

output "port" {
  description = "Redis port"
  value       = aws_elasticache_cluster.redis.cache_nodes[0].port
}

output "connection_string" {
  description = "Redis connection string"
  value       = "${aws_elasticache_cluster.redis.cache_nodes[0].address}:${aws_elasticache_cluster.redis.cache_nodes[0].port}"
}

output "cluster_id" {
  description = "ElastiCache cluster ID"
  value       = aws_elasticache_cluster.redis.cluster_id
}
