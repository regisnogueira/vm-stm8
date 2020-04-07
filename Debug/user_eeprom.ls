   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  75                     ; 32 void init_eeprom(void)
  75                     ; 33 {
  77                     	switch	.text
  78  0000               _init_eeprom:
  80  0000 5205          	subw	sp,#5
  81       00000005      OFST:	set	5
  84                     ; 34     uint32_t add = 0;
  86                     ; 35     uint8_t val = 0x00, val_comp = 0xAA;
  90  0002 a6aa          	ld	a,#170
  91  0004 6b05          	ld	(OFST+0,sp),a
  93                     ; 42     FLASH_Config();
  95  0006 ad49          	call	L3_FLASH_Config
  97                     ; 45     add = 0x4000;
  99  0008 ae4000        	ldw	x,#16384
 100  000b 1f03          	ldw	(OFST-2,sp),x
 101  000d ae0000        	ldw	x,#0
 102  0010 1f01          	ldw	(OFST-4,sp),x
 104                     ; 46     FLASH_ProgramByte(add, val_comp);
 106  0012 7b05          	ld	a,(OFST+0,sp)
 107  0014 88            	push	a
 108  0015 ae4000        	ldw	x,#16384
 109  0018 89            	pushw	x
 110  0019 ae0000        	ldw	x,#0
 111  001c 89            	pushw	x
 112  001d cd0000        	call	_FLASH_ProgramByte
 114  0020 5b05          	addw	sp,#5
 115                     ; 47     val = FLASH_ReadByte(add);
 117  0022 1e03          	ldw	x,(OFST-2,sp)
 118  0024 89            	pushw	x
 119  0025 1e03          	ldw	x,(OFST-2,sp)
 120  0027 89            	pushw	x
 121  0028 cd0000        	call	_FLASH_ReadByte
 123  002b 5b04          	addw	sp,#4
 124  002d 6b05          	ld	(OFST+0,sp),a
 126                     ; 50     val_comp = (uint8_t)(~val);
 128  002f 7b05          	ld	a,(OFST+0,sp)
 129  0031 43            	cpl	a
 130  0032 6b05          	ld	(OFST+0,sp),a
 132                     ; 51     FLASH_ProgramByte((add + 1), val_comp);
 134  0034 7b05          	ld	a,(OFST+0,sp)
 135  0036 88            	push	a
 136  0037 96            	ldw	x,sp
 137  0038 1c0002        	addw	x,#OFST-3
 138  003b cd0000        	call	c_ltor
 140  003e a601          	ld	a,#1
 141  0040 cd0000        	call	c_ladc
 143  0043 be02          	ldw	x,c_lreg+2
 144  0045 89            	pushw	x
 145  0046 be00          	ldw	x,c_lreg
 146  0048 89            	pushw	x
 147  0049 cd0000        	call	_FLASH_ProgramByte
 149  004c 5b05          	addw	sp,#5
 150                     ; 52 }
 153  004e 5b05          	addw	sp,#5
 154  0050 81            	ret
 180                     ; 54 void FLASH_Config(void)
 180                     ; 55 {
 181                     	switch	.text
 182  0051               L3_FLASH_Config:
 186                     ; 57     FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
 188  0051 4f            	clr	a
 189  0052 cd0000        	call	_FLASH_SetProgrammingTime
 191                     ; 64     FLASH_Unlock(FLASH_MEMTYPE_DATA);
 193  0055 a6f7          	ld	a,#247
 194  0057 cd0000        	call	_FLASH_Unlock
 197  005a               L35:
 198                     ; 66     while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET);
 200  005a a608          	ld	a,#8
 201  005c cd0000        	call	_FLASH_GetFlagStatus
 203  005f 4d            	tnz	a
 204  0060 27f8          	jreq	L35
 205                     ; 67 }
 208  0062 81            	ret
 329                     	switch	.ubsct
 330  0000               _eeprom:
 331  0000 000000000000  	ds.b	14
 332                     	xdef	_eeprom
 333  000e               _OperationStatus:
 334  000e 00            	ds.b	1
 335                     	xdef	_OperationStatus
 336  000f               _GBuffer:
 337  000f 000000000000  	ds.b	64
 338                     	xdef	_GBuffer
 339                     	xdef	_init_eeprom
 340                     	xref	_FLASH_GetFlagStatus
 341                     	xref	_FLASH_SetProgrammingTime
 342                     	xref	_FLASH_ReadByte
 343                     	xref	_FLASH_ProgramByte
 344                     	xref	_FLASH_Unlock
 345                     	xref.b	c_lreg
 365                     	xref	c_ladc
 366                     	xref	c_ltor
 367                     	end
