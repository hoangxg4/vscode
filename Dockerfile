# Sử dụng hình ảnh gốc với các phụ thuộc cần thiết
FROM centos:8

# Cập nhật danh sách gói và cài đặt các gói cần thiết
RUN yum update -y && yum install -y \
    curl \
    git \
    gcc \
    gcc-c++ \
    make \
    epel-release \
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
