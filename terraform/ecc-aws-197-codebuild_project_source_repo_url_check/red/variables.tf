variable "default-region" {
  type        = string
  description = "Default region for resources will be created"
}

variable "profile" {
  type        = string
  description = "Profile name configured before running apply"
}

variable "github_location" {
  type        = string
}

variable "bitbucket_location" {
  type        = string
}

variable "token" {
  type        = string
}

variable "user_password" {
  type        = string
}

variable "user_name" {
  type        = string
}