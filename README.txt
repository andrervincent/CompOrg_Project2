README REQS: 
a. Your team members' names, class, an explanation of how to run your program,
a brief description of the pieces of your assignment, any notes from group
discussions, and the workload distribution among the team (who did what).
b. Test cases that you used to test your program. For each of the test cases,
provide:
i. A description of what is being tested
ii. The input
iii. The expected output
iv. The actual output
c. Any known problems of your program, which will help you earn partial
credits.
____________________________________________________________________________________________________________
# Project2
Andre Vincent, Modona Conteh
CSCI201-01 | Dr. Gedare Bloom

This is the composition of the assignment:
Reading in 5 user-inputted integers
Checking to make sure the integers provided are in the range of (0, 32768)
If any integer is not within range, prompt user to enter five integers once more.
____________________________________________________________________________________________________________
Implementation:
	1. Printing the prompt:
		After declaring a variable for the prompt string in our .data, we used a syscall to print that string out, prompting the user.
	2. Read integer from user:
		Syscall "5" is used to read integers from the user. The input is stored into the $v0 register. We then check that the integer is within the range of 0-32768. If it is, then we store it at the nth place of the array.
	3. Repeat this process 4 times in a loop.
	4. The Calculation Program:
		Before executing the calculation subprogram, we loaded each of the argument registers with integers from our array. There were 5 integers and only 4 argument registers so we loaded the fifth integer onto the stack so it could still be used.
		
		The calculation subprogram does the following:
			#load fifth parameter from the stack
			#multiply "D" by "E" and store that result in a register.
			#subtract the product of "D" and "E" from "C", store result in a register.
			#add "A" and "B", store result in a register.
			#divide sum of "A" and "B" by result of "C-(D*E)"
			#print the full equation -> "A+B/C-D*E=X", "X" being the result.
			#return to main.
	5. Managing the Return Address
		Main calls several subprograms that use 'jr $ra' but in order for main to also use this instruction to exit the program without being overwritten, we had to store the return address of main on the stack before calling the other functions. This way, the return address of main is stored.
_____________________________________________________________________________________________________________
Test Cases:
	1. Too many wrong inputs:
		In the case that the user inputs numbers greater than the limit - 32,768 - the loop will continue infinitely. To combat this, we added a second counter to count the amount of times the user inputs a number. If that number exceeds 5, or the amount of indexes available in the array, the loop and program exits.
