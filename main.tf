terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_iam_role" "main" {
  name                 = var.rolename
  max_session_duration = var.max_session_duration
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : var.delegate_principals
        },
        "Action" : "sts:AssumeRole",
      }
    ]
  })
}
resource "aws_iam_role_policy_attachment" "main" {
  for_each   = toset(var.policy_arns)
  role       = aws_iam_role.main.name
  policy_arn = each.value
}
