   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  19                     	bsct
  20  0000               _adc_val:
  21  0000 0000          	dc.w	0
  58                     ; 9 void init_adc(void)
  58                     ; 10 {
  60                     	switch	.text
  61  0000               _init_adc:
  65                     ; 12     GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);
  67  0000 4b00          	push	#0
  68  0002 4b40          	push	#64
  69  0004 ae500f        	ldw	x,#20495
  70  0007 cd0000        	call	_GPIO_Init
  72  000a 85            	popw	x
  73                     ; 13     GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
  75  000b 4b00          	push	#0
  76  000d 4b10          	push	#16
  77  000f ae500a        	ldw	x,#20490
  78  0012 cd0000        	call	_GPIO_Init
  80  0015 85            	popw	x
  81                     ; 15     ADC1_DeInit();
  83  0016 cd0000        	call	_ADC1_DeInit
  85                     ; 16     ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_6,
  85                     ; 17               ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM,DISABLE,
  85                     ; 18               ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL0, DISABLE);
  87  0019 4b00          	push	#0
  88  001b 4b00          	push	#0
  89  001d 4b08          	push	#8
  90  001f 4b00          	push	#0
  91  0021 4b00          	push	#0
  92  0023 4b00          	push	#0
  93  0025 ae0106        	ldw	x,#262
  94  0028 cd0000        	call	_ADC1_Init
  96  002b 5b06          	addw	sp,#6
  97                     ; 20     ADC1_ScanModeCmd(ENABLE);
  99  002d a601          	ld	a,#1
 100  002f cd0000        	call	_ADC1_ScanModeCmd
 102                     ; 21     ADC1_DataBufferCmd(ENABLE);
 104  0032 a601          	ld	a,#1
 105  0034 cd0000        	call	_ADC1_DataBufferCmd
 107                     ; 22     ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
 109  0037 4b01          	push	#1
 110  0039 ae0020        	ldw	x,#32
 111  003c cd0000        	call	_ADC1_ITConfig
 113  003f 84            	pop	a
 114                     ; 23     ADC1_Cmd(ENABLE);
 116  0040 a601          	ld	a,#1
 117  0042 cd0000        	call	_ADC1_Cmd
 119                     ; 25     ADC1_StartConversion();
 122                     ; 27 }
 125  0045 cc0000        	jp	_ADC1_StartConversion
 151                     ; 29 void read_adc(void)
 151                     ; 30 {
 152                     	switch	.text
 153  0048               _read_adc:
 157                     ; 36     ADC1_ClearITPendingBit(ADC1_IT_EOC);
 159  0048 ae0080        	ldw	x,#128
 160  004b cd0000        	call	_ADC1_ClearITPendingBit
 162                     ; 38     ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
 164  004e c65400        	ld	a,21504
 165  0051 a4f0          	and	a,#240
 166  0053 c75400        	ld	21504,a
 167                     ; 39     ADC1->CSR |= (uint8_t)(ADC1_CHANNEL_6);
 169  0056 c65400        	ld	a,21504
 170  0059 aa06          	or	a,#6
 171  005b c75400        	ld	21504,a
 172                     ; 40     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
 174  005e 72135401      	bres	21505,#1
 175                     ; 42     adc_val = ADC1_GetConversionValue();
 177  0062 cd0000        	call	_ADC1_GetConversionValue
 179  0065 bf00          	ldw	_adc_val,x
 180                     ; 44 }
 183  0067 81            	ret	
 207                     	xdef	_adc_val
 208                     	xdef	_read_adc
 209                     	xdef	_init_adc
 210                     	xref	_GPIO_Init
 211                     	xref	_ADC1_ClearITPendingBit
 212                     	xref	_ADC1_GetConversionValue
 213                     	xref	_ADC1_StartConversion
 214                     	xref	_ADC1_ITConfig
 215                     	xref	_ADC1_DataBufferCmd
 216                     	xref	_ADC1_ScanModeCmd
 217                     	xref	_ADC1_Cmd
 218                     	xref	_ADC1_Init
 219                     	xref	_ADC1_DeInit
 238                     	end
