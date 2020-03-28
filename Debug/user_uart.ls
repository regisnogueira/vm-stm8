   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  46                     ; 3 void init_uart(void)
  46                     ; 4 {
  48                     	switch	.text
  49  0000               _init_uart:
  53                     ; 6     UART1_DeInit();
  55  0000 cd0000        	call	_UART1_DeInit
  57                     ; 16     UART1_Init((uint32_t)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
  57                     ; 17     UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
  59  0003 4b0c          	push	#12
  60  0005 4b80          	push	#128
  61  0007 4b00          	push	#0
  62  0009 4b00          	push	#0
  63  000b 4b00          	push	#0
  64  000d aec200        	ldw	x,#49664
  65  0010 89            	pushw	x
  66  0011 ae0001        	ldw	x,#1
  67  0014 89            	pushw	x
  68  0015 cd0000        	call	_UART1_Init
  70  0018 5b09          	addw	sp,#9
  71                     ; 18     send_uart("\n\rvm-stm8");
  73  001a ae0000        	ldw	x,#L12
  74  001d ad01          	call	_send_uart
  76                     ; 20 }
  79  001f 81            	ret
 116                     ; 22 void send_uart(const uint8_t *p)
 116                     ; 23 {
 117                     	switch	.text
 118  0020               _send_uart:
 120  0020 89            	pushw	x
 121       00000000      OFST:	set	0
 124  0021 2017          	jra	L34
 125  0023               L14:
 126                     ; 26         UART1_SendData8(*p++);
 128  0023 1e01          	ldw	x,(OFST+1,sp)
 129  0025 1c0001        	addw	x,#1
 130  0028 1f01          	ldw	(OFST+1,sp),x
 131  002a 1d0001        	subw	x,#1
 132  002d f6            	ld	a,(x)
 133  002e cd0000        	call	_UART1_SendData8
 136  0031               L15:
 137                     ; 27         while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
 139  0031 ae0080        	ldw	x,#128
 140  0034 cd0000        	call	_UART1_GetFlagStatus
 142  0037 4d            	tnz	a
 143  0038 27f7          	jreq	L15
 144  003a               L34:
 145                     ; 25     while (*p) {
 147  003a 1e01          	ldw	x,(OFST+1,sp)
 148  003c 7d            	tnz	(x)
 149  003d 26e4          	jrne	L14
 150                     ; 30 }
 153  003f 85            	popw	x
 154  0040 81            	ret
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
