# 火山引擎 IAM 策略模块变量定义
variable "policy_name" {
  type        = string
  description = "策略名称，必填，长度 1-64 字符"
}

variable "description" {
  type        = string
  description = "策略描述，最多 255 字符"
  default     = ""
}

variable "policy_document" {
  type        = string
  description = "策略文档，JSON 格式"
}

variable "policy_type" {
  type        = string
  description = "策略类型：Custom 或 System"
  default     = "Custom"
}
