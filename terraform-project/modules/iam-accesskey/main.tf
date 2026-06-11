# 火山引擎 IAM 访问密钥资源定义
# 用于创建和管理 IAM 用户的访问密钥
resource "volcenginecc_iam_accesskey" "this" {
  user_name = var.user_name
  status    = var.status
}
