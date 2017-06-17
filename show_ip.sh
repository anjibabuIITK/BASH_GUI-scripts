IP=`/sbin/ifconfig p1p1 |grep "inet addr" |cut -d: -f2|awk '{print $1}'`
#echo ""
#echo -e "\e[31;44m***** IP ADDRESS INFORMATION *****\e[0m"
echo "Your IP address : $IP"
#=====================================#
#   Written by ANJI BABU KAPAKAYALA   #
#=====================================#

