// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.
// Put your code here.

@8192
D=A
@R0
M=D //R0 = 500

@16384
D=A
@R1
M=D //R1 = 16384

@i
M=-1 //i = 0

(ZERO)
@i
M=0
@ZEROD
0;JMP  //zeros i then returns to loop

(LOOP)
@ZERO
0;JMP
(ZEROD)
@24576 
D=M //Stores keycode in D
@CHANGEW
D;JEQ
@CHANGEB
D;JGT
@LOOP 
0;JMP

(CHANGEW)
@R1
D=M
@i
A=D+M //Goes to new mem locationg to change pixels

M=0 //Sets all 16 bits to 'white'

@i
M=M+1 //i++

@R0
D=M
@i
D=D-M  //500 - i
@CHANGEW
D;JGT //goto change if 500-i>0
@LOOP
0;JMP

(CHANGEB)
@R1
D=M
@i
A=D+M //Goes to new mem locationg to change pixels

M=-1 //Sets all 16 bits to 'white'

@i
M=M+1 //i++

@R0
D=M
@i
D=D-M  //500 - i
@CHANGEB
D;JGT //goto change if 500-i>0
@LOOP
0;JMP



@LOOP
0;JMP   

