.data		        #variable declarations occur after this
	prompt: 	
	.asciiz 	" Please enter a non-zero natural number less than 32,768: "
	
	int_array:	
	.space 24	#space for 5 integers in an array
	
	.globl main
.text		        #program execution follows this

	main:
		la $s1, int_array	#loads array's space into a register
		
		li $v0, 4
		la $a0, prompt		#syscall to output the declared string
		syscall

		li $v0, 5
		syscall				#syscall to read in integers
		
		move $t0, $v0		#puts user input into a register
		slt $t1, $t0, $zero 	#comparing user input to zero.
		bne $t1, $0, LOOP1  	#branch when above condition is **NOT FALSE**.
		sw $t0, 0($s1) 		#storing input
  		addi $s1, $s1, 1 	#incrementing [i] to move to next array element
		
		#check that it's within the range
		
		
		#store this integer at the nth place of the array
		#check that the integer is within the range of 0-32768
		#repeat for 4 more integers
		
		#CALCULATION SUBPROGRAM:
		#use $a0-$a3 and integer from stack as parameters 
		#multiply $t4 by $t5 		( D * E )
		#move from lo in to $t6
		#$t0 sub $t3 -$t6			C - (D * E)
		#$t8 = $t1 + $t2			A + B
		#divide $t8 by $t0 -> $t9	(A+B)/ (C- (D * E))
		#return arguments

