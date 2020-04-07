   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  52                     ; 11 void main(void)
  52                     ; 12 {
  54                     	switch	.text
  55  0000               _main:
  59                     ; 13     init_timer();
  61  0000 cd0000        	call	_init_timer
  63                     ; 14     init_buzzer();
  65  0003 cd0000        	call	_init_buzzer
  67                     ; 15     init_uart();
  69  0006 cd0000        	call	_init_uart
  71                     ; 16     init_adc();
  73  0009 cd0000        	call	_init_adc
  75                     ; 18     init_display();
  77  000c cd0000        	call	_init_display
  79                     ; 19     init_eeprom();
  81  000f cd0000        	call	_init_eeprom
  83  0012               L12:
  84                     ; 22         pool_tick();
  86  0012 cd0000        	call	_pool_tick
  88                     ; 23         task_display();
  90  0015 cd0000        	call	_task_display
  92                     ; 24         task_motor();
  94  0018 cd0000        	call	_task_motor
  97  001b 20f5          	jra	L12
 110                     	xdef	_main
 111                     	xref	_task_motor
 112                     	xref	_init_eeprom
 113                     	xref	_task_display
 114                     	xref	_init_display
 115                     	xref	_init_adc
 116                     	xref	_init_uart
 117                     	xref	_init_buzzer
 118                     	xref	_pool_tick
 119                     	xref	_init_timer
 138                     	end
