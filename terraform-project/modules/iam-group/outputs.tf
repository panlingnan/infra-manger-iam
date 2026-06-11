# 火山引擎 IAM 用户组模块输出
output "user_group_name" {
  description = "用户组名称"
  value       = volcenginecc_iam_group.this.user_group_name
}
