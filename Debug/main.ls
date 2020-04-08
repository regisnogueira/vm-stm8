   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  54                     ; 12 void main(void)
  54                     ; 13 {
  56                     	switch	.text
  57  0000               _main:
  61                     ; 14     init_timer();
  63  0000 cd0000        	call	_init_timer
  65                     ; 15     init_buzzer();
  67  0003 cd0000        	call	_init_buzzer
  69                     ; 16     init_uart();
  71  0006 cd0000        	call	_init_uart
  73                     ; 17     init_adc();
  75  0009 cd0000        	call	_init_adc
  77                     ; 18     init_menu();
  79  000c cd0000        	call	_init_menu
  81                     ; 20     init_display();
  83  000f cd0000        	call	_init_display
  85                     ; 21     init_eeprom();
  87  0012 cd0000        	call	_init_eeprom
  89  0015               L12:
  90                     ; 24         pool_tick();
  92  0015 cd0000        	call	_pool_tick
  94                     ; 25         task_display();
  96  0018 cd0000        	call	_task_display
  98                     ; 26         task_motor();
 100  001b cd0000        	call	_task_motor
 102                     ; 27         task_menu();
 104  001e cd0000        	call	_task_menu
 107  0021 20f2          	jra	L12
 120                     	xdef	_main
 121                     	xref	_task_menu
 122                     	xref	_init_menu
 123                     	xref	_task_motor
 124                     	xref	_init_eeprom
 125                     	xref	_task_display
 126                     	xref	_init_display
 127                     	xref	_init_adc
 128                     	xref	_init_uart
 129                     	xref	_init_buzzer
 130                     	xref	_pool_tick
 131                     	xref	_init_timer
 150                     	end
