ARG BUILD_FROM
FROM $BUILD_FROM

# 安装依赖
RUN apk add --no-cache \
    wget \
    tar

# 设置工作目录
WORKDIR /app

# 下载并安装 Sun Panel DD
RUN wget -O sun-panel.tar.gz https://github.com/jjss520/sun-panel-dd/releases/latest/download/sun-panel-linux-amd64.tar.gz && \
    tar -xzf sun-panel.tar.gz && \
    rm sun-panel.tar.gz && \
    chmod +x sun-panel

# 暴露端口
EXPOSE 3002

# 复制启动脚本
COPY run.sh /
RUN chmod a+x /run.sh

CMD ["/run.sh"]
