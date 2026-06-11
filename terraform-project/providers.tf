# 火山引擎 Provider 配置
# 支持从环境变量读取凭证：
# - VOLCENGINE_ACCESS_KEY
# - VOLCENGINE_SECRET_KEY
# - VOLCENGINE_REGION
# 或直接在此配置（注意：提交代码时请删除敏感信息）
provider "volcenginecc" {
  endpoints = {
    cloudcontrolapi = "open.stable.volcengineapi-test.com"
  }
  region     = "cn-guilin-boe"
}
