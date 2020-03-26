   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  50                     ; 9 void main(void)
  50                     ; 10 {
  52                     	switch	.text
  53  0000               _main:
  57                     ; 11     init_timer();
  59  0000 cd0000        	call	_init_timer
  61                     ; 12     init_led();
  63  0003 cd0000        	call	_init_led
  65                     ; 16     init_pwm();
  67  0006 cd0000        	call	_init_pwm
  69  0009               L12:
  71  0009 20fe          	jra	L12
  84                     	xdef	_main
  85                     	xref	_init_pwm
  86                     	xref	_init_led
  87                     	xref	_init_timer
 106                     	end
