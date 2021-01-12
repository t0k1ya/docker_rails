FROM nginx:1.15.8

# インクルード用のディレクトリ内を削除
RUN rm -f /etc/nginx/conf.d/*

# nginx設定ファイルをコンテナにコピー
ADD nginx.conf /etc/nginx/myapp.conf

# ビルド完了後にnginxを起動

CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/myapp.conf
