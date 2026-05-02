FROM kukudemajia/qywx_api:20210126

USER root

# 安装 jq 工具，用于解析 HAOS 配置文件
RUN if [ -x "$(command -v apk)" ]; then apk add --no-cache jq; \
    elif [ -x "$(command -v apt-get)" ]; then apt-get update && apt-get install -y jq; \
    fi

# 复制启动脚本并赋予执行权限
COPY run.sh /run.sh
RUN chmod +x /run.sh

# 劫持原镜像的启动入口，改为执行我们的配置脚本
ENTRYPOINT ["/run.sh"]