   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  15                     	bsct
  16  0000               _adc_val:
  17  0000 0000          	dc.w	0
  53                     ; 7 void init_adc(void)
  53                     ; 8 {
  55                     	switch	.text
  56  0000               _init_adc:
  60                     ; 10     GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT );
  62  0000 4b00          	push	#0
  63  0002 4b04          	push	#4
  64  0004 ae500f        	ldw	x,#20495
  65  0007 cd0000        	call	_GPIO_Init
  67  000a 85            	popw	x
  68                     ; 11     ADC1_DeInit();
  70  000b cd0000        	call	_ADC1_DeInit
  72                     ; 12     ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_3, 
  72                     ; 13               ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM,DISABLE, 
  72                     ; 14               ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL0, DISABLE );
  74  000e 4b00          	push	#0
  75  0010 4b00          	push	#0
  76  0012 4b08          	push	#8
  77  0014 4b00          	push	#0
  78  0016 4b00          	push	#0
  79  0018 4b00          	push	#0
  80  001a ae0103        	ldw	x,#259
  81  001d cd0000        	call	_ADC1_Init
  83  0020 5b06          	addw	sp,#6
  84                     ; 16     ADC1_ScanModeCmd(ENABLE);
  86  0022 a601          	ld	a,#1
  87  0024 cd0000        	call	_ADC1_ScanModeCmd
  89                     ; 18     ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
  91  0027 4b01          	push	#1
  92  0029 ae0020        	ldw	x,#32
  93  002c cd0000        	call	_ADC1_ITConfig
  95  002f 84            	pop	a
  96                     ; 19     ADC1_Cmd(ENABLE);
  98  0030 a601          	ld	a,#1
  99  0032 cd0000        	call	_ADC1_Cmd
 101                     ; 21     ADC1_StartConversion();
 103  0035 cd0000        	call	_ADC1_StartConversion
 105                     ; 23 }
 108  0038 81            	ret
 134                     ; 25 uint16_t read_adc(void)
 134                     ; 26 {
 135                     	switch	.text
 136  0039               _read_adc:
 140                     ; 32     ADC1_ClearITPendingBit(ADC1_IT_EOC);
 142  0039 ae0080        	ldw	x,#128
 143  003c cd0000        	call	_ADC1_ClearITPendingBit
 145                     ; 34     ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
 147  003f c65400        	ld	a,21504
 148  0042 a4f0          	and	a,#240
 149  0044 c75400        	ld	21504,a
 150                     ; 35     ADC1->CSR |= (uint8_t)(ADC1_CHANNEL_3);
 152  0047 c65400        	ld	a,21504
 153  004a aa03          	or	a,#3
 154  004c c75400        	ld	21504,a
 155                     ; 36     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
 157  004f 72135401      	bres	21505,#1
 158                     ; 38     adc_val = ADC1_GetConversionValue();
 160  0053 cd0000        	call	_ADC1_GetConversionValue
 162  0056 bf00          	ldw	_adc_val,x
 163                     ; 39     return adc_val;
 165  0058 be00          	ldw	x,_adc_val
 168  005a 81            	ret
 192                     	xdef	_adc_val
 193                     	xdef	_read_adc
 194                     	xdef	_init_adc
 195                     	xref	_GPIO_Init
 196                     	xref	_ADC1_ClearITPendingBit
 197                     	xref	_ADC1_GetConversionValue
 198                     	xref	_ADC1_StartConversion
 199                     	xref	_ADC1_ITConfig
 200                     	xref	_ADC1_ScanModeCmd
 201                     	xref	_ADC1_Cmd
 202                     	xref	_ADC1_Init
 203                     	xref	_ADC1_DeInit
 222                     	end
