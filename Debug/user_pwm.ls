   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  46                     ; 3 void init_pwm(void)
  46                     ; 4 {
  48                     	switch	.text
  49  0000               _init_pwm:
  53                     ; 7     TIM2_TimeBaseInit(TIM2_PRESCALER_1, 60000);
  55  0000 aeea60        	ldw	x,#60000
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
 110                     ; 16 void set_pwm(uint16_t ccrx_val)
 110                     ; 17 {
 111                     	switch	.text
 112  0014               _set_pwm:
 116                     ; 21         TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,ccrx_val, TIM2_OCPOLARITY_HIGH);
 118  0014 4b00          	push	#0
 119  0016 89            	pushw	x
 120  0017 ae6011        	ldw	x,#24593
 121  001a cd0000        	call	_TIM2_OC1Init
 123  001d 5b03          	addw	sp,#3
 124                     ; 22         TIM2_OC1PreloadConfig(ENABLE);
 126  001f a601          	ld	a,#1
 127  0021 cd0000        	call	_TIM2_OC1PreloadConfig
 129                     ; 30 }
 132  0024 81            	ret
 145                     	xdef	_set_pwm
 146                     	xdef	_init_pwm
 147                     	xref	_TIM2_OC1PreloadConfig
 148                     	xref	_TIM2_ARRPreloadConfig
 149                     	xref	_TIM2_Cmd
 150                     	xref	_TIM2_OC1Init
 151                     	xref	_TIM2_TimeBaseInit
 170                     	end
