   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  53                     ; 12 void main(void)
  53                     ; 13 {
  55                     	switch	.text
  56  0000               _main:
  60                     ; 14     init_timer();
  62  0000 cd0000        	call	_init_timer
  64                     ; 15     init_buzzer();
  66  0003 cd0000        	call	_init_buzzer
  68                     ; 16     init_uart();
  70  0006 cd0000        	call	_init_uart
  72                     ; 17     init_adc();
  74  0009 cd0000        	call	_init_adc
  76                     ; 19     init_display();
  78  000c cd0000        	call	_init_display
  80                     ; 20     init_eeprom();
  82  000f cd0000        	call	_init_eeprom
  84  0012               L12:
  85                     ; 23         pool_tick();
  87  0012 cd0000        	call	_pool_tick
  89                     ; 24         task_display();
  91  0015 cd0000        	call	_task_display
  93                     ; 25         task_motor();
  95  0018 cd0000        	call	_task_motor
  97                     ; 26         task_menu();
  99  001b cd0000        	call	_task_menu
 102  001e 20f2          	jra	L12
 115                     	xdef	_main
 116                     	xref	_task_menu
 117                     	xref	_task_motor
 118                     	xref	_init_eeprom
 119                     	xref	_task_display
 120                     	xref	_init_display
 121                     	xref	_init_adc
 122                     	xref	_init_uart
 123                     	xref	_init_buzzer
 124                     	xref	_pool_tick
 125                     	xref	_init_timer
 144                     	end
