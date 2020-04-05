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
 129                     ; 22 void rotate_motor(void)
 129                     ; 23 {
 130                     	switch	.text
 131  0016               _rotate_motor:
 135                     ; 25 }
 138  0016 81            	ret
 163                     ; 27 void set_position(void) 
 163                     ; 28 {
 164                     	switch	.text
 165  0017               _set_position:
 169                     ; 29     motor.position = adc_val;
 171  0017 be00          	ldw	x,_adc_val
 172  0019 bf00          	ldw	_motor,x
 173                     ; 31 }
 176  001b 81            	ret
 212                     ; 33 void task_motor(void)
 212                     ; 34 {
 213                     	switch	.text
 214  001c               _task_motor:
 216  001c 89            	pushw	x
 217       00000002      OFST:	set	2
 220                     ; 35     uint16_t pwm = 0;
 222                     ; 37     pwm = adc_val;
 224  001d be00          	ldw	x,_adc_val
 225  001f 1f01          	ldw	(OFST-1,sp),x
 227                     ; 39     if (adc_val > MAX_ADC)
 229  0021 be00          	ldw	x,_adc_val
 230  0023 a303f3        	cpw	x,#1011
 231  0026 2505          	jrult	L76
 232                     ; 40         pwm = 1000;
 234  0028 ae03e8        	ldw	x,#1000
 235  002b 1f01          	ldw	(OFST-1,sp),x
 237  002d               L76:
 238                     ; 42     if (adc_val < MIN_ADC)
 240  002d be00          	ldw	x,_adc_val
 241  002f a3000a        	cpw	x,#10
 242  0032 2403          	jruge	L17
 243                     ; 43         pwm = 0;
 245  0034 5f            	clrw	x
 246  0035 1f01          	ldw	(OFST-1,sp),x
 248  0037               L17:
 249                     ; 45     set_pwm(pwm*30);
 251  0037 1e01          	ldw	x,(OFST-1,sp)
 252  0039 a61e          	ld	a,#30
 253  003b cd0000        	call	c_bmulx
 255  003e cd0000        	call	_set_pwm
 257                     ; 46 }
 260  0041 85            	popw	x
 261  0042 81            	ret
 335                     	switch	.ubsct
 336  0000               _motor:
 337  0000 000000000000  	ds.b	13
 338                     	xdef	_motor
 339                     	xref.b	_adc_val
 340                     	xdef	_set_position
 341                     	xdef	_rotate_motor
 342                     	xdef	_stop_motor
 343                     	xdef	_task_motor
 344                     	xdef	_init_motor
 345                     	xref	_set_pwm
 346                     	xref	_init_pwm
 347                     	xref	_GPIO_Init
 348                     	xref.b	c_x
 368                     	xref	c_bmulx
 369                     	end
