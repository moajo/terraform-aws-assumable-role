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

variable "max_session_duration" {
  type        = number
  description = "The maximum session duration (in seconds) for the role."
  default     = 3600
}
