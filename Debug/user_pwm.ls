   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  15                     	bsct
  16  0000               _CCR1_Val:
  17  0000 01f4          	dc.w	500
  18  0002               _CCR2_Val:
  19  0002 0064          	dc.w	100
  51                     ; 9 void init_pwm(void)
  51                     ; 10 {
  53                     	switch	.text
  54  0000               _init_pwm:
  58                     ; 13     TIM2_TimeBaseInit(TIM2_PRESCALER_1, 500);
  60  0000 ae01f4        	ldw	x,#500
  61  0003 89            	pushw	x
  62  0004 4f            	clr	a
  63  0005 cd0000        	call	_TIM2_TimeBaseInit
  65  0008 85            	popw	x
  66                     ; 27     TIM2_ARRPreloadConfig(ENABLE);
  68  0009 a601          	ld	a,#1
  69  000b cd0000        	call	_TIM2_ARRPreloadConfig
  71                     ; 30     TIM2_Cmd(ENABLE);
  73  000e a601          	ld	a,#1
  74  0010 cd0000        	call	_TIM2_Cmd
  76                     ; 32 }
  79  0013 81            	ret
 126                     ; 34 void set_pwm(uint8_t channel, uint16_t ccrx_val)
 126                     ; 35 {
 127                     	switch	.text
 128  0014               _set_pwm:
 130  0014 88            	push	a
 131       00000000      OFST:	set	0
 134                     ; 36     switch (channel) {
 137                     ; 44         break;
 138  0015 4d            	tnz	a
 139  0016 2705          	jreq	L12
 140  0018 4a            	dec	a
 141  0019 2716          	jreq	L32
 142  001b 2026          	jra	L15
 143  001d               L12:
 144                     ; 37     case PWM_CH1: /* PWM1 Mode configuration: Channel1 */ 
 144                     ; 38         TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,ccrx_val, TIM2_OCPOLARITY_HIGH);
 146  001d 4b00          	push	#0
 147  001f 1e05          	ldw	x,(OFST+5,sp)
 148  0021 89            	pushw	x
 149  0022 ae6011        	ldw	x,#24593
 150  0025 cd0000        	call	_TIM2_OC1Init
 152  0028 5b03          	addw	sp,#3
 153                     ; 39         TIM2_OC1PreloadConfig(ENABLE);
 155  002a a601          	ld	a,#1
 156  002c cd0000        	call	_TIM2_OC1PreloadConfig
 158                     ; 40         break;
 160  002f 2012          	jra	L15
 161  0031               L32:
 162                     ; 41     case PWM_CH2: /* PWM1 Mode configuration: Channel2 */ 
 162                     ; 42         TIM2_OC2Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,ccrx_val, TIM2_OCPOLARITY_HIGH);
 164  0031 4b00          	push	#0
 165  0033 1e05          	ldw	x,(OFST+5,sp)
 166  0035 89            	pushw	x
 167  0036 ae6011        	ldw	x,#24593
 168  0039 cd0000        	call	_TIM2_OC2Init
 170  003c 5b03          	addw	sp,#3
 171                     ; 43         TIM2_OC2PreloadConfig(ENABLE);
 173  003e a601          	ld	a,#1
 174  0040 cd0000        	call	_TIM2_OC2PreloadConfig
 176                     ; 44         break;
 178  0043               L15:
 179                     ; 46 }
 182  0043 84            	pop	a
 183  0044 81            	ret
 216                     	xdef	_CCR2_Val
 217                     	xdef	_CCR1_Val
 218                     	xdef	_set_pwm
 219                     	xdef	_init_pwm
 220                     	xref	_TIM2_OC2PreloadConfig
 221                     	xref	_TIM2_OC1PreloadConfig
 222                     	xref	_TIM2_ARRPreloadConfig
 223                     	xref	_TIM2_Cmd
 224                     	xref	_TIM2_OC2Init
 225                     	xref	_TIM2_OC1Init
 226                     	xref	_TIM2_TimeBaseInit
 245                     	end
