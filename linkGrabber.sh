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
	link=`echo $1`
	declare -a array=('avi' 'mkv' 'mp4' 'mp3' 'pdf' 'odt' 'odp' 'sh' 'deb' 'zip' 'bz2' 'gz')
	extension=`echo ${link##*.}`
	index=0
	for i in `echo ${array[@]}`
	do
		if [ $i==$extension ]
		then
			if [ $index -eq 0 ]
			then
				index=$((++index))
				echo "extension Detected,"
			fi
		else
			echo "not detected"
		fi
	done
	

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

[ -x /usr/bin/zenity ]
if [ $? -ne 0 ]
then
	echo "Zenity not Found,Plz install it first"
	exit 1
fi
xclipBoardContent=`xclip -o`
if [ -n $xclipBoardContent ]
then
	xclipCheck $xclipBoardContent
fi


