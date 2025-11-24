output "endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.postgres.endpoint
}

output "address" {
  description = "RDS instance address (hostname)"
  value       = aws_db_instance.postgres.address
}

output "port" {
  description = "RDS instance port"
  value       = aws_db_instance.postgres.port
}

output "database_name" {
  description = "Database name"
  value       = aws_db_instance.postgres.db_name
}

output "username" {
  description = "Master username"
  value       = aws_db_instance.postgres.username
  sensitive   = true
}

output "id" {
  description = "RDS instance ID"
  value       = aws_db_instance.postgres.id
}
