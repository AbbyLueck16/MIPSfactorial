# MIPSfactorial
This repository includes a MIPS code created in CISC 340 to calculate N! using recursion in MIPS assembly language.

## Files included:
- Assignment5.asm

## Installation
This program requires a MIPS simulator, such as MARS, to assemble and run the program.

## Usage
1. Open the ```Assignment5.asm``` file in MIPS simulator.
2. Assemble the program.
3. Run the program.
   
Input:
- The user is prompted to enter an integer to find the factorial of.
  
Contraints:
- The user's input cannot be less than zero.

## Assignment Instructions
***These are the instructions given by Professor Lamb for a CISC 340 assignment*** <br>
You are to write a program in MIPS that computes N! using recursion. Remember N! is the product of
all the numbers from 1 to N inclusive, that is 1 x 2 x 3 x (N – 1) x N. It is defined as 1 for N = 0 and is
undefined for values less than 0.
The programs first requests the user to input the value of N (display a prompt first so the user knows
what to do). If the input value is less than 0, the program is to display “N! undefined for values less than
0” and then requests the user to input the value of N again. If the value input is non-negative, it is to
compute N! using a recursive function, that is one that calls itself
  
## Example Run
```
Please enter a value that you would like to find the factorial of:
-5
N! undefined for values less than 0
6
The factorial of your number is:
720
```

## Limitations
- This program can only handle integer input values.
- Very large numbers may not work due to MIPS register sizes or overflow limitations.
