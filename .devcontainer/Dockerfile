FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# タイムゾーン設定
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

# nginx と基本パッケージのインストール
RUN apt-get update && apt-get install -y \
    nginx \
    curl \
    git \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# nginx設定ディレクトリの準備
RUN mkdir -p /etc/nginx/sites-available /etc/nginx/sites-enabled

# デフォルトのnginx設定を削除
RUN rm -f /etc/nginx/sites-enabled/default

# カスタムnginx設定
COPY nginx.conf /etc/nginx/sites-available/default
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# nginxをフォアグラウンドで実行する設定
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# 作業ディレクトリ
WORKDIR /workspace

# nginx起動スクリプト
COPY start-nginx.sh /usr/local/bin/start-nginx.sh
RUN chmod +x /usr/local/bin/start-nginx.sh

USER vscode
