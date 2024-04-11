FROM ubuntu:22.04

RUN apt update && apt install -y curl

# install VS Code (code-server)
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Khởi chạy VS Code khi container được bắt đầu
CMD ["code"]
