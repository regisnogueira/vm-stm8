   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  53                     ; 8 void main(void)
  53                     ; 9 {
  55                     	switch	.text
  56  0000               _main:
  60                     ; 10     init_timer();
  62  0000 cd0000        	call	_init_timer
  64                     ; 11     init_led();
  66  0003 cd0000        	call	_init_led
  68                     ; 12     init_buzzer();
  70  0006 cd0000        	call	_init_buzzer
  72                     ; 13     init_uart();
  74  0009 cd0000        	call	_init_uart
  76                     ; 14     init_adc();
  78  000c cd0000        	call	_init_adc
  80  000f               L12:
  81                     ; 17         delay(1000);
  83  000f ae03e8        	ldw	x,#1000
  84  0012 89            	pushw	x
  85  0013 5f            	clrw	x
  86  0014 89            	pushw	x
  87  0015 cd0000        	call	_delay
  89  0018 5b04          	addw	sp,#4
  91  001a 20f3          	jra	L12
 104                     	xdef	_main
 105                     	xref	_init_adc
 106                     	xref	_init_uart
 107                     	xref	_init_buzzer
 108                     	xref	_init_led
 109                     	xref	_delay
 110                     	xref	_init_timer
 129                     	end
