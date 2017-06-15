#!/bin/bash
#This script is to send a mail from PC via GUI interface shell script.
#
#Authour:  ANJI BABU KAPAKYALA
#          IIT KANPUR, INDIA.
#
#Creating dummy file
OUTPUT="/tmp/input.txt"
# create empty file
>$OUTPUT
# cleanup  - add a trap that will remove $OUTPUT
# if any of the signals - SIGHUP SIGINT SIGTERM it received.
trap "rm $OUTPUT; exit" SIGHUP SIGINT SIGTERM
#-----------Get mailid------------------------------
dialog --title "MAIL ID" \
--backtitle "Welcome to ANJI BABU KAPAKAYALA mailing services." \
--inputbox "Enter mailid " 8 60 2>$OUTPUT
# get respose
respose=$?
# make a decsion 
case $respose in
  0)
       echo "OK pressed" 
        ;;
  1)
       exit
#        echo "Cancel pressed." 
        ;;
  255)  
       #   echo "[ESC] key pressed."
esac
# get data stored in $OUPUT using input redirection
mailid=$(<$OUTPUT)
sed -i "/^/d" $OUTPUT
#cat $OUTPUT
#-----------Get Subject------------------------------#
#writing Subject
dialog --title "SUBJECT" \
--backtitle "ANJI BABU KAPAKAYALA" \
--inputbox "Enter Subject " 8 60 2>$OUTPUT
respose=$?
# make a decsion 
case $respose in
  0)
       echo "OK pressed" 
        ;;
  1)
       exit
#        echo "Cancel pressed." 
        ;;
  255)  
       #   echo "[ESC] key pressed."
esac
subject=$(<$OUTPUT)
sed -i "/^/d" $OUTPUT
#-----------Get Message------------------------------#
#writteng Message 
dialog --title "MESSAGE" \
--backtitle "ANJI BABU KAPAKAYALA" \
--inputbox "Type your Message Here: " 8 60 2>$OUTPUT
respose=$?
# make a decsion 
case $respose in
  0) 
# Ok Pressed
  	;;
  1) 
        exit
#  	echo "Cancel pressed." 
  	;;
  255) 
#   echo "[ESC] key pressed."
esac
message=$(<$OUTPUT)
sed -i "/^/d" $OUTPUT
#-----------Ask for Attachments---------------------------#
dialog --backtitle "ANJI BABU KAPAKAYALA" \
--title " Any Attachments ?" \
--yesno "Do You want to attach any file ?  " 8 60 
respose=$?
# make a decsion 
case $respose in
  0) 
#OK pressed
choice="yes"
#---------------------------------
dialog --title " ATTACHMENTS " \
--backtitle "ANJI BABU KAPAKAYALA" \
--inputbox "Give Your Attachemt: " 8 60 2>$OUTPUT
respose=$?
# make a decsion 
case $respose in
  0) 
#  Ok Pressed
  	;;
  1) 
        exit
#  	echo "Cancel pressed." 
  	;;
  255) 
#   echo "[ESC] key pressed."
esac
attachment=$(<$OUTPUT)
sed -i "/^/d" $OUTPUT
#----------------------------------
  	;;
  1) 
 #echo "Cancel pressed." 
  choice="no"
  	;;
  255) 
#   echo "[ESC] key pressed."
esac
#-----------Get Confiramation-------------------------#
dialog --yes-label "Send" \
--backtitle "ANJI BABU KAPAKAYALA" \
--title "Confirmation" \
--yesno "Press Send button to send a mail to $mailid " 8 60 
respose=$?
# make a decsion 
case $respose in
  0) 
#OK pressed
 if [[ $choice == *"yes"* ]]
 then
nohup echo "$message" |mutt -s "$subject" $mailid -a $attachment &>/dev/null & 
 else
nohup echo "$message" |mutt -s "$subject" $mailid &>/dev/null &
 fi
#nohup command &>/dev/null &
  	;;
  1) 
        exit
#  	echo "Cancel pressed." 
  	;;
  255) 
#   echo "[ESC] key pressed."
esac
#-----------Print Progress Bar ---------------------------#
{
    for ((i = 0 ; i <= 100 ; i+=10)); do
        sleep 1
        echo $i
    done
} |dialog --title "Please wait." \
--backtitle "ANJI BABU KAPAKAYALA" \
--gauge "Sending....." 8 60 0
#-----------Print info ---------------------------#
dialog --title "Done." \
--backtitle "Thanks for using ANJI BABU KAPAKAYALA Mailing Services." \
--msgbox "Your mail has been sent . " 8 60 
#sleep 2
#-----------Print info ---------------------------#
# remove $OUTPUT file
rm $OUTPUT
#  --cancel-label "Exit"
#--ok-label "Send"
#REFERENCE:  https://bash.cyberciti.biz/guide/An_input_dialog_box
#================================================================#
#           Written by ANJI BABU KAPAKAYALA                      #
#================================================================#
