#!/usr/local/bin/python

# -------------------------------------- #
# Script to rebuild quest files which    #
# are located in quest_list file.        #
# -------------------------------------- #
# Copyright (C) Ethoard (www.ethoard.tk) #
# -------------------------------------- #

import os
os.system('rm -rf object')
os.system('rm -f qc.core')
os.system('rm -f qc.log')

succes = ''
failed = ''

for line in file('quest_list'):
	if len(line) > 1:
		if os.system('./qc ' + line):
			print '\r\nError occurred on compile! ' + line[:len(line)-1] + '\r\n'
			failed += line[:len(line)-1] + '; '
			import sys
			sys.exit(-1)
		else:
			succes += line[:len(line)-1] + '; '

if len(failed)>0:
	print '\r\n\r\nSucces: ' + succes
	print '\r\nFailed: ' + failed + '\r\n'
else:
	print '\r\nSucces all!\r\n'

