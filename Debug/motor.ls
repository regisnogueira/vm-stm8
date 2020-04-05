   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  46                     ; 10 void init_motor(void)
  46                     ; 11 {
  48                     	switch	.text
  49  0000               _init_motor:
  53                     ; 12     motor_relay_dir();
  55  0000 4be0          	push	#224
  56  0002 4b08          	push	#8
  57  0004 ae5000        	ldw	x,#20480
  58  0007 cd0000        	call	_GPIO_Init
  60  000a 85            	popw	x
  61                     ; 13     init_pwm();
  64  000b cd0000        	call	_init_pwm
  66                     ; 14     set_pwm(PWM_FREQ);
  68  000e aeea60        	ldw	x,#60000
  69  0011 cd0000        	call	_set_pwm
  71                     ; 15 }
  74  0014 81            	ret
  97                     ; 17 void stop_motor(void)
  97                     ; 18 {
  98                     	switch	.text
  99  0015               _stop_motor:
 103                     ; 20 }
 106  0015 81            	ret
 129                     ; 22 void inc_speed(void)
 129                     ; 23 {
 130                     	switch	.text
 131  0016               _inc_speed:
 135                     ; 25 }
 138  0016 81            	ret
 161                     ; 27 void dec_speed(void)
 161                     ; 28 {
 162                     	switch	.text
 163  0017               _dec_speed:
 167                     ; 30 }
 170  0017 81            	ret
 193                     ; 32 void rotate_motor(void)
 193                     ; 33 {
 194                     	switch	.text
 195  0018               _rotate_motor:
 199                     ; 35 }
 202  0018 81            	ret
 227                     ; 37 void set_position(void) 
 227                     ; 38 {
 228                     	switch	.text
 229  0019               _set_position:
 233                     ; 39     motor.position = adc_val;
 235  0019 be00          	ldw	x,_adc_val
 236  001b bf00          	ldw	_motor,x
 237                     ; 40 }
 240  001d 81            	ret
 276                     ; 42 void task_motor(void)
 276                     ; 43 {
 277                     	switch	.text
 278  001e               _task_motor:
 280  001e 89            	pushw	x
 281       00000002      OFST:	set	2
 284                     ; 44     uint16_t pwm = 0;
 286                     ; 46     pwm = adc_val;
 288  001f be00          	ldw	x,_adc_val
 289  0021 1f01          	ldw	(OFST-1,sp),x
 291                     ; 48     if (adc_val > MAX_ADC)
 293  0023 be00          	ldw	x,_adc_val
 294  0025 a303f3        	cpw	x,#1011
 295  0028 2505          	jrult	L701
 296                     ; 49         pwm = 1000;
 298  002a ae03e8        	ldw	x,#1000
 299  002d 1f01          	ldw	(OFST-1,sp),x
 301  002f               L701:
 302                     ; 51     if (adc_val < MIN_ADC)
 304  002f be00          	ldw	x,_adc_val
 305  0031 a3000a        	cpw	x,#10
 306  0034 2403          	jruge	L111
 307                     ; 52         pwm = 0;
 309  0036 5f            	clrw	x
 310  0037 1f01          	ldw	(OFST-1,sp),x
 312  0039               L111:
 313                     ; 54     set_pwm(pwm*30);
 315  0039 1e01          	ldw	x,(OFST-1,sp)
 316  003b a61e          	ld	a,#30
 317  003d cd0000        	call	c_bmulx
 319  0040 cd0000        	call	_set_pwm
 321                     ; 55 }
 324  0043 85            	popw	x
 325  0044 81            	ret
 399                     	xdef	_dec_speed
 400                     	xdef	_inc_speed
 401                     	switch	.ubsct
 402  0000               _motor:
 403  0000 000000000000  	ds.b	13
 404                     	xdef	_motor
 405                     	xref.b	_adc_val
 406                     	xdef	_set_position
 407                     	xdef	_rotate_motor
 408                     	xdef	_stop_motor
 409                     	xdef	_task_motor
 410                     	xdef	_init_motor
 411                     	xref	_set_pwm
 412                     	xref	_init_pwm
 413                     	xref	_GPIO_Init
 414                     	xref.b	c_x
 434                     	xref	c_bmulx
 435                     	end
