# Sử dụng một base image với hệ điều hành Ubuntu hoặc Debian
FROM ubuntu:latest

# Cài đặt các dependencies cần thiết
RUN apt-get update \
    && apt-get install -y \
        wget \
        apt-transport-https \
        gpg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Thêm repository của VSCode và cài đặt VSCode
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
    && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
    && echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list \
    && apt-get update \
    && apt-get install -y \
        code \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Khởi động VSCode
CMD ["code"]
