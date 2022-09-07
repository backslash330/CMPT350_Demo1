#################################
# Demo 1 Part 1                 #
# Author: Quinn Baker           #
# Date: September 14, 2022      #
#                               #
# Purpose: To demonstrate the   #
# ability to run a basic MIPS   #
# program in the spim and       #
# qtspim programs, and to print #
# a "hello world" message       #
################################# 

#The data section reserves memory locations for future reference in the program. Commonly used for static strings

.data

hw: .asciiz "Hello, World!\n" #set the "hw" label to refer to the address where we store the string "Hello, World!"

#The text section contains the instructions to execute. Most of your time will be spent in the .text section. The text section must have a main: label to function properly
.text

#the main: label tells SPIM where to begin progam execution
main:

	#this block is equivalent to 'printf("Hello, World!\n")' in a C program
	la $a0, hw #load the address of the hw buffer into the a0 register
	li $v0, 4 #load the "print string"  syscall value into the v0 register
	syscall

	#this block is equivalent to the "exit(0)" or "return 0" lines in a C program
	li $v0, 10 #load the "terminate program" syscall value into the v0 register
	syscall #terminate the program

	
