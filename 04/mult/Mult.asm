// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.
@R0
D=M
@num1
M=D  //num1 = R0

@R1
D=M
@num2
M=D  //num2 = R1
@num2
D=M
D=D-1
@n
M=D   //n = num2 - 1

@R2
M=0 //R2 = 0

@i
M=0  //i = 0

(LOOP)
@n
D=M
@i
D=D-M
@STOP
D;JLT // if i > n goto STOP
@R0
D=M
@R2
M=D+M  // num1 + total
@i
M=M+1
@LOOP
0;JMP
(STOP)

(END)
@END
0;JMP 