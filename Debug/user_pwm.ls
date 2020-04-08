   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  61                     ; 3 void init_pwm(uint16_t period)
  61                     ; 4 {
  63                     	switch	.text
  64  0000               _init_pwm:
  68                     ; 7     TIM2_TimeBaseInit(TIM2_PRESCALER_1, period);
  70  0000 89            	pushw	x
  71  0001 4f            	clr	a
  72  0002 cd0000        	call	_TIM2_TimeBaseInit
  74  0005 a601          	ld	a,#1
  75  0007 85            	popw	x
  76                     ; 9     TIM2_ARRPreloadConfig(ENABLE);
  78  0008 cd0000        	call	_TIM2_ARRPreloadConfig
  80                     ; 12     TIM2_Cmd(ENABLE);
  82  000b a601          	ld	a,#1
  84                     ; 14 }
  87  000d cc0000        	jp	_TIM2_Cmd
 125                     ; 16 void set_pwm(uint16_t ccrx_val)
 125                     ; 17 {
 126                     	switch	.text
 127  0010               _set_pwm:
 129  0010 89            	pushw	x
 130       00000000      OFST:	set	0
 133                     ; 21         TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,ccrx_val, TIM2_OCPOLARITY_HIGH);
 135  0011 4b00          	push	#0
 136  0013 89            	pushw	x
 137  0014 ae6011        	ldw	x,#24593
 138  0017 cd0000        	call	_TIM2_OC1Init
 140  001a 5b03          	addw	sp,#3
 141                     ; 22         TIM2_OC1PreloadConfig(ENABLE);
 143  001c a601          	ld	a,#1
 144  001e cd0000        	call	_TIM2_OC1PreloadConfig
 146                     ; 25         TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,ccrx_val, TIM2_OCPOLARITY_HIGH);
 148  0021 4b00          	push	#0
 149  0023 1e02          	ldw	x,(OFST+2,sp)
 150  0025 89            	pushw	x
 151  0026 ae6011        	ldw	x,#24593
 152  0029 cd0000        	call	_TIM2_OC3Init
 154  002c 5b03          	addw	sp,#3
 155                     ; 26         TIM2_OC3PreloadConfig(ENABLE);
 157  002e a601          	ld	a,#1
 158  0030 cd0000        	call	_TIM2_OC3PreloadConfig
 160                     ; 30 }
 163  0033 85            	popw	x
 164  0034 81            	ret	
 177                     	xdef	_set_pwm
 178                     	xdef	_init_pwm
 179                     	xref	_TIM2_OC3PreloadConfig
 180                     	xref	_TIM2_OC1PreloadConfig
 181                     	xref	_TIM2_ARRPreloadConfig
 182                     	xref	_TIM2_Cmd
 183                     	xref	_TIM2_OC3Init
 184                     	xref	_TIM2_OC1Init
 185                     	xref	_TIM2_TimeBaseInit
 204                     	end
