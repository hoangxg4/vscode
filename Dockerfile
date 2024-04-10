# Sử dụng image base là Ubuntu
FROM ubuntu:latest

# Cập nhật các gói và cài đặt các phần mềm cần thiết
RUN apt-get update && apt-get install -y \
    software-properties-common \
    curl \
    wget \
    git \
    gcc \
    make \
    build-essential \
    apt-transport-https \
    ca-certificates \
    libsecret-1-dev \
    libx11-dev \
    libxkbfile-dev \
    libsqlite3-dev \
    libudev-dev \
    libgtk2.0-dev \
    libgtk-3-dev \
    libnotify-dev \
    libgconf2-dev \
    libsecret-1-dev \
    libxss1 \
    libnss3 \
    libatk1.0-dev \
    libatk-bridge2.0-dev \
    libcups2-dev \
    libdrm-dev \
    libgbm-dev \
    libxkbcommon-dev \
    libxcomposite-dev \
    libxdamage-dev \
    libxfixes-dev \
    libxi-dev \
    libxtst-dev \
    libxrandr-dev

# Thêm repository của VSCode và cài đặt
RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
RUN apt-get update && apt-get install -y code

# Thiết lập thư mục làm việc
WORKDIR /app

# Chạy VSCode khi khởi động container
CMD ["code", "--no-sandbox"]
