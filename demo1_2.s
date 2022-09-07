#################################
# Demo 1 Part 2                 #
# Author: Quinn Baker           #
# Date: September 14, 2022      #
#                               #
# Purpose: To create a MIPS     #
# program which will prompt the #
# user for an input of a        #
# particular maximum size, and  #
# prints it back to the user in #
# full, and then character by   #
# character                     #
################################# 


#The data section. Contains the empty input buffer and the two fixed string buffers
.data
	user_input: .space 64
	str1: .asciiz "Enter your name (max 64 characters): "
	str2: .asciiz "Hello, "
	str3: .asciiz "Character #"
	str4: .asciiz " is: "
	nl: .asciiz "\n"

#The text section. Contains the program instructions
.text
#the main label. This is where program execution will begin. 
main:
	#This block prints the contents of the str1 buffer
	la $a0, str1
	li $v0, 4
	syscall

	#This block reads in at most 64 characters and stores them in the user_input buffer
	li $v0, 8 #Syscall value 8 prompts the user for input
	la $a0, user_input #load the address of the user_input buffer into the a0 register
	li $a1, 65 #load the value 65 into the a1 register
	syscall

	
	#This block prints the contents of the str2 buffer
	la $a0, str2 
	li $v0, 4
	syscall

	#This block prints the contents of the user_input buffer provided by the user	
	la $a0, user_input
	li $v0, 4
	syscall

	li $t0, 0
	
#create a new label to refer to for use when looping through the input string
print_chars:
	lb $t1, user_input($t0) #load character in the user_input buffer at index $t0 (a single byte) into $t1
	beq $t1, 0, exit #if the character is 0, we've hit the end of the string (or something worse has happened, so move to the exit label
	
	#print the "Character #" string
	la $a0, str3
	li $v0, 4
	syscall

	#load the index value into $a0
	move $a0, $t0
	li $v0, 1
	syscall
	
	#print the " is: " string
	la $a0, str4
	li $v0, 4
	syscall

	#move the $t1 byte into $a0, and print the character 
	move $a0, $t1
	li $v0, 11
	syscall

	#print the newline
	la $a0, nl
	li $v0, 4
	syscall
	
	#increment the value in the $t0 register by one (add $t0 and 1 and put the result in the $t0 register)
	add $t0, $t0, 1
	
	#jump back to the print_chars label
	j print_chars

exit:

	#exit the program
	li $v0, 10
	syscall
