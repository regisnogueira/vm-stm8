   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  19                     	bsct
  20  0000               _CCR1_Val:
  21  0000 01f4          	dc.w	500
  22  0002               _CCR2_Val:
  23  0002 00fa          	dc.w	250
  24  0004               _CCR3_Val:
  25  0004 007d          	dc.w	125
  66                     ; 9 void init_pwm(void)
  66                     ; 10 {
  68                     	switch	.text
  69  0000               _init_pwm:
  73                     ; 13     TIM2_TimeBaseInit(TIM2_PRESCALER_1, 999);
  75  0000 ae03e7        	ldw	x,#999
  76  0003 89            	pushw	x
  77  0004 4f            	clr	a
  78  0005 cd0000        	call	_TIM2_TimeBaseInit
  80  0008 85            	popw	x
  81                     ; 16     TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,CCR1_Val, TIM2_OCPOLARITY_HIGH);
  83  0009 4b00          	push	#0
  84  000b be00          	ldw	x,_CCR1_Val
  85  000d 89            	pushw	x
  86  000e ae6011        	ldw	x,#24593
  87  0011 cd0000        	call	_TIM2_OC1Init
  89  0014 5b03          	addw	sp,#3
  90                     ; 17     TIM2_OC1PreloadConfig(ENABLE);
  92  0016 a601          	ld	a,#1
  93  0018 cd0000        	call	_TIM2_OC1PreloadConfig
  95                     ; 20     TIM2_OC2Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,CCR2_Val, TIM2_OCPOLARITY_HIGH);
  97  001b 4b00          	push	#0
  98  001d be02          	ldw	x,_CCR2_Val
  99  001f 89            	pushw	x
 100  0020 ae6011        	ldw	x,#24593
 101  0023 cd0000        	call	_TIM2_OC2Init
 103  0026 5b03          	addw	sp,#3
 104                     ; 21     TIM2_OC2PreloadConfig(ENABLE);
 106  0028 a601          	ld	a,#1
 107  002a cd0000        	call	_TIM2_OC2PreloadConfig
 109                     ; 24     TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,CCR3_Val, TIM2_OCPOLARITY_HIGH);
 111  002d 4b00          	push	#0
 112  002f be04          	ldw	x,_CCR3_Val
 113  0031 89            	pushw	x
 114  0032 ae6011        	ldw	x,#24593
 115  0035 cd0000        	call	_TIM2_OC3Init
 117  0038 5b03          	addw	sp,#3
 118                     ; 25     TIM2_OC3PreloadConfig(ENABLE);
 120  003a a601          	ld	a,#1
 121  003c cd0000        	call	_TIM2_OC3PreloadConfig
 123                     ; 27     TIM2_ARRPreloadConfig(ENABLE);
 125  003f a601          	ld	a,#1
 126  0041 cd0000        	call	_TIM2_ARRPreloadConfig
 128                     ; 30     TIM2_Cmd(ENABLE);
 130  0044 a601          	ld	a,#1
 132                     ; 32 }
 135  0046 cc0000        	jp	_TIM2_Cmd
 177                     	xdef	_CCR3_Val
 178                     	xdef	_CCR2_Val
 179                     	xdef	_CCR1_Val
 180                     	xdef	_init_pwm
 181                     	xref	_TIM2_OC3PreloadConfig
 182                     	xref	_TIM2_OC2PreloadConfig
 183                     	xref	_TIM2_OC1PreloadConfig
 184                     	xref	_TIM2_ARRPreloadConfig
 185                     	xref	_TIM2_Cmd
 186                     	xref	_TIM2_OC3Init
 187                     	xref	_TIM2_OC2Init
 188                     	xref	_TIM2_OC1Init
 189                     	xref	_TIM2_TimeBaseInit
 208                     	end
