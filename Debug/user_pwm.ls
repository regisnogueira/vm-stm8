   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  46                     ; 3 void init_pwm(void)
  46                     ; 4 {
  48                     	switch	.text
  49  0000               _init_pwm:
  53                     ; 7     TIM2_TimeBaseInit(TIM2_PRESCALER_1, 500);
  55  0000 ae01f4        	ldw	x,#500
  56  0003 89            	pushw	x
  57  0004 4f            	clr	a
  58  0005 cd0000        	call	_TIM2_TimeBaseInit
  60  0008 85            	popw	x
  61                     ; 21     TIM2_ARRPreloadConfig(ENABLE);
  63  0009 a601          	ld	a,#1
  64  000b cd0000        	call	_TIM2_ARRPreloadConfig
  66                     ; 24     TIM2_Cmd(ENABLE);
  68  000e a601          	ld	a,#1
  69  0010 cd0000        	call	_TIM2_Cmd
  71                     ; 26 }
  74  0013 81            	ret
 121                     ; 28 void set_pwm(uint8_t channel, uint16_t ccrx_val)
 121                     ; 29 {
 122                     	switch	.text
 123  0014               _set_pwm:
 125  0014 88            	push	a
 126       00000000      OFST:	set	0
 129                     ; 31     switch (channel) {
 132                     ; 39         break;
 133  0015 4d            	tnz	a
 134  0016 2705          	jreq	L12
 135  0018 4a            	dec	a
 136  0019 2716          	jreq	L32
 137  001b 2026          	jra	L15
 138  001d               L12:
 139                     ; 32     case PWM_CH1: /* PWM1 Mode configuration: Channel2 */ 
 139                     ; 33         TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,ccrx_val, TIM2_OCPOLARITY_HIGH);
 141  001d 4b00          	push	#0
 142  001f 1e05          	ldw	x,(OFST+5,sp)
 143  0021 89            	pushw	x
 144  0022 ae6011        	ldw	x,#24593
 145  0025 cd0000        	call	_TIM2_OC1Init
 147  0028 5b03          	addw	sp,#3
 148                     ; 34         TIM2_OC1PreloadConfig(ENABLE);
 150  002a a601          	ld	a,#1
 151  002c cd0000        	call	_TIM2_OC1PreloadConfig
 153                     ; 35         break;
 155  002f 2012          	jra	L15
 156  0031               L32:
 157                     ; 36     case PWM_CH2: /* PWM1 Mode configuration: Channel3 */ 
 157                     ; 37         TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,ccrx_val, TIM2_OCPOLARITY_HIGH);
 159  0031 4b00          	push	#0
 160  0033 1e05          	ldw	x,(OFST+5,sp)
 161  0035 89            	pushw	x
 162  0036 ae6011        	ldw	x,#24593
 163  0039 cd0000        	call	_TIM2_OC3Init
 165  003c 5b03          	addw	sp,#3
 166                     ; 38         TIM2_OC3PreloadConfig(ENABLE);
 168  003e a601          	ld	a,#1
 169  0040 cd0000        	call	_TIM2_OC3PreloadConfig
 171                     ; 39         break;
 173  0043               L15:
 174                     ; 42 }
 177  0043 84            	pop	a
 178  0044 81            	ret
 191                     	xdef	_set_pwm
 192                     	xdef	_init_pwm
 193                     	xref	_TIM2_OC3PreloadConfig
 194                     	xref	_TIM2_OC1PreloadConfig
 195                     	xref	_TIM2_ARRPreloadConfig
 196                     	xref	_TIM2_Cmd
 197                     	xref	_TIM2_OC3Init
 198                     	xref	_TIM2_OC1Init
 199                     	xref	_TIM2_TimeBaseInit
 218                     	end
