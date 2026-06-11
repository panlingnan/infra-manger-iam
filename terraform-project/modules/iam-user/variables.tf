# 火山引擎 IAM 用户模块变量定义
variable "user_name" {
  type        = string
  description = "IAM 用户名，必填，长度 1-64 字符"
}

variable "display_name" {
  type        = string
  description = "用户显示名称，长度 1-128 字符"
  default     = ""
}

variable "description" {
  type        = string
  description = "用户描述，最多 255 字符"
  default     = ""
}

variable "email" {
  type        = string
  description = "用户邮箱地址"
  default     = ""
}

variable "mobile_phone" {
  type        = string
  description = "用户手机号"
  default     = ""
}

variable "groups" {
  type        = list(string)
  description = "用户所属的用户组列表"
  default     = []
}

variable "policies" {
  type = list(object({
    policy_name = string
    policy_type = string
  }))
  description = "用户的权限策略列表"
  default     = []
}

# 标签化管理
variable "tags" {
  type = list(object({
    key   = string
    value = string
  }))
  description = "用户的资源标签列表"
  default     = []
}

# 登录相关配置
variable "enable_login" {
  type        = bool
  description = "是否启用控制台登录"
  default     = false
}

variable "login_allowed" {
  type        = bool
  description = "是否允许登录"
  default     = true
}

variable "password" {
  type        = string
  description = "登录密码，enable_login=true 时必填"
  default     = ""
  sensitive   = true
}

variable "password_reset_required" {
  type        = bool
  description = "首次登录是否需要重置密码"
  default     = true
}

variable "safe_auth_flag" {
  type        = bool
  description = "是否启用登录保护"
  default     = false
}

variable "safe_auth_type" {
  type        = string
  description = "登录保护类型：phone, email, vmfa，多个用逗号分隔"
  default     = ""
}

# AK/SK 管理
variable "enable_access_key" {
  type        = bool
  description = "是否为用户创建访问密钥"
  default     = false
}

variable "access_key_status" {
  type        = string
  description = "访问密钥状态：active 或 inactive"
  default     = "active"
}

# 离职归档配置
variable "is_offboarding" {
  type        = bool
  description = "是否为离职用户"
  default     = false
}

variable "offboarding_group" {
  type        = string
  description = "离职用户归档分组"
  default     = "OffboardedUsers"
}
