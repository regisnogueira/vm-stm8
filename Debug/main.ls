   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  62                     ; 9 void main(void)
  62                     ; 10 {
  64                     	switch	.text
  65  0000               _main:
  67  0000 89            	pushw	x
  68       00000002      OFST:	set	2
  71                     ; 11     uint16_t pwm = 250;
  73  0001 ae00fa        	ldw	x,#250
  74  0004 1f01          	ldw	(OFST-1,sp),x
  76                     ; 13     init_timer();
  78  0006 cd0000        	call	_init_timer
  80                     ; 14     init_led();
  82  0009 cd0000        	call	_init_led
  84                     ; 15     init_buzzer();
  86  000c cd0000        	call	_init_buzzer
  88                     ; 16     init_uart();
  90  000f cd0000        	call	_init_uart
  92                     ; 17     init_adc();
  94  0012 cd0000        	call	_init_adc
  96                     ; 18     init_pwm();
  98  0015 cd0000        	call	_init_pwm
 100  0018               L72:
 101                     ; 21         delay(5);
 103  0018 ae0005        	ldw	x,#5
 104  001b 89            	pushw	x
 105  001c ae0000        	ldw	x,#0
 106  001f 89            	pushw	x
 107  0020 cd0000        	call	_delay
 109  0023 5b04          	addw	sp,#4
 110                     ; 23         set_pwm(PWM_CH1, pwm);
 112  0025 1e01          	ldw	x,(OFST-1,sp)
 113  0027 89            	pushw	x
 114  0028 4f            	clr	a
 115  0029 cd0000        	call	_set_pwm
 117  002c 85            	popw	x
 118                     ; 24         set_pwm(PWM_CH2, pwm);
 120  002d 1e01          	ldw	x,(OFST-1,sp)
 121  002f 89            	pushw	x
 122  0030 a601          	ld	a,#1
 123  0032 cd0000        	call	_set_pwm
 125  0035 85            	popw	x
 127  0036 20e0          	jra	L72
 140                     	xdef	_main
 141                     	xref	_set_pwm
 142                     	xref	_init_pwm
 143                     	xref	_init_adc
 144                     	xref	_init_uart
 145                     	xref	_init_buzzer
 146                     	xref	_init_led
 147                     	xref	_delay
 148                     	xref	_init_timer
 167                     	end
