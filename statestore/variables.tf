variable "region" {
  description = "The AWS region"
  type        = string
  default     = ""
}

variable "env" {
  description = "The deployment environment (e.g., 'dev', 'prod')"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "The project name"
  type        = string
  default     = ""
}
