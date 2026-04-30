#!/bin/sh

# 提取 HA 界面的配置
export API_TOKEN=$(jq --raw-output '.api_token' /data/options.json)
export JWT_SECRET=$(jq --raw-output '.jwt_secret' /data/options.json)

echo "Starting SMS Dashboard DD from wrapper..."

# 执行原镜像真正的启动程序
exec /app/sms-dashboard
