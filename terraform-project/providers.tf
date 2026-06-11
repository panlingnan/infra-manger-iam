# 火山引擎 Provider 配置
#
# 凭证管理策略：
# - 本地开发：在 providers.local.tf 中配置 AK/SK（该文件已加入 .gitignore，不会被提交）
# - CI/CD 或生产：使用环境变量注入：
#     export VOLCENGINE_ACCESS_KEY="<your_ak>"
#     export VOLCENGINE_SECRET_KEY="<your_sk>"
#     export VOLCENGINE_REGION="cn-guilin-boe"
#
# 注意：本文件不再声明 provider "volcenginecc" 块，
# 避免与 providers.local.tf 中的默认 provider 配置发生 "Duplicate provider configuration" 冲突。
# 如需在 CI 中使用，请在此处启用以下配置（删除注释），并删除 providers.local.tf。
#
# provider "volcenginecc" {
#   region = "cn-guilin-boe"
#   endpoints = {
#     cloudcontrolapi = "open.stable.volcengineapi-test.com"
#   }
# }
