#!/bin/bash
function getdir(){
	 if [ -f $1 ]
	    then
	        #/usr/local/php/bin/php /www/wwwroot/***/one.php upload:file $1 /share/$1>> upload.log
		/usr/bin/php /www/wwwroot/***/one.php upload:file $1 $1>> upload.log
	        rm -rf $1
	        echo '删除上传完成'$1 >> upload.log
        	exit 0
        fi
    for element in `ls $1`  
    do    
        dir_or_file=$1"/"$element  
        if [ -d $dir_or_file ]  
        then   
            getdir $dir_or_file  
        else 
            i=`expr $i + 1`
            echo $i
            echo $dir_or_file
            #/usr/local/php/bin/php /www/wwwroot/***/one.php upload:file $dir_or_file /share/$dir_or_file >> upload.log
	    /usr/bin/php /www/wwwroot/***/one.php upload:file $dir_or_file $dir_or_file >> upload.log
	    rm -rf $dir_or_file
	    echo '删除完成.'$dir_or_file >> upload.log
	    if [ "$i" == "$length" ]
	         then
	            rm -rf $root_dir
		    echo "上传完成">> upload.log
		    exit 1
	    fi
        fi    
    done
}
root_dir="$1"
length=` ls -lR $1|grep "^-"|wc -l`
i=0
getdir $root_dir
