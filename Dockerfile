# Sử dụng hình ảnh chính thức của CodeServer
FROM codercom/code-server:latest

# Đặt biến môi trường cho CodeServer
ENV PASSWORD=11042006
ENV SUDO_PASSWORD=11042006

# Chọn thư mục làm việc
WORKDIR /home/coder/project

# Cài đặt các gói cần thiết (nếu cần)
RUN sudo apt-get update && sudo apt-get install -y \
    git \
    curl \
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/*

# Tùy chỉnh cài đặt CodeServer (nếu cần)
# COPY ./settings.json /home/coder/.local/share/code-server/User/settings.json

# Mở cổng 8080
EXPOSE 8080

# Khởi động CodeServer
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "."]

# Nếu cần thêm quyền sudo, bỏ comment dòng dưới
USER root
