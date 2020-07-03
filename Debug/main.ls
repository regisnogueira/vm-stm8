   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  49                     ; 9 void main(void)
  49                     ; 10 {
  51                     	switch	.text
  52  0000               _main:
  56                     ; 11     init_timer();
  58  0000 cd0000        	call	_init_timer
  60                     ; 12     init_display();
  62  0003 cd0000        	call	_init_display
  64                     ; 13     init_eeprom();
  66  0006 cd0000        	call	_init_eeprom
  68                     ; 14     init_menu();
  70  0009 cd0000        	call	_init_menu
  72                     ; 15     init_led();
  74  000c cd0000        	call	_init_led
  76  000f               L12:
  77                     ; 18         pool_tick();
  79  000f cd0000        	call	_pool_tick
  81                     ; 19         task_menu();
  83  0012 cd0000        	call	_task_menu
  86  0015 20f8          	jra	L12
  99                     	xdef	_main
 100                     	xref	_task_menu
 101                     	xref	_init_menu
 102                     	xref	_init_eeprom
 103                     	xref	_init_display
 104                     	xref	_init_led
 105                     	xref	_pool_tick
 106                     	xref	_init_timer
 125                     	end
