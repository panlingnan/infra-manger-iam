# 火山引擎 IAM 用户组资源定义
# 用于创建和管理 IAM 用户组
resource "volcenginecc_iam_group" "this" {
  user_group_name = var.user_group_name
  description     = var.description
}
