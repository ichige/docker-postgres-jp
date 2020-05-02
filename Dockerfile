FROM postgres:latest
# 日本語ロケールを追加
RUN localedef -i ja_JP -c -f UTF-8 -A /usr/share/locale/locale.alias ja_JP.UTF-8
