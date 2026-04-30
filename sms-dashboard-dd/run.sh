#!/bin/sh

# 提取 HA 界面的配置
export API_TOKEN=$(jq --raw-output '.api_token' /data/options.json)
export JWT_SECRET=$(jq --raw-output '.jwt_secret' /data/options.json)

echo "Starting SMS Dashboard DD from wrapper..."
echo "Data directory: /data"

# 如果 /app/data 不是软链接，则重新创建
if [ ! -L /app/data ]; then
    echo "Recreating /app/data symlink..."
    rm -rf /app/data
    ln -s /data /app/data
fi

# 执行原镜像真正的启动程序
exec /app/sms-dashboard
