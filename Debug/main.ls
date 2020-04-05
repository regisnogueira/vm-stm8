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
  80                     ; 20     init_pwm();
  82  000f cd0000        	call	_init_pwm
  84  0012               L12:
  85                     ; 23         pool_tick();
  87  0012 cd0000        	call	_pool_tick
  89                     ; 24         set_pwm(adc_val);
  91  0015 be00          	ldw	x,_adc_val
  92  0017 cd0000        	call	_set_pwm
  94                     ; 25         task_display();
  96  001a cd0000        	call	_task_display
  99  001d 20f3          	jra	L12
 112                     	xdef	_main
 113                     	xref.b	_adc_val
 114                     	xref	_set_pwm
 115                     	xref	_init_pwm
 116                     	xref	_task_display
 117                     	xref	_init_display
 118                     	xref	_init_adc
 119                     	xref	_init_uart
 120                     	xref	_init_buzzer
 121                     	xref	_pool_tick
 122                     	xref	_init_timer
 141                     	end
