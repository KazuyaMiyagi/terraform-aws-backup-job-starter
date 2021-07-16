variable "project_name" {
  type        = string
  description = "CodeBuild Project name"
  default     = "backup-job-starter"
}

variable "codebuild_environment_variable_backup_vault_name" {
  type        = string
  description = "The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They con-sist of lowercase letters, numbers, and hyphens."
  default     = "Default"
}

variable "codebuild_environment_variable_resource_arn" {
  type        = string
  description = "An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on the resource type."
}
