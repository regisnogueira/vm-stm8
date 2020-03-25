   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  44                     ; 7 void init_led(void)
  44                     ; 8 {
  46                     	switch	.text
  47  0000               _init_led:
  51                     ; 9     led1_dir();
  53  0000 4be0          	push	#224
  54  0002 4b20          	push	#32
  55  0004 ae5005        	ldw	x,#20485
  56  0007 cd0000        	call	_GPIO_Init
  58  000a 85            	popw	x
  59                     ; 10     set_led(LED1, BLINK_SLOW);
  62  000b ae09c4        	ldw	x,#2500
  63  000e 89            	pushw	x
  64  000f 4f            	clr	a
  65  0010 ad2e          	call	_set_led
  67  0012 85            	popw	x
  68                     ; 11 }
  71  0013 81            	ret
  97                     ; 13 void task_led(void)
  97                     ; 14 {
  98                     	switch	.text
  99  0014               _task_led:
 103                     ; 15     if (++led[LED1].time < led[LED1].speed) {
 105  0014 be00          	ldw	x,_led
 106  0016 1c0001        	addw	x,#1
 107  0019 bf00          	ldw	_led,x
 108  001b b302          	cpw	x,_led+2
 109  001d 240b          	jruge	L13
 110                     ; 16         led1_off();
 112  001f 4b20          	push	#32
 113  0021 ae5005        	ldw	x,#20485
 114  0024 cd0000        	call	_GPIO_WriteHigh
 116  0027 84            	pop	a
 118  0028 2015          	jra	L33
 119  002a               L13:
 120                     ; 18         led1_on();
 122  002a 4b20          	push	#32
 123  002c ae5005        	ldw	x,#20485
 124  002f cd0000        	call	_GPIO_WriteLow
 126  0032 84            	pop	a
 127                     ; 19         if (led[LED1].time > led[LED1].speed + LED_PULSE) {
 129  0033 be02          	ldw	x,_led+2
 130  0035 1c0032        	addw	x,#50
 131  0038 b300          	cpw	x,_led
 132  003a 2403          	jruge	L33
 133                     ; 20             led[LED1].time = 0;
 135  003c 5f            	clrw	x
 136  003d bf00          	ldw	_led,x
 137  003f               L33:
 138                     ; 23 }
 141  003f 81            	ret
 185                     ; 25 void set_led(uint8_t ledx, uint16_t speed)
 185                     ; 26 {
 186                     	switch	.text
 187  0040               _set_led:
 189  0040 88            	push	a
 190       00000000      OFST:	set	0
 193                     ; 27     led[ledx].speed = speed;
 195  0041 97            	ld	xl,a
 196  0042 a604          	ld	a,#4
 197  0044 42            	mul	x,a
 198  0045 1604          	ldw	y,(OFST+4,sp)
 199  0047 ef02          	ldw	(_led+2,x),y
 200                     ; 28 }
 203  0049 84            	pop	a
 204  004a 81            	ret
 252                     	switch	.ubsct
 253  0000               _led:
 254  0000 00000000      	ds.b	4
 255                     	xdef	_led
 256                     	xdef	_set_led
 257                     	xdef	_task_led
 258                     	xdef	_init_led
 259                     	xref	_GPIO_WriteLow
 260                     	xref	_GPIO_WriteHigh
 261                     	xref	_GPIO_Init
 281                     	end
