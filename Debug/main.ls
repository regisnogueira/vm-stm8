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
  76                     ; 18     init_display();
  78  000c cd0000        	call	_init_display
  80                     ; 19     init_eeprom();
  82  000f cd0000        	call	_init_eeprom
  84                     ; 20     init_menu();
  86  0012 cd0000        	call	_init_menu
  88  0015               L12:
  89                     ; 23         pool_tick();
  91  0015 cd0000        	call	_pool_tick
  93                     ; 24         task_display();
  95  0018 cd0000        	call	_task_display
  97                     ; 25         task_motor();
  99  001b cd0000        	call	_task_motor
 101                     ; 26         task_menu();
 103  001e cd0000        	call	_task_menu
 106  0021 20f2          	jra	L12
 119                     	xdef	_main
 120                     	xref	_task_menu
 121                     	xref	_init_menu
 122                     	xref	_task_motor
 123                     	xref	_init_eeprom
 124                     	xref	_task_display
 125                     	xref	_init_display
 126                     	xref	_init_adc
 127                     	xref	_init_uart
 128                     	xref	_init_buzzer
 129                     	xref	_pool_tick
 130                     	xref	_init_timer
 149                     	end
