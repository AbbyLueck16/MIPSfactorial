#Abigail Lueck
#Assignment 5
#This program takes an integer from the user and finds the factorial of it using recursion. 
#If the user enters a negative number the program throw and error and asks for a new number.
.data
prompt: 	.asciiz "Please enter a value that you would like to find the factorial of:\n"
resultMsg:	.asciiz "The factorial of your number is: \n"
negativeMsg:	.asciiz "N! undefined for values less than 0\n"
newLine: 	.asciiz "\n"


.text
main:
	# Print out prompt for the user 
	li 	$v0, 4         		# Code to print string
	la 	$a0, prompt 		# Address of string to print into $a0
	syscall				# Display prompt message 
	

	li 	$v0, 5			# Code to read an integer
	syscall		
	move 	$t0, $v0 		# Save input number in 
	
	blt 	$t0, $zero, error 	# If $t0 is less than 0, jump to error
	
	# Call recursive function
	move 	$a0, $t0		# Move input into $a0
	jal 	factorial		# Call the factorial function
	move 	$t1, $v0		# Save result of factorial in $t1
	
	# Print result
	li 	$v0, 4			# Code to print string
	la 	$a0, resultMsg		# Load result message
	syscall				# Display result message
	
	# Print factorial result 
	move 	$a0, $t1 		# Move the factorial result into $a0
	li 	$v0, 1			# Code to print an integer
	syscall				# Print the result
		
	j	end			# Jump end of program

factorial:
	# Save registers
    	addi    $sp, $sp, -8		# Adjust the stack for 2 items
    	sw      $ra, 4($sp)		# Save return address
    	sw      $a0, 0($sp)             # Save current value of n
    
    	# Base case: if n = 0, return 1
    	li      $t1, 0			# Set $t1 to 0
    	beq     $a0, $t1, base		# If a0 = 0, go to base case (base)

    	# Recursive case: n * factorial(n-1)
    	addi    $a0, $a0, -1            # Decrement n
    	jal     factorial               # Recursive call to factorial

    	# Restore saved registers
    	lw      $a0, 0($sp)             # Restore original n
    	lw      $ra, 4($sp)             # Restore return address
    	addi    $sp, $sp, 8             # Pop 2 items from stack

    	mul     $v0, $a0, $v0           # Multiply N * factorial(N - 1)
    	jr      $ra                     # Return

base:
    	li      $v0, 1                  # Return 1 when n = 0
    	lw      $ra, 4($sp)             # Restore return address
   	addi    $sp, $sp, 8             # Pop 2 items from stack
   	jr      $ra                     # Return

error:
    	li      $v0, 4                  # Code to print string
    	la      $a0, negativeMsg        # Load error message
    	syscall                         # Display error message 
    
    	j       main                    # Jump to main

end:
    	li      $v0, 10                 # Load exit value for syscall
    	syscall                         # Do syscall to exit
