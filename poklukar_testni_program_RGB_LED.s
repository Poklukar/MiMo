# This program uses the instructions defined in the
# basic_microcode file. It adds the numbers from 100
# down to 1 and stores the result in memory location 256.
# (c) GPL3 Warren Toomey, 2012
#

main:	li    r7, 2048		#Stack pointer
loop:	ori   r0, r0, 0
		jsr   shift
		ori   r0, r0, 4
		jsr   shift
		ori   r0, r0, 6
		jsr   shift
		ori   r0, r0, 2
		jsr   shift
		ori   r0, r0, 3
		jsr   shift
		ori   r0, r0, 1
		jsr   shift
		ori   r0, r0, 5
		jsr   shift
		ori   r0, r0, 7
		jsr   shift
		jmp   loop
		
		
inf:    jmp   inf			# loop if r7 != 0 -> loop forever

shift:  sw	  r0, 65530
		lsli  r0, r0, 3
		rts