   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  50                     ; 3 void init_uart(void)
  50                     ; 4 {
  52                     	switch	.text
  53  0000               _init_uart:
  57                     ; 5     UART1_DeInit();
  59  0000 cd0000        	call	_UART1_DeInit
  61                     ; 15     UART1_Init((uint32_t)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
  61                     ; 16     UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
  63  0003 4b0c          	push	#12
  64  0005 4b80          	push	#128
  65  0007 4b00          	push	#0
  66  0009 4b00          	push	#0
  67  000b 4b00          	push	#0
  68  000d aec200        	ldw	x,#49664
  69  0010 89            	pushw	x
  70  0011 ae0001        	ldw	x,#1
  71  0014 89            	pushw	x
  72  0015 cd0000        	call	_UART1_Init
  74  0018 5b09          	addw	sp,#9
  75                     ; 17     send_uart("\n\rvm-stm8");
  77  001a ae0000        	ldw	x,#L12
  79                     ; 18 }
  82  001d 2000          	jp	_send_uart
 119                     ; 20 void send_uart(const uint8_t *p)
 119                     ; 21 {
 120                     	switch	.text
 121  001f               _send_uart:
 123  001f 89            	pushw	x
 124       00000000      OFST:	set	0
 127  0020 200f          	jra	L34
 128  0022               L14:
 129                     ; 23         UART1_SendData8(*p++);
 131  0022 5c            	incw	x
 132  0023 1f01          	ldw	(OFST+1,sp),x
 133  0025 cd0000        	call	_UART1_SendData8
 136  0028               L15:
 137                     ; 24         while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
 139  0028 ae0080        	ldw	x,#128
 140  002b cd0000        	call	_UART1_GetFlagStatus
 142  002e 4d            	tnz	a
 143  002f 27f7          	jreq	L15
 144  0031               L34:
 145                     ; 22     while (*p) {
 147  0031 1e01          	ldw	x,(OFST+1,sp)
 148  0033 f6            	ld	a,(x)
 149  0034 26ec          	jrne	L14
 150                     ; 26 }
 153  0036 85            	popw	x
 154  0037 81            	ret	
 167                     	xdef	_send_uart
 168                     	xdef	_init_uart
 169                     	xref	_UART1_GetFlagStatus
 170                     	xref	_UART1_SendData8
 171                     	xref	_UART1_Init
 172                     	xref	_UART1_DeInit
 173                     .const:	section	.text
 174  0000               L12:
 175  0000 0a0d766d2d73  	dc.b	10,13,118,109,45,115
 176  0006 746d3800      	dc.b	"tm8",0
 196                     	end
