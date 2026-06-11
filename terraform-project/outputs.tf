# 根模块输出定义

# 所有创建的用户信息
output "iam_user_ids" {
  description = "所有创建的 IAM 用户 ID，key 为用户名"
  value       = { for name, user in module.iam_users : name => user.user_id }
}

output "iam_user_trns" {
  description = "所有创建的 IAM 用户 TRN，key 为用户名"
  value       = { for name, user in module.iam_users : name => user.trn }
}

output "iam_user_create_dates" {
  description = "所有创建的 IAM 用户创建时间，key 为用户名"
  value       = { for name, user in module.iam_users : name => user.create_date }
}

# AK/SK 信息
output "iam_user_access_keys" {
  description = "所有创建的 IAM 用户访问密钥信息，key 为用户名"
  value       = {
    for name, user in module.iam_users : name => {
      access_key_id = user.access_key_id
      status        = user.access_key_status
    }
  }
  sensitive = true
}
