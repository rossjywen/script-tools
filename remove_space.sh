#!/bin/bash
# Ross Wen 
# 2022/1/31
# 把当前目录中 给定的开始字符和结尾字符的名字中间的空格去掉
# -s 参数指定文件名开头的字符或字符串 会用在正则匹配中
# -e 参数指定文件名结尾的字符或字符串 会用在正则匹配中

print_help()
{
	echo "remove_space usage:" 
	echo "   [-h print help info]"
	echo "   [-s set name start character or string]"
	echo "   [-e set name end character or string]"
}

if [ $# -lt 2 ]
then
	echo parameter is needed see -h
	print_help
	exit 1
elif ! [[ "$1" =~ ^-. ]]
then
	echo parameter in uncorrect form
	print_help
	exit 2
fi

name_start=""
name_end=""
while getopts hs:e: arg
do
	case $arg in
	h)
		print_help
		exit 0;;
	s)
		name_start=$OPTARG;;
	e)
		name_end=$OPTARG;;
	*)
		echo unknown argv
		exit 3;;
	esac
done

echo name_start $name_start
echo name_end $name_end

IFS_backup=$IFS
IFS='\n'

count=0
origin_filename=""
modified_filename=""
for file in ./${name_start}*${name_end}
do
	#if [[ $file =~ .*${name_start}.*${name_end} ]]
	#then
		count=$[$count+1]
		origin_filename=${file#./}
		modified_filename=$(echo $origin_filename | sed -ne "s/ /-/gp")
		#echo origin file name : $origin_filename
		#echo modify file name : $modified_filename
		if [ -n "$modified_filename" ]
		then
			mv "$origin_filename" "$modified_filename"
		fi

	#else
	#	echo ignore it
	#fi
done
echo count $count
IFS=$IFS_backup


