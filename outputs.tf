data "aws_arn" "codebuild_project" {
  arn = aws_codebuild_project.main.arn
}

output "project_name" {
  value = trimprefix(data.aws_arn.codebuild_project.resource, "project/")
}

output "arn" {
  value = aws_codebuild_project.main.arn
}
