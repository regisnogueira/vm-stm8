   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  44                     ; 9 void init_led(void)
  44                     ; 10 {
  46                     	switch	.text
  47  0000               _init_led:
  51                     ; 12     led1_dir();
  53  0000 4be0          	push	#224
  54  0002 4b08          	push	#8
  55  0004 ae5000        	ldw	x,#20480
  56  0007 cd0000        	call	_GPIO_Init
  58  000a 85            	popw	x
  59                     ; 13     led.time = 0;
  62  000b 5f            	clrw	x
  63  000c bf00          	ldw	_led,x
  64                     ; 16 }
  67  000e 81            	ret
  93                     ; 18 void tmr_led(void)
  93                     ; 19 {
  94                     	switch	.text
  95  000f               _tmr_led:
  99                     ; 21     if (++led.time < (led.speed - LED_PULSE)) {
 101  000f be00          	ldw	x,_led
 102  0011 1c0001        	addw	x,#1
 103  0014 bf00          	ldw	_led,x
 104  0016 90be02        	ldw	y,_led+2
 105  0019 72a20032      	subw	y,#50
 106  001d 90bf00        	ldw	c_y,y
 107  0020 b300          	cpw	x,c_y
 108  0022 240b          	jruge	L13
 109                     ; 22         led1_off();
 111  0024 4b08          	push	#8
 112  0026 ae5000        	ldw	x,#20480
 113  0029 cd0000        	call	_GPIO_WriteLow
 115  002c 84            	pop	a
 117  002d 201b          	jra	L33
 118  002f               L13:
 119                     ; 24         led1_on();
 121  002f 4b08          	push	#8
 122  0031 ae5000        	ldw	x,#20480
 123  0034 cd0000        	call	_GPIO_WriteHigh
 125  0037 84            	pop	a
 126                     ; 25         if (led.time >= led.speed) {
 128  0038 be00          	ldw	x,_led
 129  003a b302          	cpw	x,_led+2
 130  003c 250c          	jrult	L33
 131                     ; 26             led.time = 0;
 133  003e 5f            	clrw	x
 134  003f bf00          	ldw	_led,x
 135                     ; 27             led1_off();
 137  0041 4b08          	push	#8
 138  0043 ae5000        	ldw	x,#20480
 139  0046 cd0000        	call	_GPIO_WriteLow
 141  0049 84            	pop	a
 142  004a               L33:
 143                     ; 31 }
 146  004a 81            	ret
 181                     ; 33 void set_led_period(uint16_t speed)
 181                     ; 34 {
 182                     	switch	.text
 183  004b               _set_led_period:
 187                     ; 36     led.speed = speed*100;
 189  004b a664          	ld	a,#100
 190  004d cd0000        	call	c_bmulx
 192  0050 bf02          	ldw	_led+2,x
 193                     ; 38 }
 196  0052 81            	ret
 242                     	xdef	_tmr_led
 243                     	switch	.ubsct
 244  0000               _led:
 245  0000 00000000      	ds.b	4
 246                     	xdef	_led
 247                     	xdef	_set_led_period
 248                     	xdef	_init_led
 249                     	xref	_GPIO_WriteLow
 250                     	xref	_GPIO_WriteHigh
 251                     	xref	_GPIO_Init
 252                     	xref.b	c_x
 253                     	xref.b	c_y
 273                     	xref	c_bmulx
 274                     	end
