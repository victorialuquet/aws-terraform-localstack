variable "name" {
  description = "Name prefix for RDS resources"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for DB subnet group"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of existing security group IDs"
  type        = list(string)
}

variable "username" {
  description = "Master username for the database"
  type        = string
  default     = "admin"
}

variable "engine_version" {
  description = "PostgreSQL engine version"
  type        = string
  default     = "14"
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
  default     = 20
}

variable "parameter_group_name" {
  description = "Parameter group name"
  type        = string
  default     = "default.postgres14"
}

variable "publicly_accessible" {
  description = "Whether the database should be publicly accessible"
  type        = bool
  default     = false
}

variable "apply_immediately" {
  description = "Apply changes immediately"
  type        = bool
  default     = true
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot on deletion"
  type        = bool
  default     = true
}

variable "kms_key_rotation" {
  description = "Wether or not to enable KMS encryption key rotation"
  type        = bool
  default     = false
}
