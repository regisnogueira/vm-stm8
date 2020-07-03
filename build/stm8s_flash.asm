;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.2 #11645 (Linux)
;--------------------------------------------------------
	.module stm8s_flash
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _FLASH_Unlock
	.globl _FLASH_Lock
	.globl _FLASH_DeInit
	.globl _FLASH_ITConfig
	.globl _FLASH_EraseByte
	.globl _FLASH_ProgramByte
	.globl _FLASH_ReadByte
	.globl _FLASH_ProgramWord
	.globl _FLASH_ProgramOptionByte
	.globl _FLASH_EraseOptionByte
	.globl _FLASH_ReadOptionByte
	.globl _FLASH_SetLowPowerMode
	.globl _FLASH_SetProgrammingTime
	.globl _FLASH_GetLowPowerMode
	.globl _FLASH_GetProgrammingTime
	.globl _FLASH_GetBootSize
	.globl _FLASH_GetFlagStatus
	.globl _FLASH_WaitForLastOperation
	.globl _FLASH_EraseBlock
	.globl _FLASH_ProgramBlock
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
	Sstm8s_flash$FLASH_Unlock$0 ==.
;	./libraries/src/stm8s_flash.c: 87: void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
; genLabel
;	-----------------------------------------
;	 function FLASH_Unlock
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_FLASH_Unlock:
	Sstm8s_flash$FLASH_Unlock$1 ==.
	Sstm8s_flash$FLASH_Unlock$2 ==.
;	./libraries/src/stm8s_flash.c: 93: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
; genCmpEQorNE
	ld	a, (0x03, sp)
	cp	a, #0xfd
	jrne	00112$
	jp	00113$
00112$:
	jp	00102$
00113$:
	Sstm8s_flash$FLASH_Unlock$3 ==.
; skipping generated iCode
	Sstm8s_flash$FLASH_Unlock$4 ==.
	Sstm8s_flash$FLASH_Unlock$5 ==.
;	./libraries/src/stm8s_flash.c: 95: FLASH->PUKR = FLASH_RASS_KEY1;
; genPointerSet
	mov	0x5062+0, #0x56
	Sstm8s_flash$FLASH_Unlock$6 ==.
;	./libraries/src/stm8s_flash.c: 96: FLASH->PUKR = FLASH_RASS_KEY2;
; genPointerSet
	mov	0x5062+0, #0xae
	Sstm8s_flash$FLASH_Unlock$7 ==.
; genGoto
	jp	00104$
; genLabel
00102$:
	Sstm8s_flash$FLASH_Unlock$8 ==.
	Sstm8s_flash$FLASH_Unlock$9 ==.
;	./libraries/src/stm8s_flash.c: 101: FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
; genPointerSet
	mov	0x5064+0, #0xae
	Sstm8s_flash$FLASH_Unlock$10 ==.
;	./libraries/src/stm8s_flash.c: 102: FLASH->DUKR = FLASH_RASS_KEY1;
; genPointerSet
	mov	0x5064+0, #0x56
	Sstm8s_flash$FLASH_Unlock$11 ==.
; genLabel
00104$:
	Sstm8s_flash$FLASH_Unlock$12 ==.
;	./libraries/src/stm8s_flash.c: 104: }
; genEndFunction
	Sstm8s_flash$FLASH_Unlock$13 ==.
	XG$FLASH_Unlock$0$0 ==.
	ret
	Sstm8s_flash$FLASH_Unlock$14 ==.
	Sstm8s_flash$FLASH_Lock$15 ==.
;	./libraries/src/stm8s_flash.c: 112: void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
; genLabel
;	-----------------------------------------
;	 function FLASH_Lock
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_FLASH_Lock:
	Sstm8s_flash$FLASH_Lock$16 ==.
	Sstm8s_flash$FLASH_Lock$17 ==.
;	./libraries/src/stm8s_flash.c: 118: FLASH->IAPSR &= (uint8_t)FLASH_MemType;
; genPointerGet
	ld	a, 0x505f
; genAnd
	and	a, (0x03, sp)
; genPointerSet
	ld	0x505f, a
; genLabel
00101$:
	Sstm8s_flash$FLASH_Lock$18 ==.
;	./libraries/src/stm8s_flash.c: 119: }
; genEndFunction
	Sstm8s_flash$FLASH_Lock$19 ==.
	XG$FLASH_Lock$0$0 ==.
	ret
	Sstm8s_flash$FLASH_Lock$20 ==.
	Sstm8s_flash$FLASH_DeInit$21 ==.
;	./libraries/src/stm8s_flash.c: 126: void FLASH_DeInit(void)
; genLabel
;	-----------------------------------------
;	 function FLASH_DeInit
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_FLASH_DeInit:
	Sstm8s_flash$FLASH_DeInit$22 ==.
	Sstm8s_flash$FLASH_DeInit$23 ==.
;	./libraries/src/stm8s_flash.c: 128: FLASH->CR1 = FLASH_CR1_RESET_VALUE;
; genPointerSet
	mov	0x505a+0, #0x00
	Sstm8s_flash$FLASH_DeInit$24 ==.
;	./libraries/src/stm8s_flash.c: 129: FLASH->CR2 = FLASH_CR2_RESET_VALUE;
; genPointerSet
	mov	0x505b+0, #0x00
	Sstm8s_flash$FLASH_DeInit$25 ==.
;	./libraries/src/stm8s_flash.c: 130: FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
; genPointerSet
	mov	0x505c+0, #0xff
	Sstm8s_flash$FLASH_DeInit$26 ==.
;	./libraries/src/stm8s_flash.c: 131: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
; genPointerGet
	ld	a, 0x505f
; genAnd
	and	a, #0xf7
; genPointerSet
	ld	0x505f, a
	Sstm8s_flash$FLASH_DeInit$27 ==.
;	./libraries/src/stm8s_flash.c: 132: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
; genPointerGet
	ld	a, 0x505f
; genAnd
	and	a, #0xfd
; genPointerSet
	ld	0x505f, a
	Sstm8s_flash$FLASH_DeInit$28 ==.
;	./libraries/src/stm8s_flash.c: 133: (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
; genPointerGet
; Dummy read
	ld	a, 0x505f
; genLabel
00101$:
	Sstm8s_flash$FLASH_DeInit$29 ==.
;	./libraries/src/stm8s_flash.c: 134: }
; genEndFunction
	Sstm8s_flash$FLASH_DeInit$30 ==.
	XG$FLASH_DeInit$0$0 ==.
	ret
	Sstm8s_flash$FLASH_DeInit$31 ==.
	Sstm8s_flash$FLASH_ITConfig$32 ==.
;	./libraries/src/stm8s_flash.c: 142: void FLASH_ITConfig(FunctionalState NewState)
; genLabel
;	-----------------------------------------
;	 function FLASH_ITConfig
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_FLASH_ITConfig:
	Sstm8s_flash$FLASH_ITConfig$33 ==.
	Sstm8s_flash$FLASH_ITConfig$34 ==.
;	./libraries/src/stm8s_flash.c: 149: FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
; genPointerGet
	ld	a, 0x505a
	Sstm8s_flash$FLASH_ITConfig$35 ==.
;	./libraries/src/stm8s_flash.c: 147: if(NewState != DISABLE)
; genIfx
	tnz	(0x03, sp)
	jrne	00111$
	jp	00102$
00111$:
	Sstm8s_flash$FLASH_ITConfig$36 ==.
	Sstm8s_flash$FLASH_ITConfig$37 ==.
;	./libraries/src/stm8s_flash.c: 149: FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
; genOr
	or	a, #0x02
; genPointerSet
	ld	0x505a, a
	Sstm8s_flash$FLASH_ITConfig$38 ==.
; genGoto
	jp	00104$
; genLabel
00102$:
	Sstm8s_flash$FLASH_ITConfig$39 ==.
	Sstm8s_flash$FLASH_ITConfig$40 ==.
;	./libraries/src/stm8s_flash.c: 153: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
; genAnd
	and	a, #0xfd
; genPointerSet
	ld	0x505a, a
	Sstm8s_flash$FLASH_ITConfig$41 ==.
; genLabel
00104$:
	Sstm8s_flash$FLASH_ITConfig$42 ==.
;	./libraries/src/stm8s_flash.c: 155: }
; genEndFunction
	Sstm8s_flash$FLASH_ITConfig$43 ==.
	XG$FLASH_ITConfig$0$0 ==.
	ret
	Sstm8s_flash$FLASH_ITConfig$44 ==.
	Sstm8s_flash$FLASH_EraseByte$45 ==.
;	./libraries/src/stm8s_flash.c: 164: void FLASH_EraseByte(uint32_t Address)
; genLabel
;	-----------------------------------------
;	 function FLASH_EraseByte
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_FLASH_EraseByte:
	Sstm8s_flash$FLASH_EraseByte$46 ==.
	Sstm8s_flash$FLASH_EraseByte$47 ==.
;	./libraries/src/stm8s_flash.c: 170: *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
; genCast
; genAssign
	ldw	x, (0x05, sp)
; genCast
; genAssign
; genPointerSet
	clr	(x)
; genLabel
00101$:
	Sstm8s_flash$FLASH_EraseByte$48 ==.
;	./libraries/src/stm8s_flash.c: 171: }
; genEndFunction
	Sstm8s_flash$FLASH_EraseByte$49 ==.
	XG$FLASH_EraseByte$0$0 ==.
	ret
	Sstm8s_flash$FLASH_EraseByte$50 ==.
	Sstm8s_flash$FLASH_ProgramByte$51 ==.
;	./libraries/src/stm8s_flash.c: 181: void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
; genLabel
;	-----------------------------------------
;	 function FLASH_ProgramByte
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_FLASH_ProgramByte:
	Sstm8s_flash$FLASH_ProgramByte$52 ==.
	Sstm8s_flash$FLASH_ProgramByte$53 ==.
;	./libraries/src/stm8s_flash.c: 185: *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
; genCast
; genAssign
	ldw	x, (0x05, sp)
; genCast
; genAssign
; genPointerSet
	ld	a, (0x07, sp)
	ld	(x), a
; genLabel
00101$:
	Sstm8s_flash$FLASH_ProgramByte$54 ==.
;	./libraries/src/stm8s_flash.c: 186: }
; genEndFunction
	Sstm8s_flash$FLASH_ProgramByte$55 ==.
	XG$FLASH_ProgramByte$0$0 ==.
	ret
	Sstm8s_flash$FLASH_ProgramByte$56 ==.
	Sstm8s_flash$FLASH_ReadByte$57 ==.
;	./libraries/src/stm8s_flash.c: 195: uint8_t FLASH_ReadByte(uint32_t Address)
; genLabel
;	-----------------------------------------
;	 function FLASH_ReadByte
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_FLASH_ReadByte:
	Sstm8s_flash$FLASH_ReadByte$58 ==.
	Sstm8s_flash$FLASH_ReadByte$59 ==.
;	./libraries/src/stm8s_flash.c: 201: return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
; genCast
; genAssign
	ldw	x, (0x05, sp)
; genCast
; genAssign
; genPointerGet
	ld	a, (x)
; genReturn
; genLabel
00101$:
	Sstm8s_flash$FLASH_ReadByte$60 ==.
;	./libraries/src/stm8s_flash.c: 202: }
; genEndFunction
	Sstm8s_flash$FLASH_ReadByte$61 ==.
	XG$FLASH_ReadByte$0$0 ==.
	ret
	Sstm8s_flash$FLASH_ReadByte$62 ==.
	Sstm8s_flash$FLASH_ProgramWord$63 ==.
;	./libraries/src/stm8s_flash.c: 212: void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
; genLabel
;	-----------------------------------------
;	 function FLASH_ProgramWord
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 2 bytes.
_FLASH_ProgramWord:
	Sstm8s_flash$FLASH_ProgramWord$64 ==.
	sub	sp, #2
	Sstm8s_flash$FLASH_ProgramWord$65 ==.
	Sstm8s_flash$FLASH_ProgramWord$66 ==.
;	./libraries/src/stm8s_flash.c: 218: FLASH->CR2 |= FLASH_CR2_WPRG;
; genPointerGet
	ld	a, 0x505b
; genOr
	or	a, #0x40
; genPointerSet
	ld	0x505b, a
	Sstm8s_flash$FLASH_ProgramWord$67 ==.
;	./libraries/src/stm8s_flash.c: 219: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
; genPointerGet
	ld	a, 0x505c
; genAnd
	and	a, #0xbf
; genPointerSet
	ld	0x505c, a
	Sstm8s_flash$FLASH_ProgramWord$68 ==.
;	./libraries/src/stm8s_flash.c: 222: *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
; genCast
; genAssign
	ldw	y, (0x07, sp)
; genCast
; genAssign
; skipping iCode since result will be rematerialized
; genCast
; genAssign
	ldw	x, sp
	addw	x, #9
; genPointerGet
	ld	a, (x)
; genPointerSet
	ld	(y), a
	Sstm8s_flash$FLASH_ProgramWord$69 ==.
;	./libraries/src/stm8s_flash.c: 224: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
; genPlus
	ldw	x, y
	incw	x
	ldw	(0x01, sp), x
; genAssign
	ldw	x, sp
	addw	x, #9
; genCast
; genAssign
; genAssign
; genPointerGet
	ld	a, (0x1, x)
; genPointerSet
	ldw	x, (0x01, sp)
	ld	(x), a
	Sstm8s_flash$FLASH_ProgramWord$70 ==.
;	./libraries/src/stm8s_flash.c: 226: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
; genPlus
	ldw	x, y
	incw	x
	incw	x
	ldw	(0x01, sp), x
; genAssign
	ldw	x, sp
	addw	x, #9
; genCast
; genAssign
; genAssign
; genPointerGet
	ld	a, (0x2, x)
; genPointerSet
	ldw	x, (0x01, sp)
	ld	(x), a
	Sstm8s_flash$FLASH_ProgramWord$71 ==.
;	./libraries/src/stm8s_flash.c: 228: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
; genPlus
	addw	y, #0x0003
; genAssign
	ldw	x, sp
	addw	x, #9
; genCast
; genAssign
; genAssign
; genPointerGet
	ld	a, (0x3, x)
; genPointerSet
	ld	(y), a
; genLabel
00101$:
	Sstm8s_flash$FLASH_ProgramWord$72 ==.
;	./libraries/src/stm8s_flash.c: 229: }
; genEndFunction
	addw	sp, #2
	Sstm8s_flash$FLASH_ProgramWord$73 ==.
	Sstm8s_flash$FLASH_ProgramWord$74 ==.
	XG$FLASH_ProgramWord$0$0 ==.
	ret
	Sstm8s_flash$FLASH_ProgramWord$75 ==.
	Sstm8s_flash$FLASH_ProgramOptionByte$76 ==.
;	./libraries/src/stm8s_flash.c: 237: void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
; genLabel
;	-----------------------------------------
;	 function FLASH_ProgramOptionByte
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 2 bytes.
_FLASH_ProgramOptionByte:
	Sstm8s_flash$FLASH_ProgramOptionByte$77 ==.
	sub	sp, #2
	Sstm8s_flash$FLASH_ProgramOptionByte$78 ==.
	Sstm8s_flash$FLASH_ProgramOptionByte$79 ==.
;	./libraries/src/stm8s_flash.c: 243: FLASH->CR2 |= FLASH_CR2_OPT;
; genPointerGet
	ld	a, 0x505b
; genOr
	or	a, #0x80
; genPointerSet
	ld	0x505b, a
	Sstm8s_flash$FLASH_ProgramOptionByte$80 ==.
;	./libraries/src/stm8s_flash.c: 244: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
; genPointerGet
	ld	a, 0x505c
; genAnd
	and	a, #0x7f
; genPointerSet
	ld	0x505c, a
	Sstm8s_flash$FLASH_ProgramOptionByte$81 ==.
;	./libraries/src/stm8s_flash.c: 247: if(Address == 0x4800)
; genCast
; genAssign
	ldw	x, (0x05, sp)
	Sstm8s_flash$FLASH_ProgramOptionByte$82 ==.
;	./libraries/src/stm8s_flash.c: 250: *((NEAR uint8_t*)Address) = Data;
; genCast
; genAssign
	ldw	y, (0x05, sp)
	ldw	(0x01, sp), y
	Sstm8s_flash$FLASH_ProgramOptionByte$83 ==.
;	./libraries/src/stm8s_flash.c: 247: if(Address == 0x4800)
; genCmpEQorNE
	cpw	x, #0x4800
	jrne	00112$
	jp	00113$
00112$:
	jp	00102$
00113$:
	Sstm8s_flash$FLASH_ProgramOptionByte$84 ==.
; skipping generated iCode
	Sstm8s_flash$FLASH_ProgramOptionByte$85 ==.
	Sstm8s_flash$FLASH_ProgramOptionByte$86 ==.
;	./libraries/src/stm8s_flash.c: 250: *((NEAR uint8_t*)Address) = Data;
; genPointerSet
	ldw	x, (0x01, sp)
	ld	a, (0x07, sp)
	ld	(x), a
	Sstm8s_flash$FLASH_ProgramOptionByte$87 ==.
; genGoto
	jp	00103$
; genLabel
00102$:
	Sstm8s_flash$FLASH_ProgramOptionByte$88 ==.
	Sstm8s_flash$FLASH_ProgramOptionByte$89 ==.
;	./libraries/src/stm8s_flash.c: 255: *((NEAR uint8_t*)Address) = Data;
; genPointerSet
	ldw	y, (0x01, sp)
	ld	a, (0x07, sp)
	ld	(y), a
	Sstm8s_flash$FLASH_ProgramOptionByte$90 ==.
;	./libraries/src/stm8s_flash.c: 256: *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
; genPlus
	incw	x
; genCast
; genAssign
; genCast
; genAssign
	ldw	(0x01, sp), x
; genCpl
	ld	a, (0x07, sp)
	cpl	a
; genPointerSet
	ldw	x, (0x01, sp)
	ld	(x), a
	Sstm8s_flash$FLASH_ProgramOptionByte$91 ==.
; genLabel
00103$:
	Sstm8s_flash$FLASH_ProgramOptionByte$92 ==.
;	./libraries/src/stm8s_flash.c: 258: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
; genIPush
	push	#0xfd
	Sstm8s_flash$FLASH_ProgramOptionByte$93 ==.
; genCall
	call	_FLASH_WaitForLastOperation
	pop	a
	Sstm8s_flash$FLASH_ProgramOptionByte$94 ==.
	Sstm8s_flash$FLASH_ProgramOptionByte$95 ==.
;	./libraries/src/stm8s_flash.c: 261: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
; genPointerGet
	ld	a, 0x505b
; genAnd
	and	a, #0x7f
; genPointerSet
	ld	0x505b, a
	Sstm8s_flash$FLASH_ProgramOptionByte$96 ==.
;	./libraries/src/stm8s_flash.c: 262: FLASH->NCR2 |= FLASH_NCR2_NOPT;
; genPointerGet
	ld	a, 0x505c
; genOr
	or	a, #0x80
; genPointerSet
	ld	0x505c, a
; genLabel
00104$:
	Sstm8s_flash$FLASH_ProgramOptionByte$97 ==.
;	./libraries/src/stm8s_flash.c: 263: }
; genEndFunction
	addw	sp, #2
	Sstm8s_flash$FLASH_ProgramOptionByte$98 ==.
	Sstm8s_flash$FLASH_ProgramOptionByte$99 ==.
	XG$FLASH_ProgramOptionByte$0$0 ==.
	ret
	Sstm8s_flash$FLASH_ProgramOptionByte$100 ==.
	Sstm8s_flash$FLASH_EraseOptionByte$101 ==.
;	./libraries/src/stm8s_flash.c: 270: void FLASH_EraseOptionByte(uint16_t Address)
; genLabel
;	-----------------------------------------
;	 function FLASH_EraseOptionByte
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_FLASH_EraseOptionByte:
	Sstm8s_flash$FLASH_EraseOptionByte$102 ==.
	Sstm8s_flash$FLASH_EraseOptionByte$103 ==.
;	./libraries/src/stm8s_flash.c: 276: FLASH->CR2 |= FLASH_CR2_OPT;
; genPointerGet
	ld	a, 0x505b
; genOr
	or	a, #0x80
; genPointerSet
	ld	0x505b, a
	Sstm8s_flash$FLASH_EraseOptionByte$104 ==.
;	./libraries/src/stm8s_flash.c: 277: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
; genPointerGet
	ld	a, 0x505c
; genAnd
	and	a, #0x7f
; genPointerSet
	ld	0x505c, a
	Sstm8s_flash$FLASH_EraseOptionByte$105 ==.
;	./libraries/src/stm8s_flash.c: 280: if(Address == 0x4800)
; genCast
; genAssign
	ldw	y, (0x03, sp)
	Sstm8s_flash$FLASH_EraseOptionByte$106 ==.
;	./libraries/src/stm8s_flash.c: 283: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
; genCast
; genAssign
	ldw	x, (0x03, sp)
	Sstm8s_flash$FLASH_EraseOptionByte$107 ==.
;	./libraries/src/stm8s_flash.c: 280: if(Address == 0x4800)
; genCmpEQorNE
	cpw	y, #0x4800
	jrne	00112$
	jp	00113$
00112$:
	jp	00102$
00113$:
	Sstm8s_flash$FLASH_EraseOptionByte$108 ==.
; skipping generated iCode
	Sstm8s_flash$FLASH_EraseOptionByte$109 ==.
	Sstm8s_flash$FLASH_EraseOptionByte$110 ==.
;	./libraries/src/stm8s_flash.c: 283: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
; genPointerSet
	clr	(x)
	Sstm8s_flash$FLASH_EraseOptionByte$111 ==.
; genGoto
	jp	00103$
; genLabel
00102$:
	Sstm8s_flash$FLASH_EraseOptionByte$112 ==.
	Sstm8s_flash$FLASH_EraseOptionByte$113 ==.
;	./libraries/src/stm8s_flash.c: 288: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
; genPointerSet
	clr	(x)
	Sstm8s_flash$FLASH_EraseOptionByte$114 ==.
;	./libraries/src/stm8s_flash.c: 289: *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
; genPlus
	ldw	x, (0x03, sp)
	incw	x
; genCast
; genAssign
; genPointerSet
	ld	a, #0xff
	ld	(x), a
	Sstm8s_flash$FLASH_EraseOptionByte$115 ==.
; genLabel
00103$:
	Sstm8s_flash$FLASH_EraseOptionByte$116 ==.
;	./libraries/src/stm8s_flash.c: 291: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
; genIPush
	push	#0xfd
	Sstm8s_flash$FLASH_EraseOptionByte$117 ==.
; genCall
	call	_FLASH_WaitForLastOperation
	pop	a
	Sstm8s_flash$FLASH_EraseOptionByte$118 ==.
	Sstm8s_flash$FLASH_EraseOptionByte$119 ==.
;	./libraries/src/stm8s_flash.c: 294: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
; genPointerGet
	ld	a, 0x505b
; genAnd
	and	a, #0x7f
; genPointerSet
	ld	0x505b, a
	Sstm8s_flash$FLASH_EraseOptionByte$120 ==.
;	./libraries/src/stm8s_flash.c: 295: FLASH->NCR2 |= FLASH_NCR2_NOPT;
; genPointerGet
	ld	a, 0x505c
; genOr
	or	a, #0x80
; genPointerSet
	ld	0x505c, a
; genLabel
00104$:
	Sstm8s_flash$FLASH_EraseOptionByte$121 ==.
;	./libraries/src/stm8s_flash.c: 296: }
; genEndFunction
	Sstm8s_flash$FLASH_EraseOptionByte$122 ==.
	XG$FLASH_EraseOptionByte$0$0 ==.
	ret
	Sstm8s_flash$FLASH_EraseOptionByte$123 ==.
	Sstm8s_flash$FLASH_ReadOptionByte$124 ==.
;	./libraries/src/stm8s_flash.c: 303: uint16_t FLASH_ReadOptionByte(uint16_t Address)
; genLabel
;	-----------------------------------------
;	 function FLASH_ReadOptionByte
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 3 bytes.
_FLASH_ReadOptionByte:
	Sstm8s_flash$FLASH_ReadOptionByte$125 ==.
	sub	sp, #3
	Sstm8s_flash$FLASH_ReadOptionByte$126 ==.
	Sstm8s_flash$FLASH_ReadOptionByte$127 ==.
;	./libraries/src/stm8s_flash.c: 311: value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
; genCast
; genAssign
	ldw	x, (0x06, sp)
; genPointerGet
	ld	a, (x)
	ld	(0x03, sp), a
	Sstm8s_flash$FLASH_ReadOptionByte$128 ==.
;	./libraries/src/stm8s_flash.c: 312: value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
; genAssign
; genPointerGet
	ld	a, (0x1, x)
	ld	(0x01, sp), a
	Sstm8s_flash$FLASH_ReadOptionByte$129 ==.
;	./libraries/src/stm8s_flash.c: 315: if(Address == 0x4800)	 
; genCast
; genAssign
	ldw	y, (0x06, sp)
	Sstm8s_flash$FLASH_ReadOptionByte$130 ==.
;	./libraries/src/stm8s_flash.c: 317: res_value =	 value_optbyte;
; genCast
; genAssign
	clrw	x
	ld	a, (0x03, sp)
	ld	xl, a
	Sstm8s_flash$FLASH_ReadOptionByte$131 ==.
;	./libraries/src/stm8s_flash.c: 315: if(Address == 0x4800)	 
; genCmpEQorNE
	cpw	y, #0x4800
	jrne	00120$
	jp	00121$
00120$:
	jp	00105$
00121$:
	Sstm8s_flash$FLASH_ReadOptionByte$132 ==.
; skipping generated iCode
	Sstm8s_flash$FLASH_ReadOptionByte$133 ==.
	Sstm8s_flash$FLASH_ReadOptionByte$134 ==.
;	./libraries/src/stm8s_flash.c: 317: res_value =	 value_optbyte;
; genAssign
	Sstm8s_flash$FLASH_ReadOptionByte$135 ==.
; genGoto
	jp	00106$
; genLabel
00105$:
	Sstm8s_flash$FLASH_ReadOptionByte$136 ==.
	Sstm8s_flash$FLASH_ReadOptionByte$137 ==.
;	./libraries/src/stm8s_flash.c: 321: if(value_optbyte == (uint8_t)(~value_optbyte_complement))
; genCpl
	ld	a, (0x01, sp)
	cpl	a
; genCmpEQorNE
	cp	a, (0x03, sp)
	jrne	00123$
	jp	00124$
00123$:
	jp	00102$
00124$:
	Sstm8s_flash$FLASH_ReadOptionByte$138 ==.
; skipping generated iCode
	Sstm8s_flash$FLASH_ReadOptionByte$139 ==.
	Sstm8s_flash$FLASH_ReadOptionByte$140 ==.
;	./libraries/src/stm8s_flash.c: 323: res_value = (uint16_t)((uint16_t)value_optbyte << 8);
; genLeftShiftLiteral
	clr	a
	rlwa	x
; genAssign
	ldw	(0x02, sp), x
	Sstm8s_flash$FLASH_ReadOptionByte$141 ==.
;	./libraries/src/stm8s_flash.c: 324: res_value = res_value | (uint16_t)value_optbyte_complement;
; genCast
; genAssign
	ld	a, (0x01, sp)
	clrw	x
; genOr
	or	a, (0x03, sp)
	ld	xl, a
	ld	a, xh
	or	a, (0x02, sp)
	ld	xh, a
; genAssign
	Sstm8s_flash$FLASH_ReadOptionByte$142 ==.
; genGoto
	jp	00106$
; genLabel
00102$:
	Sstm8s_flash$FLASH_ReadOptionByte$143 ==.
	Sstm8s_flash$FLASH_ReadOptionByte$144 ==.
;	./libraries/src/stm8s_flash.c: 328: res_value = FLASH_OPTIONBYTE_ERROR;
; genAssign
	ldw	x, #0x5555
	Sstm8s_flash$FLASH_ReadOptionByte$145 ==.
; genLabel
00106$:
	Sstm8s_flash$FLASH_ReadOptionByte$146 ==.
;	./libraries/src/stm8s_flash.c: 331: return(res_value);
; genReturn
; genLabel
00107$:
	Sstm8s_flash$FLASH_ReadOptionByte$147 ==.
;	./libraries/src/stm8s_flash.c: 332: }
; genEndFunction
	addw	sp, #3
	Sstm8s_flash$FLASH_ReadOptionByte$148 ==.
	Sstm8s_flash$FLASH_ReadOptionByte$149 ==.
	XG$FLASH_ReadOptionByte$0$0 ==.
	ret
	Sstm8s_flash$FLASH_ReadOptionByte$150 ==.
	Sstm8s_flash$FLASH_SetLowPowerMode$151 ==.
;	./libraries/src/stm8s_flash.c: 340: void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
; genLabel
;	-----------------------------------------
;	 function FLASH_SetLowPowerMode
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_FLASH_SetLowPowerMode:
	Sstm8s_flash$FLASH_SetLowPowerMode$152 ==.
	Sstm8s_flash$FLASH_SetLowPowerMode$153 ==.
;	./libraries/src/stm8s_flash.c: 346: FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
; genPointerGet
	ld	a, 0x505a
; genAnd
	and	a, #0xf3
; genPointerSet
	ld	0x505a, a
	Sstm8s_flash$FLASH_SetLowPowerMode$154 ==.
;	./libraries/src/stm8s_flash.c: 349: FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
; genPointerGet
	ld	a, 0x505a
; genOr
	or	a, (0x03, sp)
; genPointerSet
	ld	0x505a, a
; genLabel
00101$:
	Sstm8s_flash$FLASH_SetLowPowerMode$155 ==.
;	./libraries/src/stm8s_flash.c: 350: }
; genEndFunction
	Sstm8s_flash$FLASH_SetLowPowerMode$156 ==.
	XG$FLASH_SetLowPowerMode$0$0 ==.
	ret
	Sstm8s_flash$FLASH_SetLowPowerMode$157 ==.
	Sstm8s_flash$FLASH_SetProgrammingTime$158 ==.
;	./libraries/src/stm8s_flash.c: 358: void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
; genLabel
;	-----------------------------------------
;	 function FLASH_SetProgrammingTime
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_FLASH_SetProgrammingTime:
	Sstm8s_flash$FLASH_SetProgrammingTime$159 ==.
	Sstm8s_flash$FLASH_SetProgrammingTime$160 ==.
;	./libraries/src/stm8s_flash.c: 363: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
; genPointerGet
	ld	a, 0x505a
; genAnd
	and	a, #0xfe
; genPointerSet
	ld	0x505a, a
	Sstm8s_flash$FLASH_SetProgrammingTime$161 ==.
;	./libraries/src/stm8s_flash.c: 364: FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
; genPointerGet
	ld	a, 0x505a
; genOr
	or	a, (0x03, sp)
; genPointerSet
	ld	0x505a, a
; genLabel
00101$:
	Sstm8s_flash$FLASH_SetProgrammingTime$162 ==.
;	./libraries/src/stm8s_flash.c: 365: }
; genEndFunction
	Sstm8s_flash$FLASH_SetProgrammingTime$163 ==.
	XG$FLASH_SetProgrammingTime$0$0 ==.
	ret
	Sstm8s_flash$FLASH_SetProgrammingTime$164 ==.
	Sstm8s_flash$FLASH_GetLowPowerMode$165 ==.
;	./libraries/src/stm8s_flash.c: 372: FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
; genLabel
;	-----------------------------------------
;	 function FLASH_GetLowPowerMode
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_FLASH_GetLowPowerMode:
	Sstm8s_flash$FLASH_GetLowPowerMode$166 ==.
	Sstm8s_flash$FLASH_GetLowPowerMode$167 ==.
;	./libraries/src/stm8s_flash.c: 374: return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
; genPointerGet
	ld	a, 0x505a
; genAnd
	and	a, #0x0c
; genReturn
; genLabel
00101$:
	Sstm8s_flash$FLASH_GetLowPowerMode$168 ==.
;	./libraries/src/stm8s_flash.c: 375: }
; genEndFunction
	Sstm8s_flash$FLASH_GetLowPowerMode$169 ==.
	XG$FLASH_GetLowPowerMode$0$0 ==.
	ret
	Sstm8s_flash$FLASH_GetLowPowerMode$170 ==.
	Sstm8s_flash$FLASH_GetProgrammingTime$171 ==.
;	./libraries/src/stm8s_flash.c: 382: FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
; genLabel
;	-----------------------------------------
;	 function FLASH_GetProgrammingTime
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_FLASH_GetProgrammingTime:
	Sstm8s_flash$FLASH_GetProgrammingTime$172 ==.
	Sstm8s_flash$FLASH_GetProgrammingTime$173 ==.
;	./libraries/src/stm8s_flash.c: 384: return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
; genPointerGet
	ld	a, 0x505a
; genAnd
	and	a, #0x01
; genReturn
; genLabel
00101$:
	Sstm8s_flash$FLASH_GetProgrammingTime$174 ==.
;	./libraries/src/stm8s_flash.c: 385: }
; genEndFunction
	Sstm8s_flash$FLASH_GetProgrammingTime$175 ==.
	XG$FLASH_GetProgrammingTime$0$0 ==.
	ret
	Sstm8s_flash$FLASH_GetProgrammingTime$176 ==.
	Sstm8s_flash$FLASH_GetBootSize$177 ==.
;	./libraries/src/stm8s_flash.c: 392: uint32_t FLASH_GetBootSize(void)
; genLabel
;	-----------------------------------------
;	 function FLASH_GetBootSize
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 4 bytes.
_FLASH_GetBootSize:
	Sstm8s_flash$FLASH_GetBootSize$178 ==.
	sub	sp, #4
	Sstm8s_flash$FLASH_GetBootSize$179 ==.
	Sstm8s_flash$FLASH_GetBootSize$180 ==.
;	./libraries/src/stm8s_flash.c: 397: temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
; genPointerGet
	ld	a, 0x505d
; genCast
; genAssign
	clrw	x
	clrw	y
; genLeftShiftLiteral
	clr	(0x04, sp)
	sll	(0x04, sp)
	rlc	a
	rlcw	x
; genAssign
	ld	yh, a
	ld	a, (0x04, sp)
	ld	yl, a
	Sstm8s_flash$FLASH_GetBootSize$181 ==.
;	./libraries/src/stm8s_flash.c: 400: if(FLASH->FPR == 0xFF)
; genPointerGet
	ld	a, 0x505d
; genCmpEQorNE
	inc	a
	jrne	00111$
	jp	00112$
00111$:
	jp	00102$
00112$:
	Sstm8s_flash$FLASH_GetBootSize$182 ==.
; skipping generated iCode
	Sstm8s_flash$FLASH_GetBootSize$183 ==.
	Sstm8s_flash$FLASH_GetBootSize$184 ==.
;	./libraries/src/stm8s_flash.c: 402: temp += 512;
; genPlus
	addw	y, #0x0200
	ld	a, xl
	adc	a, #0x00
	ld	xl, a
	ld	a, xh
	adc	a, #0x00
; genAssign
	ld	xh, a
	Sstm8s_flash$FLASH_GetBootSize$185 ==.
; genLabel
00102$:
	Sstm8s_flash$FLASH_GetBootSize$186 ==.
;	./libraries/src/stm8s_flash.c: 406: return(temp);
; genReturn
	exgw	x, y
; genLabel
00103$:
	Sstm8s_flash$FLASH_GetBootSize$187 ==.
;	./libraries/src/stm8s_flash.c: 407: }
; genEndFunction
	addw	sp, #4
	Sstm8s_flash$FLASH_GetBootSize$188 ==.
	Sstm8s_flash$FLASH_GetBootSize$189 ==.
	XG$FLASH_GetBootSize$0$0 ==.
	ret
	Sstm8s_flash$FLASH_GetBootSize$190 ==.
	Sstm8s_flash$FLASH_GetFlagStatus$191 ==.
;	./libraries/src/stm8s_flash.c: 417: FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
; genLabel
;	-----------------------------------------
;	 function FLASH_GetFlagStatus
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_FLASH_GetFlagStatus:
	Sstm8s_flash$FLASH_GetFlagStatus$192 ==.
	Sstm8s_flash$FLASH_GetFlagStatus$193 ==.
;	./libraries/src/stm8s_flash.c: 424: if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
; genPointerGet
	ld	a, 0x505f
; genAnd
	and	a, (0x03, sp)
; genIfx
	tnz	a
	jrne	00111$
	jp	00102$
00111$:
	Sstm8s_flash$FLASH_GetFlagStatus$194 ==.
	Sstm8s_flash$FLASH_GetFlagStatus$195 ==.
;	./libraries/src/stm8s_flash.c: 426: status = SET; /* FLASH_FLAG is set */
; genAssign
	ld	a, #0x01
	Sstm8s_flash$FLASH_GetFlagStatus$196 ==.
; genGoto
	jp	00103$
; genLabel
00102$:
	Sstm8s_flash$FLASH_GetFlagStatus$197 ==.
	Sstm8s_flash$FLASH_GetFlagStatus$198 ==.
;	./libraries/src/stm8s_flash.c: 430: status = RESET; /* FLASH_FLAG is reset*/
; genAssign
	clr	a
	Sstm8s_flash$FLASH_GetFlagStatus$199 ==.
; genLabel
00103$:
	Sstm8s_flash$FLASH_GetFlagStatus$200 ==.
;	./libraries/src/stm8s_flash.c: 434: return status;
; genReturn
; genLabel
00104$:
	Sstm8s_flash$FLASH_GetFlagStatus$201 ==.
;	./libraries/src/stm8s_flash.c: 435: }
; genEndFunction
	Sstm8s_flash$FLASH_GetFlagStatus$202 ==.
	XG$FLASH_GetFlagStatus$0$0 ==.
	ret
	Sstm8s_flash$FLASH_GetFlagStatus$203 ==.
	Sstm8s_flash$FLASH_WaitForLastOperation$204 ==.
;	./libraries/src/stm8s_flash.c: 549: IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
; genLabel
;	-----------------------------------------
;	 function FLASH_WaitForLastOperation
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_FLASH_WaitForLastOperation:
	Sstm8s_flash$FLASH_WaitForLastOperation$205 ==.
	Sstm8s_flash$FLASH_WaitForLastOperation$206 ==.
;	./libraries/src/stm8s_flash.c: 551: uint8_t flagstatus = 0x00;
; genAssign
	clr	a
	Sstm8s_flash$FLASH_WaitForLastOperation$207 ==.
;	./libraries/src/stm8s_flash.c: 577: while((flagstatus == 0x00) && (timeout != 0x00))
; genAssign
	clrw	x
	decw	x
; genLabel
00102$:
; genIfx
	tnz	a
	jreq	00130$
	jp	00104$
00130$:
; genIfx
	tnzw	x
	jrne	00131$
	jp	00104$
00131$:
	Sstm8s_flash$FLASH_WaitForLastOperation$208 ==.
	Sstm8s_flash$FLASH_WaitForLastOperation$209 ==.
;	./libraries/src/stm8s_flash.c: 579: flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
; genPointerGet
	ld	a, 0x505f
; genAnd
	and	a, #0x05
	Sstm8s_flash$FLASH_WaitForLastOperation$210 ==.
;	./libraries/src/stm8s_flash.c: 580: timeout--;
; genMinus
	decw	x
	Sstm8s_flash$FLASH_WaitForLastOperation$211 ==.
; genGoto
	jp	00102$
; genLabel
00104$:
	Sstm8s_flash$FLASH_WaitForLastOperation$212 ==.
;	./libraries/src/stm8s_flash.c: 584: if(timeout == 0x00 )
; genIfx
	tnzw	x
	jreq	00132$
	jp	00106$
00132$:
	Sstm8s_flash$FLASH_WaitForLastOperation$213 ==.
	Sstm8s_flash$FLASH_WaitForLastOperation$214 ==.
;	./libraries/src/stm8s_flash.c: 586: flagstatus = FLASH_STATUS_TIMEOUT;
; genAssign
	ld	a, #0x02
	Sstm8s_flash$FLASH_WaitForLastOperation$215 ==.
; genLabel
00106$:
	Sstm8s_flash$FLASH_WaitForLastOperation$216 ==.
;	./libraries/src/stm8s_flash.c: 589: return((FLASH_Status_TypeDef)flagstatus);
; genReturn
; genLabel
00107$:
	Sstm8s_flash$FLASH_WaitForLastOperation$217 ==.
;	./libraries/src/stm8s_flash.c: 590: }
; genEndFunction
	Sstm8s_flash$FLASH_WaitForLastOperation$218 ==.
	XG$FLASH_WaitForLastOperation$0$0 ==.
	ret
	Sstm8s_flash$FLASH_WaitForLastOperation$219 ==.
	Sstm8s_flash$FLASH_EraseBlock$220 ==.
;	./libraries/src/stm8s_flash.c: 599: IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
; genLabel
;	-----------------------------------------
;	 function FLASH_EraseBlock
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 6 bytes.
_FLASH_EraseBlock:
	Sstm8s_flash$FLASH_EraseBlock$221 ==.
	sub	sp, #6
	Sstm8s_flash$FLASH_EraseBlock$222 ==.
	Sstm8s_flash$FLASH_EraseBlock$223 ==.
;	./libraries/src/stm8s_flash.c: 612: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
; genCmpEQorNE
	ld	a, (0x0b, sp)
	cp	a, #0xfd
	jrne	00112$
	jp	00113$
00112$:
	jp	00102$
00113$:
	Sstm8s_flash$FLASH_EraseBlock$224 ==.
; skipping generated iCode
	Sstm8s_flash$FLASH_EraseBlock$225 ==.
	Sstm8s_flash$FLASH_EraseBlock$226 ==.
;	./libraries/src/stm8s_flash.c: 615: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
; genAssign
	ldw	x, #0x8000
	ldw	(0x03, sp), x
	clrw	x
	ldw	(0x01, sp), x
	Sstm8s_flash$FLASH_EraseBlock$227 ==.
; genGoto
	jp	00103$
; genLabel
00102$:
	Sstm8s_flash$FLASH_EraseBlock$228 ==.
	Sstm8s_flash$FLASH_EraseBlock$229 ==.
;	./libraries/src/stm8s_flash.c: 620: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
; genAssign
	ldw	x, #0x4000
	ldw	(0x03, sp), x
	clrw	x
	ldw	(0x01, sp), x
	Sstm8s_flash$FLASH_EraseBlock$230 ==.
; genLabel
00103$:
	Sstm8s_flash$FLASH_EraseBlock$231 ==.
;	./libraries/src/stm8s_flash.c: 628: pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
; genAssign
	ldw	x, (0x09, sp)
; genLeftShiftLiteral
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x05, sp), x
; genCast
; genAssign
	ldw	x, (0x03, sp)
; genPlus
	addw	x, (0x05, sp)
; genCast
; genAssign
; genAssign
	Sstm8s_flash$FLASH_EraseBlock$232 ==.
;	./libraries/src/stm8s_flash.c: 632: FLASH->CR2 |= FLASH_CR2_ERASE;
; genPointerGet
	ld	a, 0x505b
; genOr
	or	a, #0x20
; genPointerSet
	ld	0x505b, a
	Sstm8s_flash$FLASH_EraseBlock$233 ==.
;	./libraries/src/stm8s_flash.c: 633: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
; genPointerGet
	ld	a, 0x505c
; genAnd
	and	a, #0xdf
; genPointerSet
	ld	0x505c, a
	Sstm8s_flash$FLASH_EraseBlock$234 ==.
;	./libraries/src/stm8s_flash.c: 637: *pwFlash = (uint32_t)0;
; genPointerSet
	clr	(0x3, x)
	clr	(0x2, x)
	clr	(0x1, x)
	clr	(x)
; genLabel
00104$:
	Sstm8s_flash$FLASH_EraseBlock$235 ==.
;	./libraries/src/stm8s_flash.c: 645: }
; genEndFunction
	addw	sp, #6
	Sstm8s_flash$FLASH_EraseBlock$236 ==.
	Sstm8s_flash$FLASH_EraseBlock$237 ==.
	XG$FLASH_EraseBlock$0$0 ==.
	ret
	Sstm8s_flash$FLASH_EraseBlock$238 ==.
	Sstm8s_flash$FLASH_ProgramBlock$239 ==.
;	./libraries/src/stm8s_flash.c: 656: IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
; genLabel
;	-----------------------------------------
;	 function FLASH_ProgramBlock
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 8 bytes.
_FLASH_ProgramBlock:
	Sstm8s_flash$FLASH_ProgramBlock$240 ==.
	sub	sp, #8
	Sstm8s_flash$FLASH_ProgramBlock$241 ==.
	Sstm8s_flash$FLASH_ProgramBlock$242 ==.
;	./libraries/src/stm8s_flash.c: 665: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
; genCmpEQorNE
	ld	a, (0x0d, sp)
	cp	a, #0xfd
	jrne	00129$
	jp	00130$
00129$:
	jp	00102$
00130$:
	Sstm8s_flash$FLASH_ProgramBlock$243 ==.
; skipping generated iCode
	Sstm8s_flash$FLASH_ProgramBlock$244 ==.
	Sstm8s_flash$FLASH_ProgramBlock$245 ==.
;	./libraries/src/stm8s_flash.c: 668: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
; genAssign
	ldw	x, #0x8000
	ldw	(0x03, sp), x
	clrw	x
	Sstm8s_flash$FLASH_ProgramBlock$246 ==.
; genGoto
	jp	00103$
; genLabel
00102$:
	Sstm8s_flash$FLASH_ProgramBlock$247 ==.
	Sstm8s_flash$FLASH_ProgramBlock$248 ==.
;	./libraries/src/stm8s_flash.c: 673: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
; genAssign
	ldw	x, #0x4000
	ldw	(0x03, sp), x
	clrw	x
	Sstm8s_flash$FLASH_ProgramBlock$249 ==.
; genLabel
00103$:
	Sstm8s_flash$FLASH_ProgramBlock$250 ==.
;	./libraries/src/stm8s_flash.c: 677: startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
; genCast
; genAssign
	ldw	y, (0x0b, sp)
	ldw	(0x07, sp), y
	clrw	y
; genLeftShift
	ldw	(0x05, sp), y
	ldw	y, (0x07, sp)
	ld	a, #0x06
00131$:
	sllw	y
	rlc	(0x06, sp)
	rlc	(0x05, sp)
	dec	a
	jrne	00131$
00132$:
; genPlus
	addw	y, (0x03, sp)
	ld	a, xl
	adc	a, (0x06, sp)
	ld	xl, a
	ld	a, xh
	adc	a, (0x05, sp)
	ld	xh, a
; genAssign
	ldw	(0x03, sp), y
	ldw	(0x01, sp), x
	Sstm8s_flash$FLASH_ProgramBlock$251 ==.
;	./libraries/src/stm8s_flash.c: 683: FLASH->CR2 |= FLASH_CR2_PRG;
; genPointerGet
	ld	a, 0x505b
	Sstm8s_flash$FLASH_ProgramBlock$252 ==.
;	./libraries/src/stm8s_flash.c: 680: if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
; genIfx
	tnz	(0x0e, sp)
	jreq	00133$
	jp	00105$
00133$:
	Sstm8s_flash$FLASH_ProgramBlock$253 ==.
	Sstm8s_flash$FLASH_ProgramBlock$254 ==.
;	./libraries/src/stm8s_flash.c: 683: FLASH->CR2 |= FLASH_CR2_PRG;
; genOr
	or	a, #0x01
; genPointerSet
	ld	0x505b, a
	Sstm8s_flash$FLASH_ProgramBlock$255 ==.
;	./libraries/src/stm8s_flash.c: 684: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
; genPointerGet
	ld	a, 0x505c
; genAnd
	and	a, #0xfe
; genPointerSet
	ld	0x505c, a
	Sstm8s_flash$FLASH_ProgramBlock$256 ==.
; genGoto
	jp	00114$
; genLabel
00105$:
	Sstm8s_flash$FLASH_ProgramBlock$257 ==.
	Sstm8s_flash$FLASH_ProgramBlock$258 ==.
;	./libraries/src/stm8s_flash.c: 689: FLASH->CR2 |= FLASH_CR2_FPRG;
; genOr
	or	a, #0x10
; genPointerSet
	ld	0x505b, a
	Sstm8s_flash$FLASH_ProgramBlock$259 ==.
;	./libraries/src/stm8s_flash.c: 690: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
; genPointerGet
	ld	a, 0x505c
; genAnd
	and	a, #0xef
; genPointerSet
	ld	0x505c, a
	Sstm8s_flash$FLASH_ProgramBlock$260 ==.
	Sstm8s_flash$FLASH_ProgramBlock$261 ==.
;	./libraries/src/stm8s_flash.c: 694: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
; genLabel
00114$:
; genAssign
	clrw	y
; genLabel
00108$:
	Sstm8s_flash$FLASH_ProgramBlock$262 ==.
	Sstm8s_flash$FLASH_ProgramBlock$263 ==.
;	./libraries/src/stm8s_flash.c: 696: *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
; genCast
; genAssign
	ldw	x, (0x03, sp)
; genCast
; genAssign
	ldw	(0x05, sp), x
; genPlus
	ldw	x, y
	addw	x, (0x05, sp)
	ldw	(0x07, sp), x
; genPlus
	ldw	x, y
	addw	x, (0x0f, sp)
; genPointerGet
	ld	a, (x)
; genPointerSet
	ldw	x, (0x07, sp)
	ld	(x), a
	Sstm8s_flash$FLASH_ProgramBlock$264 ==.
	Sstm8s_flash$FLASH_ProgramBlock$265 ==.
;	./libraries/src/stm8s_flash.c: 694: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
; genPlus
	incw	y
; genCmp
; genCmpTop
	cpw	y, #0x0040
	jrnc	00134$
	jp	00108$
00134$:
; skipping generated iCode
; genLabel
00110$:
	Sstm8s_flash$FLASH_ProgramBlock$266 ==.
;	./libraries/src/stm8s_flash.c: 698: }
; genEndFunction
	addw	sp, #8
	Sstm8s_flash$FLASH_ProgramBlock$267 ==.
	Sstm8s_flash$FLASH_ProgramBlock$268 ==.
	XG$FLASH_ProgramBlock$0$0 ==.
	ret
	Sstm8s_flash$FLASH_ProgramBlock$269 ==.
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

	.area .debug_line (NOLOAD)
	.dw	0,Ldebug_line_end-Ldebug_line_start
Ldebug_line_start:
	.dw	2
	.dw	0,Ldebug_line_stmt-6-Ldebug_line_start
	.db	1
	.db	1
	.db	-5
	.db	15
	.db	10
	.db	0
	.db	1
	.db	1
	.db	1
	.db	1
	.db	0
	.db	0
	.db	0
	.db	1
	.ascii "/usr/local/bin/../share/sdcc/include/stm8"
	.db	0
	.ascii "/usr/local/share/sdcc/include/stm8"
	.db	0
	.ascii "/usr/local/bin/../share/sdcc/include"
	.db	0
	.ascii "/usr/local/share/sdcc/include"
	.db	0
	.db	0
	.ascii "./libraries/src/stm8s_flash.c"
	.db	0
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.db	0
Ldebug_line_stmt:
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_flash$FLASH_Unlock$0)
	.db	3
	.sleb128	86
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_Unlock$2-Sstm8s_flash$FLASH_Unlock$0
	.db	3
	.sleb128	6
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_Unlock$5-Sstm8s_flash$FLASH_Unlock$2
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_Unlock$6-Sstm8s_flash$FLASH_Unlock$5
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_Unlock$9-Sstm8s_flash$FLASH_Unlock$6
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_Unlock$10-Sstm8s_flash$FLASH_Unlock$9
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_Unlock$12-Sstm8s_flash$FLASH_Unlock$10
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Sstm8s_flash$FLASH_Unlock$13-Sstm8s_flash$FLASH_Unlock$12
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_flash$FLASH_Lock$15)
	.db	3
	.sleb128	111
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_Lock$17-Sstm8s_flash$FLASH_Lock$15
	.db	3
	.sleb128	6
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_Lock$18-Sstm8s_flash$FLASH_Lock$17
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_flash$FLASH_Lock$19-Sstm8s_flash$FLASH_Lock$18
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_flash$FLASH_DeInit$21)
	.db	3
	.sleb128	125
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_DeInit$23-Sstm8s_flash$FLASH_DeInit$21
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_DeInit$24-Sstm8s_flash$FLASH_DeInit$23
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_DeInit$25-Sstm8s_flash$FLASH_DeInit$24
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_DeInit$26-Sstm8s_flash$FLASH_DeInit$25
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_DeInit$27-Sstm8s_flash$FLASH_DeInit$26
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_DeInit$28-Sstm8s_flash$FLASH_DeInit$27
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_DeInit$29-Sstm8s_flash$FLASH_DeInit$28
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_flash$FLASH_DeInit$30-Sstm8s_flash$FLASH_DeInit$29
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_flash$FLASH_ITConfig$32)
	.db	3
	.sleb128	141
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ITConfig$34-Sstm8s_flash$FLASH_ITConfig$32
	.db	3
	.sleb128	7
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ITConfig$35-Sstm8s_flash$FLASH_ITConfig$34
	.db	3
	.sleb128	-2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ITConfig$37-Sstm8s_flash$FLASH_ITConfig$35
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ITConfig$40-Sstm8s_flash$FLASH_ITConfig$37
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ITConfig$42-Sstm8s_flash$FLASH_ITConfig$40
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Sstm8s_flash$FLASH_ITConfig$43-Sstm8s_flash$FLASH_ITConfig$42
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_flash$FLASH_EraseByte$45)
	.db	3
	.sleb128	163
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseByte$47-Sstm8s_flash$FLASH_EraseByte$45
	.db	3
	.sleb128	6
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseByte$48-Sstm8s_flash$FLASH_EraseByte$47
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_flash$FLASH_EraseByte$49-Sstm8s_flash$FLASH_EraseByte$48
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_flash$FLASH_ProgramByte$51)
	.db	3
	.sleb128	180
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramByte$53-Sstm8s_flash$FLASH_ProgramByte$51
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramByte$54-Sstm8s_flash$FLASH_ProgramByte$53
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_flash$FLASH_ProgramByte$55-Sstm8s_flash$FLASH_ProgramByte$54
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_flash$FLASH_ReadByte$57)
	.db	3
	.sleb128	194
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ReadByte$59-Sstm8s_flash$FLASH_ReadByte$57
	.db	3
	.sleb128	6
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ReadByte$60-Sstm8s_flash$FLASH_ReadByte$59
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_flash$FLASH_ReadByte$61-Sstm8s_flash$FLASH_ReadByte$60
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_flash$FLASH_ProgramWord$63)
	.db	3
	.sleb128	211
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramWord$66-Sstm8s_flash$FLASH_ProgramWord$63
	.db	3
	.sleb128	6
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramWord$67-Sstm8s_flash$FLASH_ProgramWord$66
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramWord$68-Sstm8s_flash$FLASH_ProgramWord$67
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramWord$69-Sstm8s_flash$FLASH_ProgramWord$68
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramWord$70-Sstm8s_flash$FLASH_ProgramWord$69
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramWord$71-Sstm8s_flash$FLASH_ProgramWord$70
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramWord$72-Sstm8s_flash$FLASH_ProgramWord$71
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_flash$FLASH_ProgramWord$74-Sstm8s_flash$FLASH_ProgramWord$72
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$76)
	.db	3
	.sleb128	236
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramOptionByte$79-Sstm8s_flash$FLASH_ProgramOptionByte$76
	.db	3
	.sleb128	6
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramOptionByte$80-Sstm8s_flash$FLASH_ProgramOptionByte$79
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramOptionByte$81-Sstm8s_flash$FLASH_ProgramOptionByte$80
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramOptionByte$82-Sstm8s_flash$FLASH_ProgramOptionByte$81
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramOptionByte$83-Sstm8s_flash$FLASH_ProgramOptionByte$82
	.db	3
	.sleb128	-3
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramOptionByte$86-Sstm8s_flash$FLASH_ProgramOptionByte$83
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramOptionByte$89-Sstm8s_flash$FLASH_ProgramOptionByte$86
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramOptionByte$90-Sstm8s_flash$FLASH_ProgramOptionByte$89
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramOptionByte$92-Sstm8s_flash$FLASH_ProgramOptionByte$90
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramOptionByte$95-Sstm8s_flash$FLASH_ProgramOptionByte$92
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramOptionByte$96-Sstm8s_flash$FLASH_ProgramOptionByte$95
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramOptionByte$97-Sstm8s_flash$FLASH_ProgramOptionByte$96
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_flash$FLASH_ProgramOptionByte$99-Sstm8s_flash$FLASH_ProgramOptionByte$97
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_flash$FLASH_EraseOptionByte$101)
	.db	3
	.sleb128	269
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseOptionByte$103-Sstm8s_flash$FLASH_EraseOptionByte$101
	.db	3
	.sleb128	6
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseOptionByte$104-Sstm8s_flash$FLASH_EraseOptionByte$103
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseOptionByte$105-Sstm8s_flash$FLASH_EraseOptionByte$104
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseOptionByte$106-Sstm8s_flash$FLASH_EraseOptionByte$105
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseOptionByte$107-Sstm8s_flash$FLASH_EraseOptionByte$106
	.db	3
	.sleb128	-3
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseOptionByte$110-Sstm8s_flash$FLASH_EraseOptionByte$107
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseOptionByte$113-Sstm8s_flash$FLASH_EraseOptionByte$110
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseOptionByte$114-Sstm8s_flash$FLASH_EraseOptionByte$113
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseOptionByte$116-Sstm8s_flash$FLASH_EraseOptionByte$114
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseOptionByte$119-Sstm8s_flash$FLASH_EraseOptionByte$116
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseOptionByte$120-Sstm8s_flash$FLASH_EraseOptionByte$119
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseOptionByte$121-Sstm8s_flash$FLASH_EraseOptionByte$120
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_flash$FLASH_EraseOptionByte$122-Sstm8s_flash$FLASH_EraseOptionByte$121
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$124)
	.db	3
	.sleb128	302
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ReadOptionByte$127-Sstm8s_flash$FLASH_ReadOptionByte$124
	.db	3
	.sleb128	8
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ReadOptionByte$128-Sstm8s_flash$FLASH_ReadOptionByte$127
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ReadOptionByte$129-Sstm8s_flash$FLASH_ReadOptionByte$128
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ReadOptionByte$130-Sstm8s_flash$FLASH_ReadOptionByte$129
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ReadOptionByte$131-Sstm8s_flash$FLASH_ReadOptionByte$130
	.db	3
	.sleb128	-2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ReadOptionByte$134-Sstm8s_flash$FLASH_ReadOptionByte$131
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ReadOptionByte$137-Sstm8s_flash$FLASH_ReadOptionByte$134
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ReadOptionByte$140-Sstm8s_flash$FLASH_ReadOptionByte$137
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ReadOptionByte$141-Sstm8s_flash$FLASH_ReadOptionByte$140
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ReadOptionByte$144-Sstm8s_flash$FLASH_ReadOptionByte$141
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ReadOptionByte$146-Sstm8s_flash$FLASH_ReadOptionByte$144
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ReadOptionByte$147-Sstm8s_flash$FLASH_ReadOptionByte$146
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_flash$FLASH_ReadOptionByte$149-Sstm8s_flash$FLASH_ReadOptionByte$147
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_flash$FLASH_SetLowPowerMode$151)
	.db	3
	.sleb128	339
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_SetLowPowerMode$153-Sstm8s_flash$FLASH_SetLowPowerMode$151
	.db	3
	.sleb128	6
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_SetLowPowerMode$154-Sstm8s_flash$FLASH_SetLowPowerMode$153
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_SetLowPowerMode$155-Sstm8s_flash$FLASH_SetLowPowerMode$154
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_flash$FLASH_SetLowPowerMode$156-Sstm8s_flash$FLASH_SetLowPowerMode$155
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_flash$FLASH_SetProgrammingTime$158)
	.db	3
	.sleb128	357
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_SetProgrammingTime$160-Sstm8s_flash$FLASH_SetProgrammingTime$158
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_SetProgrammingTime$161-Sstm8s_flash$FLASH_SetProgrammingTime$160
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_SetProgrammingTime$162-Sstm8s_flash$FLASH_SetProgrammingTime$161
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_flash$FLASH_SetProgrammingTime$163-Sstm8s_flash$FLASH_SetProgrammingTime$162
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_flash$FLASH_GetLowPowerMode$165)
	.db	3
	.sleb128	371
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_GetLowPowerMode$167-Sstm8s_flash$FLASH_GetLowPowerMode$165
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_GetLowPowerMode$168-Sstm8s_flash$FLASH_GetLowPowerMode$167
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_flash$FLASH_GetLowPowerMode$169-Sstm8s_flash$FLASH_GetLowPowerMode$168
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_flash$FLASH_GetProgrammingTime$171)
	.db	3
	.sleb128	381
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_GetProgrammingTime$173-Sstm8s_flash$FLASH_GetProgrammingTime$171
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_GetProgrammingTime$174-Sstm8s_flash$FLASH_GetProgrammingTime$173
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_flash$FLASH_GetProgrammingTime$175-Sstm8s_flash$FLASH_GetProgrammingTime$174
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_flash$FLASH_GetBootSize$177)
	.db	3
	.sleb128	391
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_GetBootSize$180-Sstm8s_flash$FLASH_GetBootSize$177
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_GetBootSize$181-Sstm8s_flash$FLASH_GetBootSize$180
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_GetBootSize$184-Sstm8s_flash$FLASH_GetBootSize$181
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_GetBootSize$186-Sstm8s_flash$FLASH_GetBootSize$184
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_GetBootSize$187-Sstm8s_flash$FLASH_GetBootSize$186
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_flash$FLASH_GetBootSize$189-Sstm8s_flash$FLASH_GetBootSize$187
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_flash$FLASH_GetFlagStatus$191)
	.db	3
	.sleb128	416
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_GetFlagStatus$193-Sstm8s_flash$FLASH_GetFlagStatus$191
	.db	3
	.sleb128	7
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_GetFlagStatus$195-Sstm8s_flash$FLASH_GetFlagStatus$193
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_GetFlagStatus$198-Sstm8s_flash$FLASH_GetFlagStatus$195
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_GetFlagStatus$200-Sstm8s_flash$FLASH_GetFlagStatus$198
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_GetFlagStatus$201-Sstm8s_flash$FLASH_GetFlagStatus$200
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_flash$FLASH_GetFlagStatus$202-Sstm8s_flash$FLASH_GetFlagStatus$201
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_flash$FLASH_WaitForLastOperation$204)
	.db	3
	.sleb128	548
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_WaitForLastOperation$206-Sstm8s_flash$FLASH_WaitForLastOperation$204
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_WaitForLastOperation$207-Sstm8s_flash$FLASH_WaitForLastOperation$206
	.db	3
	.sleb128	26
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_WaitForLastOperation$209-Sstm8s_flash$FLASH_WaitForLastOperation$207
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_WaitForLastOperation$210-Sstm8s_flash$FLASH_WaitForLastOperation$209
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_WaitForLastOperation$212-Sstm8s_flash$FLASH_WaitForLastOperation$210
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_WaitForLastOperation$214-Sstm8s_flash$FLASH_WaitForLastOperation$212
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_WaitForLastOperation$216-Sstm8s_flash$FLASH_WaitForLastOperation$214
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_WaitForLastOperation$217-Sstm8s_flash$FLASH_WaitForLastOperation$216
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_flash$FLASH_WaitForLastOperation$218-Sstm8s_flash$FLASH_WaitForLastOperation$217
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_flash$FLASH_EraseBlock$220)
	.db	3
	.sleb128	598
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseBlock$223-Sstm8s_flash$FLASH_EraseBlock$220
	.db	3
	.sleb128	13
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseBlock$226-Sstm8s_flash$FLASH_EraseBlock$223
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseBlock$229-Sstm8s_flash$FLASH_EraseBlock$226
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseBlock$231-Sstm8s_flash$FLASH_EraseBlock$229
	.db	3
	.sleb128	8
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseBlock$232-Sstm8s_flash$FLASH_EraseBlock$231
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseBlock$233-Sstm8s_flash$FLASH_EraseBlock$232
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseBlock$234-Sstm8s_flash$FLASH_EraseBlock$233
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_EraseBlock$235-Sstm8s_flash$FLASH_EraseBlock$234
	.db	3
	.sleb128	8
	.db	1
	.db	9
	.dw	1+Sstm8s_flash$FLASH_EraseBlock$237-Sstm8s_flash$FLASH_EraseBlock$235
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$239)
	.db	3
	.sleb128	655
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramBlock$242-Sstm8s_flash$FLASH_ProgramBlock$239
	.db	3
	.sleb128	9
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramBlock$245-Sstm8s_flash$FLASH_ProgramBlock$242
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramBlock$248-Sstm8s_flash$FLASH_ProgramBlock$245
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramBlock$250-Sstm8s_flash$FLASH_ProgramBlock$248
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramBlock$251-Sstm8s_flash$FLASH_ProgramBlock$250
	.db	3
	.sleb128	6
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramBlock$252-Sstm8s_flash$FLASH_ProgramBlock$251
	.db	3
	.sleb128	-3
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramBlock$254-Sstm8s_flash$FLASH_ProgramBlock$252
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramBlock$255-Sstm8s_flash$FLASH_ProgramBlock$254
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramBlock$258-Sstm8s_flash$FLASH_ProgramBlock$255
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramBlock$259-Sstm8s_flash$FLASH_ProgramBlock$258
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramBlock$261-Sstm8s_flash$FLASH_ProgramBlock$259
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramBlock$263-Sstm8s_flash$FLASH_ProgramBlock$261
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramBlock$265-Sstm8s_flash$FLASH_ProgramBlock$263
	.db	3
	.sleb128	-2
	.db	1
	.db	9
	.dw	Sstm8s_flash$FLASH_ProgramBlock$266-Sstm8s_flash$FLASH_ProgramBlock$265
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	1+Sstm8s_flash$FLASH_ProgramBlock$268-Sstm8s_flash$FLASH_ProgramBlock$266
	.db	0
	.uleb128	1
	.db	1
Ldebug_line_end:

	.area .debug_loc (NOLOAD)
Ldebug_loc_start:
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$267)
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$269)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$243)
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$267)
	.dw	2
	.db	120
	.sleb128	9
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$241)
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$243)
	.dw	2
	.db	120
	.sleb128	9
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$240)
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$241)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_flash$FLASH_EraseBlock$236)
	.dw	0,(Sstm8s_flash$FLASH_EraseBlock$238)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_flash$FLASH_EraseBlock$224)
	.dw	0,(Sstm8s_flash$FLASH_EraseBlock$236)
	.dw	2
	.db	120
	.sleb128	7
	.dw	0,(Sstm8s_flash$FLASH_EraseBlock$222)
	.dw	0,(Sstm8s_flash$FLASH_EraseBlock$224)
	.dw	2
	.db	120
	.sleb128	7
	.dw	0,(Sstm8s_flash$FLASH_EraseBlock$221)
	.dw	0,(Sstm8s_flash$FLASH_EraseBlock$222)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_flash$FLASH_WaitForLastOperation$205)
	.dw	0,(Sstm8s_flash$FLASH_WaitForLastOperation$219)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_flash$FLASH_GetFlagStatus$192)
	.dw	0,(Sstm8s_flash$FLASH_GetFlagStatus$203)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_flash$FLASH_GetBootSize$188)
	.dw	0,(Sstm8s_flash$FLASH_GetBootSize$190)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_flash$FLASH_GetBootSize$182)
	.dw	0,(Sstm8s_flash$FLASH_GetBootSize$188)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Sstm8s_flash$FLASH_GetBootSize$179)
	.dw	0,(Sstm8s_flash$FLASH_GetBootSize$182)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Sstm8s_flash$FLASH_GetBootSize$178)
	.dw	0,(Sstm8s_flash$FLASH_GetBootSize$179)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_flash$FLASH_GetProgrammingTime$172)
	.dw	0,(Sstm8s_flash$FLASH_GetProgrammingTime$176)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_flash$FLASH_GetLowPowerMode$166)
	.dw	0,(Sstm8s_flash$FLASH_GetLowPowerMode$170)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_flash$FLASH_SetProgrammingTime$159)
	.dw	0,(Sstm8s_flash$FLASH_SetProgrammingTime$164)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_flash$FLASH_SetLowPowerMode$152)
	.dw	0,(Sstm8s_flash$FLASH_SetLowPowerMode$157)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$148)
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$150)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$138)
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$148)
	.dw	2
	.db	120
	.sleb128	4
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$132)
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$138)
	.dw	2
	.db	120
	.sleb128	4
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$126)
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$132)
	.dw	2
	.db	120
	.sleb128	4
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$125)
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$126)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_flash$FLASH_EraseOptionByte$118)
	.dw	0,(Sstm8s_flash$FLASH_EraseOptionByte$123)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_flash$FLASH_EraseOptionByte$117)
	.dw	0,(Sstm8s_flash$FLASH_EraseOptionByte$118)
	.dw	2
	.db	120
	.sleb128	2
	.dw	0,(Sstm8s_flash$FLASH_EraseOptionByte$108)
	.dw	0,(Sstm8s_flash$FLASH_EraseOptionByte$117)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_flash$FLASH_EraseOptionByte$102)
	.dw	0,(Sstm8s_flash$FLASH_EraseOptionByte$108)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$98)
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$100)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$94)
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$98)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$93)
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$94)
	.dw	2
	.db	120
	.sleb128	4
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$84)
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$93)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$78)
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$84)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$77)
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$78)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_flash$FLASH_ProgramWord$73)
	.dw	0,(Sstm8s_flash$FLASH_ProgramWord$75)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_flash$FLASH_ProgramWord$65)
	.dw	0,(Sstm8s_flash$FLASH_ProgramWord$73)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Sstm8s_flash$FLASH_ProgramWord$64)
	.dw	0,(Sstm8s_flash$FLASH_ProgramWord$65)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_flash$FLASH_ReadByte$58)
	.dw	0,(Sstm8s_flash$FLASH_ReadByte$62)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_flash$FLASH_ProgramByte$52)
	.dw	0,(Sstm8s_flash$FLASH_ProgramByte$56)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_flash$FLASH_EraseByte$46)
	.dw	0,(Sstm8s_flash$FLASH_EraseByte$50)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_flash$FLASH_ITConfig$33)
	.dw	0,(Sstm8s_flash$FLASH_ITConfig$44)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_flash$FLASH_DeInit$22)
	.dw	0,(Sstm8s_flash$FLASH_DeInit$31)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_flash$FLASH_Lock$16)
	.dw	0,(Sstm8s_flash$FLASH_Lock$20)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_flash$FLASH_Unlock$3)
	.dw	0,(Sstm8s_flash$FLASH_Unlock$14)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_flash$FLASH_Unlock$1)
	.dw	0,(Sstm8s_flash$FLASH_Unlock$3)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0

	.area .debug_abbrev (NOLOAD)
Ldebug_abbrev:
	.uleb128	11
	.uleb128	15
	.db	0
	.uleb128	11
	.uleb128	11
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	10
	.uleb128	46
	.db	0
	.uleb128	3
	.uleb128	8
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	63
	.uleb128	12
	.uleb128	64
	.uleb128	6
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	3
	.uleb128	5
	.db	0
	.uleb128	2
	.uleb128	10
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	2
	.uleb128	46
	.db	1
	.uleb128	1
	.uleb128	19
	.uleb128	3
	.uleb128	8
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	63
	.uleb128	12
	.uleb128	64
	.uleb128	6
	.uleb128	0
	.uleb128	0
	.uleb128	9
	.uleb128	52
	.db	0
	.uleb128	2
	.uleb128	10
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	7
	.uleb128	46
	.db	1
	.uleb128	1
	.uleb128	19
	.uleb128	3
	.uleb128	8
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	63
	.uleb128	12
	.uleb128	64
	.uleb128	6
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	1
	.uleb128	17
	.db	1
	.uleb128	3
	.uleb128	8
	.uleb128	16
	.uleb128	6
	.uleb128	19
	.uleb128	11
	.uleb128	37
	.uleb128	8
	.uleb128	0
	.uleb128	0
	.uleb128	4
	.uleb128	11
	.db	0
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	0
	.uleb128	0
	.uleb128	8
	.uleb128	11
	.db	1
	.uleb128	1
	.uleb128	19
	.uleb128	17
	.uleb128	1
	.uleb128	0
	.uleb128	0
	.uleb128	6
	.uleb128	46
	.db	0
	.uleb128	3
	.uleb128	8
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	63
	.uleb128	12
	.uleb128	64
	.uleb128	6
	.uleb128	0
	.uleb128	0
	.uleb128	12
	.uleb128	46
	.db	1
	.uleb128	3
	.uleb128	8
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	63
	.uleb128	12
	.uleb128	64
	.uleb128	6
	.uleb128	0
	.uleb128	0
	.uleb128	5
	.uleb128	36
	.db	0
	.uleb128	3
	.uleb128	8
	.uleb128	11
	.uleb128	11
	.uleb128	62
	.uleb128	11
	.uleb128	0
	.uleb128	0
	.uleb128	0

	.area .debug_info (NOLOAD)
	.dw	0,Ldebug_info_end-Ldebug_info_start
Ldebug_info_start:
	.dw	2
	.dw	0,(Ldebug_abbrev)
	.db	4
	.uleb128	1
	.ascii "./libraries/src/stm8s_flash.c"
	.db	0
	.dw	0,(Ldebug_line_start+-4)
	.db	1
	.ascii "SDCC version 4.0.2 #11645"
	.db	0
	.uleb128	2
	.dw	0,145
	.ascii "FLASH_Unlock"
	.db	0
	.dw	0,(_FLASH_Unlock)
	.dw	0,(XG$FLASH_Unlock$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+656)
	.uleb128	3
	.db	2
	.db	145
	.sleb128	2
	.ascii "FLASH_MemType"
	.db	0
	.dw	0,145
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_Unlock$4)
	.dw	0,(Sstm8s_flash$FLASH_Unlock$7)
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_Unlock$8)
	.dw	0,(Sstm8s_flash$FLASH_Unlock$11)
	.uleb128	0
	.uleb128	5
	.ascii "unsigned char"
	.db	0
	.db	1
	.db	8
	.uleb128	2
	.dw	0,214
	.ascii "FLASH_Lock"
	.db	0
	.dw	0,(_FLASH_Lock)
	.dw	0,(XG$FLASH_Lock$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+636)
	.uleb128	3
	.db	2
	.db	145
	.sleb128	2
	.ascii "FLASH_MemType"
	.db	0
	.dw	0,145
	.uleb128	0
	.uleb128	6
	.ascii "FLASH_DeInit"
	.db	0
	.dw	0,(_FLASH_DeInit)
	.dw	0,(XG$FLASH_DeInit$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+616)
	.uleb128	2
	.dw	0,310
	.ascii "FLASH_ITConfig"
	.db	0
	.dw	0,(_FLASH_ITConfig)
	.dw	0,(XG$FLASH_ITConfig$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+596)
	.uleb128	3
	.db	2
	.db	145
	.sleb128	2
	.ascii "NewState"
	.db	0
	.dw	0,145
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_ITConfig$36)
	.dw	0,(Sstm8s_flash$FLASH_ITConfig$38)
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_ITConfig$39)
	.dw	0,(Sstm8s_flash$FLASH_ITConfig$41)
	.uleb128	0
	.uleb128	2
	.dw	0,361
	.ascii "FLASH_EraseByte"
	.db	0
	.dw	0,(_FLASH_EraseByte)
	.dw	0,(XG$FLASH_EraseByte$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+576)
	.uleb128	3
	.db	2
	.db	145
	.sleb128	2
	.ascii "Address"
	.db	0
	.dw	0,361
	.uleb128	0
	.uleb128	5
	.ascii "unsigned long"
	.db	0
	.db	4
	.db	7
	.uleb128	2
	.dw	0,444
	.ascii "FLASH_ProgramByte"
	.db	0
	.dw	0,(_FLASH_ProgramByte)
	.dw	0,(XG$FLASH_ProgramByte$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+556)
	.uleb128	3
	.db	2
	.db	145
	.sleb128	2
	.ascii "Address"
	.db	0
	.dw	0,361
	.uleb128	3
	.db	2
	.db	145
	.sleb128	6
	.ascii "Data"
	.db	0
	.dw	0,145
	.uleb128	0
	.uleb128	7
	.dw	0,498
	.ascii "FLASH_ReadByte"
	.db	0
	.dw	0,(_FLASH_ReadByte)
	.dw	0,(XG$FLASH_ReadByte$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+536)
	.dw	0,145
	.uleb128	3
	.db	2
	.db	145
	.sleb128	2
	.ascii "Address"
	.db	0
	.dw	0,361
	.uleb128	0
	.uleb128	2
	.dw	0,564
	.ascii "FLASH_ProgramWord"
	.db	0
	.dw	0,(_FLASH_ProgramWord)
	.dw	0,(XG$FLASH_ProgramWord$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+492)
	.uleb128	3
	.db	2
	.db	145
	.sleb128	2
	.ascii "Address"
	.db	0
	.dw	0,361
	.uleb128	3
	.db	2
	.db	145
	.sleb128	6
	.ascii "Data"
	.db	0
	.dw	0,361
	.uleb128	0
	.uleb128	2
	.dw	0,654
	.ascii "FLASH_ProgramOptionByte"
	.db	0
	.dw	0,(_FLASH_ProgramOptionByte)
	.dw	0,(XG$FLASH_ProgramOptionByte$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+412)
	.uleb128	3
	.db	2
	.db	145
	.sleb128	2
	.ascii "Address"
	.db	0
	.dw	0,654
	.uleb128	3
	.db	2
	.db	145
	.sleb128	4
	.ascii "Data"
	.db	0
	.dw	0,145
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$85)
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$87)
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$88)
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$91)
	.uleb128	0
	.uleb128	5
	.ascii "unsigned int"
	.db	0
	.db	2
	.db	7
	.uleb128	2
	.dw	0,745
	.ascii "FLASH_EraseOptionByte"
	.db	0
	.dw	0,(_FLASH_EraseOptionByte)
	.dw	0,(XG$FLASH_EraseOptionByte$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+356)
	.uleb128	3
	.db	2
	.db	145
	.sleb128	2
	.ascii "Address"
	.db	0
	.dw	0,654
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_EraseOptionByte$109)
	.dw	0,(Sstm8s_flash$FLASH_EraseOptionByte$111)
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_EraseOptionByte$112)
	.dw	0,(Sstm8s_flash$FLASH_EraseOptionByte$115)
	.uleb128	0
	.uleb128	7
	.dw	0,915
	.ascii "FLASH_ReadOptionByte"
	.db	0
	.dw	0,(_FLASH_ReadOptionByte)
	.dw	0,(XG$FLASH_ReadOptionByte$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+288)
	.dw	0,654
	.uleb128	3
	.db	2
	.db	145
	.sleb128	2
	.ascii "Address"
	.db	0
	.dw	0,654
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$133)
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$135)
	.uleb128	8
	.dw	0,841
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$136)
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$139)
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$142)
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$143)
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$145)
	.uleb128	0
	.uleb128	9
	.db	2
	.db	145
	.sleb128	-1
	.ascii "value_optbyte"
	.db	0
	.dw	0,145
	.uleb128	9
	.db	2
	.db	145
	.sleb128	-3
	.ascii "value_optbyte_complement"
	.db	0
	.dw	0,145
	.uleb128	9
	.db	2
	.db	145
	.sleb128	-2
	.ascii "res_value"
	.db	0
	.dw	0,654
	.uleb128	0
	.uleb128	2
	.dw	0,977
	.ascii "FLASH_SetLowPowerMode"
	.db	0
	.dw	0,(_FLASH_SetLowPowerMode)
	.dw	0,(XG$FLASH_SetLowPowerMode$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+268)
	.uleb128	3
	.db	2
	.db	145
	.sleb128	2
	.ascii "FLASH_LPMode"
	.db	0
	.dw	0,145
	.uleb128	0
	.uleb128	2
	.dw	0,1044
	.ascii "FLASH_SetProgrammingTime"
	.db	0
	.dw	0,(_FLASH_SetProgrammingTime)
	.dw	0,(XG$FLASH_SetProgrammingTime$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+248)
	.uleb128	3
	.db	2
	.db	145
	.sleb128	2
	.ascii "FLASH_ProgTime"
	.db	0
	.dw	0,145
	.uleb128	0
	.uleb128	10
	.ascii "FLASH_GetLowPowerMode"
	.db	0
	.dw	0,(_FLASH_GetLowPowerMode)
	.dw	0,(XG$FLASH_GetLowPowerMode$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+228)
	.dw	0,145
	.uleb128	10
	.ascii "FLASH_GetProgrammingTime"
	.db	0
	.dw	0,(_FLASH_GetProgrammingTime)
	.dw	0,(XG$FLASH_GetProgrammingTime$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+208)
	.dw	0,145
	.uleb128	7
	.dw	0,1200
	.ascii "FLASH_GetBootSize"
	.db	0
	.dw	0,(_FLASH_GetBootSize)
	.dw	0,(XG$FLASH_GetBootSize$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+152)
	.dw	0,361
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_GetBootSize$183)
	.dw	0,(Sstm8s_flash$FLASH_GetBootSize$185)
	.uleb128	9
	.db	12
	.db	82
	.db	147
	.uleb128	1
	.db	81
	.db	147
	.uleb128	1
	.db	84
	.db	147
	.uleb128	1
	.db	83
	.db	147
	.uleb128	1
	.ascii "temp"
	.db	0
	.dw	0,361
	.uleb128	0
	.uleb128	7
	.dw	0,1294
	.ascii "FLASH_GetFlagStatus"
	.db	0
	.dw	0,(_FLASH_GetFlagStatus)
	.dw	0,(XG$FLASH_GetFlagStatus$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+132)
	.dw	0,145
	.uleb128	3
	.db	2
	.db	145
	.sleb128	2
	.ascii "FLASH_FLAG"
	.db	0
	.dw	0,145
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_GetFlagStatus$194)
	.dw	0,(Sstm8s_flash$FLASH_GetFlagStatus$196)
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_GetFlagStatus$197)
	.dw	0,(Sstm8s_flash$FLASH_GetFlagStatus$199)
	.uleb128	9
	.db	1
	.db	80
	.ascii "status"
	.db	0
	.dw	0,145
	.uleb128	0
	.uleb128	7
	.dw	0,1422
	.ascii "FLASH_WaitForLastOperation"
	.db	0
	.dw	0,(_FLASH_WaitForLastOperation)
	.dw	0,(XG$FLASH_WaitForLastOperation$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+112)
	.dw	0,145
	.uleb128	3
	.db	2
	.db	145
	.sleb128	2
	.ascii "FLASH_MemType"
	.db	0
	.dw	0,145
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_WaitForLastOperation$208)
	.dw	0,(Sstm8s_flash$FLASH_WaitForLastOperation$211)
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_WaitForLastOperation$213)
	.dw	0,(Sstm8s_flash$FLASH_WaitForLastOperation$215)
	.uleb128	9
	.db	1
	.db	80
	.ascii "flagstatus"
	.db	0
	.dw	0,145
	.uleb128	9
	.db	6
	.db	82
	.db	147
	.uleb128	1
	.db	81
	.db	147
	.uleb128	1
	.ascii "timeout"
	.db	0
	.dw	0,654
	.uleb128	0
	.uleb128	2
	.dw	0,1562
	.ascii "FLASH_EraseBlock"
	.db	0
	.dw	0,(_FLASH_EraseBlock)
	.dw	0,(XG$FLASH_EraseBlock$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+56)
	.uleb128	3
	.db	2
	.db	145
	.sleb128	2
	.ascii "BlockNum"
	.db	0
	.dw	0,654
	.uleb128	3
	.db	2
	.db	145
	.sleb128	4
	.ascii "FLASH_MemType"
	.db	0
	.dw	0,145
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_EraseBlock$225)
	.dw	0,(Sstm8s_flash$FLASH_EraseBlock$227)
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_EraseBlock$228)
	.dw	0,(Sstm8s_flash$FLASH_EraseBlock$230)
	.uleb128	9
	.db	2
	.db	145
	.sleb128	-6
	.ascii "startaddress"
	.db	0
	.dw	0,361
	.uleb128	11
	.db	2
	.dw	0,361
	.uleb128	9
	.db	6
	.db	82
	.db	147
	.uleb128	1
	.db	81
	.db	147
	.uleb128	1
	.ascii "pwFlash"
	.db	0
	.dw	0,1535
	.uleb128	0
	.uleb128	12
	.ascii "FLASH_ProgramBlock"
	.db	0
	.dw	0,(_FLASH_ProgramBlock)
	.dw	0,(XG$FLASH_ProgramBlock$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start)
	.uleb128	3
	.db	2
	.db	145
	.sleb128	2
	.ascii "BlockNum"
	.db	0
	.dw	0,654
	.uleb128	3
	.db	2
	.db	145
	.sleb128	4
	.ascii "FLASH_MemType"
	.db	0
	.dw	0,145
	.uleb128	3
	.db	2
	.db	145
	.sleb128	5
	.ascii "FLASH_ProgMode"
	.db	0
	.dw	0,145
	.uleb128	11
	.db	2
	.dw	0,145
	.uleb128	3
	.db	2
	.db	145
	.sleb128	6
	.ascii "Buffer"
	.db	0
	.dw	0,1657
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$244)
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$246)
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$247)
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$249)
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$253)
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$256)
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$257)
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$260)
	.uleb128	4
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$262)
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$264)
	.uleb128	9
	.db	6
	.db	84
	.db	147
	.uleb128	1
	.db	83
	.db	147
	.uleb128	1
	.ascii "Count"
	.db	0
	.dw	0,654
	.uleb128	9
	.db	2
	.db	145
	.sleb128	-8
	.ascii "startaddress"
	.db	0
	.dw	0,361
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.uleb128	0
Ldebug_info_end:

	.area .debug_pubnames (NOLOAD)
	.dw	0,Ldebug_pubnames_end-Ldebug_pubnames_start
Ldebug_pubnames_start:
	.dw	2
	.dw	0,(Ldebug_info_start-4)
	.dw	0,4+Ldebug_info_end-Ldebug_info_start
	.dw	0,73
	.ascii "FLASH_Unlock"
	.db	0
	.dw	0,162
	.ascii "FLASH_Lock"
	.db	0
	.dw	0,214
	.ascii "FLASH_DeInit"
	.db	0
	.dw	0,241
	.ascii "FLASH_ITConfig"
	.db	0
	.dw	0,310
	.ascii "FLASH_EraseByte"
	.db	0
	.dw	0,378
	.ascii "FLASH_ProgramByte"
	.db	0
	.dw	0,444
	.ascii "FLASH_ReadByte"
	.db	0
	.dw	0,498
	.ascii "FLASH_ProgramWord"
	.db	0
	.dw	0,564
	.ascii "FLASH_ProgramOptionByte"
	.db	0
	.dw	0,670
	.ascii "FLASH_EraseOptionByte"
	.db	0
	.dw	0,745
	.ascii "FLASH_ReadOptionByte"
	.db	0
	.dw	0,915
	.ascii "FLASH_SetLowPowerMode"
	.db	0
	.dw	0,977
	.ascii "FLASH_SetProgrammingTime"
	.db	0
	.dw	0,1044
	.ascii "FLASH_GetLowPowerMode"
	.db	0
	.dw	0,1084
	.ascii "FLASH_GetProgrammingTime"
	.db	0
	.dw	0,1127
	.ascii "FLASH_GetBootSize"
	.db	0
	.dw	0,1200
	.ascii "FLASH_GetFlagStatus"
	.db	0
	.dw	0,1294
	.ascii "FLASH_WaitForLastOperation"
	.db	0
	.dw	0,1422
	.ascii "FLASH_EraseBlock"
	.db	0
	.dw	0,1562
	.ascii "FLASH_ProgramBlock"
	.db	0
	.dw	0,0
Ldebug_pubnames_end:

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE0_end-Ldebug_CIE0_start
Ldebug_CIE0_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
Ldebug_CIE0_end:
	.dw	0,40
	.dw	0,(Ldebug_CIE0_start-4)
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$240)	;initial loc
	.dw	0,Sstm8s_flash$FLASH_ProgramBlock$269-Sstm8s_flash$FLASH_ProgramBlock$240
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$240)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$241)
	.db	14
	.uleb128	10
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$243)
	.db	14
	.uleb128	10
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ProgramBlock$267)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE1_end-Ldebug_CIE1_start
Ldebug_CIE1_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
Ldebug_CIE1_end:
	.dw	0,40
	.dw	0,(Ldebug_CIE1_start-4)
	.dw	0,(Sstm8s_flash$FLASH_EraseBlock$221)	;initial loc
	.dw	0,Sstm8s_flash$FLASH_EraseBlock$238-Sstm8s_flash$FLASH_EraseBlock$221
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_EraseBlock$221)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_EraseBlock$222)
	.db	14
	.uleb128	8
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_EraseBlock$224)
	.db	14
	.uleb128	8
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_EraseBlock$236)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE2_end-Ldebug_CIE2_start
Ldebug_CIE2_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
Ldebug_CIE2_end:
	.dw	0,19
	.dw	0,(Ldebug_CIE2_start-4)
	.dw	0,(Sstm8s_flash$FLASH_WaitForLastOperation$205)	;initial loc
	.dw	0,Sstm8s_flash$FLASH_WaitForLastOperation$219-Sstm8s_flash$FLASH_WaitForLastOperation$205
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_WaitForLastOperation$205)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE3_end-Ldebug_CIE3_start
Ldebug_CIE3_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
Ldebug_CIE3_end:
	.dw	0,19
	.dw	0,(Ldebug_CIE3_start-4)
	.dw	0,(Sstm8s_flash$FLASH_GetFlagStatus$192)	;initial loc
	.dw	0,Sstm8s_flash$FLASH_GetFlagStatus$203-Sstm8s_flash$FLASH_GetFlagStatus$192
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_GetFlagStatus$192)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE4_end-Ldebug_CIE4_start
Ldebug_CIE4_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
Ldebug_CIE4_end:
	.dw	0,40
	.dw	0,(Ldebug_CIE4_start-4)
	.dw	0,(Sstm8s_flash$FLASH_GetBootSize$178)	;initial loc
	.dw	0,Sstm8s_flash$FLASH_GetBootSize$190-Sstm8s_flash$FLASH_GetBootSize$178
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_GetBootSize$178)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_GetBootSize$179)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_GetBootSize$182)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_GetBootSize$188)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE5_end-Ldebug_CIE5_start
Ldebug_CIE5_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
Ldebug_CIE5_end:
	.dw	0,19
	.dw	0,(Ldebug_CIE5_start-4)
	.dw	0,(Sstm8s_flash$FLASH_GetProgrammingTime$172)	;initial loc
	.dw	0,Sstm8s_flash$FLASH_GetProgrammingTime$176-Sstm8s_flash$FLASH_GetProgrammingTime$172
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_GetProgrammingTime$172)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE6_end-Ldebug_CIE6_start
Ldebug_CIE6_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
Ldebug_CIE6_end:
	.dw	0,19
	.dw	0,(Ldebug_CIE6_start-4)
	.dw	0,(Sstm8s_flash$FLASH_GetLowPowerMode$166)	;initial loc
	.dw	0,Sstm8s_flash$FLASH_GetLowPowerMode$170-Sstm8s_flash$FLASH_GetLowPowerMode$166
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_GetLowPowerMode$166)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE7_end-Ldebug_CIE7_start
Ldebug_CIE7_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
Ldebug_CIE7_end:
	.dw	0,19
	.dw	0,(Ldebug_CIE7_start-4)
	.dw	0,(Sstm8s_flash$FLASH_SetProgrammingTime$159)	;initial loc
	.dw	0,Sstm8s_flash$FLASH_SetProgrammingTime$164-Sstm8s_flash$FLASH_SetProgrammingTime$159
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_SetProgrammingTime$159)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE8_end-Ldebug_CIE8_start
Ldebug_CIE8_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
Ldebug_CIE8_end:
	.dw	0,19
	.dw	0,(Ldebug_CIE8_start-4)
	.dw	0,(Sstm8s_flash$FLASH_SetLowPowerMode$152)	;initial loc
	.dw	0,Sstm8s_flash$FLASH_SetLowPowerMode$157-Sstm8s_flash$FLASH_SetLowPowerMode$152
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_SetLowPowerMode$152)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE9_end-Ldebug_CIE9_start
Ldebug_CIE9_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
Ldebug_CIE9_end:
	.dw	0,47
	.dw	0,(Ldebug_CIE9_start-4)
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$125)	;initial loc
	.dw	0,Sstm8s_flash$FLASH_ReadOptionByte$150-Sstm8s_flash$FLASH_ReadOptionByte$125
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$125)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$126)
	.db	14
	.uleb128	5
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$132)
	.db	14
	.uleb128	5
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$138)
	.db	14
	.uleb128	5
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ReadOptionByte$148)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE10_end-Ldebug_CIE10_start
Ldebug_CIE10_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
Ldebug_CIE10_end:
	.dw	0,40
	.dw	0,(Ldebug_CIE10_start-4)
	.dw	0,(Sstm8s_flash$FLASH_EraseOptionByte$102)	;initial loc
	.dw	0,Sstm8s_flash$FLASH_EraseOptionByte$123-Sstm8s_flash$FLASH_EraseOptionByte$102
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_EraseOptionByte$102)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_EraseOptionByte$108)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_EraseOptionByte$117)
	.db	14
	.uleb128	3
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_EraseOptionByte$118)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE11_end-Ldebug_CIE11_start
Ldebug_CIE11_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
Ldebug_CIE11_end:
	.dw	0,54
	.dw	0,(Ldebug_CIE11_start-4)
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$77)	;initial loc
	.dw	0,Sstm8s_flash$FLASH_ProgramOptionByte$100-Sstm8s_flash$FLASH_ProgramOptionByte$77
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$77)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$78)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$84)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$93)
	.db	14
	.uleb128	5
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$94)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ProgramOptionByte$98)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE12_end-Ldebug_CIE12_start
Ldebug_CIE12_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
Ldebug_CIE12_end:
	.dw	0,33
	.dw	0,(Ldebug_CIE12_start-4)
	.dw	0,(Sstm8s_flash$FLASH_ProgramWord$64)	;initial loc
	.dw	0,Sstm8s_flash$FLASH_ProgramWord$75-Sstm8s_flash$FLASH_ProgramWord$64
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ProgramWord$64)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ProgramWord$65)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ProgramWord$73)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE13_end-Ldebug_CIE13_start
Ldebug_CIE13_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
Ldebug_CIE13_end:
	.dw	0,19
	.dw	0,(Ldebug_CIE13_start-4)
	.dw	0,(Sstm8s_flash$FLASH_ReadByte$58)	;initial loc
	.dw	0,Sstm8s_flash$FLASH_ReadByte$62-Sstm8s_flash$FLASH_ReadByte$58
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ReadByte$58)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE14_end-Ldebug_CIE14_start
Ldebug_CIE14_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
Ldebug_CIE14_end:
	.dw	0,19
	.dw	0,(Ldebug_CIE14_start-4)
	.dw	0,(Sstm8s_flash$FLASH_ProgramByte$52)	;initial loc
	.dw	0,Sstm8s_flash$FLASH_ProgramByte$56-Sstm8s_flash$FLASH_ProgramByte$52
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ProgramByte$52)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE15_end-Ldebug_CIE15_start
Ldebug_CIE15_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
Ldebug_CIE15_end:
	.dw	0,19
	.dw	0,(Ldebug_CIE15_start-4)
	.dw	0,(Sstm8s_flash$FLASH_EraseByte$46)	;initial loc
	.dw	0,Sstm8s_flash$FLASH_EraseByte$50-Sstm8s_flash$FLASH_EraseByte$46
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_EraseByte$46)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE16_end-Ldebug_CIE16_start
Ldebug_CIE16_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
Ldebug_CIE16_end:
	.dw	0,19
	.dw	0,(Ldebug_CIE16_start-4)
	.dw	0,(Sstm8s_flash$FLASH_ITConfig$33)	;initial loc
	.dw	0,Sstm8s_flash$FLASH_ITConfig$44-Sstm8s_flash$FLASH_ITConfig$33
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_ITConfig$33)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE17_end-Ldebug_CIE17_start
Ldebug_CIE17_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
Ldebug_CIE17_end:
	.dw	0,19
	.dw	0,(Ldebug_CIE17_start-4)
	.dw	0,(Sstm8s_flash$FLASH_DeInit$22)	;initial loc
	.dw	0,Sstm8s_flash$FLASH_DeInit$31-Sstm8s_flash$FLASH_DeInit$22
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_DeInit$22)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE18_end-Ldebug_CIE18_start
Ldebug_CIE18_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
Ldebug_CIE18_end:
	.dw	0,19
	.dw	0,(Ldebug_CIE18_start-4)
	.dw	0,(Sstm8s_flash$FLASH_Lock$16)	;initial loc
	.dw	0,Sstm8s_flash$FLASH_Lock$20-Sstm8s_flash$FLASH_Lock$16
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_Lock$16)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE19_end-Ldebug_CIE19_start
Ldebug_CIE19_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
Ldebug_CIE19_end:
	.dw	0,26
	.dw	0,(Ldebug_CIE19_start-4)
	.dw	0,(Sstm8s_flash$FLASH_Unlock$1)	;initial loc
	.dw	0,Sstm8s_flash$FLASH_Unlock$14-Sstm8s_flash$FLASH_Unlock$1
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_Unlock$1)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_flash$FLASH_Unlock$3)
	.db	14
	.uleb128	2
