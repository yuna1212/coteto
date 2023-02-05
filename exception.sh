#!/bin/bash
check_the_number_of_arguments() {
# $1: 매개변수 개수
    if [ $1 -lt 1 ]
    then
        echo "err: 첫번째 argument로 파일 이름이 필요합니다."
        exit
    elif [ $1 -gt 1 ]
    then
        echo "err: argument로 하나의 파일 이름만 가능합니다."
        exit
    fi
}

check_file_type() {
# $1: 파일 path
    file_path=$1
    regex="\.py$"
    if [[ $file_path =~ $regex ]]
    then
        return
    else
        echo "err: 파일의 확장자는 반드시 .py 여야 합니다"
        exit
    fi
}

is_existing_file() {
# $1: 파일 path
    file_path=$1
    if [ -e "$file_path" ]
    then
        return 1
    else
        return 0
    fi
}
