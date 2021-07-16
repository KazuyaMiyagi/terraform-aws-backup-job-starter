module "this" {
  source                                           = "../../"
  project_name                                     = "backup-job-starter"
  codebuild_environment_variable_backup_vault_name = "Default"
  codebuild_environment_variable_resource_arn      = "arn:aws:rds:<region>:<account number>:<resourcetype>:<name>"
}
