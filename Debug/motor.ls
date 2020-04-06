   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  47                     ; 16 void init_motor(void)
  47                     ; 17 {
  49                     	switch	.text
  50  0000               _init_motor:
  54                     ; 18     motor_relay_dir();
  56  0000 4be0          	push	#224
  57  0002 4b08          	push	#8
  58  0004 ae5000        	ldw	x,#20480
  59  0007 cd0000        	call	_GPIO_Init
  61  000a 85            	popw	x
  62                     ; 19     init_pwm(PWM_PERIOD);
  65  000b aeea60        	ldw	x,#60000
  66  000e cd0000        	call	_init_pwm
  68                     ; 20     motor.max_pos = eeprom.max_position;
  70  0011 be08          	ldw	x,_eeprom+8
  71  0013 bf02          	ldw	_motor+2,x
  72                     ; 21     motor.max_pos = eeprom.min_position;
  74  0015 be0a          	ldw	x,_eeprom+10
  75  0017 bf02          	ldw	_motor+2,x
  76                     ; 22     motor.speed = 0;
  78  0019 5f            	clrw	x
  79  001a bf07          	ldw	_motor+7,x
  80                     ; 23 }
  83  001c 81            	ret
 118                     .const:	section	.text
 119  0000               L21:
 120  0000 0000ea61      	dc.l	60001
 121                     ; 25 void speed_up(uint8_t value)
 121                     ; 26 {
 122                     	switch	.text
 123  001d               _speed_up:
 127                     ; 27     motor.speed += value;
 129  001d bb08          	add	a,_motor+8
 130  001f b708          	ld	_motor+8,a
 131  0021 2402          	jrnc	L01
 132  0023 3c07          	inc	_motor+7
 133  0025               L01:
 134                     ; 28     if (motor.speed > PWM_PERIOD)
 136  0025 9c            	rvf
 137  0026 be07          	ldw	x,_motor+7
 138  0028 cd0000        	call	c_uitolx
 140  002b ae0000        	ldw	x,#L21
 141  002e cd0000        	call	c_lcmp
 143  0031 2f05          	jrslt	L73
 144                     ; 29         motor.speed = PWM_PERIOD;
 146  0033 aeea60        	ldw	x,#60000
 147  0036 bf07          	ldw	_motor+7,x
 148  0038               L73:
 149                     ; 30 }
 152  0038 81            	ret
 187                     ; 32 void speed_down(uint8_t value)
 187                     ; 33 {
 188                     	switch	.text
 189  0039               _speed_down:
 193                     ; 34     if (motor.speed >= value)
 195  0039 5f            	clrw	x
 196  003a 97            	ld	xl,a
 197  003b b307          	cpw	x,_motor+7
 198  003d 220b          	jrugt	L75
 199                     ; 35         motor.speed -= value;
 201  003f 5f            	clrw	x
 202  0040 97            	ld	xl,a
 203  0041 72b00007      	subw	x,_motor+7
 204  0045 50            	negw	x
 205  0046 bf07          	ldw	_motor+7,x
 207  0048 2003          	jra	L16
 208  004a               L75:
 209                     ; 37         motor.speed = 0;
 211  004a 5f            	clrw	x
 212  004b bf07          	ldw	_motor+7,x
 213  004d               L16:
 214                     ; 38 }
 217  004d 81            	ret
 242                     ; 40 void set_position(void) 
 242                     ; 41 {
 243                     	switch	.text
 244  004e               _set_position:
 248                     ; 42     motor.position = adc_val;
 250  004e be00          	ldw	x,_adc_val
 251  0050 bf00          	ldw	_motor,x
 252                     ; 43 }
 255  0052 81            	ret
 280                     ; 45 void tmr_motor(void) 
 280                     ; 46 {
 281                     	switch	.text
 282  0053               _tmr_motor:
 286                     ; 47     if (motor.flags & INVERT_ROTATION) {
 288  0053 b60b          	ld	a,_motor+11
 289  0055 a501          	bcp	a,#1
 290  0057 2713          	jreq	L301
 291                     ; 48         motor.timer--;
 293  0059 3a09          	dec	_motor+9
 294                     ; 49         if (!motor.timer) {
 296  005b 3d09          	tnz	_motor+9
 297  005d 260d          	jrne	L301
 298                     ; 50             motor_invert();
 300  005f 4b08          	push	#8
 301  0061 ae5000        	ldw	x,#20480
 302  0064 cd0000        	call	_GPIO_WriteReverse
 304  0067 84            	pop	a
 305                     ; 51             motor.flags &= ~INVERT_ROTATION;
 307  0068 7211000b      	bres	_motor+11,#0
 308  006c               L301:
 309                     ; 54 }
 312  006c 81            	ret
 339                     ; 56 void task_motor(void)
 339                     ; 57 {
 340                     	switch	.text
 341  006d               _task_motor:
 345                     ; 58     motor.position = adc_val;
 347  006d be00          	ldw	x,_adc_val
 348  006f bf00          	ldw	_motor,x
 349                     ; 60     if (((motor.position > motor.max_pos) || 
 349                     ; 61          (motor.position < motor.min_pos)) &&
 349                     ; 62         !(motor.flags & INVERT_ROTATION)) {
 351  0071 be00          	ldw	x,_motor
 352  0073 b302          	cpw	x,_motor+2
 353  0075 2206          	jrugt	L121
 355  0077 be00          	ldw	x,_motor
 356  0079 b304          	cpw	x,_motor+4
 357  007b 2415          	jruge	L711
 358  007d               L121:
 360  007d b60b          	ld	a,_motor+11
 361  007f a501          	bcp	a,#1
 362  0081 260f          	jrne	L711
 363                     ; 63         motor.flags |= INVERT_ROTATION;
 365  0083 7210000b      	bset	_motor+11,#0
 366                     ; 64         motor.timer = INVERT_MOTOR_TIME;
 368  0087 35640009      	mov	_motor+9,#100
 369                     ; 65         motor.speed = 0;
 371  008b 5f            	clrw	x
 372  008c bf07          	ldw	_motor+7,x
 373                     ; 66         set_pwm(motor.speed);
 375  008e 5f            	clrw	x
 376  008f cd0000        	call	_set_pwm
 378  0092               L711:
 379                     ; 69     if (!tick)
 381  0092 3d00          	tnz	_tick
 382  0094 2601          	jrne	L321
 383                     ; 70         return;
 386  0096 81            	ret
 387  0097               L321:
 388                     ; 72     set_pwm(motor.speed);
 390  0097 be07          	ldw	x,_motor+7
 391  0099 cd0000        	call	_set_pwm
 393                     ; 73 }
 396  009c 81            	ret
 477                     	xdef	_tmr_motor
 478                     	switch	.ubsct
 479  0000               _motor:
 480  0000 000000000000  	ds.b	12
 481                     	xdef	_motor
 482                     	xref.b	_eeprom
 483                     	xref.b	_tick
 484                     	xref.b	_adc_val
 485                     	xdef	_speed_down
 486                     	xdef	_speed_up
 487                     	xdef	_set_position
 488                     	xdef	_task_motor
 489                     	xdef	_init_motor
 490                     	xref	_set_pwm
 491                     	xref	_init_pwm
 492                     	xref	_GPIO_WriteReverse
 493                     	xref	_GPIO_Init
 513                     	xref	c_lcmp
 514                     	xref	c_uitolx
 515                     	end
