# 根模块变量定义

# Provider 认证配置 - 优先使用环境变量
# 若环境变量未设置，可在 providers.tf 中指定
variable "region" {
  type        = string
  description = "火山引擎区域"
  default     = "cn-guilin-boe"
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
    user_name             = string
    display_name          = string
    description           = string
    email                 = string
    mobile_phone          = string
    groups                = list(string)
    policies              = list(object({ policy_name = string, policy_type = string }))
    tags                  = list(object({ key = string, value = string }))
    enable_login          = bool
    login_allowed         = bool
    password              = string
    password_reset_required = bool
    safe_auth_flag        = bool
    safe_auth_type        = string
    enable_access_key     = bool
    access_key_status     = string
    is_offboarding        = bool
    offboarding_group     = string
  }))
  description = "IAM 用户列表，用于用户全生命周期管理（入职/转岗/离职）"
  default     = [] #...
}
