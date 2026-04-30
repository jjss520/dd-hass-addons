# 1. 直接拉取原作者的远程镜像作为基础底包
FROM ghcr.io/jjss520/sms-dashboard-dd:latest

# 2. 切换到 root 用户（防止原镜像默认使用了普通用户，导致我们无权安装包）
USER root

# 3. 安装 jq 工具，用于解析 HAOS 的 options.json 配置文件
# 由于不确定原作者是用 Alpine 还是 Ubuntu/Debian 打包的，这里写了一个兼容写法
RUN if [ -x "$(command -v apk)" ]; then apk add --no-cache jq; \
    elif [ -x "$(command -v apt-get)" ]; then apt-get update && apt-get install -y jq; \
    fi

# 4. 删除自带的 data 目录，并将其软链接到你指定的长路径
RUN rm -rf /app/data && ln -s /data/dd/sms-dashboard /app/data

# 5. 复制并设置我们的启动脚本
COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

# 6. 覆盖原镜像的启动入口，改为执行我们的脚本
ENTRYPOINT ["/app/run.sh"]
