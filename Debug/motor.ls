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
  67                     ; 19     motor.max_pos = eeprom.min_position;
  69  000f be0e          	ldw	x,_eeprom+14
  70  0011 bf02          	ldw	_motor+2,x
  71                     ; 20     motor.speed = 0;
  73  0013 5f            	clrw	x
  74  0014 bf07          	ldw	_motor+7,x
  75                     ; 22     init_pwm(PWM_PERIOD);
  77  0016 aeea60        	ldw	x,#60000
  78  0019 cd0000        	call	_init_pwm
  80                     ; 23     set_pwm(motor.speed);
  82  001c be07          	ldw	x,_motor+7
  83  001e cd0000        	call	_set_pwm
  85                     ; 25 }
  88  0021 81            	ret
 123                     .const:	section	.text
 124  0000               L21:
 125  0000 0000ea61      	dc.l	60001
 126                     ; 27 void speed_up(uint8_t value)
 126                     ; 28 {
 127                     	switch	.text
 128  0022               _speed_up:
 132                     ; 30     motor.speed += value;
 134  0022 bb08          	add	a,_motor+8
 135  0024 b708          	ld	_motor+8,a
 136  0026 2402          	jrnc	L01
 137  0028 3c07          	inc	_motor+7
 138  002a               L01:
 139                     ; 31     if (motor.speed > PWM_PERIOD)
 141  002a 9c            	rvf
 142  002b be07          	ldw	x,_motor+7
 143  002d cd0000        	call	c_uitolx
 145  0030 ae0000        	ldw	x,#L21
 146  0033 cd0000        	call	c_lcmp
 148  0036 2f05          	jrslt	L73
 149                     ; 32         motor.speed = PWM_PERIOD;
 151  0038 aeea60        	ldw	x,#60000
 152  003b bf07          	ldw	_motor+7,x
 153  003d               L73:
 154                     ; 34 }
 157  003d 81            	ret
 192                     ; 36 void speed_down(uint8_t value)
 192                     ; 37 {
 193                     	switch	.text
 194  003e               _speed_down:
 198                     ; 39     if (motor.speed >= value)
 200  003e 5f            	clrw	x
 201  003f 97            	ld	xl,a
 202  0040 b307          	cpw	x,_motor+7
 203  0042 220b          	jrugt	L75
 204                     ; 40         motor.speed -= value;
 206  0044 5f            	clrw	x
 207  0045 97            	ld	xl,a
 208  0046 72b00007      	subw	x,_motor+7
 209  004a 50            	negw	x
 210  004b bf07          	ldw	_motor+7,x
 212  004d 2003          	jra	L16
 213  004f               L75:
 214                     ; 42         motor.speed = 0;
 216  004f 5f            	clrw	x
 217  0050 bf07          	ldw	_motor+7,x
 218  0052               L16:
 219                     ; 44 }
 222  0052 81            	ret
 247                     ; 46 void set_position(void) 
 247                     ; 47 {
 248                     	switch	.text
 249  0053               _set_position:
 253                     ; 49     motor.position = adc_val;
 255  0053 be00          	ldw	x,_adc_val
 256  0055 bf00          	ldw	_motor,x
 257                     ; 51 }
 260  0057 81            	ret
 285                     ; 53 void tmr_motor(void) 
 285                     ; 54 {
 286                     	switch	.text
 287  0058               _tmr_motor:
 291                     ; 57     if (motor.flags & INVERT_ROTATION) {
 293  0058 b60b          	ld	a,_motor+11
 294  005a a501          	bcp	a,#1
 295  005c 2713          	jreq	L301
 296                     ; 58         motor.timer--;
 298  005e 3a09          	dec	_motor+9
 299                     ; 59         if (!motor.timer) {
 301  0060 3d09          	tnz	_motor+9
 302  0062 260d          	jrne	L301
 303                     ; 60             motor_invert();
 305  0064 4b08          	push	#8
 306  0066 ae5000        	ldw	x,#20480
 307  0069 cd0000        	call	_GPIO_WriteReverse
 309  006c 84            	pop	a
 310                     ; 61             motor.flags &= ~INVERT_ROTATION;
 312  006d 7211000b      	bres	_motor+11,#0
 313  0071               L301:
 314                     ; 65 }
 317  0071 81            	ret
 320                     	bsct
 321  0000               L701_prev_speed:
 322  0000 0000          	dc.w	0
 357                     ; 67 void task_motor(void)
 357                     ; 68 {
 358                     	switch	.text
 359  0072               _task_motor:
 363                     ; 71     motor.position = adc_val;
 365  0072 be00          	ldw	x,_adc_val
 366  0074 bf00          	ldw	_motor,x
 367                     ; 75     if (((motor.position > motor.max_pos) || 
 367                     ; 76          (motor.position < motor.min_pos)) &&
 367                     ; 77         !(motor.flags & INVERT_ROTATION)) {
 369  0076 be00          	ldw	x,_motor
 370  0078 b302          	cpw	x,_motor+2
 371  007a 2206          	jrugt	L131
 373  007c be00          	ldw	x,_motor
 374  007e b304          	cpw	x,_motor+4
 375  0080 2411          	jruge	L721
 376  0082               L131:
 378  0082 b60b          	ld	a,_motor+11
 379  0084 a501          	bcp	a,#1
 380  0086 260b          	jrne	L721
 381                     ; 78         motor.flags |= INVERT_ROTATION;
 383  0088 7210000b      	bset	_motor+11,#0
 384                     ; 79         motor.timer = INVERT_MOTOR_TIME;
 386  008c 35640009      	mov	_motor+9,#100
 387                     ; 80         motor.speed = 0;
 389  0090 5f            	clrw	x
 390  0091 bf07          	ldw	_motor+7,x
 391  0093               L721:
 392                     ; 83     if (motor.speed != prev_speed)
 394  0093 be07          	ldw	x,_motor+7
 395  0095 b300          	cpw	x,L701_prev_speed
 396  0097 2705          	jreq	L331
 397                     ; 84         set_pwm(motor.speed);
 399  0099 be07          	ldw	x,_motor+7
 400  009b cd0000        	call	_set_pwm
 402  009e               L331:
 403                     ; 85     prev_speed = motor.speed;
 405  009e be07          	ldw	x,_motor+7
 406  00a0 bf00          	ldw	L701_prev_speed,x
 407                     ; 87 }
 410  00a2 81            	ret
 491                     	xdef	_tmr_motor
 492                     	switch	.ubsct
 493  0000               _motor:
 494  0000 000000000000  	ds.b	12
 495                     	xdef	_motor
 496                     	xref.b	_eeprom
 497                     	xref.b	_adc_val
 498                     	xdef	_speed_down
 499                     	xdef	_speed_up
 500                     	xdef	_set_position
 501                     	xdef	_task_motor
 502                     	xdef	_init_motor
 503                     	xref	_set_pwm
 504                     	xref	_init_pwm
 505                     	xref	_GPIO_WriteReverse
 506                     	xref	_GPIO_Init
 526                     	xref	c_lcmp
 527                     	xref	c_uitolx
 528                     	end
