# 根模块变量定义

# Provider 认证配置 - 优先使用环境变量
# 若环境变量未设置，可在 providers.tf 中指定
variable "region" {
  type        = string
  description = "火山引擎区域"
  default     = "cn-beijing"
}

# ==============================================
# IAM 用户组管理
# 集中声明所有会被 iam_users 引用的用户组
# 包括业务用户组（如 infra-manager-user-group）和离职归档组（如 OffboardedUsers）
# ==============================================
variable "iam_groups" {
  type = list(object({
    user_group_name = string
    description     = optional(string, "")
  }))
  description = "IAM 用户组列表，会被 iam_users 中的 groups / offboarding_group 引用"
  default     = []
}

# ==============================================
# IAM 用户全生命周期管理
# 三个场景的使用方式：
#
# 1. 入职（Onboarding）：在列表中添加新用户
# 2. 转岗（Transfering）：修改现有用户的 groups/policies/tags
# 3. 离职（Offboarding）：设置 is_offboarding = true
# ==============================================
variable "iam_users" {
  type = list(object({
    user_name               = string
    display_name            = optional(string, "")
    description             = optional(string, "")
    email                   = optional(string, "")
    mobile_phone            = optional(string, "")
    groups                  = optional(list(string), [])
    policies                = optional(list(object({ policy_name = string, policy_type = string })), [])
    tags                    = optional(list(object({ key = string, value = string })), [])
    enable_login            = optional(bool, false)
    login_allowed           = optional(bool, false)
    password                = optional(string, "")
    password_reset_required = optional(bool, false)
    safe_auth_flag          = optional(bool, false)
    safe_auth_type          = optional(string, "")
    enable_access_key       = optional(bool, false)
    access_key_status       = optional(string, "inactive")
    is_offboarding          = optional(bool, false)
    offboarding_group       = optional(string, "")
  }))
  description = "IAM 用户列表，用于用户全生命周期管理（入职/转岗/离职）"
  default     = [] #....
}
