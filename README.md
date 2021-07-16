AWS Backup job starter Terraform module
====================================================================================================

This terraform module start an AWS Backup job in CodeBuild

Usage
----------------------------------------------------------------------------------------------------

```hcl
module "backup-job-starter" {
  source                                           = "KazuyaMiyagi/backup-job-starter/aws"
  project_name                                     = "backup-job-starter"
  codebuild_environment_variable_backup_vault_name = "Default"
  codebuild_environment_variable_resource_arn      = "arn:aws:rds:<region>:<account number>:<resourcetype>:<name>"
}
```

Examples
----------------------------------------------------------------------------------------------------

* [Simple](https://github.com/KazuyaMiyagi/terraform-aws-backup-job-starter/tree/main/examples/simple)

Requirements
----------------------------------------------------------------------------------------------------

| Name      | Version    |
|-----------|------------|
| terraform | >= 0.12.\* |
| aws       | >= 3.12.\* |

Providers
----------------------------------------------------------------------------------------------------

| Name | Version    |
|------|------------|
| aws  | >= 3.12.\* |

Inputs
----------------------------------------------------------------------------------------------------

| Name                                                  | Description                                        | Type     | Default                | Required |
|-------------------------------------------------------|----------------------------------------------------|----------|------------------------|:--------:|
| project_name                                          | CodeBuild Project name                             | `string` | `"backup-job-starter"` | no       |
| codebuild\_environment\_variable\_backup\_vault\_name | CodeBuild BACKUP\_VAULT\_NAME environment variable | `string` | `"Default"`            | no       |
| codebuild\_environment\_variable\_resource\_arn       | CodeBuild RESOURCE\_ARN environment variable       | `string` | None                   | yes      |


Outputs
----------------------------------------------------------------------------------------------------

| Name          | Description            |
|---------------|------------------------|
| project\_name | CodeBuild project name |
| arn           | CodeBuild project arn  |



License
----------------------------------------------------------------------------------------------------

Apache 2 Licensed. See LICENSE for full details.
