#!/bin/sh

echo "Loading configurations from HAOS options..."

# 读取 HAOS 界面的配置，并转为容器内的环境变量
export QYWX_SECRET_KEY=$(jq --raw-output '.QYWX_SECRET_KEY' /data/options.json)
export QYWX_CORPID=$(jq --raw-output '.QYWX_CORPID' /data/options.json)
export QYWX_AGENTID=$(jq --raw-output '.QYWX_AGENTID' /data/options.json)
export QYWX_SECRET=$(jq --raw-output '.QYWX_SECRET' /data/options.json)

echo "Configurations loaded. Starting API service..."

# 执行精准提取出来的原镜像启动程序
exec python /app/qywx.py