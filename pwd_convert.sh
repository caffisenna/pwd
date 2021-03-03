#!/bin/sh

# 2020.02.20
# RaceManagerから出力されるテキストデータを
# excel形式に変換するスクリプトです。
# 変換データは若干のカラム修正が必要な場合があります。
# mac版のsed(BSD版)のため、オプションパラメータ(-i)が独特です。

# --------------------------------------------
# 使い方
# pwd.sh を実行し
# 当該ファイルをD&Dすれば自動処理が走ります
# --------------------------------------------

echo '---------------------------------'
echo '変換するファイルをD&Dしてください'
echo '---------------------------------'

# ファイル読み込み
read file

# 文字コード変換
nkf -w --overwrite $file
echo "文字コードをutf8に変換しました"

# 置換処理
echo "置換を開始します..."

sed -i '' 's/  */ /g' $file
sed -i '' 's/団//g' $file
sed -i '' 's/第//g' $file
sed -i '' 's/*/*'$'\t/g' $file
sed -i '' 's/ /'$'\t/g' $file
sed -i '' 's/'$'\t'$'\t/'$'\t/g' $file
sed -i '' '/Difference/d' $file
sed -i '' '/SuperTimer/d' $file
sed -i '' 's/AverageHeats/Average'$'\tHeats/g' $file
sed -i '' 's/・//g' $file
sed -i '' 's/^'$'\t//g' $file

echo "変換完了!"
