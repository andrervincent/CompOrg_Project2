.data		#variable declarations occur after this
	prompt: 	.asciiz 	" Please enter a non-zero natural number less than 32,768: "
	int_array:	.space 4	#space for 5 integers in an array
	.globl main
.text		#program execution follows this
	main:

		li $v0, 4
		la $a0, prompt		#syscall to output the declared string
		syscall

		li $v0, 5
		syscall				#syscall to read in integers
		
		move $t0, $v0		#puts user input into a register
		sw $t0, int_array	#stores integer at base address of the array
		la $s0, int_array 		#loads first index into register

		li $v0, 1
		move $a0, $t1
		syscall
		
		#store this integer at the nth place of the array
		#check that the integer is within the range of 0-32768
		#repeat for 4 more integers
		
		#CALCULATION SUBPROGRAM:
		#load $t1-$t5(parameters) from the stack 
		#multiply $t4 by $t5 		( D * E )
		#move from lo in to $t6
		#$t0 sub $t3 -$t6			C - (D * E)
		#$t8 = $t1 + $t2			A + B
		#divide $t8 by $t0 -> $t9	(A+B)/ (C- (D * E))
		#return arguments

