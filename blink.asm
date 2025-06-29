.device ATmega328P

; Define constants vars yonked form m328Pdef.inc
; PORTB maps to pins 8-13.
.equ	PORTB	= 0x05	;Controls state
.equ	DDRB	= 0x04	;Make output
.equ	PINB	= 0x03	;Make input

; Timer 0 control
.equ	TCCR0A	= 0x25	;Timer/Counter0 Control Register A
.equ	TCCR0B	= 0x24	;Timer/Counter0 Control Register B
.equ	GTCCR	= 0x23	;General Timer/Conter Control Register

; Define the entrypoint and got main function 
.org 0x0000
	jmp reset	;Main code loop
.org 0x0020
	jmp tim0_ovf	;Interrupt handler of timer0 overflow

reset:
	sbi DDRB, 5
	cbi TCCR0B, 0	;Turn on the timer
	sei		;Enable intterupts
main:
	sbi PORTB, 5
	jmp main

tim0_ovf:		; timer0 overlfow intterupt handler
	sbi PINB, 5
	reti

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

	
