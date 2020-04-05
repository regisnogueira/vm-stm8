   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  15                     	bsct
  16  0000               _adc_val:
  17  0000 0000          	dc.w	0
  54                     ; 9 void init_adc(void)
  54                     ; 10 {
  56                     	switch	.text
  57  0000               _init_adc:
  61                     ; 12     GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);
  63  0000 4b00          	push	#0
  64  0002 4b40          	push	#64
  65  0004 ae500f        	ldw	x,#20495
  66  0007 cd0000        	call	_GPIO_Init
  68  000a 85            	popw	x
  69                     ; 13     GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
  71  000b 4b00          	push	#0
  72  000d 4b10          	push	#16
  73  000f ae500a        	ldw	x,#20490
  74  0012 cd0000        	call	_GPIO_Init
  76  0015 85            	popw	x
  77                     ; 15     ADC1_DeInit();
  79  0016 cd0000        	call	_ADC1_DeInit
  81                     ; 16     ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_6,
  81                     ; 17               ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM,DISABLE,
  81                     ; 18               ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL0, DISABLE);
  83  0019 4b00          	push	#0
  84  001b 4b00          	push	#0
  85  001d 4b08          	push	#8
  86  001f 4b00          	push	#0
  87  0021 4b00          	push	#0
  88  0023 4b00          	push	#0
  89  0025 ae0106        	ldw	x,#262
  90  0028 cd0000        	call	_ADC1_Init
  92  002b 5b06          	addw	sp,#6
  93                     ; 20     ADC1_ScanModeCmd(ENABLE);
  95  002d a601          	ld	a,#1
  96  002f cd0000        	call	_ADC1_ScanModeCmd
  98                     ; 21     ADC1_DataBufferCmd(ENABLE);
 100  0032 a601          	ld	a,#1
 101  0034 cd0000        	call	_ADC1_DataBufferCmd
 103                     ; 22     ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
 105  0037 4b01          	push	#1
 106  0039 ae0020        	ldw	x,#32
 107  003c cd0000        	call	_ADC1_ITConfig
 109  003f 84            	pop	a
 110                     ; 23     ADC1_Cmd(ENABLE);
 112  0040 a601          	ld	a,#1
 113  0042 cd0000        	call	_ADC1_Cmd
 115                     ; 25     ADC1_StartConversion();
 117  0045 cd0000        	call	_ADC1_StartConversion
 119                     ; 27 }
 122  0048 81            	ret
 148                     ; 29 void read_adc(void)
 148                     ; 30 {
 149                     	switch	.text
 150  0049               _read_adc:
 154                     ; 36     ADC1_ClearITPendingBit(ADC1_IT_EOC);
 156  0049 ae0080        	ldw	x,#128
 157  004c cd0000        	call	_ADC1_ClearITPendingBit
 159                     ; 38     ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
 161  004f c65400        	ld	a,21504
 162  0052 a4f0          	and	a,#240
 163  0054 c75400        	ld	21504,a
 164                     ; 39     ADC1->CSR |= (uint8_t)(ADC1_CHANNEL_6);
 166  0057 c65400        	ld	a,21504
 167  005a aa06          	or	a,#6
 168  005c c75400        	ld	21504,a
 169                     ; 40     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
 171  005f 72135401      	bres	21505,#1
 172                     ; 42     adc_val = ADC1_GetConversionValue();
 174  0063 cd0000        	call	_ADC1_GetConversionValue
 176  0066 bf00          	ldw	_adc_val,x
 177                     ; 44 }
 180  0068 81            	ret
 204                     	xdef	_adc_val
 205                     	xdef	_read_adc
 206                     	xdef	_init_adc
 207                     	xref	_GPIO_Init
 208                     	xref	_ADC1_ClearITPendingBit
 209                     	xref	_ADC1_GetConversionValue
 210                     	xref	_ADC1_StartConversion
 211                     	xref	_ADC1_ITConfig
 212                     	xref	_ADC1_DataBufferCmd
 213                     	xref	_ADC1_ScanModeCmd
 214                     	xref	_ADC1_Cmd
 215                     	xref	_ADC1_Init
 216                     	xref	_ADC1_DeInit
 235                     	end
