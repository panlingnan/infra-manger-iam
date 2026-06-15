# 火山引擎认证配置
# 现在使用环境变量：
# export VOLCENGINE_ACCESS_KEY="your_ak"
# export VOLCENGINE_SECRET_KEY="your_sk"
# export VOLCENGINE_REGION="cn-beijing"

# 若需在此文件中指定，可在 providers.tf 中取消注释相关配置


# ==============================================
# IAM 用户全生命周期管理配置
#
# 使用说明：
#
# 1. 【入职】在 iam_users 列表中添加新用户
# 2. 【转岗】修改列表中现有用户的 groups/policies/tags
# 3. 【离职】设置 is_offboarding = true
#
# 执行 terraform plan/apply 后，Terraform 会自动处理变更
# ==============================================

iam_users = [
  # 示例 1：新入职用户（完整配置）
  {
    user_name             = "NewEmployee"
    display_name          = "新员工张三"
    description           = "新入职开发人员 - 游戏项目组"
    email                 = "zhangsan@example.com"
    mobile_phone          = "13800138000"
    groups                = ["DevTeam", "GameProjectGroup"]  # 通用权限通过用户组继承
    policies              = [                                  # 特定权限直接绑定
      {
        policy_name = "GameProjectFullAccess"
        policy_type = "Custom"
      }
    ]
    projects              = ["GameProject001"]               # 项目关联
    tags                  = [                                  # 标签化管理
      { key = "env", value = "prod" },
      { key = "department", value = "dev" },
      { key = "project", value = "game001" },
      { key = "employee_id", value = "EMP001" }
    ]
    enable_login          = true
    login_allowed         = true
    password              = "InitialPass123!"
    password_reset_required = true  # 强制密码重置
    safe_auth_flag        = true
    safe_auth_type        = "phone,email"
    enable_access_key     = true    # 启用 AK/SK
    access_key_status     = "active"
    is_offboarding        = false
    offboarding_group     = "OffboardedUsers"
  },

  # 示例 2：转岗用户（修改 groups/policies）
  {
    user_name             = "TransferringEmployee"
    display_name          = "转岗员工李四"
    description           = "从开发转岗到运维"
    email                 = "lisi@example.com"
    mobile_phone          = "13800138001"
    groups                = ["OpsTeam"]  # 【转岗】修改用户组
    policies              = [             # 【转岗】修改权限策略
      {
        policy_name = "OpsFullAccess"
        policy_type = "Custom"
      }
    ]
    projects              = ["OpsProject001"]  # 【转岗】修改项目
    tags                  = [
      { key = "env", value = "prod" },
      { key = "department", value = "ops" },  # 【转岗】更新标签
      { key = "project", value = "ops001" },
      { key = "employee_id", value = "EMP002" }
    ]
    enable_login          = true
    login_allowed         = true
    password              = "Password123!"
    password_reset_required = false
    safe_auth_flag        = true
    safe_auth_type        = "phone"
    enable_access_key     = true
    access_key_status     = "active"
    is_offboarding        = false
    offboarding_group     = "OffboardedUsers"
  },

  # 示例 3：离职用户（设置 is_offboarding = true）
  {
    user_name             = "LeavingEmployee"
    display_name          = "离职员工王五"
    description           = "已离职 - 归档"
    email                 = "wangwu@example.com"
    mobile_phone          = "13800138002"
    groups                = ["DevTeam"]  # 会被自动替换为离职分组
    policies              = [            # 会被自动清空
      {
        policy_name = "FullAccess"
        policy_type = "System"
      }
    ]
    projects              = ["Project001"]
    tags                  = [
      { key = "env", value = "prod" },
      { key = "department", value = "dev" },
      { key = "employee_id", value = "EMP003" },
      { key = "status", value = "offboarded" }
    ]
    enable_login          = true  # 会被自动禁用
    login_allowed         = true
    password              = "Password123!"
    password_reset_required = false
    safe_auth_flag        = false
    safe_auth_type        = ""
    enable_access_key     = true  # 会被自动处理
    access_key_status     = "active"
    is_offboarding        = true  # 关键：设置为 true
    offboarding_group     = "OffboardedUsers"
  }
]
