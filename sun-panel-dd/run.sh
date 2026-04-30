#!/usr/bin/with-contenv bashio

# 创建持久化目录
mkdir -p /config/dd/sun-panel/conf
mkdir -p /config/dd/sun-panel/uploads
mkdir -p /config/dd/sun-panel/database
mkdir -p /config/dd/sun-panel/runtime

# 移除 /app 下的原始目录并创建软链接
rm -rf /app/conf /app/uploads /app/database /app/runtime
ln -s /config/dd/sun-panel/conf /app/conf
ln -s /config/dd/sun-panel/uploads /app/uploads
ln -s /config/dd/sun-panel/database /app/database
ln -s /config/dd/sun-panel/runtime /app/runtime

# 启动 Sun Panel
cd /app
exec ./sun-panel
