# Dockerfile training

## ENTRYPOINTについて
* 存在しないコマンドに関して、docker buildは成功するがdocker run時にエラーで失敗する。ENTRYPOINTは実行可能であるかどうかを保証は出来ない。

## CMDについて
* ENTRYPOINTとの違いは、主に、docker runを行う際に実行されるデフォルトコマンドを指定すること。
* 複数記述した場合には最後のENTRYPOINTの記述が有効となる。

## Dockerfile指定

`docker build -f`でファイルを指定する。

```
$ docker build -f dockerfiles/Dockerfile_test -t test .
```

## ubuntu上でnginx起動

```
$ docker build -f dockerfiles/Dockerfile_image -t sample:nginx
$ docker run -d -p 80:80 sample:nginx
```
