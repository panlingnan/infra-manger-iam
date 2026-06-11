# 火山引擎 IAM 用户组模块变量定义
variable "user_group_name" {
  type        = string
  description = "用户组名称，必填，长度 1-64 字符"
}

variable "description" {
  type        = string
  description = "用户组描述，最多 255 字符"
  default     = ""
}
