# -Top 5 processes as far as memory usage is concerned
#echo -e "\e[31;44m***** TOP 5 MEMORY-CONSUMING PROCESSES *****\e[0m"
top_5=`ps -eo pid,%mem,%cpu,comm --sort=-%mem | head -n 6`
echo ""
echo " Top 5 processes as far as memory usage is concerned "
echo "====================================================="
echo ""
echo "$top_5"
echo ""
#================================================#
#    anji babu kapakayaala
#================================================#
