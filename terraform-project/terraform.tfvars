# ==============================================
# IAM 用户组（先于用户创建）
# 集中声明所有会被 iam_users 使用的用户组：
# - 业务组：infra-manager-user-group
# - 离职归档组：OffboardedUsers
# ==============================================
iam_groups = [
  {
    user_group_name = "infra-manager-user-group"
    description     = "基础设施管理员用户组"
  },
  {
    user_group_name = "OffboardedUsers"
    description     = "离职员工归档组：用户进入此组后将自动清空策略并禁用登录"
  }
]

iam_users = [
  {
    user_name               = "user新入职12345"
    display_name            = "新员工姓名"
    description             = "员工描述"
    email                   = "153@163.com"
    mobile_phone            = "15306554210"
    groups                  = ["infra-manager-user-group"]
    policies = [
      {
        policy_name = "ECSFullAccess"
        policy_type = "System"
      }
    ]
    tags = [
      { key = "env", value = "prod" },
      { key = "department", value = "dev" }
    ]
    enable_login            = true
    login_allowed           = true
    password                = "123456abc@!AAzzdd12"
    password_reset_required = false
    safe_auth_flag          = false
    safe_auth_type          = "phone"
    enable_access_key       = false
    access_key_status       = "active"
    is_offboarding          = false
    offboarding_group       = "OffboardedUsers"
  },
  {
    user_name               = "user新入职234"
    display_name            = "新员工姓名"
    description             = "员工描述"
    email                   = "153@163.com"
    mobile_phone            = "15306554210"
    groups                  = ["infra-manager-user-group"]
    policies = [
      {
        policy_name = "ECSFullAccess"
        policy_type = "System"
      }
    ]
    tags = [
      { key = "env", value = "prod" },
      { key = "department", value = "dev" }
    ]
    enable_login            = true
    login_allowed           = true
    password                = "123456abc@!AAzzdd12"
    password_reset_required = false
    safe_auth_flag          = false
    safe_auth_type          = "phone"
    enable_access_key       = false
    access_key_status       = "active"
    is_offboarding          = false
    offboarding_group       = "OffboardedUsers"
  },
  {
    # 离职员工：设置 is_offboarding = true，系统会自动：
    #   1. 将用户组改为 offboarding_group
    #   2. 清空策略
    #   3. 禁用登录
    #   4. 处理访问密钥
    user_name         = "离职员工用户名54321"
    is_offboarding    = true
    offboarding_group = "OffboardedUsers"
  }
]
