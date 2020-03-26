   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  14                     	bsct
  15  0000               _CCR1_Val:
  16  0000 01f4          	dc.w	500
  17  0002               _CCR2_Val:
  18  0002 00fa          	dc.w	250
  19  0004               _CCR3_Val:
  20  0004 007d          	dc.w	125
  61                     ; 9 void init_pwm(void)
  61                     ; 10 {
  63                     	switch	.text
  64  0000               _init_pwm:
  68                     ; 13     TIM2_TimeBaseInit(TIM2_PRESCALER_1, 999);
  70  0000 ae03e7        	ldw	x,#999
  71  0003 89            	pushw	x
  72  0004 4f            	clr	a
  73  0005 cd0000        	call	_TIM2_TimeBaseInit
  75  0008 85            	popw	x
  76                     ; 16     TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,CCR1_Val, TIM2_OCPOLARITY_HIGH);
  78  0009 4b00          	push	#0
  79  000b be00          	ldw	x,_CCR1_Val
  80  000d 89            	pushw	x
  81  000e ae6011        	ldw	x,#24593
  82  0011 cd0000        	call	_TIM2_OC1Init
  84  0014 5b03          	addw	sp,#3
  85                     ; 17     TIM2_OC1PreloadConfig(ENABLE);
  87  0016 a601          	ld	a,#1
  88  0018 cd0000        	call	_TIM2_OC1PreloadConfig
  90                     ; 20     TIM2_OC2Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,CCR2_Val, TIM2_OCPOLARITY_HIGH);
  92  001b 4b00          	push	#0
  93  001d be02          	ldw	x,_CCR2_Val
  94  001f 89            	pushw	x
  95  0020 ae6011        	ldw	x,#24593
  96  0023 cd0000        	call	_TIM2_OC2Init
  98  0026 5b03          	addw	sp,#3
  99                     ; 21     TIM2_OC2PreloadConfig(ENABLE);
 101  0028 a601          	ld	a,#1
 102  002a cd0000        	call	_TIM2_OC2PreloadConfig
 104                     ; 24     TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,CCR3_Val, TIM2_OCPOLARITY_HIGH);
 106  002d 4b00          	push	#0
 107  002f be04          	ldw	x,_CCR3_Val
 108  0031 89            	pushw	x
 109  0032 ae6011        	ldw	x,#24593
 110  0035 cd0000        	call	_TIM2_OC3Init
 112  0038 5b03          	addw	sp,#3
 113                     ; 25     TIM2_OC3PreloadConfig(ENABLE);
 115  003a a601          	ld	a,#1
 116  003c cd0000        	call	_TIM2_OC3PreloadConfig
 118                     ; 27     TIM2_ARRPreloadConfig(ENABLE);
 120  003f a601          	ld	a,#1
 121  0041 cd0000        	call	_TIM2_ARRPreloadConfig
 123                     ; 30     TIM2_Cmd(ENABLE);
 125  0044 a601          	ld	a,#1
 126  0046 cd0000        	call	_TIM2_Cmd
 128                     ; 32 }
 131  0049 81            	ret
 173                     	xdef	_CCR3_Val
 174                     	xdef	_CCR2_Val
 175                     	xdef	_CCR1_Val
 176                     	xdef	_init_pwm
 177                     	xref	_TIM2_OC3PreloadConfig
 178                     	xref	_TIM2_OC2PreloadConfig
 179                     	xref	_TIM2_OC1PreloadConfig
 180                     	xref	_TIM2_ARRPreloadConfig
 181                     	xref	_TIM2_Cmd
 182                     	xref	_TIM2_OC3Init
 183                     	xref	_TIM2_OC2Init
 184                     	xref	_TIM2_OC1Init
 185                     	xref	_TIM2_TimeBaseInit
 204                     	end
