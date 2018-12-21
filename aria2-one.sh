#!/bin/bash
path=$3
downloadpath='/root/Download'
if [ $2 -eq 0 ]
        then
                exit 0
fi
while true; do  #提取下载文件根路径，如把/root/downloads/a/b/c/d.jpg变成/root/Download
filepath=$path
path=${path%/*};
if [ "$path" = "$downloadpath" ] && [ $2 -eq 1 ]  #如果下载的是单个文件
    then
    /usr/bin/php /www/wwwroot/one.hsru.tk/one.php upload:file "$filepath" /upload/ >> /root/upload.log
    rm -rf "$filepath"
    echo '删除完成'"$filepath" >> upload.log
    exit 0
elif [ "$path" = "$downloadpath" ]   #文件夹
    then
    /usr/bin/php /www/wwwroot/one.hsru.tk/one.php  upload:folder "$filepath"/ /upload/"${filepath##*/}"/ >> /root/upload.log
    rm -rf "$filepath"/ 
    echo '删除完成'"$filepath"/ >> upload.log
    exit 0
fi
done
