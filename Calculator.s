.global _start
.equ ADDR_SWITCH, 0xFF200040
.equ led, 0xFF200000
.equ ADDR_BUTTON, 0xFF200050
.equ ADDR_7SEG1TO4, 0xFF200020
_start:

  	ldr r7, =ADDR_SWITCH
  	mov r2, #0x1    // kind of an iterator to check which one is high
  	mov r5, #0x1	//to check "and" result , bitwise operations
  
loop:
  	ldr r6, [r7]
  	and r3, r6, r2
  	cmp r3, r2
  	beq store_1st
  	lsl r2, r2, #0x1
  	b loop

loop2:
  
  	lsl r2,r2, #0x1
  	ldr r6 , [r7]
  	and r3,r6, r2
  	cmp r3, r2
  	beq store_2nd
  	b loop2

store_1st:
  	mov r0,r2     // r0 and r1 will be having our inputs
  	b loop2
store_2nd:
  	mov r1,r2
  	b calculator
  
calculator:		// after getting the numbers, r0 and r1 are required
				// rest registers are useless so i can modify them 
	mov r2, #0x1
	mov r3, #0x2
	mov r4, #0x4
	ldr r7, =ADDR_BUTTON
	ldr r5 , [r7]
	cmp r5, r2
	beq addition
	cmp r5, r3
	beq subtraction
	cmp r5, r4
	beq multiplication
	
addition:
	add r3, r1, r0
	b seven_seg
	
subtraction:
	sub r3, r1, r0
	b seven_seg

multiplication:
	mul r3, r1, r0
	b seven_seg

seven_seg:     // results which are to be shown in seven_seg are stored
			   // in reg r3, and r1 and r0 have 2 values, rest are junk now
	ldr r7, =ADDR_7SEG1TO4
  	ldr r2, =#0b0000000000000000000000000000000 // bits will cleanup first four segments
	str r2, [r7]    //write to the 7 segment display
	
  zero:
  
 	ldr r2,=#0b00111111
	mov r4, #0
	cmp r4, r3
	bne one
  	str r2,[r7]
 
  one:
  	ldr r2,=#0b00000110
	mov r4, #1
	cmp r4, r3
	bne two
  	str r2,[r7]
 
  two:
  	ldr r2,=#0b01011011
	mov r4, #2
	cmp r4, r3
	bne three
  	str r2,[r7]
  three:
  	ldr r2,=#0b01001111
	mov r4, #3
	cmp r4, r3
	bne four
  	str r2,[r7]
  four:
  	ldr r2,=#0b01100110
	mov r4, #4
	cmp r4, r3
	bne five
  	str r2,[r7]
  five:
  	ldr r2,=#0b01101101
	mov r4, #5
	cmp r4, r3
	bne six
  	str r2,[r7]
  six:
  	ldr r2,=#0b01111101
	mov r4, #6
	cmp r4, r3
	cmp r4, r3
	bne seven
  	str r2,[r7]
  seven:
  	ldr r2,=#0b00000111
	mov r4, #7
	cmp r4, r3
	bne eight
  	str r2,[r7]
  eight:
  	ldr r2,=#0b01111111
	mov r4, #8
	cmp r4, r3
	bne nine
  	str r2,[r7]
  nine:
  	ldr r2,=#0b01101111
	mov r4, #9
	cmp r4, r3
	bne ten
  	str r2,[r7]
  ten:
  	ldr r2,=#0b00000110 00000110
	mov r4, #10
	cmp r4, r3
	bne eleven
  	str r2,[r7]
  eleven:
  	ldr r2,=#0b0000011000000110
	mov r4, #11
	cmp r4, r3
	bne twelve
  	str r2,[r7]
  twelve:
  	ldr r2,=#0b0000011001011011
	mov r4, #12
	cmp r4, r3
	bne thirteen
  	str r2,[r7]
  thirteen:
  	ldr r2,=#0b0000011001001111
	mov r4, #13
	cmp r4, r3
	bne fourteen
  	str r2,[r7]
  fourteen:
  	ldr r2,=#0b0000011001100110
	mov r4, #14
	cmp r4, r3
	bne fifteen
  	str r2,[r7]
  fifteen:
  	ldr r2,=#0b0000011001101101
	mov r4, #15
	cmp r4, r3
	bne sixteen
  	str r2,[r7]
  sixteen:
  	ldr r2,=#0b0000011001111101
	mov r4, #16
	cmp r4, r3
	bne seventeen
  	str r2,[r7]
  seventeen: 
  	ldr r2,=#0b0000011000000111
	mov r4, #17
	cmp r4, r3
	bne eightteen
  	str r2,[r7]
  eightteen:
  	ldr r2,=#0b0000011001111111
	mov r4, #18
	cmp r4, r3
	bne nineteen
  	str r2,[r7]
  nineteen:
  	ldr r2,=#0b0000011001101111
	mov r4, #19
	cmp r4, r3
	bne twenty
  	str r2,[r7]
  twenty:
  	ldr r2,=#0b0101101100111111
	mov r4, #20
	cmp r4, r3
	bne twenty_four
  	str r2,[r7]
  twenty_four:
  	ldr r2,=#0b0101101101100110
	mov r4, #24
	cmp r4, r3
	bne twenty_eight
  	str r2,[r7]
  twenty_eight:
  	ldr r2,=#0b0101101101111111
	mov r4, #28
	cmp r4, r3
	bne thirty_two
  	str r2,[r7]
  thirty_two:
  	ldr r2,=#0b0100111101011011
	mov r4, #32
	cmp r4, r3
	bne thirty_six
  	str r2,[r7]
  thirty_six:
  	ldr r2,=#0b0100111101011011
	mov r4, #32
	cmp r4, r3
	bne thirty_six
  	str r2,[r7]
  fourty:
  	ldr r2,=#0b0100111101011011
	mov r4, #32
	cmp r4, r3
	bne thirty_six
  	str r2,[r7]
  fourty_four:
  	ldr r2,=#0b0100111101011011
	mov r4, #32
	cmp r4, r3
	bne thirty_six
  	str r2,[r7]
  fourty_eight:
  	ldr r2,=#0b0100111101011011
	mov r4, #32
	cmp r4, r3
	bne thirty_six
  	str r2,[r7]
  fifty_two:
  	ldr r2,=#0b0100111101011011
	mov r4, #32
	cmp r4, r3
	bne thirty_six
  	str r2,[r7]
  fifty_six:
  	ldr r2,=#0b0100111101011011
	mov r4, #32
	cmp r4, r3
	bne thirty_six
  	str r2,[r7]
  sixty:
  	ldr r2,=#0b0100111101011011
	mov r4, #32
	cmp r4, r3
	bne thirty_six
  	str r2,[r7]
  sixty_four:
  	ldr r2,=#0b0100111101011011
	mov r4, #32
	cmp r4, r3
	bne thirty_six
  	str r2,[r7]
  sixty_eight:
  	ldr r2,=#0b0100111101011011
	mov r4, #32
	cmp r4, r3
	bne thirty_six
  	str r2,[r7]
  seventy_two:
  	ldr r2,=#0b0100111101011011
	mov r4, #32
	cmp r4, r3
	bne thirty_six
  	str r2,[r7]
  seventy_six:
  	ldr r2,=#0b0100111101011011
	mov r4, #32
	cmp r4, r3
	bne thirty_six
  	str r2,[r7]
  eighty:
  	ldr r2,=#0b0100111101011011
	mov r4, #32
	cmp r4, r3
	bne thirty_six
  	str r2,[r7]
  eighty_four:
  	ldr r2,=#0b0100111101011011
	mov r4, #32
	cmp r4, r3
	bne thirty_six
  	str r2,[r7]
  eighty_eight:
  	ldr r2,=#0b0100111101011011
	mov r4, #32
	cmp r4, r3
	bne thirty_six
  	str r2,[r7]
  ninety_two:
  	ldr r2,=#0b0100111101011011
	mov r4, #32
	cmp r4, r3
	bne thirty_six
  	str r2,[r7]
  ninety_six:
  	ldr r2,=#0b0100111101011011
	mov r4, #32
	cmp r4, r3
	bne thirty_six
  	str r2,[r7]
	
	
  	
.end
 

