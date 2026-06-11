# 火山引擎 IAM 项目模块变量定义
variable "project_name" {
  type        = string
  description = "项目名称，必填，长度 1-64 字符"
}

variable "description" {
  type        = string
  description = "项目描述，最多 255 字符"
  default     = ""
}
