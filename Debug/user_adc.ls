   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  14                     	bsct
  15  0000               _adc_val:
  16  0000 0000          	dc.w	0
  53                     ; 9 void init_adc(void)
  53                     ; 10 {
  55                     	switch	.text
  56  0000               _init_adc:
  60                     ; 12     GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);
  62  0000 4b00          	push	#0
  63  0002 4b40          	push	#64
  64  0004 ae500f        	ldw	x,#20495
  65  0007 cd0000        	call	_GPIO_Init
  67  000a 85            	popw	x
  68                     ; 13     GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
  70  000b 4b00          	push	#0
  71  000d 4b10          	push	#16
  72  000f ae500a        	ldw	x,#20490
  73  0012 cd0000        	call	_GPIO_Init
  75  0015 85            	popw	x
  76                     ; 15     ADC1_DeInit();
  78  0016 cd0000        	call	_ADC1_DeInit
  80                     ; 16     ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_6,
  80                     ; 17               ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM,DISABLE,
  80                     ; 18               ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL0, DISABLE);
  82  0019 4b00          	push	#0
  83  001b 4b00          	push	#0
  84  001d 4b08          	push	#8
  85  001f 4b00          	push	#0
  86  0021 4b00          	push	#0
  87  0023 4b00          	push	#0
  88  0025 ae0106        	ldw	x,#262
  89  0028 cd0000        	call	_ADC1_Init
  91  002b 5b06          	addw	sp,#6
  92                     ; 20     ADC1_ScanModeCmd(ENABLE);
  94  002d a601          	ld	a,#1
  95  002f cd0000        	call	_ADC1_ScanModeCmd
  97                     ; 21     ADC1_DataBufferCmd(ENABLE);
  99  0032 a601          	ld	a,#1
 100  0034 cd0000        	call	_ADC1_DataBufferCmd
 102                     ; 22     ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
 104  0037 4b01          	push	#1
 105  0039 ae0020        	ldw	x,#32
 106  003c cd0000        	call	_ADC1_ITConfig
 108  003f 84            	pop	a
 109                     ; 23     ADC1_Cmd(ENABLE);
 111  0040 a601          	ld	a,#1
 112  0042 cd0000        	call	_ADC1_Cmd
 114                     ; 25     ADC1_StartConversion();
 116  0045 cd0000        	call	_ADC1_StartConversion
 118                     ; 27 }
 121  0048 81            	ret
 147                     ; 29 void read_adc(void)
 147                     ; 30 {
 148                     	switch	.text
 149  0049               _read_adc:
 153                     ; 36     ADC1_ClearITPendingBit(ADC1_IT_EOC);
 155  0049 ae0080        	ldw	x,#128
 156  004c cd0000        	call	_ADC1_ClearITPendingBit
 158                     ; 38     ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
 160  004f c65400        	ld	a,21504
 161  0052 a4f0          	and	a,#240
 162  0054 c75400        	ld	21504,a
 163                     ; 39     ADC1->CSR |= (uint8_t)(ADC1_CHANNEL_6);
 165  0057 c65400        	ld	a,21504
 166  005a aa06          	or	a,#6
 167  005c c75400        	ld	21504,a
 168                     ; 40     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
 170  005f 72135401      	bres	21505,#1
 171                     ; 42     adc_val = ADC1_GetConversionValue();
 173  0063 cd0000        	call	_ADC1_GetConversionValue
 175  0066 bf00          	ldw	_adc_val,x
 176                     ; 44 }
 179  0068 81            	ret
 203                     	xdef	_adc_val
 204                     	xdef	_read_adc
 205                     	xdef	_init_adc
 206                     	xref	_GPIO_Init
 207                     	xref	_ADC1_ClearITPendingBit
 208                     	xref	_ADC1_GetConversionValue
 209                     	xref	_ADC1_StartConversion
 210                     	xref	_ADC1_ITConfig
 211                     	xref	_ADC1_DataBufferCmd
 212                     	xref	_ADC1_ScanModeCmd
 213                     	xref	_ADC1_Cmd
 214                     	xref	_ADC1_Init
 215                     	xref	_ADC1_DeInit
 234                     	end
