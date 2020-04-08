   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  58                     ; 12 void main(void)
  58                     ; 13 {
  60                     	switch	.text
  61  0000               _main:
  65                     ; 14     init_timer();
  67  0000 cd0000        	call	_init_timer
  69                     ; 15     init_buzzer();
  71  0003 cd0000        	call	_init_buzzer
  73                     ; 16     init_uart();
  75  0006 cd0000        	call	_init_uart
  77                     ; 17     init_adc();
  79  0009 cd0000        	call	_init_adc
  81                     ; 18     init_menu();
  83  000c cd0000        	call	_init_menu
  85                     ; 20     init_display();
  87  000f cd0000        	call	_init_display
  89                     ; 21     init_eeprom();
  91  0012 cd0000        	call	_init_eeprom
  93  0015               L12:
  94                     ; 24         pool_tick();
  96  0015 cd0000        	call	_pool_tick
  98                     ; 25         task_display();
 100  0018 cd0000        	call	_task_display
 102                     ; 26         task_motor();
 104  001b cd0000        	call	_task_motor
 106                     ; 27         task_menu();
 108  001e cd0000        	call	_task_menu
 111  0021 20f2          	jra	L12
 124                     	xdef	_main
 125                     	xref	_task_menu
 126                     	xref	_init_menu
 127                     	xref	_task_motor
 128                     	xref	_init_eeprom
 129                     	xref	_task_display
 130                     	xref	_init_display
 131                     	xref	_init_adc
 132                     	xref	_init_uart
 133                     	xref	_init_buzzer
 134                     	xref	_pool_tick
 135                     	xref	_init_timer
 154                     	end
