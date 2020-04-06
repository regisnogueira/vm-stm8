   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  46                     ; 13 void init_motor(void)
  46                     ; 14 {
  48                     	switch	.text
  49  0000               _init_motor:
  53                     ; 15     motor_relay_dir();
  55  0000 4be0          	push	#224
  56  0002 4b08          	push	#8
  57  0004 ae5000        	ldw	x,#20480
  58  0007 cd0000        	call	_GPIO_Init
  60  000a 85            	popw	x
  61                     ; 16     init_pwm(PWM_PERIOD);
  64  000b aeea60        	ldw	x,#60000
  65  000e cd0000        	call	_init_pwm
  67                     ; 17     motor.speed = 0;
  69  0011 5f            	clrw	x
  70  0012 bf07          	ldw	_motor+7,x
  71                     ; 18 }
  74  0014 81            	ret
  97                     ; 20 void stop_motor(void)
  97                     ; 21 {
  98                     	switch	.text
  99  0015               _stop_motor:
 103                     ; 23 }
 106  0015 81            	ret
 141                     .const:	section	.text
 142  0000               L41:
 143  0000 0000ea61      	dc.l	60001
 144                     ; 25 void inc_speed(uint8_t value)
 144                     ; 26 {
 145                     	switch	.text
 146  0016               _inc_speed:
 150                     ; 27     motor.speed += value;
 152  0016 bb08          	add	a,_motor+8
 153  0018 b708          	ld	_motor+8,a
 154  001a 2402          	jrnc	L21
 155  001c 3c07          	inc	_motor+7
 156  001e               L21:
 157                     ; 28     if (motor.speed > PWM_PERIOD)
 159  001e 9c            	rvf
 160  001f be07          	ldw	x,_motor+7
 161  0021 cd0000        	call	c_uitolx
 163  0024 ae0000        	ldw	x,#L41
 164  0027 cd0000        	call	c_lcmp
 166  002a 2f05          	jrslt	L74
 167                     ; 29         motor.speed = PWM_PERIOD;
 169  002c aeea60        	ldw	x,#60000
 170  002f bf07          	ldw	_motor+7,x
 171  0031               L74:
 172                     ; 30 }
 175  0031 81            	ret
 210                     ; 32 void dec_speed(uint8_t value)
 210                     ; 33 {
 211                     	switch	.text
 212  0032               _dec_speed:
 216                     ; 34     if (motor.speed >= value)
 218  0032 5f            	clrw	x
 219  0033 97            	ld	xl,a
 220  0034 b307          	cpw	x,_motor+7
 221  0036 220b          	jrugt	L76
 222                     ; 35         motor.speed -= value;
 224  0038 5f            	clrw	x
 225  0039 97            	ld	xl,a
 226  003a 72b00007      	subw	x,_motor+7
 227  003e 50            	negw	x
 228  003f bf07          	ldw	_motor+7,x
 230  0041 2003          	jra	L17
 231  0043               L76:
 232                     ; 37         motor.speed = 0;
 234  0043 5f            	clrw	x
 235  0044 bf07          	ldw	_motor+7,x
 236  0046               L17:
 237                     ; 38 }
 240  0046 81            	ret
 265                     ; 40 void set_position(void) 
 265                     ; 41 {
 266                     	switch	.text
 267  0047               _set_position:
 271                     ; 42     motor.position = adc_val;
 273  0047 be00          	ldw	x,_adc_val
 274  0049 bf00          	ldw	_motor,x
 275                     ; 43 }
 278  004b 81            	ret
 303                     ; 45 void tmr_motor(void) 
 303                     ; 46 {
 304                     	switch	.text
 305  004c               _tmr_motor:
 309                     ; 47     if (motor.flags & INVERT_ROTATION) {
 311  004c b60b          	ld	a,_motor+11
 312  004e a501          	bcp	a,#1
 313  0050 2713          	jreq	L311
 314                     ; 48         motor.timer--;
 316  0052 3a09          	dec	_motor+9
 317                     ; 49         if (!motor.timer) {
 319  0054 3d09          	tnz	_motor+9
 320  0056 260d          	jrne	L311
 321                     ; 50             motor_invert();
 323  0058 4b08          	push	#8
 324  005a ae5000        	ldw	x,#20480
 325  005d cd0000        	call	_GPIO_WriteReverse
 327  0060 84            	pop	a
 328                     ; 51             motor.flags &= ~INVERT_ROTATION;
 330  0061 7211000b      	bres	_motor+11,#0
 331  0065               L311:
 332                     ; 54 }
 335  0065 81            	ret
 362                     ; 56 void task_motor(void)
 362                     ; 57 {
 363                     	switch	.text
 364  0066               _task_motor:
 368                     ; 58     motor.position = adc_val;
 370  0066 be00          	ldw	x,_adc_val
 371  0068 bf00          	ldw	_motor,x
 372                     ; 60     if (((motor.position > motor.max_pos) || 
 372                     ; 61          (motor.position < motor.min_pos)) &&
 372                     ; 62         !(motor.flags & INVERT_ROTATION)) {
 374  006a be00          	ldw	x,_motor
 375  006c b302          	cpw	x,_motor+2
 376  006e 2206          	jrugt	L131
 378  0070 be00          	ldw	x,_motor
 379  0072 b304          	cpw	x,_motor+4
 380  0074 2415          	jruge	L721
 381  0076               L131:
 383  0076 b60b          	ld	a,_motor+11
 384  0078 a501          	bcp	a,#1
 385  007a 260f          	jrne	L721
 386                     ; 63         motor.flags |= INVERT_ROTATION;
 388  007c 7210000b      	bset	_motor+11,#0
 389                     ; 64         motor.timer = INVERT_MOTOR_TIME;
 391  0080 35640009      	mov	_motor+9,#100
 392                     ; 65         motor.speed = 0;
 394  0084 5f            	clrw	x
 395  0085 bf07          	ldw	_motor+7,x
 396                     ; 66         set_pwm(motor.speed);
 398  0087 5f            	clrw	x
 399  0088 cd0000        	call	_set_pwm
 401  008b               L721:
 402                     ; 69     if (!tick)
 404  008b 3d00          	tnz	_tick
 405  008d 2601          	jrne	L331
 406                     ; 70         return;
 409  008f 81            	ret
 410  0090               L331:
 411                     ; 72     set_pwm(motor.speed);
 413  0090 be07          	ldw	x,_motor+7
 414  0092 cd0000        	call	_set_pwm
 416                     ; 73 }
 419  0095 81            	ret
 500                     	xdef	_tmr_motor
 501                     	xdef	_dec_speed
 502                     	xdef	_inc_speed
 503                     	switch	.ubsct
 504  0000               _motor:
 505  0000 000000000000  	ds.b	12
 506                     	xdef	_motor
 507                     	xref.b	_tick
 508                     	xref.b	_adc_val
 509                     	xdef	_set_position
 510                     	xdef	_stop_motor
 511                     	xdef	_task_motor
 512                     	xdef	_init_motor
 513                     	xref	_set_pwm
 514                     	xref	_init_pwm
 515                     	xref	_GPIO_WriteReverse
 516                     	xref	_GPIO_Init
 536                     	xref	c_lcmp
 537                     	xref	c_uitolx
 538                     	end
