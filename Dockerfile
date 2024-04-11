# Sử dụng ảnh base Ubuntu 20.04
FROM ubuntu:20.04

# Cài đặt các gói cần thiết
RUN apt-get update && \
    apt-get install -y \
    sudo \
    snapd && \
    rm -rf /var/lib/apt/lists/*

# Cài đặt Visual Studio Code bằng Snap
RUN snap install --classic code

# Khởi chạy Visual Studio Code
CMD ["code"]
