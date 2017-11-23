#!/bin/bash

#离线执行monkey
function offlineMonkey(){
    for index in ${arr_num[*]}; do

        mobile_path=/sdcard/mobile_monkey.sh
        file_name=${path}mobile_monkey.sh
        
        #
        adb -s ${index} shell rm -rf ${mobile_path}
        #将脚本push到手机上
        adb -s ${index} push ${file_name} ${mobile_path}

        #adb shell chmod 777 ${mobile_path}

        #执行脚本
        adb -s ${index} shell source ${mobile_path} &
        # adb shell source ${mobile_path}

        #也可以分开执行，如下
        #adb shell
        #sh ${mobile_path} &

        #
        sleep 3s
        #当开始执行后，查看是否有sh进程，如果有，拔掉数据线，接着后续的就能够离线运行。
        adb -s ${index} shell ps | grep shell
    done
}