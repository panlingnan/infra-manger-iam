# IAM 用户管理主入口文件
# 使用可复用的 iam-user 模块批量管理用户

# 批量创建 IAM 用户
module "iam_users" {
  source   = "./modules/iam-user"
  for_each = { for user in var.iam_users : user.user_name => user }

  # 传递用户配置
  user_name             = each.value.user_name
  display_name          = each.value.display_name
  description           = each.value.description
  email                 = each.value.email
  mobile_phone          = each.value.mobile_phone
  groups                = each.value.groups
  policies              = each.value.policies
  projects              = each.value.projects
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
