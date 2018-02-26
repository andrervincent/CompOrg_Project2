.data		        #variable declarations occur after this
	prompt: 	
	.asciiz 	" Please enter a non-zero natural number less than 32,768: "
	div_str:	.asciiz "/"
	mult_str:	.asciiz "*"
	add_str:	.asciiz "+"
	sub_str:	.asciiz "-"
	equal_str:	.asciiz "="
	.align 2
	int_array:	
	.space 24	#space for 5 integers in an array

	.globl main
.text		        #program execution follows this

	main:
		la $s1, int_array		#loads array's space into a register
		add $t2, $zero, $0		#i = 0

		LOOP1:
			li $v0, 4
			la $a0, prompt		#syscall to output the declared string
			syscall
		
			li $v0, 5
			syscall				#syscall to read in integers
			move $t0, $v0		#puts user input into a register
			
			slt $t1, $t0, $zero 	#comparing user input to zero.
			bne $t1, $0, LOOP1  	#branch when above condition is **NOT FALSE**.
			#check that it's less than 32,768.
			
			sw $t0, 0($s1) 		#store this integer at the nth place of the array
  			addi $s1, $s1, 4 	#incrementing [i] to move to next array element
  			addi $t2, $t2, 1	#i++
  			slti $t3, $t2, 5	#while (i < 5)
  			bne $t3, $zero, LOOP1		#repeat for 4 more integers
		
  			
		

		CALCULATIONS:
		#use $a0-$a3 and integer from stack as parameters 
		mult $a3, $t4		#( D * E )
		mflo $t5			#move from lo in to $t5
		sub $t6, $a2, $t5	#C - (D * E)
		add $t7, $a0, $a1	#A + B
		div $t7, $t6		#(A+B)/ (C- (D * E))
		mfhi $t8			#stores remainder from higher 32 bits
		mflo $t9			#stores quotient from lower 32 bits
		
		li $v0, 1
		addi $a0, $a0, 0			#A
		syscall
		
		li $v0, 4
		la $a0, add_str				#+
		syscall
		
		li $v0, 1
		addi $a1, $a1, 0			#B
		syscall
		
		add $a0, $zero, $0			#clears registers to avoid adding numbers within syscall
		add $a1, $zero, $0
		
		li $v0, 4
		la $a0, div_str				#/
		syscall
		
		add $a0, $zero, $0			#clear
		
		li $v0, 1
		addi $a0, $a2, 0			#C
		syscall
		
		li $v0, 4
		la $a1, sub_str				#-
		syscall
		
		add $a0, $zero, $0
		
		li $v0, 1
		addi $a0, $a3, 0			#D
		syscall
		
		li $v0, 4
		la $a1, mult_str			#*
		syscall
		
		add $a0, $a0, $zero
		
		li $v0, 1
		add $a0, $t4, $zero			#E
		syscall
		
		li $v0, 4
		la $a0, equal_str			#=
		syscall
		
		add $a1, $a1, $zero
		
		li $v0, 1
		addi $a1, $t9, 0			#X
		
		syscall
		
		
		
		jr $ra				#return arguments

