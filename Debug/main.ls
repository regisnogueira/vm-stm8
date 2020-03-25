   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  46                     ; 6 void main(void)
  46                     ; 7 {
  48                     	switch	.text
  49  0000               _main:
  53                     ; 8     init_timer();
  55  0000 cd0000        	call	_init_timer
  57                     ; 9     init_led();
  59  0003 cd0000        	call	_init_led
  61                     ; 10     init_buzzer();
  63  0006 cd0000        	call	_init_buzzer
  65  0009               L12:
  66                     ; 13         delay(1000);
  68  0009 ae03e8        	ldw	x,#1000
  69  000c 89            	pushw	x
  70  000d ae0000        	ldw	x,#0
  71  0010 89            	pushw	x
  72  0011 cd0000        	call	_delay
  74  0014 5b04          	addw	sp,#4
  76  0016 20f1          	jra	L12
  89                     	xdef	_main
  90                     	xref	_init_buzzer
  91                     	xref	_init_led
  92                     	xref	_delay
  93                     	xref	_init_timer
 112                     	end
