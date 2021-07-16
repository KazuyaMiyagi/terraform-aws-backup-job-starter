resource "aws_iam_role" "main" {
  path               = "/service-role/"
  name               = "${title(var.project_name)}-CodeBuild"
  assume_role_policy = data.aws_iam_policy_document.main_assume_policy.json
}

data "aws_iam_policy_document" "main_assume_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "main_attached_policy" {
  role       = aws_iam_role.main.name
  policy_arn = aws_iam_policy.main.arn
}

resource "aws_iam_policy" "main" {
  name   = "${title(var.project_name)}-CodeBuild-Policy"
  policy = data.aws_iam_policy_document.main.json
}

data "aws_iam_policy_document" "main" {
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      aws_cloudwatch_log_group.main.arn,
      "${aws_cloudwatch_log_group.main.arn}:log-stream:*",
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "backup:ListBackupJobs",
      "backup:DescribeBackupJob",
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "backup:StartBackupJob",
    ]
    resources = [
      "arn:aws:backup:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:backup-vault:*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "iam:PassRole",
    ]
    resources = [
      aws_iam_role.service_role.arn
    ]
  }
}

resource "aws_iam_role" "service_role" {
  path               = "/service-role/"
  name               = "${title(var.project_name)}-AWS-Backup-Service-Role"
  assume_role_policy = data.aws_iam_policy_document.service_role_assume_policy.json
}

data "aws_iam_policy_document" "service_role_assume_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["backup.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "service_role_attached_policy" {
  role       = aws_iam_role.service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
}
