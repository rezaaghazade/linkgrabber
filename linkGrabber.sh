#!/bin/bash  
#===============================================================================
#
#          FILE: linkGrabber.sh
# 
#         USAGE: ./linkGrabber.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: kernel >  2.6.0 , bash > 4.2.0
#          BUGS: ---
#         NOTES: read it,learn it,share it
#        AUTHOR: |reza.aghazade|  ,  |reza.zah1991@gmail.com|
#  ORGANIZATION: |mine OpenSource Co.|
#       CREATED: ۱۳/۰۷/۱۸ ۰۳:۰۵:۵۶ IRDT
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

checkUrl ()
{
        array=(avi mkv mp4 mp3 pdf odt odp sh deb zip bz2 gz)
	echo ${array[4]}

}	# ----------  end of function checkUrl  ----------
xclipCheck ()
{
	
	wget -o log --spider $1
	rm log
	echo "hi babe $?"
	if [ $? -eq 0 ]
	then
		echo "Address has a destination"
		checkUrl $1
		
	fi
}	# ----------  end of function xclipCheck  ----------

xclipBoardContent=`xclip -o`
if [ -n $xclipBoardContent ]
then
	xclipCheck $xclipBoardContent
fi


