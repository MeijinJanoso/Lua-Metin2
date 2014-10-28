#!/bin/sh

# -------------------------------------- #
# Script to rebuild quest files which    #
# are located in quest_list file.        #
# -------------------------------------- #
# Copyright (C) Ethoard (www.ethoard.tk) #
# -------------------------------------- #

rm -rdf object
rm -f qc.core
rm -f qc.log

while read FILE_LINE;
do
	# echo -e "# ---------------------------------------------------------------------------- #"
	# echo -e "./qc $FILE_LINE"
	./qc $FILE_LINE >> ./qc.log
done < "quest_list"

if [ -r "qc.core" ]; then
	echo -e "Error occurred on compile!\r\n"
else
	echo -e "\r\nSucces all!\r\n"
fi

rm -f qc.core