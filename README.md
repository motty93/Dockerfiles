# Dockerfile training

## ENTRYPOINTについて
* 存在しないコマンドに関して、docker buildは成功するがdocker run時にエラーで失敗する。ENTRYPOINTは実行可能であるかどうかを保証は出来ない。
