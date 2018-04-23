#!/bin/bash

SRC=$3

downloadpath='/root/Download/'
cd $downloadpath
if [ "$2" == "0" ]; then
	echo $1'没有文件'$SRC>> upload.log
  exit 0
else

#删掉些BT中没用的辣鸡文件
find "$SRC" -regextype posix-extended -regex ".*\.(chm|torrent|htm|html|url|nfo|jpg|bmp|png|ico|gif)" -exec rm -f {} \;

path=${SRC##*$downloadpath}
echo $1'准备上传'$path>> upload.log
cd $downloadpath
bash /root/upload.sh $path
exit $3
fi
