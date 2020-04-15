   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  47                     ; 13 void init_motor(void)
  47                     ; 14 {
  49                     	switch	.text
  50  0000               _init_motor:
  54                     ; 16     motor_relay_dir();
  56  0000 4be0          	push	#224
  57  0002 4b08          	push	#8
  58  0004 ae5000        	ldw	x,#20480
  59  0007 cd0000        	call	_GPIO_Init
  61  000a 85            	popw	x
  62                     ; 18     motor.max_pos = eeprom.max_position;
  65  000b be0c          	ldw	x,_eeprom+12
  66  000d bf02          	ldw	_motor+2,x
  67                     ; 19     motor.min_pos = eeprom.min_position;
  69  000f be0e          	ldw	x,_eeprom+14
  70  0011 bf04          	ldw	_motor+4,x
  71                     ; 20     motor.speed = PWM_PERIOD/2;
  73  0013 ae7530        	ldw	x,#30000
  74  0016 bf07          	ldw	_motor+7,x
  75                     ; 22     if (motor.max_pos > MAX_POSITION)
  77  0018 be02          	ldw	x,_motor+2
  78  001a a303f3        	cpw	x,#1011
  79  001d 2505          	jrult	L12
  80                     ; 23         motor.max_pos = MAX_POSITION;
  82  001f ae03f2        	ldw	x,#1010
  83  0022 bf02          	ldw	_motor+2,x
  84  0024               L12:
  85                     ; 25     if (motor.min_pos < MIN_POSITION)
  87  0024 be04          	ldw	x,_motor+4
  88  0026 a3000a        	cpw	x,#10
  89  0029 2405          	jruge	L32
  90                     ; 26         motor.min_pos = MIN_POSITION;
  92  002b ae000a        	ldw	x,#10
  93  002e bf04          	ldw	_motor+4,x
  94  0030               L32:
  95                     ; 28     init_pwm(PWM_PERIOD);
  97  0030 aeea60        	ldw	x,#60000
  98  0033 cd0000        	call	_init_pwm
 100                     ; 29     set_pwm(motor.speed);
 102  0036 be07          	ldw	x,_motor+7
 103  0038 cd0000        	call	_set_pwm
 105                     ; 31 }
 108  003b 81            	ret
 143                     .const:	section	.text
 144  0000               L21:
 145  0000 0000ea61      	dc.l	60001
 146                     ; 33 void speed_up(uint8_t value)
 146                     ; 34 {
 147                     	switch	.text
 148  003c               _speed_up:
 152                     ; 36     motor.speed += value;
 154  003c bb08          	add	a,_motor+8
 155  003e b708          	ld	_motor+8,a
 156  0040 2402          	jrnc	L01
 157  0042 3c07          	inc	_motor+7
 158  0044               L01:
 159                     ; 37     if (motor.speed > PWM_PERIOD)
 161  0044 9c            	rvf
 162  0045 be07          	ldw	x,_motor+7
 163  0047 cd0000        	call	c_uitolx
 165  004a ae0000        	ldw	x,#L21
 166  004d cd0000        	call	c_lcmp
 168  0050 2f05          	jrslt	L34
 169                     ; 38         motor.speed = PWM_PERIOD;
 171  0052 aeea60        	ldw	x,#60000
 172  0055 bf07          	ldw	_motor+7,x
 173  0057               L34:
 174                     ; 40 }
 177  0057 81            	ret
 212                     ; 42 void speed_down(uint8_t value)
 212                     ; 43 {
 213                     	switch	.text
 214  0058               _speed_down:
 218                     ; 45     if (motor.speed >= value)
 220  0058 5f            	clrw	x
 221  0059 97            	ld	xl,a
 222  005a b307          	cpw	x,_motor+7
 223  005c 220b          	jrugt	L36
 224                     ; 46         motor.speed -= value;
 226  005e 5f            	clrw	x
 227  005f 97            	ld	xl,a
 228  0060 72b00007      	subw	x,_motor+7
 229  0064 50            	negw	x
 230  0065 bf07          	ldw	_motor+7,x
 232  0067 2003          	jra	L56
 233  0069               L36:
 234                     ; 48         motor.speed = 0;
 236  0069 5f            	clrw	x
 237  006a bf07          	ldw	_motor+7,x
 238  006c               L56:
 239                     ; 50 }
 242  006c 81            	ret
 267                     ; 52 void set_position(void) 
 267                     ; 53 {
 268                     	switch	.text
 269  006d               _set_position:
 273                     ; 55     motor.position = adc_val;
 275  006d be00          	ldw	x,_adc_val
 276  006f bf00          	ldw	_motor,x
 277                     ; 57 }
 280  0071 81            	ret
 305                     ; 59 void tmr_motor(void) 
 305                     ; 60 {
 306                     	switch	.text
 307  0072               _tmr_motor:
 311                     ; 63     if (motor.flags & INVERT_ROTATION) {
 313  0072 b60b          	ld	a,_motor+11
 314  0074 a501          	bcp	a,#1
 315  0076 2713          	jreq	L701
 316                     ; 64         motor.timer--;
 318  0078 3a09          	dec	_motor+9
 319                     ; 65         if (!motor.timer) {
 321  007a 3d09          	tnz	_motor+9
 322  007c 260d          	jrne	L701
 323                     ; 66             motor_invert();
 325  007e 4b08          	push	#8
 326  0080 ae5000        	ldw	x,#20480
 327  0083 cd0000        	call	_GPIO_WriteReverse
 329  0086 84            	pop	a
 330                     ; 67             motor.flags &= ~INVERT_ROTATION;
 332  0087 7211000b      	bres	_motor+11,#0
 333  008b               L701:
 334                     ; 71 }
 337  008b 81            	ret
 340                     	bsct
 341  0000               L311_prev_speed:
 342  0000 0000          	dc.w	0
 377                     ; 73 void task_motor(void)
 377                     ; 74 {
 378                     	switch	.text
 379  008c               _task_motor:
 383                     ; 77     motor.position = adc_val;
 385  008c be00          	ldw	x,_adc_val
 386  008e bf00          	ldw	_motor,x
 387                     ; 81     if (((motor.position > motor.max_pos) || 
 387                     ; 82          (motor.position < motor.min_pos)) &&
 387                     ; 83         !(motor.flags & INVERT_ROTATION)) {
 389  0090 be00          	ldw	x,_motor
 390  0092 b302          	cpw	x,_motor+2
 391  0094 2206          	jrugt	L531
 393  0096 be00          	ldw	x,_motor
 394  0098 b304          	cpw	x,_motor+4
 395  009a 2411          	jruge	L331
 396  009c               L531:
 398  009c b60b          	ld	a,_motor+11
 399  009e a501          	bcp	a,#1
 400  00a0 260b          	jrne	L331
 401                     ; 84         motor.flags |= INVERT_ROTATION;
 403  00a2 7210000b      	bset	_motor+11,#0
 404                     ; 85         motor.timer = INVERT_MOTOR_TIME;
 406  00a6 35140009      	mov	_motor+9,#20
 407                     ; 86         motor.speed = 0;
 409  00aa 5f            	clrw	x
 410  00ab bf07          	ldw	_motor+7,x
 411  00ad               L331:
 412                     ; 89     if (motor.speed != prev_speed)
 414  00ad be07          	ldw	x,_motor+7
 415  00af b300          	cpw	x,L311_prev_speed
 416  00b1 2705          	jreq	L731
 417                     ; 90         set_pwm(motor.speed);
 419  00b3 be07          	ldw	x,_motor+7
 420  00b5 cd0000        	call	_set_pwm
 422  00b8               L731:
 423                     ; 91     prev_speed = motor.speed;
 425  00b8 be07          	ldw	x,_motor+7
 426  00ba bf00          	ldw	L311_prev_speed,x
 427                     ; 93 }
 430  00bc 81            	ret
 511                     	xdef	_tmr_motor
 512                     	switch	.ubsct
 513  0000               _motor:
 514  0000 000000000000  	ds.b	12
 515                     	xdef	_motor
 516                     	xref.b	_eeprom
 517                     	xref.b	_adc_val
 518                     	xdef	_speed_down
 519                     	xdef	_speed_up
 520                     	xdef	_set_position
 521                     	xdef	_task_motor
 522                     	xdef	_init_motor
 523                     	xref	_set_pwm
 524                     	xref	_init_pwm
 525                     	xref	_GPIO_WriteReverse
 526                     	xref	_GPIO_Init
 546                     	xref	c_lcmp
 547                     	xref	c_uitolx
 548                     	end
