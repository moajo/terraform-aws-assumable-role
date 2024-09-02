Creates single IAM role which can be assumed by trusted resources.

```tf
module "role_admin" {
  source      = "git@github.com:moajo/terraform-aws-assumable-role.git?ref=v2.2.0"
  rolename    = "admin"
  policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]

  delegate_principals = [
    "arn:aws:iam::123456789999:user/moajo", # Allow single user
    "123456789999", # Allow all users in this account.
  ]
}
```

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                   | Version |
| ------------------------------------------------------ | ------- |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | ~> 5.0  |

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | ~> 5.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                                          | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                                     | resource |
| [aws_iam_role_policy_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name                                                                                          | Description                                             | Type           | Default | Required |
| --------------------------------------------------------------------------------------------- | ------------------------------------------------------- | -------------- | ------- | :------: |
| <a name="input_delegate_principals"></a> [delegate_principals](#input_delegate_principals)    | List of principals to allow for AssumeRole.             | `list(string)` | n/a     |   yes    |
| <a name="input_max_session_duration"></a> [max_session_duration](#input_max_session_duration) | The maximum session duration (in seconds) for the role. | `number`       | `3600`  |    no    |
| <a name="input_policy_arns"></a> [policy_arns](#input_policy_arns)                            | List of policy ARNs to attach to the role.              | `list(string)` | n/a     |   yes    |
| <a name="input_rolename"></a> [rolename](#input_rolename)                                     | The name of the role.                                   | `string`       | n/a     |   yes    |

## Outputs

| Name                                                        | Description |
| ----------------------------------------------------------- | ----------- |
| <a name="output_role_arn"></a> [role_arn](#output_role_arn) | ARN of role |

<!-- END_TF_DOCS -->
