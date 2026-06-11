# 火山引擎 IAM 访问密钥模块输出
output "access_key_id" {
  description = "访问密钥 ID"
  value       = volcenginecc_iam_accesskey.this.access_key_id
  sensitive   = true
}

output "status" {
  description = "访问密钥状态"
  value       = volcenginecc_iam_accesskey.this.status
}
