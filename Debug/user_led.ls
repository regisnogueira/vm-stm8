   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  49                     ; 7 void init_led(void)
  49                     ; 8 {
  51                     	switch	.text
  52  0000               _init_led:
  56                     ; 9     led1_dir();
  58  0000 4be0          	push	#224
  59  0002 4b20          	push	#32
  60  0004 ae5005        	ldw	x,#20485
  61  0007 cd0000        	call	_GPIO_Init
  63  000a 85            	popw	x
  64                     ; 10     set_led(LED1, BLINK_SLOW);
  67  000b ae09c4        	ldw	x,#2500
  68  000e 89            	pushw	x
  69  000f 4f            	clr	a
  70  0010 ad2b          	call	_set_led
  72  0012 85            	popw	x
  73                     ; 11 }
  76  0013 81            	ret	
 102                     ; 13 void task_led(void)
 102                     ; 14 {
 103                     	switch	.text
 104  0014               _task_led:
 108                     ; 15     if (++led[LED1].time < led[LED1].speed) {
 110  0014 be00          	ldw	x,_led
 111  0016 5c            	incw	x
 112  0017 bf00          	ldw	_led,x
 113  0019 b302          	cpw	x,_led+2
 114  001b 240a          	jruge	L13
 115                     ; 16         led1_off();
 117  001d 4b20          	push	#32
 118  001f ae5005        	ldw	x,#20485
 119  0022 cd0000        	call	_GPIO_WriteHigh
 121  0025 84            	pop	a
 124  0026 81            	ret	
 125  0027               L13:
 126                     ; 18         led1_on();
 128  0027 4b20          	push	#32
 129  0029 ae5005        	ldw	x,#20485
 130  002c cd0000        	call	_GPIO_WriteLow
 132  002f be02          	ldw	x,_led+2
 133  0031 1c0032        	addw	x,#50
 134  0034 b300          	cpw	x,_led
 135  0036 84            	pop	a
 136                     ; 19         if (led[LED1].time > led[LED1].speed + LED_PULSE) {
 138  0037 2403          	jruge	L33
 139                     ; 20             led[LED1].time = 0;
 141  0039 5f            	clrw	x
 142  003a bf00          	ldw	_led,x
 143  003c               L33:
 144                     ; 23 }
 147  003c 81            	ret	
 191                     ; 25 void set_led(uint8_t ledx, uint16_t speed)
 191                     ; 26 {
 192                     	switch	.text
 193  003d               _set_led:
 195       ffffffff      OFST: set -1
 198                     ; 27     led[ledx].speed = speed;
 200  003d 97            	ld	xl,a
 201  003e a604          	ld	a,#4
 202  0040 42            	mul	x,a
 203  0041 1603          	ldw	y,(OFST+4,sp)
 204  0043 ef02          	ldw	(_led+2,x),y
 205                     ; 28 }
 208  0045 81            	ret	
 256                     	switch	.ubsct
 257  0000               _led:
 258  0000 00000000      	ds.b	4
 259                     	xdef	_led
 260                     	xdef	_set_led
 261                     	xdef	_task_led
 262                     	xdef	_init_led
 263                     	xref	_GPIO_WriteLow
 264                     	xref	_GPIO_WriteHigh
 265                     	xref	_GPIO_Init
 285                     	end
