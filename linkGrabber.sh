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
#  REQUIREMENTS: kernel >  2.6.0 , bash > 4.2.0 , zenity > 3.6.0
#          BUGS: ---
#         NOTES: read it,learn it,share it
#        AUTHOR: |reza.aghazade|  ,  |reza.zah1991@gmail.com|
#  ORGANIZATION: |mine OpenSource Co.|
#       CREATED: ۱۳/۰۷/۱۸ ۰۳:۰۵:۵۶ IRDT
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

downloadFile ()
{
	axel -n 33 "$1"	
}	# ----------  end of function downloadFile  ----------
checkUrl ()
{
	echo "in checkURL"
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
				zenity --info --text="Link Detected : $1 --size Of File : $2"	
				if [ $? -eq 0 ]
				then
					FILE=`zenity --file-selection --directory --title="Select a Directory for Saving File"`
					cd $FILE
					downloadFile $1		
				fi
		#	zenity --info --text="Link Detected $1.\n size Of File : $2"	
			fi
		else
			echo "not detected"
		fi
	done
	

}	# ----------  end of function checkUrl  ----------
xclipCheck ()
{
	echo "in xclipCheck"	
	wget -o log --spider $1
	sizeOfFile=`sed -n '5p' log |cut -d ' ' -f 3`
	rm log
	echo "Size : $sizeOfFile"
	if [ $? -eq 0 ]
	then
		echo "Address has a destination"
		checkUrl $1 $sizeOfFile
		
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


