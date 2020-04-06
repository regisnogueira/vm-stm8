   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  57                     ; 3 void init_pwm(uint16_t period)
  57                     ; 4 {
  59                     	switch	.text
  60  0000               _init_pwm:
  64                     ; 7     TIM2_TimeBaseInit(TIM2_PRESCALER_1, period);
  66  0000 89            	pushw	x
  67  0001 4f            	clr	a
  68  0002 cd0000        	call	_TIM2_TimeBaseInit
  70  0005 85            	popw	x
  71                     ; 9     TIM2_ARRPreloadConfig(ENABLE);
  73  0006 a601          	ld	a,#1
  74  0008 cd0000        	call	_TIM2_ARRPreloadConfig
  76                     ; 12     TIM2_Cmd(ENABLE);
  78  000b a601          	ld	a,#1
  79  000d cd0000        	call	_TIM2_Cmd
  81                     ; 14 }
  84  0010 81            	ret
 122                     ; 16 void set_pwm(uint16_t ccrx_val)
 122                     ; 17 {
 123                     	switch	.text
 124  0011               _set_pwm:
 126  0011 89            	pushw	x
 127       00000000      OFST:	set	0
 130                     ; 21         TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,ccrx_val, TIM2_OCPOLARITY_HIGH);
 132  0012 4b00          	push	#0
 133  0014 89            	pushw	x
 134  0015 ae6011        	ldw	x,#24593
 135  0018 cd0000        	call	_TIM2_OC1Init
 137  001b 5b03          	addw	sp,#3
 138                     ; 22         TIM2_OC1PreloadConfig(ENABLE);
 140  001d a601          	ld	a,#1
 141  001f cd0000        	call	_TIM2_OC1PreloadConfig
 143                     ; 25         TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,ccrx_val, TIM2_OCPOLARITY_HIGH);
 145  0022 4b00          	push	#0
 146  0024 1e02          	ldw	x,(OFST+2,sp)
 147  0026 89            	pushw	x
 148  0027 ae6011        	ldw	x,#24593
 149  002a cd0000        	call	_TIM2_OC3Init
 151  002d 5b03          	addw	sp,#3
 152                     ; 26         TIM2_OC3PreloadConfig(ENABLE);
 154  002f a601          	ld	a,#1
 155  0031 cd0000        	call	_TIM2_OC3PreloadConfig
 157                     ; 30 }
 160  0034 85            	popw	x
 161  0035 81            	ret
 174                     	xdef	_set_pwm
 175                     	xdef	_init_pwm
 176                     	xref	_TIM2_OC3PreloadConfig
 177                     	xref	_TIM2_OC1PreloadConfig
 178                     	xref	_TIM2_ARRPreloadConfig
 179                     	xref	_TIM2_Cmd
 180                     	xref	_TIM2_OC3Init
 181                     	xref	_TIM2_OC1Init
 182                     	xref	_TIM2_TimeBaseInit
 201                     	end
