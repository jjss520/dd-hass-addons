#!/usr/bin/env bash

echo "Loading configurations..."

# 1. 从 HAOS 提取界面的配置作为环境变量
export API_TOKEN=$(jq --raw-output '.api_token' /data/options.json)
export JWT_SECRET=$(jq --raw-output '.jwt_secret' /data/options.json)

# 2. 【最关键的一步】确保物理数据目录存在
# 这一步必须做，否则软链接会指向一个不存在的文件夹导致报错
TARGET_DIR="/data"
echo "Ensuring data directory exists at $TARGET_DIR..."
mkdir -p "$TARGET_DIR"

echo "Starting SMS Dashboard DD..."

# 3. 启动主程序
exec /app/sms-dashboard
