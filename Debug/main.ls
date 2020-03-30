   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  49                     ; 10 void main(void)
  49                     ; 11 {
  51                     	switch	.text
  52  0000               _main:
  56                     ; 12     init_timer();    
  58  0000 cd0000        	call	_init_timer
  60                     ; 13     init_buzzer();
  62  0003 cd0000        	call	_init_buzzer
  64                     ; 14     init_uart();
  66  0006 cd0000        	call	_init_uart
  68                     ; 15     init_adc();
  70  0009 cd0000        	call	_init_adc
  72                     ; 17     init_display();
  74  000c cd0000        	call	_init_display
  76                     ; 18     init_led();
  78  000f cd0000        	call	_init_led
  80  0012               L12:
  82  0012 20fe          	jra	L12
  95                     	xdef	_main
  96                     	xref	_init_display
  97                     	xref	_init_adc
  98                     	xref	_init_uart
  99                     	xref	_init_buzzer
 100                     	xref	_init_led
 101                     	xref	_init_timer
 120                     	end
