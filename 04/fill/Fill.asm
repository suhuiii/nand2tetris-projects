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
(START)	
	@SCREEN
	D=A
	@R0
	M=D
	
(LOOP)
	@KBD
	D=M
	@WHITE
	D;JEQ
		(BLACK)	
		@4681
		D = A
		@R0
		A = M
		M= D + M
		D=M
		@32767
		D=D-A
		@ADDONE
		D;JEQ
		@LOOP
		0;JMP

		(WHITE)
		@R0
		A = M
		D = M
		@MINUSONE
		D;JEQ
		@4681
		D = A
		@R0
		A = M
		M = M - D
		
		@LOOP
		0;JMP

	(ADDONE)
	@R0
	M=M+1
	@LOOP
	0;JMP

	(MINUSONE)
	@R0
	M=M-1
	D=M
	@SCREEN
	D=D-A
	@START
	D;JLT
	@LOOP
	0;JMP