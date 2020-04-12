   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  56                     ; 3 void init_pwm(uint16_t period)
  56                     ; 4 {
  58                     	switch	.text
  59  0000               _init_pwm:
  63                     ; 7     TIM2_TimeBaseInit(TIM2_PRESCALER_1, period);
  65  0000 89            	pushw	x
  66  0001 4f            	clr	a
  67  0002 cd0000        	call	_TIM2_TimeBaseInit
  69  0005 85            	popw	x
  70                     ; 9     TIM2_ARRPreloadConfig(ENABLE);
  72  0006 a601          	ld	a,#1
  73  0008 cd0000        	call	_TIM2_ARRPreloadConfig
  75                     ; 12     TIM2_Cmd(ENABLE);
  77  000b a601          	ld	a,#1
  78  000d cd0000        	call	_TIM2_Cmd
  80                     ; 14 }
  83  0010 81            	ret
 119                     ; 16 void set_pwm(uint16_t ccrx_val)
 119                     ; 17 {
 120                     	switch	.text
 121  0011               _set_pwm:
 125                     ; 19     TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,ccrx_val, TIM2_OCPOLARITY_HIGH);
 127  0011 4b00          	push	#0
 128  0013 89            	pushw	x
 129  0014 ae6011        	ldw	x,#24593
 130  0017 cd0000        	call	_TIM2_OC1Init
 132  001a 5b03          	addw	sp,#3
 133                     ; 20     TIM2_OC1PreloadConfig(ENABLE);
 135  001c a601          	ld	a,#1
 136  001e cd0000        	call	_TIM2_OC1PreloadConfig
 138                     ; 22 }
 141  0021 81            	ret
 154                     	xdef	_set_pwm
 155                     	xdef	_init_pwm
 156                     	xref	_TIM2_OC1PreloadConfig
 157                     	xref	_TIM2_ARRPreloadConfig
 158                     	xref	_TIM2_Cmd
 159                     	xref	_TIM2_OC1Init
 160                     	xref	_TIM2_TimeBaseInit
 179                     	end
