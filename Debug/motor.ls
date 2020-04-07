   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  48                     ; 13 void init_motor(void)
  48                     ; 14 {
  50                     	switch	.text
  51  0000               _init_motor:
  55                     ; 15     motor_relay_dir();
  57  0000 4be0          	push	#224
  58  0002 4b08          	push	#8
  59  0004 ae5000        	ldw	x,#20480
  60  0007 cd0000        	call	_GPIO_Init
  62  000a 85            	popw	x
  63                     ; 17     motor.max_pos = eeprom.max_position;
  66  000b be08          	ldw	x,_eeprom+8
  67  000d bf02          	ldw	_motor+2,x
  68                     ; 18     motor.max_pos = eeprom.min_position;
  70  000f be0a          	ldw	x,_eeprom+10
  71  0011 bf02          	ldw	_motor+2,x
  72                     ; 19     motor.speed = 0;
  74  0013 5f            	clrw	x
  75  0014 bf07          	ldw	_motor+7,x
  76                     ; 21     init_pwm(PWM_PERIOD);
  78  0016 aeea60        	ldw	x,#60000
  79  0019 cd0000        	call	_init_pwm
  81                     ; 22     set_pwm(motor.speed);
  83  001c be07          	ldw	x,_motor+7
  84  001e cd0000        	call	_set_pwm
  86                     ; 23 }
  89  0021 81            	ret
 124                     .const:	section	.text
 125  0000               L21:
 126  0000 0000ea61      	dc.l	60001
 127                     ; 25 void speed_up(uint8_t value)
 127                     ; 26 {
 128                     	switch	.text
 129  0022               _speed_up:
 133                     ; 27     motor.speed += value;
 135  0022 bb08          	add	a,_motor+8
 136  0024 b708          	ld	_motor+8,a
 137  0026 2402          	jrnc	L01
 138  0028 3c07          	inc	_motor+7
 139  002a               L01:
 140                     ; 28     if (motor.speed > PWM_PERIOD)
 142  002a 9c            	rvf
 143  002b be07          	ldw	x,_motor+7
 144  002d cd0000        	call	c_uitolx
 146  0030 ae0000        	ldw	x,#L21
 147  0033 cd0000        	call	c_lcmp
 149  0036 2f05          	jrslt	L73
 150                     ; 29         motor.speed = PWM_PERIOD;
 152  0038 aeea60        	ldw	x,#60000
 153  003b bf07          	ldw	_motor+7,x
 154  003d               L73:
 155                     ; 30 }
 158  003d 81            	ret
 193                     ; 32 void speed_down(uint8_t value)
 193                     ; 33 {
 194                     	switch	.text
 195  003e               _speed_down:
 199                     ; 34     if (motor.speed >= value)
 201  003e 5f            	clrw	x
 202  003f 97            	ld	xl,a
 203  0040 b307          	cpw	x,_motor+7
 204  0042 220b          	jrugt	L75
 205                     ; 35         motor.speed -= value;
 207  0044 5f            	clrw	x
 208  0045 97            	ld	xl,a
 209  0046 72b00007      	subw	x,_motor+7
 210  004a 50            	negw	x
 211  004b bf07          	ldw	_motor+7,x
 213  004d 2003          	jra	L16
 214  004f               L75:
 215                     ; 37         motor.speed = 0;
 217  004f 5f            	clrw	x
 218  0050 bf07          	ldw	_motor+7,x
 219  0052               L16:
 220                     ; 38 }
 223  0052 81            	ret
 248                     ; 40 void set_position(void) 
 248                     ; 41 {
 249                     	switch	.text
 250  0053               _set_position:
 254                     ; 42     motor.position = adc_val;
 256  0053 be00          	ldw	x,_adc_val
 257  0055 bf00          	ldw	_motor,x
 258                     ; 43 }
 261  0057 81            	ret
 286                     ; 45 void tmr_motor(void) 
 286                     ; 46 {
 287                     	switch	.text
 288  0058               _tmr_motor:
 292                     ; 48     if (motor.flags & INVERT_ROTATION) {
 294  0058 b60b          	ld	a,_motor+11
 295  005a a501          	bcp	a,#1
 296  005c 2713          	jreq	L301
 297                     ; 49         motor.timer--;
 299  005e 3a09          	dec	_motor+9
 300                     ; 50         if (!motor.timer) {
 302  0060 3d09          	tnz	_motor+9
 303  0062 260d          	jrne	L301
 304                     ; 51             motor_invert();
 306  0064 4b08          	push	#8
 307  0066 ae5000        	ldw	x,#20480
 308  0069 cd0000        	call	_GPIO_WriteReverse
 310  006c 84            	pop	a
 311                     ; 52             motor.flags &= ~INVERT_ROTATION;
 313  006d 7211000b      	bres	_motor+11,#0
 314  0071               L301:
 315                     ; 55 }
 318  0071 81            	ret
 345                     ; 57 void task_motor(void)
 345                     ; 58 {
 346                     	switch	.text
 347  0072               _task_motor:
 351                     ; 59     motor.position = adc_val;
 353  0072 be00          	ldw	x,_adc_val
 354  0074 bf00          	ldw	_motor,x
 355                     ; 63     if (((motor.position > motor.max_pos) || 
 355                     ; 64          (motor.position < motor.min_pos)) &&
 355                     ; 65         !(motor.flags & INVERT_ROTATION)) {
 357  0076 be00          	ldw	x,_motor
 358  0078 b302          	cpw	x,_motor+2
 359  007a 2206          	jrugt	L121
 361  007c be00          	ldw	x,_motor
 362  007e b304          	cpw	x,_motor+4
 363  0080 2415          	jruge	L711
 364  0082               L121:
 366  0082 b60b          	ld	a,_motor+11
 367  0084 a501          	bcp	a,#1
 368  0086 260f          	jrne	L711
 369                     ; 66         motor.flags |= INVERT_ROTATION;
 371  0088 7210000b      	bset	_motor+11,#0
 372                     ; 67         motor.timer = INVERT_MOTOR_TIME;
 374  008c 35640009      	mov	_motor+9,#100
 375                     ; 68         motor.speed = 0;
 377  0090 5f            	clrw	x
 378  0091 bf07          	ldw	_motor+7,x
 379                     ; 69         set_pwm(motor.speed);
 381  0093 5f            	clrw	x
 382  0094 cd0000        	call	_set_pwm
 384  0097               L711:
 385                     ; 72     if (!tick)
 387  0097 3d00          	tnz	_tick
 388  0099 2601          	jrne	L321
 389                     ; 73         return;
 392  009b 81            	ret
 393  009c               L321:
 394                     ; 75     set_pwm(motor.speed);
 396  009c be07          	ldw	x,_motor+7
 397  009e cd0000        	call	_set_pwm
 399                     ; 76 }
 402  00a1 81            	ret
 483                     	xdef	_tmr_motor
 484                     	switch	.ubsct
 485  0000               _motor:
 486  0000 000000000000  	ds.b	12
 487                     	xdef	_motor
 488                     	xref.b	_eeprom
 489                     	xref.b	_tick
 490                     	xref.b	_adc_val
 491                     	xdef	_speed_down
 492                     	xdef	_speed_up
 493                     	xdef	_set_position
 494                     	xdef	_task_motor
 495                     	xdef	_init_motor
 496                     	xref	_set_pwm
 497                     	xref	_init_pwm
 498                     	xref	_GPIO_WriteReverse
 499                     	xref	_GPIO_Init
 519                     	xref	c_lcmp
 520                     	xref	c_uitolx
 521                     	end
