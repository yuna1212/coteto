#!/bin/bash
. $COTETO_HOME/exception.sh

the_number_of_arguments=$#
file_path=$1

# 유효성 확인 
check_the_number_of_arguments $the_number_of_arguments
check_file_type "$file_path"
is_existing_file "$file_path"
if [ $? -eq 1 ]
then
    echo "이미 존재하는 파일입니다."
    exit
fi

# 기록할 현재 시간 가져오기
now=`date +'%F %I:%M %p'`
echo "시작시간: $now"

# 현재 시간을 새로운 파일에 기록하고 vi로 열기
template="\"\"\"\n시작 시간: $now\n소요 시간: \n풀이 방법:\n\"\"\"\n"
echo -e "$template" > "$file_path"
