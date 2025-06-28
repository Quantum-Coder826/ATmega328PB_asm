.device ATmega328P

; Define constants vars yonked form m328Pdef.inc
; PORTB maps to pins 8-13.
.equ	PORTB	= 0x05		;Controls state
.equ	DDRB	= 0x04		;Make output
.equ	PINB	= 0x03		;Make input

; Define the entrypoint and got main function 
.org 0x0000
	jmp main

main:
	sbi DDRB, 5		; Set as output (will add pull-up resistor)
loop:
	sbi PINB, 5		; Setting this bit will toggle the output.
	call wait
	jmp loop

; subrotine to wait "lage" amout of time
wait: 
	clr r16
	clr r17
outer_loop:
	inc r16
	cpi r16, 0xff
	breq done

	inner_loop:
	inc r17
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	cpi r17, 0xff
	brne inner_loop
	jmp outer_loop
done:
ret

	
