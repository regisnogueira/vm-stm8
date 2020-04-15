   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  52                     ; 12 void main(void)
  52                     ; 13 {
  54                     	switch	.text
  55  0000               _main:
  59                     ; 14     init_timer();
  61  0000 cd0000        	call	_init_timer
  63                     ; 15     init_buzzer();
  65  0003 cd0000        	call	_init_buzzer
  67                     ; 16     init_uart();
  69  0006 cd0000        	call	_init_uart
  71                     ; 17     init_adc();
  73  0009 cd0000        	call	_init_adc
  75                     ; 18     init_display();
  77  000c cd0000        	call	_init_display
  79                     ; 19     init_eeprom();
  81  000f cd0000        	call	_init_eeprom
  83                     ; 20     init_menu();
  85  0012 cd0000        	call	_init_menu
  87  0015               L12:
  88                     ; 23         pool_tick();
  90  0015 cd0000        	call	_pool_tick
  92                     ; 24         task_menu();
  94  0018 cd0000        	call	_task_menu
  96                     ; 25         task_motor();
  98  001b cd0000        	call	_task_motor
 101  001e 20f5          	jra	L12
 114                     	xdef	_main
 115                     	xref	_task_menu
 116                     	xref	_init_menu
 117                     	xref	_task_motor
 118                     	xref	_init_eeprom
 119                     	xref	_init_display
 120                     	xref	_init_adc
 121                     	xref	_init_uart
 122                     	xref	_init_buzzer
 123                     	xref	_pool_tick
 124                     	xref	_init_timer
 143                     	end
