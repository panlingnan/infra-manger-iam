# 火山引擎 IAM 用户模块输出
output "user_id" {
  description = "用户 ID"
  value       = volcenginecc_iam_user.this.user_id
}

output "user_name" {
  description = "用户名"
  value       = volcenginecc_iam_user.this.user_name
}

output "trn" {
  description = "用户 TRN 标识"
  value       = volcenginecc_iam_user.this.trn
}

output "create_date" {
  description = "用户创建时间"
  value       = volcenginecc_iam_user.this.create_date
}

# AK/SK 输出
output "access_key_id" {
  description = "访问密钥 ID"
  value       = length(volcenginecc_iam_accesskey.this) > 0 ? volcenginecc_iam_accesskey.this[0].access_key_id : ""
  sensitive   = true
}

output "access_key_status" {
  description = "访问密钥状态"
  value       = length(volcenginecc_iam_accesskey.this) > 0 ? volcenginecc_iam_accesskey.this[0].status : ""
}
