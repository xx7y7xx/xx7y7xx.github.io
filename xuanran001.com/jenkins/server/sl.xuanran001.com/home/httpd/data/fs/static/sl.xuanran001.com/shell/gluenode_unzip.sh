#/bin/sh
# $1 = xxx.zip
#mobile="/home/httpd/mobile"

#zip_path =$mobile/$1

#if () then
        # 检查 /home/httpd/mobile > /home/httpd/data/fs/static/www.hellojia.com/mob 这个软连接是否存在,如果没有创建
        # ln -s /home/httpd/mobile /home/httpd/data/fs/static/www.hellojia.com/

#7z X $mobile zip_patha

echo $1
filename=`echo "$1"`                                            #filename =00569f13-f627-426f-bff7-eba8b8d70fb3.zip
filedirname=`echo "$1" |cut -d "." -f 1`                #filedirname=00569f13-f627-426f-bff7-eba8b8d70fb3
dir=/home/httpd/mobile/
www_xuanran=/home/httpd/data/fs/static/www.xuanran001.com/
sl_xuanran=/home/httpd/data/fs/static/sl.xuanran001.com/
file=$dir$filename               #/home/httpd/mobile/00569f13-f627-426f-bff7-eba8b8d70fb3.zip
ldir=$dir$filedirname           #/home/httpd/mobile/00569f13-f627-426f-bff7-eba8b8d70fb3
dirdata=${dir}data/               #/home/httpd/mobile/data/
dirpublic=${dir}public/          #/home/httpd/mobile/public/
# 基础目录的初始化
# 首先判断 /home/httpd/mobile 在不在，没有就创建出来.
test -d $dir ||mkdir -p $dir
test -d $dirdata ||mkdir -p $dirdata
test -d $dirpublic ||mkdir -p $dirpublic
# 判断 /home/httpd/data/fs/static/www.xuanran001.com/ 在不在，没有创建出来
test -d  $www_xuanran ||mkdir -p $www_xuanran
# 判断 /home/httpd/mobile ->/home/httpd/data/fs/static/www.xuanran001.com/mobile 在不在，没有创建
test -e ${www_xuanran}mobile ||ln -s $dir ${www_xuanran}mobile
# 判断 /home/httpd/data/fs/static/www.xuanran001.com/ ->/home/httpd/data/fs/static/sl.xuanran001.com 在不在，没有创建
test -e $sl_xuanran ||ln -s $www_xuanran $sl_xuanran
# unzip
unzip -o -d $ldir $file
if [ ! $? -eq 0 ];then
        echo "ERROR  unzip has something wrong ,please pay attention to checking it." #&>$log
        exit 1
else
        echo " unzip is ok" # &>$log
fi
#delete zip
rm  -f  $file            #rm -f     /home/httpd/mobile/xxx.zip

# 移动UUID/data/*  到/home/httpd/mobile/data/ 目录下
#mv -f ${ldir}/data/*    $dirdata
cp -Rpf ${ldir}/data/*    $dirdata
# 移动UUID/public/*  到/home/httpd/mobile/public/ 目录下
#mv -f ${ldir}/public/*  $dirpublic
cp -Rpf  ${ldir}/public/*  $dirpublic
# 删除 UUID/data 和 UUID/public
rm -rf ${ldir}/data  ${ldir}/public
# 创建/home/httpd/mobile/data/ -> UUID/data
ln -s  $dirdata  ${ldir}/data
# 创建/home/httpd/mobile/public/ -> UUID/public
ln -s  $dirpublic  ${ldir}/public

# lndir=/home/httpd/data/fs/static/www.hellojia.com/mobile

exit 0

