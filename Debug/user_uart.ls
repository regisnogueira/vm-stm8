   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  45                     ; 4 void init_uart(void)
  45                     ; 5 {
  47                     	switch	.text
  48  0000               _init_uart:
  52                     ; 6     UART1_DeInit();
  54  0000 cd0000        	call	_UART1_DeInit
  56                     ; 16     UART1_Init((uint32_t)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
  56                     ; 17     UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
  58  0003 4b0c          	push	#12
  59  0005 4b80          	push	#128
  60  0007 4b00          	push	#0
  61  0009 4b00          	push	#0
  62  000b 4b00          	push	#0
  63  000d aec200        	ldw	x,#49664
  64  0010 89            	pushw	x
  65  0011 ae0001        	ldw	x,#1
  66  0014 89            	pushw	x
  67  0015 cd0000        	call	_UART1_Init
  69  0018 5b09          	addw	sp,#9
  70                     ; 20     printf("\n\rUART1 Example :retarget the C library printf()/getchar() functions to the UART\n\r");
  72  001a ae000f        	ldw	x,#L12
  73  001d cd0000        	call	_printf
  75                     ; 21     printf("\n\rEnter Text\n\r");
  77  0020 ae0000        	ldw	x,#L32
  78  0023 cd0000        	call	_printf
  80                     ; 22 }
  83  0026 81            	ret
 119                     ; 29 PUTCHAR_PROTOTYPE
 119                     ; 30 {
 120                     	switch	.text
 121  0027               _putchar:
 123  0027 88            	push	a
 124       00000000      OFST:	set	0
 127                     ; 32   UART1_SendData8(c);
 129  0028 cd0000        	call	_UART1_SendData8
 132  002b               L54:
 133                     ; 34   while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
 135  002b ae0080        	ldw	x,#128
 136  002e cd0000        	call	_UART1_GetFlagStatus
 138  0031 4d            	tnz	a
 139  0032 27f7          	jreq	L54
 140                     ; 36   return (c);
 142  0034 7b01          	ld	a,(OFST+1,sp)
 145  0036 5b01          	addw	sp,#1
 146  0038 81            	ret
 182                     ; 44 GETCHAR_PROTOTYPE
 182                     ; 45 {
 183                     	switch	.text
 184  0039               _getchar:
 186  0039 88            	push	a
 187       00000001      OFST:	set	1
 190                     ; 47   char c = 0;
 193  003a               L17:
 194                     ; 52   while (UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
 196  003a ae0020        	ldw	x,#32
 197  003d cd0000        	call	_UART1_GetFlagStatus
 199  0040 4d            	tnz	a
 200  0041 27f7          	jreq	L17
 201                     ; 53     c = UART1_ReceiveData8();
 203  0043 cd0000        	call	_UART1_ReceiveData8
 205  0046 6b01          	ld	(OFST+0,sp),a
 207                     ; 54   return (c);
 209  0048 7b01          	ld	a,(OFST+0,sp)
 212  004a 5b01          	addw	sp,#1
 213  004c 81            	ret
 226                     	xdef	_init_uart
 227                     	xref	_UART1_GetFlagStatus
 228                     	xref	_UART1_SendData8
 229                     	xref	_UART1_ReceiveData8
 230                     	xref	_UART1_Init
 231                     	xref	_UART1_DeInit
 232                     	xdef	_putchar
 233                     	xref	_printf
 234                     	xdef	_getchar
 235                     .const:	section	.text
 236  0000               L32:
 237  0000 0a0d456e7465  	dc.b	10,13,69,110,116,101
 238  0006 722054657874  	dc.b	"r Text",10
 239  000d 0d00          	dc.b	13,0
 240  000f               L12:
 241  000f 0a0d55415254  	dc.b	10,13,85,65,82,84
 242  0015 31204578616d  	dc.b	"1 Example :retarge"
 243  0027 742074686520  	dc.b	"t the C library pr"
 244  0039 696e74662829  	dc.b	"intf()/getchar() f"
 245  004b 756e6374696f  	dc.b	"unctions to the UA"
 246  005d 52540a        	dc.b	"RT",10
 247  0060 0d00          	dc.b	13,0
 267                     	end
