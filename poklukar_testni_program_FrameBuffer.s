# This program uses the instructions defined in the
# basic_microcode file. It adds the numbers from 100
# down to 1 and stores the result in memory location 256.
# (c) GPL3 Warren Toomey, 2012
#

main:	li    r0, 7
		li    r1, 1				#number of bits shift
		li    r2, 57344			#left bounce
		li    r3, 7				#right bounce
		li    r7, 2048			#stack pointer

		
loopl:	jsr draw				#bounce 3x3 cube left and right
		lsl   r0, r0, r1
		jeq   r0, r2, loopr
		jmp   loopl

loopr:	jsr draw
		lsr   r0, r0, r1
		jeq   r0, r3, loopl
		jmp   loopr
		
inf:    jmp   inf			# loop if r7 != 0 -> loop forever

draw:   sw	  r0, 16399
		sw	  r0, 16398
		sw	  r0, 16397
		rts