# Sử dụng hình ảnh gốc Debian Buster
FROM debian:buster

# Cập nhật danh sách gói và cài đặt các gói cần thiết
RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    gcc \
    g++ \
    make \
    python3 \
    python3-pip \
    nodejs \
    npm

# Cài đặt code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Tạo thư mục cấu hình của code-server
RUN mkdir -p /root/.config/code-server

# Vô hiệu hóa xác thực mật khẩu cho code-server
RUN echo "bind-addr: 0.0.0.0:8080" > /root/.config/code-server/config.yaml && \
    echo "auth: none" >> /root/.config/code-server/config.yaml

# Tiếp tục cổng mặc định của code-server
EXPOSE 8080

# Khởi động code-server
CMD ["code-server", "--config", "/root/.config/code-server/config.yaml"]
