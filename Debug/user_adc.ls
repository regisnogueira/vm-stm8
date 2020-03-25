   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  53                     ; 3 void init_adc(void)
  53                     ; 4 {
  55                     	switch	.text
  56  0000               _init_adc:
  60                     ; 5     ADC1_DeInit();
  62  0000 cd0000        	call	_ADC1_DeInit
  64                     ; 6     ADC1_Init(ADC1_CONVERSIONMODE_SINGLE,
  64                     ; 7         ADC1_CHANNEL_4,
  64                     ; 8         ADC1_PRESSEL_FCPU_D4,
  64                     ; 9         ADC1_EXTTRIG_TIM,
  64                     ; 10         ENABLE,
  64                     ; 11         ADC1_ALIGN_RIGHT,
  64                     ; 12         ADC1_SCHMITTTRIG_CHANNEL0,
  64                     ; 13         DISABLE);
  66  0003 4b00          	push	#0
  67  0005 4b00          	push	#0
  68  0007 4b08          	push	#8
  69  0009 4b01          	push	#1
  70  000b 4b00          	push	#0
  71  000d 4b20          	push	#32
  72  000f ae0004        	ldw	x,#4
  73  0012 cd0000        	call	_ADC1_Init
  75  0015 5b06          	addw	sp,#6
  76                     ; 14     ADC1_ScanModeCmd(ENABLE);
  78  0017 a601          	ld	a,#1
  79  0019 cd0000        	call	_ADC1_ScanModeCmd
  81                     ; 15     ADC1_DataBufferCmd(ENABLE);
  83  001c a601          	ld	a,#1
  84  001e cd0000        	call	_ADC1_DataBufferCmd
  86                     ; 16     ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
  88  0021 4b01          	push	#1
  89  0023 ae0020        	ldw	x,#32
  90  0026 cd0000        	call	_ADC1_ITConfig
  92  0029 84            	pop	a
  93                     ; 17     ADC1_Cmd(ENABLE);
  95  002a a601          	ld	a,#1
  97                     ; 18 }
 100  002c cc0000        	jp	_ADC1_Cmd
 113                     	xdef	_init_adc
 114                     	xref	_ADC1_ITConfig
 115                     	xref	_ADC1_DataBufferCmd
 116                     	xref	_ADC1_ScanModeCmd
 117                     	xref	_ADC1_Cmd
 118                     	xref	_ADC1_Init
 119                     	xref	_ADC1_DeInit
 138                     	end
