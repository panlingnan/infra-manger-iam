# 火山引擎 IAM 策略模块输出
output "policy_name" {
  description = "策略名称"
  value       = volcenginecc_iam_policy.this.policy_name
}

output "policy_type" {
  description = "策略类型"
  value       = volcenginecc_iam_policy.this.policy_type
}
