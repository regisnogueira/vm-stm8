   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  46                     ; 3 void init_pwm(void)
  46                     ; 4 {
  48                     	switch	.text
  49  0000               _init_pwm:
  53                     ; 7     TIM2_TimeBaseInit(TIM2_PRESCALER_1, 1023);
  55  0000 ae03ff        	ldw	x,#1023
  56  0003 89            	pushw	x
  57  0004 4f            	clr	a
  58  0005 cd0000        	call	_TIM2_TimeBaseInit
  60  0008 85            	popw	x
  61                     ; 9     TIM2_ARRPreloadConfig(ENABLE);
  63  0009 a601          	ld	a,#1
  64  000b cd0000        	call	_TIM2_ARRPreloadConfig
  66                     ; 12     TIM2_Cmd(ENABLE);
  68  000e a601          	ld	a,#1
  69  0010 cd0000        	call	_TIM2_Cmd
  71                     ; 14 }
  74  0013 81            	ret
 112                     ; 16 void set_pwm(uint16_t ccrx_val)
 112                     ; 17 {
 113                     	switch	.text
 114  0014               _set_pwm:
 116  0014 89            	pushw	x
 117       00000000      OFST:	set	0
 120                     ; 21         TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,ccrx_val, TIM2_OCPOLARITY_HIGH);
 122  0015 4b00          	push	#0
 123  0017 89            	pushw	x
 124  0018 ae6011        	ldw	x,#24593
 125  001b cd0000        	call	_TIM2_OC1Init
 127  001e 5b03          	addw	sp,#3
 128                     ; 22         TIM2_OC1PreloadConfig(ENABLE);
 130  0020 a601          	ld	a,#1
 131  0022 cd0000        	call	_TIM2_OC1PreloadConfig
 133                     ; 25         TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,ccrx_val, TIM2_OCPOLARITY_HIGH);
 135  0025 4b00          	push	#0
 136  0027 1e02          	ldw	x,(OFST+2,sp)
 137  0029 89            	pushw	x
 138  002a ae6011        	ldw	x,#24593
 139  002d cd0000        	call	_TIM2_OC3Init
 141  0030 5b03          	addw	sp,#3
 142                     ; 26         TIM2_OC3PreloadConfig(ENABLE);
 144  0032 a601          	ld	a,#1
 145  0034 cd0000        	call	_TIM2_OC3PreloadConfig
 147                     ; 30 }
 150  0037 85            	popw	x
 151  0038 81            	ret
 164                     	xdef	_set_pwm
 165                     	xdef	_init_pwm
 166                     	xref	_TIM2_OC3PreloadConfig
 167                     	xref	_TIM2_OC1PreloadConfig
 168                     	xref	_TIM2_ARRPreloadConfig
 169                     	xref	_TIM2_Cmd
 170                     	xref	_TIM2_OC3Init
 171                     	xref	_TIM2_OC1Init
 172                     	xref	_TIM2_TimeBaseInit
 191                     	end
