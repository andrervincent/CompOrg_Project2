# Project2
Andre Vincent, Modona Conteh
CSCI201-01 | Dr. Gedare Bloom

Assignment:
(1) Print the following prompt message:
Please enter a non-zero natural number less than 32,768:
	After declaring a variable for the prompt string in our .data, we used a 	syscall to print that string out, prompting the user.
(2) Read an integer from the user
	Syscall "5" is used to read integers from the user. The input is stored into the $v0 register.
	We then check that the integer is within the range of 0-32768. If it is, then we store it at the
	nth place of the array.
(3) Repeat the above process (Step 1 and 2) five times.
(4) Check whether or not all the five integers are larger than 0 and less than 32768. If not,
repeat Steps 1 through 4.
(5) Call a procedure (subprogram) that calculates the result of A + B / (C – D × E), where
A, B, C, D and E are the five integers entered. The procedure should return the result.
	The calculation subprogram does the following:
		load the the parameters from the stack
		multiply "D" by "E" and move that result into a register
		# subtract the product of "D"and "E" from "C", store result in a register.
		# add "A" and "B", store result in a register.
		#divide sum of "A" and "B" by result of "C-(D*E)"
		#return return result to the main.
Use the appropriate MIPS calling conventions, and the usual order of operations. Note:
you need to pass 5 values to the subprogram, but can only pass four of them using the
argument registers. The fifth value must be passed using the stack!
(6) Print the following message:
A + B / (C – D × E) = X
Where A, B, C, D and E should be replaced by the integers entered, and X is the value of the
expression calculated at Step 5.
(7) Return from main using jr $ra (not using the exit syscall). The jr should not cause
an error, and if it does then your program is not using the stack properly.
Part 2 (15 points)
Test cases to validate the program in Part 1. Be sure to test for correct inputs, corner
cases, and invalid inputs. You will document your test cases in your README file.
In your README file, identify the range, i.e., [min, max], of X, and which test cases hit the
edges of the range.
Requirements
1. Your program must run without error in QtSPIM.
2. COMMENT YOUR CODE. If something doesn’t work, you may get partial credit if
your comments show that you were on the right track.
3. ou must submit a README file.
4. Any repetition must be done using a loop structure. Replication of code for repetition
will not receive credit.
