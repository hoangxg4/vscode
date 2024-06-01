# Sử dụng base image chính thức của Jupyter với JupyterLab
FROM jupyter/base-notebook:latest

# Tạo một người dùng mới không phải root
ARG NB_USER=jovyan
ARG NB_UID=1000
ARG NB_GID=100

USER root

# Cài đặt sudo để có thể sử dụng su
RUN apt-get update && \
    apt-get install -y sudo && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Tạo người dùng không phải root và thêm vào sudo group
RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER && \
    echo "$NB_USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$NB_USER && \
    chmod 0440 /etc/sudoers.d/$NB_USER

# Đặt người dùng mới là người dùng mặc định khi chạy container
USER $NB_USER

# Thiết lập thư mục làm việc
WORKDIR /home/$NB_USER

# Cài đặt JupyterLab
RUN pip install jupyterlab

# Expose port để truy cập JupyterLab
EXPOSE 8888

# Chạy JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
