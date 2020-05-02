# Postgres JP イメージ

**postgres** 最新版で、日本語のロケールを利用できるようにする。  
なお、**postgres** では、データベースのデフォルトでは `ja_JP.utf8` を設定出来ない仕様となっている。  

- [参考ドキュメント](https://www.postgresql.jp/document/11/html/multibyte.html)

ロケールを日本語にすることで、ソート順などで恩恵を受けることが出来るようだ。  
デフォルトは `en_US.utf8` となっているが、それでも困らないことも多々ある。

## build

`Dockerfile` では、単純に `ja_JP.utf8` を利用できるようにロケールに追加している。  
OSに存在しないロケールは指定できないので注意すること。

```bash
docker build -t manson/postgres:1.0 .
```

## run

```bash
docker run -it \
  --name postgres1 \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -d manson/postgres:1.0
```

## createdb

**postgres** では、データベース別にロケールを設定することが出来る。  
デフォルトでと違うロケールを設定する場合は、 `template0` を指定する必要がある。

```bash
createdb -l ja_JP.utf8 -T template0 dbname
```
