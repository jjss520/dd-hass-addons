ARG BUILD_FROM
FROM $BUILD_FROM

# 安装必需的依赖工具
RUN apk add --no-cache jq wget bash

# 创建并进入工作目录
WORKDIR /app

# 根据构建时的架构，动态下载正确的二进制程序
ARG BUILD_ARCH
RUN if [ "${BUILD_ARCH}" = "aarch64" ]; then \
        BINARY_URL="https://github.com/jjss520/sms-dashboard-dd/releases/latest/download/sms-dashboard-linux-arm64"; \
    elif [ "${BUILD_ARCH}" = "armv7" ]; then \
        BINARY_URL="https://github.com/jjss520/sms-dashboard-dd/releases/latest/download/sms-dashboard-linux-arm"; \
    else \
        BINARY_URL="https://github.com/jjss520/sms-dashboard-dd/releases/latest/download/sms-dashboard-linux-amd64"; \
    fi && \
    wget -O sms-dashboard $BINARY_URL && \
    chmod +x sms-dashboard

# 将程序默认的数据目录软链接到我们要持久化存储的目标目录
RUN ln -s /data /app/data

# 复制启动脚本并赋予执行权限
COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

# 启动命令
CMD [ "/app/run.sh" ]
