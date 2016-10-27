// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// add R0 to to itself R1 times
// for(i=0; i<R1; i++)
// R2 = R2+R0;

// Put your code here.
	@2
	M=0 //R2 =0
	@i
	M=0 //i = 0
(LOOP)
	@i
	D=M //D=i
	@1
	D=D-M // i-R1
	@END
	D;JGE //if(i-R1)>=0 go to end
	
	@0
	D=M // D = R0
	@2
	M = D + M // R2= R2+R0
	@i
	M = M+1

	@LOOP
	0;JMP
(END)
	0;JMP