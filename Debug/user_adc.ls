   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  19                     	bsct
  20  0000               _adc_val:
  21  0000 0000          	dc.w	0
  57                     ; 5 void init_adc(void)
  57                     ; 6 {
  59                     	switch	.text
  60  0000               _init_adc:
  64                     ; 7     GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT );
  66  0000 4b00          	push	#0
  67  0002 4b08          	push	#8
  68  0004 ae500f        	ldw	x,#20495
  69  0007 cd0000        	call	_GPIO_Init
  71  000a 85            	popw	x
  72                     ; 8     ADC1_DeInit();
  74  000b cd0000        	call	_ADC1_DeInit
  76                     ; 9     ADC1_DeInit();
  78  000e cd0000        	call	_ADC1_DeInit
  80                     ; 10     ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_4, 
  80                     ; 11               ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM,DISABLE, 
  80                     ; 12               ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL0, DISABLE );
  82  0011 4b00          	push	#0
  83  0013 4b00          	push	#0
  84  0015 4b08          	push	#8
  85  0017 4b00          	push	#0
  86  0019 4b00          	push	#0
  87  001b 4b00          	push	#0
  88  001d ae0104        	ldw	x,#260
  89  0020 cd0000        	call	_ADC1_Init
  91  0023 5b06          	addw	sp,#6
  92                     ; 14     ADC1_ScanModeCmd(ENABLE);
  94  0025 a601          	ld	a,#1
  95  0027 cd0000        	call	_ADC1_ScanModeCmd
  97                     ; 16     ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
  99  002a 4b01          	push	#1
 100  002c ae0020        	ldw	x,#32
 101  002f cd0000        	call	_ADC1_ITConfig
 103  0032 84            	pop	a
 104                     ; 17     ADC1_Cmd(ENABLE);
 106  0033 a601          	ld	a,#1
 107  0035 cd0000        	call	_ADC1_Cmd
 109                     ; 19     ADC1_StartConversion();
 112                     ; 20 }
 115  0038 cc0000        	jp	_ADC1_StartConversion
 140                     ; 22 uint16_t read_adc(void)
 140                     ; 23 {
 141                     	switch	.text
 142  003b               _read_adc:
 146                     ; 24     adc_val = ADC1_GetConversionValue();
 148  003b cd0000        	call	_ADC1_GetConversionValue
 150  003e bf00          	ldw	_adc_val,x
 151                     ; 25     return adc_val;
 155  0040 81            	ret	
 179                     	xdef	_adc_val
 180                     	xdef	_read_adc
 181                     	xdef	_init_adc
 182                     	xref	_GPIO_Init
 183                     	xref	_ADC1_GetConversionValue
 184                     	xref	_ADC1_StartConversion
 185                     	xref	_ADC1_ITConfig
 186                     	xref	_ADC1_ScanModeCmd
 187                     	xref	_ADC1_Cmd
 188                     	xref	_ADC1_Init
 189                     	xref	_ADC1_DeInit
 208                     	end
