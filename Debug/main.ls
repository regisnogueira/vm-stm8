   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  51                     ; 7 void main(void)
  51                     ; 8 {
  53                     	switch	.text
  54  0000               _main:
  58                     ; 9     init_timer();
  60  0000 cd0000        	call	_init_timer
  62                     ; 10     init_led();
  64  0003 cd0000        	call	_init_led
  66                     ; 11     init_buzzer();
  68  0006 cd0000        	call	_init_buzzer
  70                     ; 12     init_uart();
  72  0009 cd0000        	call	_init_uart
  74  000c               L12:
  76  000c 20fe          	jra	L12
  89                     	xdef	_main
  90                     	xref	_init_uart
  91                     	xref	_init_buzzer
  92                     	xref	_init_led
  93                     	xref	_init_timer
 112                     	end
