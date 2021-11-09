variable "rolename" {
  type        = string
  description = "The name of the role."
}

variable "policy_arns" {
  type        = list(string)
  description = "List of policy ARNs to attach to the role."
}

variable "delegate_principals" {
  type        = list(string)
  description = "List of principals to allow for AssumeRole."
}
