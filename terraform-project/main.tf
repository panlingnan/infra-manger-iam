# IAM 用户管理主入口文件
# 使用可复用的 iam-group / iam-user 模块批量管理用户组和用户

# 1. 批量创建 IAM 用户组（必须先于用户创建，确保用户能成功加入用户组）
module "iam_groups" {
  source   = "./modules/iam-group"
  for_each = { for g in var.iam_groups : g.user_group_name => g }

  user_group_name = each.value.user_group_name
  description     = each.value.description
}

# 2. 批量创建 IAM 用户
module "iam_users" {
  source   = "./modules/iam-user"
  for_each = { for user in var.iam_users : user.user_name => user }

  # 显式依赖：保证用户组先于用户创建
  depends_on = [module.iam_groups]

  # 传递用户配置
  user_name             = each.value.user_name
  display_name          = each.value.display_name
  description           = each.value.description
  email                 = each.value.email
  mobile_phone          = each.value.mobile_phone
  groups                = each.value.groups
  policies              = each.value.policies
  tags                  = each.value.tags
  enable_login          = each.value.enable_login
  login_allowed         = each.value.login_allowed
  password              = each.value.password
  password_reset_required = each.value.password_reset_required
  safe_auth_flag        = each.value.safe_auth_flag
  safe_auth_type        = each.value.safe_auth_type
  enable_access_key     = each.value.enable_access_key
  access_key_status     = each.value.access_key_status
  is_offboarding        = each.value.is_offboarding
  offboarding_group     = each.value.offboarding_group
}
