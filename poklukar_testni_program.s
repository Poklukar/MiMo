# This program uses the instructions defined in the
# basic_microcode file. It adds the numbers from 100
# down to 1 and stores the result in memory location 256.
# (c) GPL3 Warren Toomey, 2012
#

main:	li    r7, 2048		#Stack pointer
		li	  r0, 63		#Load number 64 into r0
		inc	  r0			#increment r0
		muli  r1, r0, 2		#multiply r0 with immediate and store to r1
		div   r0, r1, r0	#divide r1 with r0 and store to r0 (result is 2)
		jsr   reset			#jump to reset of all registers but r7
		
		li    r0, 3			#load r0
		move  r1, r0		#copy r0 to r1
		neg   r1			#negate r1
		bgt   r0, r1, asc	#if r0 > r1 then branch to asc
		blt   r1, r0, desc	#if r0 < r1 then branch to desc
							#if r0 and r1 are the same (0) finish in infinite loop

inf:    jnez  r7, inf			# loop if r7 != 0 -> loop forever


reset:	clr r0				#resets all registers to 0 except r7 - stack pointer
		clr r1
		clr r2
		clr r3
		clr r4
		clr r5
		clr r6
		rts
		
desc:	inc   r1			#while r1 != r0 increment r1
		beq   r1, r0, inf
		br desc
		
asc:	dec   r1			#while r1 != r0 decrement r1
		beq   r1, r0, inf
		br asc