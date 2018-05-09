#!/bin/sh

START=$PWD

HERE=$(cd $(dirname $(readlink $0 || echo $0)) && pwd)
cd $HERE

OUT=index.html

cat > $OUT << HEADER
<html>
  <head>
    <title>Index of binary-pkgs</title>
  </head>
  <body>
    <h1>Index of binary-pkgs</h1>
HEADER

for item in *
do
  if [ -r "$item" ]
  then
    echo "    <a href=\"$item\">$item</a><br/>" >> $OUT
  fi
done

cat >> $OUT << FOOTER
  </body>
</html>
FOOTER

cd $START
