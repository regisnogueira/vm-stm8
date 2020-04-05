   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  52                     ; 10 void main(void)
  52                     ; 11 {
  54                     	switch	.text
  55  0000               _main:
  59                     ; 12     init_timer();    
  61  0000 cd0000        	call	_init_timer
  63                     ; 13     init_buzzer();
  65  0003 cd0000        	call	_init_buzzer
  67                     ; 14     init_uart();
  69  0006 cd0000        	call	_init_uart
  71                     ; 15     init_adc();
  73  0009 cd0000        	call	_init_adc
  75                     ; 17     init_display();
  77  000c cd0000        	call	_init_display
  79                     ; 18     init_motor();
  81  000f cd0000        	call	_init_motor
  83  0012               L12:
  84                     ; 21         set_pwm(55000);
  86  0012 aed6d8        	ldw	x,#55000
  87  0015 cd0000        	call	_set_pwm
  89                     ; 22         delay(1000);
  91  0018 ae03e8        	ldw	x,#1000
  92  001b 89            	pushw	x
  93  001c ae0000        	ldw	x,#0
  94  001f 89            	pushw	x
  95  0020 cd0000        	call	_delay
  97  0023 5b04          	addw	sp,#4
  98                     ; 23         set_pwm(0);
 100  0025 5f            	clrw	x
 101  0026 cd0000        	call	_set_pwm
 103                     ; 24         delay(100);
 105  0029 ae0064        	ldw	x,#100
 106  002c 89            	pushw	x
 107  002d ae0000        	ldw	x,#0
 108  0030 89            	pushw	x
 109  0031 cd0000        	call	_delay
 111  0034 5b04          	addw	sp,#4
 112                     ; 25         motor_invert();
 114  0036 4b08          	push	#8
 115  0038 ae5000        	ldw	x,#20480
 116  003b cd0000        	call	_GPIO_WriteReverse
 118  003e 84            	pop	a
 119                     ; 26         delay(100);
 121  003f ae0064        	ldw	x,#100
 122  0042 89            	pushw	x
 123  0043 ae0000        	ldw	x,#0
 124  0046 89            	pushw	x
 125  0047 cd0000        	call	_delay
 127  004a 5b04          	addw	sp,#4
 129  004c 20c4          	jra	L12
 142                     	xdef	_main
 143                     	xref	_init_motor
 144                     	xref	_set_pwm
 145                     	xref	_init_display
 146                     	xref	_init_adc
 147                     	xref	_init_uart
 148                     	xref	_init_buzzer
 149                     	xref	_delay
 150                     	xref	_init_timer
 151                     	xref	_GPIO_WriteReverse
 170                     	end
