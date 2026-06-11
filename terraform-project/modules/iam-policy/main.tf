# 火山引擎 IAM 策略资源定义
# 用于创建和管理 IAM 权限策略
resource "volcenginecc_iam_policy" "this" {
  policy_name     = var.policy_name
  description     = var.description
  policy_document = var.policy_document
  policy_type     = var.policy_type
}
