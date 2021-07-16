resource "aws_codebuild_project" "main" {
  name          = var.project_name
  description   = "Start AWS Backup job project for ${var.project_name}"
  build_timeout = 60
  service_role  = aws_iam_role.main.arn

  logs_config {
    cloudwatch_logs {
      status     = "ENABLED"
      group_name = aws_cloudwatch_log_group.main.name
    }
    s3_logs {
      status = "DISABLED"
    }
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = false

    environment_variable {
      name  = "BACKUP_VAULT_NAME"
      type  = "PLAINTEXT"
      value = var.codebuild_environment_variable_backup_vault_name
    }

    environment_variable {
      name  = "RESOURCE_ARN"
      type  = "PLAINTEXT"
      value = var.codebuild_environment_variable_resource_arn
    }

    environment_variable {
      name  = "IAM_ROLE_ARN"
      type  = "PLAINTEXT"
      value = aws_iam_role.service_role.arn
    }
  }

  source {
    type      = "NO_SOURCE"
    buildspec = file("${path.module}/buildspec.yml")
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }
}
