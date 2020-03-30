   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  45                     ; 9 void init_led(void)
  45                     ; 10 {
  47                     	switch	.text
  48  0000               _init_led:
  52                     ; 12     led1_dir();
  54  0000 4be0          	push	#224
  55  0002 4b08          	push	#8
  56  0004 ae5000        	ldw	x,#20480
  57  0007 cd0000        	call	_GPIO_Init
  59  000a 85            	popw	x
  60                     ; 13     set_led(LED1, BLINK_SLOW);
  63  000b ae0384        	ldw	x,#900
  64  000e 89            	pushw	x
  65  000f 4f            	clr	a
  66  0010 ad2e          	call	_set_led
  68  0012 85            	popw	x
  69                     ; 15 }
  72  0013 81            	ret
  98                     ; 17 void task_led(void)
  98                     ; 18 {
  99                     	switch	.text
 100  0014               _task_led:
 104                     ; 20     if (++led[LED1].time < led[LED1].speed) {
 106  0014 be00          	ldw	x,_led
 107  0016 1c0001        	addw	x,#1
 108  0019 bf00          	ldw	_led,x
 109  001b b302          	cpw	x,_led+2
 110  001d 240b          	jruge	L13
 111                     ; 21         led1_off();
 113  001f 4b08          	push	#8
 114  0021 ae5000        	ldw	x,#20480
 115  0024 cd0000        	call	_GPIO_WriteLow
 117  0027 84            	pop	a
 119  0028 2015          	jra	L33
 120  002a               L13:
 121                     ; 23         led1_on();
 123  002a 4b08          	push	#8
 124  002c ae5000        	ldw	x,#20480
 125  002f cd0000        	call	_GPIO_WriteHigh
 127  0032 84            	pop	a
 128                     ; 24         if (led[LED1].time > led[LED1].speed + LED_PULSE) {
 130  0033 be02          	ldw	x,_led+2
 131  0035 1c0064        	addw	x,#100
 132  0038 b300          	cpw	x,_led
 133  003a 2403          	jruge	L33
 134                     ; 25             led[LED1].time = 0;
 136  003c 5f            	clrw	x
 137  003d bf00          	ldw	_led,x
 138  003f               L33:
 139                     ; 29 }
 142  003f 81            	ret
 186                     ; 31 void set_led(uint8_t ledx, uint16_t speed)
 186                     ; 32 {
 187                     	switch	.text
 188  0040               _set_led:
 190  0040 88            	push	a
 191       00000000      OFST:	set	0
 194                     ; 34     led[ledx].speed = speed;
 196  0041 97            	ld	xl,a
 197  0042 a604          	ld	a,#4
 198  0044 42            	mul	x,a
 199  0045 1604          	ldw	y,(OFST+4,sp)
 200  0047 ef02          	ldw	(_led+2,x),y
 201                     ; 36 }
 204  0049 84            	pop	a
 205  004a 81            	ret
 253                     	switch	.ubsct
 254  0000               _led:
 255  0000 00000000      	ds.b	4
 256                     	xdef	_led
 257                     	xdef	_set_led
 258                     	xdef	_task_led
 259                     	xdef	_init_led
 260                     	xref	_GPIO_WriteLow
 261                     	xref	_GPIO_WriteHigh
 262                     	xref	_GPIO_Init
 282                     	end
