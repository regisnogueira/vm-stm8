   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  49                     ; 3 void init_uart(void)
  49                     ; 4 {
  51                     	switch	.text
  52  0000               _init_uart:
  56                     ; 5     UART1_DeInit();
  58  0000 cd0000        	call	_UART1_DeInit
  60                     ; 15     UART1_Init((uint32_t)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
  60                     ; 16     UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
  62  0003 4b0c          	push	#12
  63  0005 4b80          	push	#128
  64  0007 4b00          	push	#0
  65  0009 4b00          	push	#0
  66  000b 4b00          	push	#0
  67  000d aec200        	ldw	x,#49664
  68  0010 89            	pushw	x
  69  0011 ae0001        	ldw	x,#1
  70  0014 89            	pushw	x
  71  0015 cd0000        	call	_UART1_Init
  73  0018 5b09          	addw	sp,#9
  74                     ; 19 }
  77  001a 81            	ret	
  90                     	xdef	_init_uart
  91                     	xref	_UART1_Init
  92                     	xref	_UART1_DeInit
 111                     	end
