# 火山引擎 IAM 访问密钥模块变量定义
variable "user_name" {
  type        = string
  description = "用户名称，必填"
}

variable "status" {
  type        = string
  description = "访问密钥状态：active 或 inactive"
  default     = "active"
}
