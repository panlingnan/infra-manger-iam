# 火山引擎 IAM 项目资源定义
# 用于创建和管理 IAM 项目
resource "volcenginecc_iam_project" "this" {
  project_name = var.project_name
  description  = var.description
}
