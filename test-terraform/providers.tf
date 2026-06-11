# 火山引擎 Provider 配置
# 支持从环境变量读取凭证：
# - VOLCENGINE_ACCESS_KEY
# - VOLCENGINE_SECRET_KEY
# - VOLCENGINE_REGION
provider "volcenginecc" {
  # 若环境变量未设置，可在此指定
  # access_key = "your_ak"
  # secret_key = "your_sk"
  # region     = "cn-beijing"
}
