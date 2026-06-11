# 火山引擎 IAM 用户资源定义
# 用于创建和管理单个 IAM 用户
resource "volcenginecc_iam_user" "this" {
  user_name    = var.user_name
  display_name = var.display_name
  description  = var.description
  email        = var.email
  mobile_phone = var.mobile_phone
  
  # 离职归档逻辑
  groups = var.is_offboarding ? [var.offboarding_group] : var.groups
  
  # 离职时移除所有直接绑定的策略
  policies = var.is_offboarding ? [] : var.policies
  
  tags = var.tags

  # 登录配置 - 离职时禁用登录
  login_profile = var.is_offboarding ? {
    login_allowed = false
  } : (var.enable_login ? {
    login_allowed           = var.login_allowed
    password                = var.password
    password_reset_required = var.password_reset_required
    safe_auth_flag          = var.safe_auth_flag
    safe_auth_type          = var.safe_auth_type
  } : null)
}

# AK/SK 管理 - 仅当 enable_access_key=true 且非离职用户时创建
resource "volcenginecc_iam_accesskey" "this" {
  count     = var.enable_access_key && !var.is_offboarding ? 1 : 0
  user_name = var.user_name
  status    = var.access_key_status
}

# 项目关联 - 待实现
# 注意：volcenginecc 可能需要通过其他资源或 API 实现项目关联
# 这里预留接口，具体实现取决于 volcenginecc 的实际支持
