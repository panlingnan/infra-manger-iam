# Terraform 版本和 Provider 约束
terraform {
  required_version = ">= 1.0.0"

  required_providers {
    volcenginecc = {
      source  = "volcengine/volcenginecc"
      version = ">= 0.0.40"
    }
  }
}
