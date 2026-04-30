#!/bin/sh

# 提取 HA 界面的配置
export API_TOKEN=$(jq --raw-output '.api_token' /data/options.json)
export JWT_SECRET=$(jq --raw-output '.jwt_secret' /data/options.json)

# 【新增这一步】：在 Supervisor 挂载 /data 后，立刻创建子目录
# -p 参数可以自动创建多级目录，且如果目录已存在也不会报错
mkdir -p /data/dd/sms-dashboard

echo "Starting SMS Dashboard DD from wrapper..."
echo "Data directory ensured at /data/dd/sms-dashboard"

# 执行原镜像真正的启动程序
exec /app/sms-dashboard
