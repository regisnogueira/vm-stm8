   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  51                     ; 10 void main(void)
  51                     ; 11 {
  53                     	switch	.text
  54  0000               _main:
  58                     ; 12     init_timer();    
  60  0000 cd0000        	call	_init_timer
  62                     ; 13     init_buzzer();
  64  0003 cd0000        	call	_init_buzzer
  66                     ; 14     init_uart();
  68  0006 cd0000        	call	_init_uart
  70                     ; 15     init_adc();
  72  0009 cd0000        	call	_init_adc
  74                     ; 17     init_display();
  76  000c cd0000        	call	_init_display
  78  000f               L12:
  79                     ; 20         pool_tick();
  81  000f cd0000        	call	_pool_tick
  83                     ; 21         task_display();
  85  0012 cd0000        	call	_task_display
  87                     ; 22         task_motor();
  89  0015 cd0000        	call	_task_motor
  92  0018 20f5          	jra	L12
 105                     	xdef	_main
 106                     	xref	_task_motor
 107                     	xref	_task_display
 108                     	xref	_init_display
 109                     	xref	_init_adc
 110                     	xref	_init_uart
 111                     	xref	_init_buzzer
 112                     	xref	_pool_tick
 113                     	xref	_init_timer
 132                     	end
