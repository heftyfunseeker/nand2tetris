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
(GET_INPUT)
	@24576 // key value is stored here
	D=M
	@FILL_SCREEN_BLACK
	D;JNE
	@FILL_SCREEN_WHITE
	0;JMP

(FILL_SCREEN_BLACK)
	@pixel_color
	M=-1
	@FILL_SCREEN_INTERNAL
	0;JMP
	
(FILL_SCREEN_WHITE)
	@pixel_color
	M=0
	@FILL_SCREEN_INTERNAL
	0;JMP
		
(FILL_SCREEN_INTERNAL)
	// assign screen start to R0
	@SCREEN
	D=A
	@R0
	M=D
	
	(FILL_SCREEN_LOOP)
		// write word/pixels
		@pixel_color
		D=M
		@R0
		A=M 
		M=D
		
		// move to next word
		D=A
		@1
		D=D+A 
		
		// save next address for write
		@R0
		M=D 
		
		// Loop test
		@24576 // end of screen mem
		D=D-A
		@FILL_SCREEN_LOOP
		D;JLT

		@GET_INPUT
		0;JMP
		
	
	
	
	
	
	
	
