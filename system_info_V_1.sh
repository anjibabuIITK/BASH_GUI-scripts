#this Script will show you the reqired details of system information
# this script uses the other scripts as well to show output.
#
#Authour Info:  Mr.ANJI BABU KAPAKAYALA
#               Indian Institute of Technology, Kanpur
#               INDIA.
#               anjibabu480@gmail.com
#
#!/bin/sh
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

#------------------COMMANDS----------------------------------
#IP= `/sbin/ifconfig p1p1 |grep "inet addr" |cut -d: -f2|awk '{print $1}'`
#hostname=`hostnamectl`
#hardwareinfo=`lscpu`
#freememory=`free -h`
#disc_space=`du -h`
#top_5=`ps -eo pid,%mem,%cpu,comm --sort=-%mem | head -n 6`
#------------------COMMANDS----------------------------------

display_result() {
  dialog --title "$1" \
     --backtitle "Written By ANJI BABU KAPAKAYALA " \
    --no-collapse \
    --msgbox "$result" 0 0
}

while true; do
$DIALOG --clear --title "System Information" \
        --backtitle "Written By ANJI BABU KAPAKYALA " \
        --menu "Please select :" 20 51 7 \
        "1" "IP Address" \
        "2" "Disk Space" \
        "3" "Hostname Information" \
        "4" "Free Memory (RAM)" \
        "5" "Hardware Information" \
        "6" "Authour Informations" \
        "7" "TOP 5 Processes " 2> $tempfile

retval=$?

choice=`cat $tempfile`

case $retval in
  0)
#   echo " OK PRESESSED"
  ;;
  1)
    exit
#    echo "Cancel pressed.";;
  ;;
 255)
    exit
#    echo "ESC pressed.";;
esac
  case $choice in
    0 )
      clear
      echo "Program terminated."
      ;;
    1 )
      result=$(sh show_ip.sh)
#      result=$IP
      display_result "System Information"
      ;;
    2 )
      result=$(df -h)
      display_result "Disk Space"
      ;;
    3 )
        result=$(sh hostname_info.sh )
        display_result "Hostname Information"
      ;;
    4)
       result=$(free -h)
       display_result "free memory"
    ;;
    5) result=$(lscpu)
       display_result "Hardware Information"
    ;;
    6)     result=$(sh my_details.sh)
       display_result "Authour Information"
    ;;
    7)
      result=$(sh top_5_processes.sh)
      display_result "TOP 5 PROCESSES LIST"
    ;;
  esac
done 
#=================================================================#
#           Written By ANIJA BABU KAPAKAYALA                      #
#=================================================================#





