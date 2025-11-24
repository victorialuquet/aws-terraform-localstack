variable "name" {
  description = "Name prefix for ElastiCache resources"
  type        = string
}

variable "subnet_group_name" {
  description = "Existing ElastiCache subnet group name"
  type        = string
}

variable "security_group_ids" {
  description = "List of existing security group IDs"
  type        = list(string)
}

variable "engine_version" {
  description = "Redis engine version"
  type        = string
  default     = "7.0"
}

variable "node_type" {
  description = "ElastiCache node type"
  type        = string
  default     = "cache.t3.micro"
}

variable "num_cache_nodes" {
  description = "Number of cache nodes"
  type        = number
  default     = 1
}

variable "parameter_group_name" {
  description = "Redis parameter group name"
  type        = string
  default     = "default.redis7"
}
