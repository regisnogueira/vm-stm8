   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  52                     ; 7 void main(void)
  52                     ; 8 {
  54                     	switch	.text
  55  0000               _main:
  59                     ; 9     init_timer();
  61  0000 cd0000        	call	_init_timer
  63                     ; 10     init_led();
  65  0003 cd0000        	call	_init_led
  67                     ; 11     init_buzzer();
  69  0006 cd0000        	call	_init_buzzer
  71                     ; 12     init_uart();
  73  0009 cd0000        	call	_init_uart
  75  000c               L12:
  76                     ; 15         delay(1000);
  78  000c ae03e8        	ldw	x,#1000
  79  000f 89            	pushw	x
  80  0010 5f            	clrw	x
  81  0011 89            	pushw	x
  82  0012 cd0000        	call	_delay
  84  0015 5b04          	addw	sp,#4
  86  0017 20f3          	jra	L12
  99                     	xdef	_main
 100                     	xref	_init_uart
 101                     	xref	_init_buzzer
 102                     	xref	_init_led
 103                     	xref	_delay
 104                     	xref	_init_timer
 123                     	end
