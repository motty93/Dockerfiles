# docker commands

## docker runのオプションについて

`docker run`でコンテナの生成 & 起動を行います。

```
$ docker run [オプション] イメージ名[:タグ名][引数]
```

この時のオプションを以下にまとめる。

```
## コンテナの生成・起動(単純なオプション)
-a : 標準入力、標準出力、標準エラー出力にアタッチする

--cidfile="ファイル名" : コンテナIDをファイルに出力する

-d, --detach=false : コンテナを生成し、バックグラウンドで実行する

-i, --interactive=false : コンテナの標準入力を開く

-t, --tty=false : tty(端末デバイス)を使う

--name : コンテナ名

## コンテナのバックグラウンド実行
-d, --detach=false : 同上

-u, --user="ユーザー名" : ユーザー名を指定する

--restart=[no | on-failure | on-failure:回数n | always] : コマンドの実行結果によって再起動を行うオプション
  no : 再起動しない
  on-failure : 終了ステータスが０出ない時に再起動する
  on-failure:回数n : 終了ステータスが０出ない時にn回再起動する
  always : 常に再起動する

--rm : コマンド実行完了後にコンテナを自動で削除する

## コンテナのネットワーク設定
--add-host=[ホスト名:IPアドレス] : コンテナの/etc/hostsにホスト名とIPアドレスを定義する

--dns=[IPアドレス] : DNSサーバーのIPアドレス指定

--expose=[ポート番号] : 指定したレンジのポート番号を割り当てる

--mac-address=[MACアドレス] : コンテナのMACアドレスを指定する

--net=[bridge | none | conrainer:<name|id> | host] : コンテナのネットワークを指定する
  bridge : ブリッジ接続を行う
  none : ネットワークに接続しない
  container:[name|id] : 他のコンテナのネットワークを使う
  host : コンテナがホストOSのネットワークを使う

-h, --host="ホスト名" : コンテナ自身のホスト名を指定する

-p, --publish-all=[true | false] : ホストの任意のポートをコンテナに割り当てる

--link=[コンテナ名:エイリアス] : 他のコンテナからアクセスするときの名前

## リソースを指定してコンテナを生成・実行
-c, --cpu-shares=0 : CPUの使用の配分

-m, --memory=[メモリ使用量] : 使用するメモリを制限して実行する

-v, --volume=[ホストのディレクトリ]:[コンテナのディレクトリ] ホストとコンテナのディレクトリを共有

## コンテナを生成・起動する環境を指定
-e, --env=[環境変数] : 環境変数を指定する

--env-file=[ファイル名] : 環境変数をファイルから設定する

--privileged=[true | false] : 特権モードで起動する（ホストのカーネル昨日も操作可）

--read-only=[true | false] : コンテナのファイルシステムを読み込み専用にする

-w, --workdir=[パス] : コンテナの作業ディレクトリを指定する
```

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
