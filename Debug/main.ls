   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  44                     ; 9 void main(void)
  44                     ; 10 {
  46                     	switch	.text
  47  0000               _main:
  51                     ; 11     init_timer();
  53  0000 cd0000        	call	_init_timer
  55                     ; 12     init_led();
  57  0003 cd0000        	call	_init_led
  59  0006               L12:
  61  0006 20fe          	jra	L12
  74                     	xdef	_main
  75                     	xref	_init_led
  76                     	xref	_init_timer
  95                     	end
