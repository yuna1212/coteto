#!/bin/bash
. $COTETO_HOME/exception.sh

the_number_of_arguments=$#
file_path=$1

# 유효성 확인
check_the_number_of_arguments $the_number_of_arguments
check_file_type "$file_path"
is_existing_file "$file_path"
if [ $? -eq 0 ]
then
    echo "존재하지 않는 파일입니다."
    exit
fi


# 기록할 현재 시간 가져오기
now_time=`date +'%F %I:%M %p'`
echo "완료 시간: $now_time"

# 파일에서 시작 시간 읽어오기
start_time_line=$(sed -n 2p "$file_path")
start_time=$(echo $start_time_line | grep -oP '(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01]) (0[1-9]|1[012]):[0-5][0-9] [AP]M')
echo $start_time_line

# 시작 시간에서 현재 시간 빼기
now_sec=$(date -d "$now_time" +%s)
start_sec=$(date -d "$start_time" +%s)

sec_diff=$(($now_sec-$start_sec))
min_diff=$(($sec_diff/60))
hour_diff=$(($min_diff/60))
min_diff=$(($min_diff%60))
echo "소요 시간: $hour_diff시간 $min_diff분"

# 10분 단위로 반올림하기
min_apprx=$((($min_diff+5)/10*10))
hour_apprx=$((hour_diff+$min_apprx/60))
min_apprx=$(($min_apprx%60))

consumed_time_format="-분"
if [ $hour_apprx -eq 0 ]
then
    consumed_time_format="$min_apprx분"
elif [ $min_apprx -eq 0 ]
then
    consumed_time_format="$hour_apprx시간"
else
    consumed_time_format="$hour_apprx시간 $min_apprx분"
fi

echo -e "기록한 시간: \e[1;93m$consumed_time_format\e[0m" 

# 파일에 소요 시간 기록
sed -i "3s/.*/소요 시간: $consumed_time_format/" "$file_path"
