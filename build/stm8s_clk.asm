;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.2 #11645 (Linux)
;--------------------------------------------------------
	.module stm8s_clk
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CLKPrescTable
	.globl _HSIDivFactor
	.globl _CLK_DeInit
	.globl _CLK_FastHaltWakeUpCmd
	.globl _CLK_HSECmd
	.globl _CLK_HSICmd
	.globl _CLK_LSICmd
	.globl _CLK_CCOCmd
	.globl _CLK_ClockSwitchCmd
	.globl _CLK_SlowActiveHaltWakeUpCmd
	.globl _CLK_PeripheralClockConfig
	.globl _CLK_ClockSwitchConfig
	.globl _CLK_HSIPrescalerConfig
	.globl _CLK_CCOConfig
	.globl _CLK_ITConfig
	.globl _CLK_SYSCLKConfig
	.globl _CLK_SWIMConfig
	.globl _CLK_ClockSecuritySystemEnable
	.globl _CLK_GetSYSCLKSource
	.globl _CLK_GetClockFreq
	.globl _CLK_AdjustHSICalibrationValue
	.globl _CLK_SYSCLKEmergencyClear
	.globl _CLK_GetFlagStatus
	.globl _CLK_GetITStatus
	.globl _CLK_ClearITPendingBit
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
	Sstm8s_clk$CLK_DeInit$0 ==.
;	./libraries/src/stm8s_clk.c: 72: void CLK_DeInit(void)
; genLabel
;	-----------------------------------------
;	 function CLK_DeInit
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CLK_DeInit:
	Sstm8s_clk$CLK_DeInit$1 ==.
	Sstm8s_clk$CLK_DeInit$2 ==.
;	./libraries/src/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
; genPointerSet
	mov	0x50c0+0, #0x01
	Sstm8s_clk$CLK_DeInit$3 ==.
;	./libraries/src/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
; genPointerSet
	mov	0x50c1+0, #0x00
	Sstm8s_clk$CLK_DeInit$4 ==.
;	./libraries/src/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
; genPointerSet
	mov	0x50c4+0, #0xe1
	Sstm8s_clk$CLK_DeInit$5 ==.
;	./libraries/src/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
; genPointerSet
	mov	0x50c5+0, #0x00
	Sstm8s_clk$CLK_DeInit$6 ==.
;	./libraries/src/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
; genPointerSet
	mov	0x50c6+0, #0x18
	Sstm8s_clk$CLK_DeInit$7 ==.
;	./libraries/src/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
; genPointerSet
	mov	0x50c7+0, #0xff
	Sstm8s_clk$CLK_DeInit$8 ==.
;	./libraries/src/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
; genPointerSet
	mov	0x50ca+0, #0xff
	Sstm8s_clk$CLK_DeInit$9 ==.
;	./libraries/src/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
; genPointerSet
	mov	0x50c8+0, #0x00
	Sstm8s_clk$CLK_DeInit$10 ==.
;	./libraries/src/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
; genPointerSet
	mov	0x50c9+0, #0x00
	Sstm8s_clk$CLK_DeInit$11 ==.
;	./libraries/src/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
; genLabel
00101$:
; genPointerGet
	ld	a, 0x50c9
; genAnd
	srl	a
	jrnc	00116$
	jp	00101$
00116$:
; skipping generated iCode
	Sstm8s_clk$CLK_DeInit$12 ==.
;	./libraries/src/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
; genPointerSet
	mov	0x50c9+0, #0x00
	Sstm8s_clk$CLK_DeInit$13 ==.
;	./libraries/src/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
; genPointerSet
	mov	0x50cc+0, #0x00
	Sstm8s_clk$CLK_DeInit$14 ==.
;	./libraries/src/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
; genPointerSet
	mov	0x50cd+0, #0x00
; genLabel
00104$:
	Sstm8s_clk$CLK_DeInit$15 ==.
;	./libraries/src/stm8s_clk.c: 88: }
; genEndFunction
	Sstm8s_clk$CLK_DeInit$16 ==.
	XG$CLK_DeInit$0$0 ==.
	ret
	Sstm8s_clk$CLK_DeInit$17 ==.
	Sstm8s_clk$CLK_FastHaltWakeUpCmd$18 ==.
;	./libraries/src/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
; genLabel
;	-----------------------------------------
;	 function CLK_FastHaltWakeUpCmd
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CLK_FastHaltWakeUpCmd:
	Sstm8s_clk$CLK_FastHaltWakeUpCmd$19 ==.
	Sstm8s_clk$CLK_FastHaltWakeUpCmd$20 ==.
;	./libraries/src/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
; genPointerGet
	ld	a, 0x50c0
	Sstm8s_clk$CLK_FastHaltWakeUpCmd$21 ==.
;	./libraries/src/stm8s_clk.c: 104: if (NewState != DISABLE)
; genIfx
	tnz	(0x03, sp)
	jrne	00111$
	jp	00102$
00111$:
	Sstm8s_clk$CLK_FastHaltWakeUpCmd$22 ==.
	Sstm8s_clk$CLK_FastHaltWakeUpCmd$23 ==.
;	./libraries/src/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
; genOr
	or	a, #0x04
; genPointerSet
	ld	0x50c0, a
	Sstm8s_clk$CLK_FastHaltWakeUpCmd$24 ==.
; genGoto
	jp	00104$
; genLabel
00102$:
	Sstm8s_clk$CLK_FastHaltWakeUpCmd$25 ==.
	Sstm8s_clk$CLK_FastHaltWakeUpCmd$26 ==.
;	./libraries/src/stm8s_clk.c: 112: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
; genAnd
	and	a, #0xfb
; genPointerSet
	ld	0x50c0, a
	Sstm8s_clk$CLK_FastHaltWakeUpCmd$27 ==.
; genLabel
00104$:
	Sstm8s_clk$CLK_FastHaltWakeUpCmd$28 ==.
;	./libraries/src/stm8s_clk.c: 114: }
; genEndFunction
	Sstm8s_clk$CLK_FastHaltWakeUpCmd$29 ==.
	XG$CLK_FastHaltWakeUpCmd$0$0 ==.
	ret
	Sstm8s_clk$CLK_FastHaltWakeUpCmd$30 ==.
	Sstm8s_clk$CLK_HSECmd$31 ==.
;	./libraries/src/stm8s_clk.c: 121: void CLK_HSECmd(FunctionalState NewState)
; genLabel
;	-----------------------------------------
;	 function CLK_HSECmd
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CLK_HSECmd:
	Sstm8s_clk$CLK_HSECmd$32 ==.
	Sstm8s_clk$CLK_HSECmd$33 ==.
;	./libraries/src/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
; genPointerGet
	ld	a, 0x50c1
	Sstm8s_clk$CLK_HSECmd$34 ==.
;	./libraries/src/stm8s_clk.c: 126: if (NewState != DISABLE)
; genIfx
	tnz	(0x03, sp)
	jrne	00111$
	jp	00102$
00111$:
	Sstm8s_clk$CLK_HSECmd$35 ==.
	Sstm8s_clk$CLK_HSECmd$36 ==.
;	./libraries/src/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
; genOr
	or	a, #0x01
; genPointerSet
	ld	0x50c1, a
	Sstm8s_clk$CLK_HSECmd$37 ==.
; genGoto
	jp	00104$
; genLabel
00102$:
	Sstm8s_clk$CLK_HSECmd$38 ==.
	Sstm8s_clk$CLK_HSECmd$39 ==.
;	./libraries/src/stm8s_clk.c: 134: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
; genAnd
	and	a, #0xfe
; genPointerSet
	ld	0x50c1, a
	Sstm8s_clk$CLK_HSECmd$40 ==.
; genLabel
00104$:
	Sstm8s_clk$CLK_HSECmd$41 ==.
;	./libraries/src/stm8s_clk.c: 136: }
; genEndFunction
	Sstm8s_clk$CLK_HSECmd$42 ==.
	XG$CLK_HSECmd$0$0 ==.
	ret
	Sstm8s_clk$CLK_HSECmd$43 ==.
	Sstm8s_clk$CLK_HSICmd$44 ==.
;	./libraries/src/stm8s_clk.c: 143: void CLK_HSICmd(FunctionalState NewState)
; genLabel
;	-----------------------------------------
;	 function CLK_HSICmd
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CLK_HSICmd:
	Sstm8s_clk$CLK_HSICmd$45 ==.
	Sstm8s_clk$CLK_HSICmd$46 ==.
;	./libraries/src/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
; genPointerGet
	ld	a, 0x50c0
	Sstm8s_clk$CLK_HSICmd$47 ==.
;	./libraries/src/stm8s_clk.c: 148: if (NewState != DISABLE)
; genIfx
	tnz	(0x03, sp)
	jrne	00111$
	jp	00102$
00111$:
	Sstm8s_clk$CLK_HSICmd$48 ==.
	Sstm8s_clk$CLK_HSICmd$49 ==.
;	./libraries/src/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
; genOr
	or	a, #0x01
; genPointerSet
	ld	0x50c0, a
	Sstm8s_clk$CLK_HSICmd$50 ==.
; genGoto
	jp	00104$
; genLabel
00102$:
	Sstm8s_clk$CLK_HSICmd$51 ==.
	Sstm8s_clk$CLK_HSICmd$52 ==.
;	./libraries/src/stm8s_clk.c: 156: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
; genAnd
	and	a, #0xfe
; genPointerSet
	ld	0x50c0, a
	Sstm8s_clk$CLK_HSICmd$53 ==.
; genLabel
00104$:
	Sstm8s_clk$CLK_HSICmd$54 ==.
;	./libraries/src/stm8s_clk.c: 158: }
; genEndFunction
	Sstm8s_clk$CLK_HSICmd$55 ==.
	XG$CLK_HSICmd$0$0 ==.
	ret
	Sstm8s_clk$CLK_HSICmd$56 ==.
	Sstm8s_clk$CLK_LSICmd$57 ==.
;	./libraries/src/stm8s_clk.c: 166: void CLK_LSICmd(FunctionalState NewState)
; genLabel
;	-----------------------------------------
;	 function CLK_LSICmd
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CLK_LSICmd:
	Sstm8s_clk$CLK_LSICmd$58 ==.
	Sstm8s_clk$CLK_LSICmd$59 ==.
;	./libraries/src/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
; genPointerGet
	ld	a, 0x50c0
	Sstm8s_clk$CLK_LSICmd$60 ==.
;	./libraries/src/stm8s_clk.c: 171: if (NewState != DISABLE)
; genIfx
	tnz	(0x03, sp)
	jrne	00111$
	jp	00102$
00111$:
	Sstm8s_clk$CLK_LSICmd$61 ==.
	Sstm8s_clk$CLK_LSICmd$62 ==.
;	./libraries/src/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
; genOr
	or	a, #0x08
; genPointerSet
	ld	0x50c0, a
	Sstm8s_clk$CLK_LSICmd$63 ==.
; genGoto
	jp	00104$
; genLabel
00102$:
	Sstm8s_clk$CLK_LSICmd$64 ==.
	Sstm8s_clk$CLK_LSICmd$65 ==.
;	./libraries/src/stm8s_clk.c: 179: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
; genAnd
	and	a, #0xf7
; genPointerSet
	ld	0x50c0, a
	Sstm8s_clk$CLK_LSICmd$66 ==.
; genLabel
00104$:
	Sstm8s_clk$CLK_LSICmd$67 ==.
;	./libraries/src/stm8s_clk.c: 181: }
; genEndFunction
	Sstm8s_clk$CLK_LSICmd$68 ==.
	XG$CLK_LSICmd$0$0 ==.
	ret
	Sstm8s_clk$CLK_LSICmd$69 ==.
	Sstm8s_clk$CLK_CCOCmd$70 ==.
;	./libraries/src/stm8s_clk.c: 189: void CLK_CCOCmd(FunctionalState NewState)
; genLabel
;	-----------------------------------------
;	 function CLK_CCOCmd
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CLK_CCOCmd:
	Sstm8s_clk$CLK_CCOCmd$71 ==.
	Sstm8s_clk$CLK_CCOCmd$72 ==.
;	./libraries/src/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
; genPointerGet
	ld	a, 0x50c9
	Sstm8s_clk$CLK_CCOCmd$73 ==.
;	./libraries/src/stm8s_clk.c: 194: if (NewState != DISABLE)
; genIfx
	tnz	(0x03, sp)
	jrne	00111$
	jp	00102$
00111$:
	Sstm8s_clk$CLK_CCOCmd$74 ==.
	Sstm8s_clk$CLK_CCOCmd$75 ==.
;	./libraries/src/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
; genOr
	or	a, #0x01
; genPointerSet
	ld	0x50c9, a
	Sstm8s_clk$CLK_CCOCmd$76 ==.
; genGoto
	jp	00104$
; genLabel
00102$:
	Sstm8s_clk$CLK_CCOCmd$77 ==.
	Sstm8s_clk$CLK_CCOCmd$78 ==.
;	./libraries/src/stm8s_clk.c: 202: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
; genAnd
	and	a, #0xfe
; genPointerSet
	ld	0x50c9, a
	Sstm8s_clk$CLK_CCOCmd$79 ==.
; genLabel
00104$:
	Sstm8s_clk$CLK_CCOCmd$80 ==.
;	./libraries/src/stm8s_clk.c: 204: }
; genEndFunction
	Sstm8s_clk$CLK_CCOCmd$81 ==.
	XG$CLK_CCOCmd$0$0 ==.
	ret
	Sstm8s_clk$CLK_CCOCmd$82 ==.
	Sstm8s_clk$CLK_ClockSwitchCmd$83 ==.
;	./libraries/src/stm8s_clk.c: 213: void CLK_ClockSwitchCmd(FunctionalState NewState)
; genLabel
;	-----------------------------------------
;	 function CLK_ClockSwitchCmd
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CLK_ClockSwitchCmd:
	Sstm8s_clk$CLK_ClockSwitchCmd$84 ==.
	Sstm8s_clk$CLK_ClockSwitchCmd$85 ==.
;	./libraries/src/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
; genPointerGet
	ld	a, 0x50c5
	Sstm8s_clk$CLK_ClockSwitchCmd$86 ==.
;	./libraries/src/stm8s_clk.c: 218: if (NewState != DISABLE )
; genIfx
	tnz	(0x03, sp)
	jrne	00111$
	jp	00102$
00111$:
	Sstm8s_clk$CLK_ClockSwitchCmd$87 ==.
	Sstm8s_clk$CLK_ClockSwitchCmd$88 ==.
;	./libraries/src/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
; genOr
	or	a, #0x02
; genPointerSet
	ld	0x50c5, a
	Sstm8s_clk$CLK_ClockSwitchCmd$89 ==.
; genGoto
	jp	00104$
; genLabel
00102$:
	Sstm8s_clk$CLK_ClockSwitchCmd$90 ==.
	Sstm8s_clk$CLK_ClockSwitchCmd$91 ==.
;	./libraries/src/stm8s_clk.c: 226: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
; genAnd
	and	a, #0xfd
; genPointerSet
	ld	0x50c5, a
	Sstm8s_clk$CLK_ClockSwitchCmd$92 ==.
; genLabel
00104$:
	Sstm8s_clk$CLK_ClockSwitchCmd$93 ==.
;	./libraries/src/stm8s_clk.c: 228: }
; genEndFunction
	Sstm8s_clk$CLK_ClockSwitchCmd$94 ==.
	XG$CLK_ClockSwitchCmd$0$0 ==.
	ret
	Sstm8s_clk$CLK_ClockSwitchCmd$95 ==.
	Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$96 ==.
;	./libraries/src/stm8s_clk.c: 238: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
; genLabel
;	-----------------------------------------
;	 function CLK_SlowActiveHaltWakeUpCmd
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CLK_SlowActiveHaltWakeUpCmd:
	Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$97 ==.
	Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$98 ==.
;	./libraries/src/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
; genPointerGet
	ld	a, 0x50c0
	Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$99 ==.
;	./libraries/src/stm8s_clk.c: 243: if (NewState != DISABLE)
; genIfx
	tnz	(0x03, sp)
	jrne	00111$
	jp	00102$
00111$:
	Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$100 ==.
	Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$101 ==.
;	./libraries/src/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
; genOr
	or	a, #0x20
; genPointerSet
	ld	0x50c0, a
	Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$102 ==.
; genGoto
	jp	00104$
; genLabel
00102$:
	Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$103 ==.
	Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$104 ==.
;	./libraries/src/stm8s_clk.c: 251: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
; genAnd
	and	a, #0xdf
; genPointerSet
	ld	0x50c0, a
	Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$105 ==.
; genLabel
00104$:
	Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$106 ==.
;	./libraries/src/stm8s_clk.c: 253: }
; genEndFunction
	Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$107 ==.
	XG$CLK_SlowActiveHaltWakeUpCmd$0$0 ==.
	ret
	Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$108 ==.
	Sstm8s_clk$CLK_PeripheralClockConfig$109 ==.
;	./libraries/src/stm8s_clk.c: 263: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
; genLabel
;	-----------------------------------------
;	 function CLK_PeripheralClockConfig
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 2 bytes.
_CLK_PeripheralClockConfig:
	Sstm8s_clk$CLK_PeripheralClockConfig$110 ==.
	sub	sp, #2
	Sstm8s_clk$CLK_PeripheralClockConfig$111 ==.
	Sstm8s_clk$CLK_PeripheralClockConfig$112 ==.
;	./libraries/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
; genAnd
	ld	a, (0x05, sp)
	and	a, #0x0f
; genLeftShift
	push	a
	Sstm8s_clk$CLK_PeripheralClockConfig$113 ==.
	ld	a, #0x01
	ld	(0x02, sp), a
	pop	a
	Sstm8s_clk$CLK_PeripheralClockConfig$114 ==.
	tnz	a
	jreq	00128$
00127$:
	sll	(0x01, sp)
	dec	a
	jrne	00127$
00128$:
	Sstm8s_clk$CLK_PeripheralClockConfig$115 ==.
;	./libraries/src/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
; genCpl
	ld	a, (0x01, sp)
	cpl	a
	ld	(0x02, sp), a
	Sstm8s_clk$CLK_PeripheralClockConfig$116 ==.
;	./libraries/src/stm8s_clk.c: 269: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
; genAnd
	ld	a, (0x05, sp)
	bcp	a, #0x10
	jreq	00129$
	jp	00108$
00129$:
; skipping generated iCode
	Sstm8s_clk$CLK_PeripheralClockConfig$117 ==.
;	./libraries/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
; genPointerGet
	ld	a, 0x50c7
	Sstm8s_clk$CLK_PeripheralClockConfig$118 ==.
	Sstm8s_clk$CLK_PeripheralClockConfig$119 ==.
;	./libraries/src/stm8s_clk.c: 271: if (NewState != DISABLE)
; genIfx
	tnz	(0x06, sp)
	jrne	00130$
	jp	00102$
00130$:
	Sstm8s_clk$CLK_PeripheralClockConfig$120 ==.
	Sstm8s_clk$CLK_PeripheralClockConfig$121 ==.
;	./libraries/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
; genOr
	or	a, (0x01, sp)
; genPointerSet
	ld	0x50c7, a
	Sstm8s_clk$CLK_PeripheralClockConfig$122 ==.
; genGoto
	jp	00110$
; genLabel
00102$:
	Sstm8s_clk$CLK_PeripheralClockConfig$123 ==.
	Sstm8s_clk$CLK_PeripheralClockConfig$124 ==.
;	./libraries/src/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
; genAnd
	and	a, (0x02, sp)
; genPointerSet
	ld	0x50c7, a
	Sstm8s_clk$CLK_PeripheralClockConfig$125 ==.
; genGoto
	jp	00110$
; genLabel
00108$:
	Sstm8s_clk$CLK_PeripheralClockConfig$126 ==.
;	./libraries/src/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
; genPointerGet
	ld	a, 0x50ca
	Sstm8s_clk$CLK_PeripheralClockConfig$127 ==.
	Sstm8s_clk$CLK_PeripheralClockConfig$128 ==.
;	./libraries/src/stm8s_clk.c: 284: if (NewState != DISABLE)
; genIfx
	tnz	(0x06, sp)
	jrne	00131$
	jp	00105$
00131$:
	Sstm8s_clk$CLK_PeripheralClockConfig$129 ==.
	Sstm8s_clk$CLK_PeripheralClockConfig$130 ==.
;	./libraries/src/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
; genOr
	or	a, (0x01, sp)
; genPointerSet
	ld	0x50ca, a
	Sstm8s_clk$CLK_PeripheralClockConfig$131 ==.
; genGoto
	jp	00110$
; genLabel
00105$:
	Sstm8s_clk$CLK_PeripheralClockConfig$132 ==.
	Sstm8s_clk$CLK_PeripheralClockConfig$133 ==.
;	./libraries/src/stm8s_clk.c: 292: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
; genAnd
	and	a, (0x02, sp)
; genPointerSet
	ld	0x50ca, a
	Sstm8s_clk$CLK_PeripheralClockConfig$134 ==.
; genLabel
00110$:
	Sstm8s_clk$CLK_PeripheralClockConfig$135 ==.
;	./libraries/src/stm8s_clk.c: 295: }
; genEndFunction
	addw	sp, #2
	Sstm8s_clk$CLK_PeripheralClockConfig$136 ==.
	Sstm8s_clk$CLK_PeripheralClockConfig$137 ==.
	XG$CLK_PeripheralClockConfig$0$0 ==.
	ret
	Sstm8s_clk$CLK_PeripheralClockConfig$138 ==.
	Sstm8s_clk$CLK_ClockSwitchConfig$139 ==.
;	./libraries/src/stm8s_clk.c: 309: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
; genLabel
;	-----------------------------------------
;	 function CLK_ClockSwitchConfig
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_CLK_ClockSwitchConfig:
	Sstm8s_clk$CLK_ClockSwitchConfig$140 ==.
	Sstm8s_clk$CLK_ClockSwitchConfig$141 ==.
;	./libraries/src/stm8s_clk.c: 322: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
; genPointerGet
	ld	a, 0x50c3
	ld	yl, a
	Sstm8s_clk$CLK_ClockSwitchConfig$142 ==.
;	./libraries/src/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
; genPointerGet
	ld	a, 0x50c5
	Sstm8s_clk$CLK_ClockSwitchConfig$143 ==.
;	./libraries/src/stm8s_clk.c: 325: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
; genCmpEQorNE
	push	a
	Sstm8s_clk$CLK_ClockSwitchConfig$144 ==.
	ld	a, (0x04, sp)
	dec	a
	pop	a
	Sstm8s_clk$CLK_ClockSwitchConfig$145 ==.
	jrne	00232$
	jp	00233$
00232$:
	jp	00122$
00233$:
	Sstm8s_clk$CLK_ClockSwitchConfig$146 ==.
; skipping generated iCode
	Sstm8s_clk$CLK_ClockSwitchConfig$147 ==.
	Sstm8s_clk$CLK_ClockSwitchConfig$148 ==.
;	./libraries/src/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
; genOr
	or	a, #0x02
; genPointerSet
	ld	0x50c5, a
	Sstm8s_clk$CLK_ClockSwitchConfig$149 ==.
; genPointerGet
	ld	a, 0x50c5
	Sstm8s_clk$CLK_ClockSwitchConfig$150 ==.
;	./libraries/src/stm8s_clk.c: 331: if (ITState != DISABLE)
; genIfx
	tnz	(0x05, sp)
	jrne	00234$
	jp	00102$
00234$:
	Sstm8s_clk$CLK_ClockSwitchConfig$151 ==.
	Sstm8s_clk$CLK_ClockSwitchConfig$152 ==.
;	./libraries/src/stm8s_clk.c: 333: CLK->SWCR |= CLK_SWCR_SWIEN;
; genOr
	or	a, #0x04
; genPointerSet
	ld	0x50c5, a
	Sstm8s_clk$CLK_ClockSwitchConfig$153 ==.
; genGoto
	jp	00103$
; genLabel
00102$:
	Sstm8s_clk$CLK_ClockSwitchConfig$154 ==.
	Sstm8s_clk$CLK_ClockSwitchConfig$155 ==.
;	./libraries/src/stm8s_clk.c: 337: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
; genAnd
	and	a, #0xfb
; genPointerSet
	ld	0x50c5, a
	Sstm8s_clk$CLK_ClockSwitchConfig$156 ==.
; genLabel
00103$:
	Sstm8s_clk$CLK_ClockSwitchConfig$157 ==.
;	./libraries/src/stm8s_clk.c: 341: CLK->SWR = (uint8_t)CLK_NewClock;
; genPointerSet
	ldw	x, #0x50c4
	ld	a, (0x04, sp)
	ld	(x), a
	Sstm8s_clk$CLK_ClockSwitchConfig$158 ==.
	Sstm8s_clk$CLK_ClockSwitchConfig$159 ==.
;	./libraries/src/stm8s_clk.c: 344: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
; genAssign
	clrw	x
	decw	x
; genLabel
00105$:
; genPointerGet
	ld	a, 0x50c5
; genAnd
	srl	a
	jrc	00235$
	jp	00107$
00235$:
; skipping generated iCode
; genIfx
	tnzw	x
	jrne	00236$
	jp	00107$
00236$:
	Sstm8s_clk$CLK_ClockSwitchConfig$160 ==.
	Sstm8s_clk$CLK_ClockSwitchConfig$161 ==.
;	./libraries/src/stm8s_clk.c: 346: DownCounter--;
; genMinus
	decw	x
	Sstm8s_clk$CLK_ClockSwitchConfig$162 ==.
; genGoto
	jp	00105$
; genLabel
00107$:
	Sstm8s_clk$CLK_ClockSwitchConfig$163 ==.
;	./libraries/src/stm8s_clk.c: 349: if(DownCounter != 0)
; genIfx
	tnzw	x
	jrne	00237$
	jp	00109$
00237$:
	Sstm8s_clk$CLK_ClockSwitchConfig$164 ==.
	Sstm8s_clk$CLK_ClockSwitchConfig$165 ==.
;	./libraries/src/stm8s_clk.c: 351: Swif = SUCCESS;
; genAssign
	ld	a, #0x01
	ld	xl, a
	Sstm8s_clk$CLK_ClockSwitchConfig$166 ==.
; genGoto
	jp	00123$
; genLabel
00109$:
	Sstm8s_clk$CLK_ClockSwitchConfig$167 ==.
	Sstm8s_clk$CLK_ClockSwitchConfig$168 ==.
;	./libraries/src/stm8s_clk.c: 355: Swif = ERROR;
; genAssign
	clrw	x
	Sstm8s_clk$CLK_ClockSwitchConfig$169 ==.
; genGoto
	jp	00123$
; genLabel
00122$:
	Sstm8s_clk$CLK_ClockSwitchConfig$170 ==.
	Sstm8s_clk$CLK_ClockSwitchConfig$171 ==.
;	./libraries/src/stm8s_clk.c: 361: if (ITState != DISABLE)
; genIfx
	tnz	(0x05, sp)
	jrne	00238$
	jp	00112$
00238$:
	Sstm8s_clk$CLK_ClockSwitchConfig$172 ==.
	Sstm8s_clk$CLK_ClockSwitchConfig$173 ==.
;	./libraries/src/stm8s_clk.c: 363: CLK->SWCR |= CLK_SWCR_SWIEN;
; genOr
	or	a, #0x04
; genPointerSet
	ld	0x50c5, a
	Sstm8s_clk$CLK_ClockSwitchConfig$174 ==.
; genGoto
	jp	00113$
; genLabel
00112$:
	Sstm8s_clk$CLK_ClockSwitchConfig$175 ==.
	Sstm8s_clk$CLK_ClockSwitchConfig$176 ==.
;	./libraries/src/stm8s_clk.c: 367: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
; genAnd
	and	a, #0xfb
; genPointerSet
	ld	0x50c5, a
	Sstm8s_clk$CLK_ClockSwitchConfig$177 ==.
; genLabel
00113$:
	Sstm8s_clk$CLK_ClockSwitchConfig$178 ==.
;	./libraries/src/stm8s_clk.c: 371: CLK->SWR = (uint8_t)CLK_NewClock;
; genPointerSet
	ldw	x, #0x50c4
	ld	a, (0x04, sp)
	ld	(x), a
	Sstm8s_clk$CLK_ClockSwitchConfig$179 ==.
	Sstm8s_clk$CLK_ClockSwitchConfig$180 ==.
;	./libraries/src/stm8s_clk.c: 374: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
; genAssign
	clrw	x
	decw	x
; genLabel
00115$:
; genPointerGet
	ld	a, 0x50c5
; genAnd
	bcp	a, #0x08
	jrne	00239$
	jp	00117$
00239$:
; skipping generated iCode
; genIfx
	tnzw	x
	jrne	00240$
	jp	00117$
00240$:
	Sstm8s_clk$CLK_ClockSwitchConfig$181 ==.
	Sstm8s_clk$CLK_ClockSwitchConfig$182 ==.
;	./libraries/src/stm8s_clk.c: 376: DownCounter--;
; genMinus
	decw	x
	Sstm8s_clk$CLK_ClockSwitchConfig$183 ==.
; genGoto
	jp	00115$
; genLabel
00117$:
	Sstm8s_clk$CLK_ClockSwitchConfig$184 ==.
;	./libraries/src/stm8s_clk.c: 379: if(DownCounter != 0)
; genIfx
	tnzw	x
	jrne	00241$
	jp	00119$
00241$:
	Sstm8s_clk$CLK_ClockSwitchConfig$185 ==.
	Sstm8s_clk$CLK_ClockSwitchConfig$186 ==.
;	./libraries/src/stm8s_clk.c: 382: CLK->SWCR |= CLK_SWCR_SWEN;
; genPointerGet
	ld	a, 0x50c5
; genOr
	or	a, #0x02
; genPointerSet
	ld	0x50c5, a
	Sstm8s_clk$CLK_ClockSwitchConfig$187 ==.
;	./libraries/src/stm8s_clk.c: 383: Swif = SUCCESS;
; genAssign
	ld	a, #0x01
	ld	xl, a
	Sstm8s_clk$CLK_ClockSwitchConfig$188 ==.
; genGoto
	jp	00123$
; genLabel
00119$:
	Sstm8s_clk$CLK_ClockSwitchConfig$189 ==.
	Sstm8s_clk$CLK_ClockSwitchConfig$190 ==.
;	./libraries/src/stm8s_clk.c: 387: Swif = ERROR;
; genAssign
	clrw	x
	Sstm8s_clk$CLK_ClockSwitchConfig$191 ==.
; genLabel
00123$:
	Sstm8s_clk$CLK_ClockSwitchConfig$192 ==.
;	./libraries/src/stm8s_clk.c: 390: if(Swif != ERROR)
; genIfx
	ld	a, xl
	tnz	a
	jrne	00242$
	jp	00136$
00242$:
	Sstm8s_clk$CLK_ClockSwitchConfig$193 ==.
	Sstm8s_clk$CLK_ClockSwitchConfig$194 ==.
;	./libraries/src/stm8s_clk.c: 393: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
; genIfx
	tnz	(0x06, sp)
	jreq	00243$
	jp	00132$
00243$:
; genCmpEQorNE
	ld	a, yl
	cp	a, #0xe1
	jrne	00245$
	jp	00246$
00245$:
	jp	00132$
00246$:
	Sstm8s_clk$CLK_ClockSwitchConfig$195 ==.
; skipping generated iCode
	Sstm8s_clk$CLK_ClockSwitchConfig$196 ==.
	Sstm8s_clk$CLK_ClockSwitchConfig$197 ==.
;	./libraries/src/stm8s_clk.c: 395: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
; genPointerGet
	ld	a, 0x50c0
; genAnd
	and	a, #0xfe
; genPointerSet
	ld	0x50c0, a
	Sstm8s_clk$CLK_ClockSwitchConfig$198 ==.
; genGoto
	jp	00136$
; genLabel
00132$:
	Sstm8s_clk$CLK_ClockSwitchConfig$199 ==.
;	./libraries/src/stm8s_clk.c: 397: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
; genIfx
	tnz	(0x06, sp)
	jreq	00247$
	jp	00128$
00247$:
; genCmpEQorNE
	ld	a, yl
	cp	a, #0xd2
	jrne	00249$
	jp	00250$
00249$:
	jp	00128$
00250$:
	Sstm8s_clk$CLK_ClockSwitchConfig$200 ==.
; skipping generated iCode
	Sstm8s_clk$CLK_ClockSwitchConfig$201 ==.
	Sstm8s_clk$CLK_ClockSwitchConfig$202 ==.
;	./libraries/src/stm8s_clk.c: 399: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
; genPointerGet
	ld	a, 0x50c0
; genAnd
	and	a, #0xf7
; genPointerSet
	ld	0x50c0, a
	Sstm8s_clk$CLK_ClockSwitchConfig$203 ==.
; genGoto
	jp	00136$
; genLabel
00128$:
	Sstm8s_clk$CLK_ClockSwitchConfig$204 ==.
;	./libraries/src/stm8s_clk.c: 401: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
; genIfx
	tnz	(0x06, sp)
	jreq	00251$
	jp	00136$
00251$:
; genCmpEQorNE
	ld	a, yl
	cp	a, #0xb4
	jrne	00253$
	jp	00254$
00253$:
	jp	00136$
00254$:
	Sstm8s_clk$CLK_ClockSwitchConfig$205 ==.
; skipping generated iCode
	Sstm8s_clk$CLK_ClockSwitchConfig$206 ==.
	Sstm8s_clk$CLK_ClockSwitchConfig$207 ==.
;	./libraries/src/stm8s_clk.c: 403: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
; genPointerGet
	ld	a, 0x50c1
; genAnd
	and	a, #0xfe
; genPointerSet
	ld	0x50c1, a
	Sstm8s_clk$CLK_ClockSwitchConfig$208 ==.
; genLabel
00136$:
	Sstm8s_clk$CLK_ClockSwitchConfig$209 ==.
;	./libraries/src/stm8s_clk.c: 406: return(Swif);
; genReturn
	ld	a, xl
; genLabel
00137$:
	Sstm8s_clk$CLK_ClockSwitchConfig$210 ==.
;	./libraries/src/stm8s_clk.c: 407: }
; genEndFunction
	Sstm8s_clk$CLK_ClockSwitchConfig$211 ==.
	XG$CLK_ClockSwitchConfig$0$0 ==.
	ret
	Sstm8s_clk$CLK_ClockSwitchConfig$212 ==.
	Sstm8s_clk$CLK_HSIPrescalerConfig$213 ==.
;	./libraries/src/stm8s_clk.c: 415: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
; genLabel
;	-----------------------------------------
;	 function CLK_HSIPrescalerConfig
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CLK_HSIPrescalerConfig:
	Sstm8s_clk$CLK_HSIPrescalerConfig$214 ==.
	Sstm8s_clk$CLK_HSIPrescalerConfig$215 ==.
;	./libraries/src/stm8s_clk.c: 421: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
; genPointerGet
	ld	a, 0x50c6
; genAnd
	and	a, #0xe7
; genPointerSet
	ld	0x50c6, a
	Sstm8s_clk$CLK_HSIPrescalerConfig$216 ==.
;	./libraries/src/stm8s_clk.c: 424: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
; genPointerGet
	ld	a, 0x50c6
; genOr
	or	a, (0x03, sp)
; genPointerSet
	ld	0x50c6, a
; genLabel
00101$:
	Sstm8s_clk$CLK_HSIPrescalerConfig$217 ==.
;	./libraries/src/stm8s_clk.c: 425: }
; genEndFunction
	Sstm8s_clk$CLK_HSIPrescalerConfig$218 ==.
	XG$CLK_HSIPrescalerConfig$0$0 ==.
	ret
	Sstm8s_clk$CLK_HSIPrescalerConfig$219 ==.
	Sstm8s_clk$CLK_CCOConfig$220 ==.
;	./libraries/src/stm8s_clk.c: 436: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
; genLabel
;	-----------------------------------------
;	 function CLK_CCOConfig
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CLK_CCOConfig:
	Sstm8s_clk$CLK_CCOConfig$221 ==.
	Sstm8s_clk$CLK_CCOConfig$222 ==.
;	./libraries/src/stm8s_clk.c: 442: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
; genPointerGet
	ld	a, 0x50c9
; genAnd
	and	a, #0xe1
; genPointerSet
	ld	0x50c9, a
	Sstm8s_clk$CLK_CCOConfig$223 ==.
;	./libraries/src/stm8s_clk.c: 445: CLK->CCOR |= (uint8_t)CLK_CCO;
; genPointerGet
	ld	a, 0x50c9
; genOr
	or	a, (0x03, sp)
; genPointerSet
	ld	0x50c9, a
	Sstm8s_clk$CLK_CCOConfig$224 ==.
;	./libraries/src/stm8s_clk.c: 448: CLK->CCOR |= CLK_CCOR_CCOEN;
; genPointerGet
	ld	a, 0x50c9
; genOr
	or	a, #0x01
; genPointerSet
	ld	0x50c9, a
; genLabel
00101$:
	Sstm8s_clk$CLK_CCOConfig$225 ==.
;	./libraries/src/stm8s_clk.c: 449: }
; genEndFunction
	Sstm8s_clk$CLK_CCOConfig$226 ==.
	XG$CLK_CCOConfig$0$0 ==.
	ret
	Sstm8s_clk$CLK_CCOConfig$227 ==.
	Sstm8s_clk$CLK_ITConfig$228 ==.
;	./libraries/src/stm8s_clk.c: 459: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
; genLabel
;	-----------------------------------------
;	 function CLK_ITConfig
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 1 bytes.
_CLK_ITConfig:
	Sstm8s_clk$CLK_ITConfig$229 ==.
	push	a
	Sstm8s_clk$CLK_ITConfig$230 ==.
	Sstm8s_clk$CLK_ITConfig$231 ==.
;	./libraries/src/stm8s_clk.c: 467: switch (CLK_IT)
; genCmpEQorNE
	ld	a, (0x04, sp)
	cp	a, #0x0c
	jrne	00140$
	ld	a, #0x01
	ld	(0x01, sp), a
	jp	00141$
00140$:
	clr	(0x01, sp)
00141$:
	Sstm8s_clk$CLK_ITConfig$232 ==.
; genCmpEQorNE
	ld	a, (0x04, sp)
	cp	a, #0x1c
	jrne	00143$
	ld	a, #0x01
	jp	00144$
00143$:
	clr	a
00144$:
	Sstm8s_clk$CLK_ITConfig$233 ==.
	Sstm8s_clk$CLK_ITConfig$234 ==.
;	./libraries/src/stm8s_clk.c: 465: if (NewState != DISABLE)
; genIfx
	tnz	(0x05, sp)
	jrne	00145$
	jp	00110$
00145$:
	Sstm8s_clk$CLK_ITConfig$235 ==.
	Sstm8s_clk$CLK_ITConfig$236 ==.
;	./libraries/src/stm8s_clk.c: 467: switch (CLK_IT)
; genIfx
	tnz	(0x01, sp)
	jreq	00146$
	jp	00102$
00146$:
; genIfx
	tnz	a
	jrne	00147$
	jp	00112$
00147$:
	Sstm8s_clk$CLK_ITConfig$237 ==.
	Sstm8s_clk$CLK_ITConfig$238 ==.
;	./libraries/src/stm8s_clk.c: 470: CLK->SWCR |= CLK_SWCR_SWIEN;
; genPointerGet
	ld	a, 0x50c5
; genOr
	or	a, #0x04
; genPointerSet
	ld	0x50c5, a
	Sstm8s_clk$CLK_ITConfig$239 ==.
;	./libraries/src/stm8s_clk.c: 471: break;
; genGoto
	jp	00112$
	Sstm8s_clk$CLK_ITConfig$240 ==.
;	./libraries/src/stm8s_clk.c: 472: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
; genLabel
00102$:
	Sstm8s_clk$CLK_ITConfig$241 ==.
;	./libraries/src/stm8s_clk.c: 473: CLK->CSSR |= CLK_CSSR_CSSDIE;
; genPointerGet
	ld	a, 0x50c8
; genOr
	or	a, #0x04
; genPointerSet
	ld	0x50c8, a
	Sstm8s_clk$CLK_ITConfig$242 ==.
;	./libraries/src/stm8s_clk.c: 474: break;
; genGoto
	jp	00112$
	Sstm8s_clk$CLK_ITConfig$243 ==.
	Sstm8s_clk$CLK_ITConfig$244 ==.
;	./libraries/src/stm8s_clk.c: 477: }
; genLabel
00110$:
	Sstm8s_clk$CLK_ITConfig$245 ==.
	Sstm8s_clk$CLK_ITConfig$246 ==.
;	./libraries/src/stm8s_clk.c: 481: switch (CLK_IT)
; genIfx
	tnz	(0x01, sp)
	jreq	00148$
	jp	00106$
00148$:
; genIfx
	tnz	a
	jrne	00149$
	jp	00112$
00149$:
	Sstm8s_clk$CLK_ITConfig$247 ==.
	Sstm8s_clk$CLK_ITConfig$248 ==.
;	./libraries/src/stm8s_clk.c: 484: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
; genPointerGet
	ld	a, 0x50c5
; genAnd
	and	a, #0xfb
; genPointerSet
	ld	0x50c5, a
	Sstm8s_clk$CLK_ITConfig$249 ==.
;	./libraries/src/stm8s_clk.c: 485: break;
; genGoto
	jp	00112$
	Sstm8s_clk$CLK_ITConfig$250 ==.
;	./libraries/src/stm8s_clk.c: 486: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
; genLabel
00106$:
	Sstm8s_clk$CLK_ITConfig$251 ==.
;	./libraries/src/stm8s_clk.c: 487: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
; genPointerGet
	ld	a, 0x50c8
; genAnd
	and	a, #0xfb
; genPointerSet
	ld	0x50c8, a
	Sstm8s_clk$CLK_ITConfig$252 ==.
	Sstm8s_clk$CLK_ITConfig$253 ==.
;	./libraries/src/stm8s_clk.c: 491: }
; genLabel
00112$:
	Sstm8s_clk$CLK_ITConfig$254 ==.
;	./libraries/src/stm8s_clk.c: 493: }
; genEndFunction
	pop	a
	Sstm8s_clk$CLK_ITConfig$255 ==.
	Sstm8s_clk$CLK_ITConfig$256 ==.
	XG$CLK_ITConfig$0$0 ==.
	ret
	Sstm8s_clk$CLK_ITConfig$257 ==.
	Sstm8s_clk$CLK_SYSCLKConfig$258 ==.
;	./libraries/src/stm8s_clk.c: 500: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
; genLabel
;	-----------------------------------------
;	 function CLK_SYSCLKConfig
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 1 bytes.
_CLK_SYSCLKConfig:
	Sstm8s_clk$CLK_SYSCLKConfig$259 ==.
	push	a
	Sstm8s_clk$CLK_SYSCLKConfig$260 ==.
	Sstm8s_clk$CLK_SYSCLKConfig$261 ==.
;	./libraries/src/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
; genPointerGet
	ld	a, 0x50c6
	Sstm8s_clk$CLK_SYSCLKConfig$262 ==.
;	./libraries/src/stm8s_clk.c: 505: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
; genAnd
	tnz	(0x04, sp)
	jrpl	00111$
	jp	00102$
00111$:
; skipping generated iCode
	Sstm8s_clk$CLK_SYSCLKConfig$263 ==.
	Sstm8s_clk$CLK_SYSCLKConfig$264 ==.
;	./libraries/src/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
; genAnd
	and	a, #0xe7
; genPointerSet
	ld	0x50c6, a
	Sstm8s_clk$CLK_SYSCLKConfig$265 ==.
;	./libraries/src/stm8s_clk.c: 508: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
; genPointerGet
	ld	a, 0x50c6
	ld	(0x01, sp), a
; genAnd
	ld	a, (0x04, sp)
	and	a, #0x18
; genOr
	or	a, (0x01, sp)
; genPointerSet
	ld	0x50c6, a
	Sstm8s_clk$CLK_SYSCLKConfig$266 ==.
; genGoto
	jp	00104$
; genLabel
00102$:
	Sstm8s_clk$CLK_SYSCLKConfig$267 ==.
	Sstm8s_clk$CLK_SYSCLKConfig$268 ==.
;	./libraries/src/stm8s_clk.c: 512: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
; genAnd
	and	a, #0xf8
; genPointerSet
	ld	0x50c6, a
	Sstm8s_clk$CLK_SYSCLKConfig$269 ==.
;	./libraries/src/stm8s_clk.c: 513: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
; genPointerGet
	ld	a, 0x50c6
	ld	(0x01, sp), a
; genAnd
	ld	a, (0x04, sp)
	and	a, #0x07
; genOr
	or	a, (0x01, sp)
; genPointerSet
	ld	0x50c6, a
	Sstm8s_clk$CLK_SYSCLKConfig$270 ==.
; genLabel
00104$:
	Sstm8s_clk$CLK_SYSCLKConfig$271 ==.
;	./libraries/src/stm8s_clk.c: 515: }
; genEndFunction
	pop	a
	Sstm8s_clk$CLK_SYSCLKConfig$272 ==.
	Sstm8s_clk$CLK_SYSCLKConfig$273 ==.
	XG$CLK_SYSCLKConfig$0$0 ==.
	ret
	Sstm8s_clk$CLK_SYSCLKConfig$274 ==.
	Sstm8s_clk$CLK_SWIMConfig$275 ==.
;	./libraries/src/stm8s_clk.c: 523: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
; genLabel
;	-----------------------------------------
;	 function CLK_SWIMConfig
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CLK_SWIMConfig:
	Sstm8s_clk$CLK_SWIMConfig$276 ==.
	Sstm8s_clk$CLK_SWIMConfig$277 ==.
;	./libraries/src/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
; genPointerGet
	ld	a, 0x50cd
	Sstm8s_clk$CLK_SWIMConfig$278 ==.
;	./libraries/src/stm8s_clk.c: 528: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
; genIfx
	tnz	(0x03, sp)
	jrne	00111$
	jp	00102$
00111$:
	Sstm8s_clk$CLK_SWIMConfig$279 ==.
	Sstm8s_clk$CLK_SWIMConfig$280 ==.
;	./libraries/src/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
; genOr
	or	a, #0x01
; genPointerSet
	ld	0x50cd, a
	Sstm8s_clk$CLK_SWIMConfig$281 ==.
; genGoto
	jp	00104$
; genLabel
00102$:
	Sstm8s_clk$CLK_SWIMConfig$282 ==.
	Sstm8s_clk$CLK_SWIMConfig$283 ==.
;	./libraries/src/stm8s_clk.c: 536: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
; genAnd
	and	a, #0xfe
; genPointerSet
	ld	0x50cd, a
	Sstm8s_clk$CLK_SWIMConfig$284 ==.
; genLabel
00104$:
	Sstm8s_clk$CLK_SWIMConfig$285 ==.
;	./libraries/src/stm8s_clk.c: 538: }
; genEndFunction
	Sstm8s_clk$CLK_SWIMConfig$286 ==.
	XG$CLK_SWIMConfig$0$0 ==.
	ret
	Sstm8s_clk$CLK_SWIMConfig$287 ==.
	Sstm8s_clk$CLK_ClockSecuritySystemEnable$288 ==.
;	./libraries/src/stm8s_clk.c: 547: void CLK_ClockSecuritySystemEnable(void)
; genLabel
;	-----------------------------------------
;	 function CLK_ClockSecuritySystemEnable
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CLK_ClockSecuritySystemEnable:
	Sstm8s_clk$CLK_ClockSecuritySystemEnable$289 ==.
	Sstm8s_clk$CLK_ClockSecuritySystemEnable$290 ==.
;	./libraries/src/stm8s_clk.c: 550: CLK->CSSR |= CLK_CSSR_CSSEN;
; genPointerGet
	ld	a, 0x50c8
; genOr
	or	a, #0x01
; genPointerSet
	ld	0x50c8, a
; genLabel
00101$:
	Sstm8s_clk$CLK_ClockSecuritySystemEnable$291 ==.
;	./libraries/src/stm8s_clk.c: 551: }
; genEndFunction
	Sstm8s_clk$CLK_ClockSecuritySystemEnable$292 ==.
	XG$CLK_ClockSecuritySystemEnable$0$0 ==.
	ret
	Sstm8s_clk$CLK_ClockSecuritySystemEnable$293 ==.
	Sstm8s_clk$CLK_GetSYSCLKSource$294 ==.
;	./libraries/src/stm8s_clk.c: 559: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
; genLabel
;	-----------------------------------------
;	 function CLK_GetSYSCLKSource
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CLK_GetSYSCLKSource:
	Sstm8s_clk$CLK_GetSYSCLKSource$295 ==.
	Sstm8s_clk$CLK_GetSYSCLKSource$296 ==.
;	./libraries/src/stm8s_clk.c: 561: return((CLK_Source_TypeDef)CLK->CMSR);
; genPointerGet
	ld	a, 0x50c3
; genReturn
; genLabel
00101$:
	Sstm8s_clk$CLK_GetSYSCLKSource$297 ==.
;	./libraries/src/stm8s_clk.c: 562: }
; genEndFunction
	Sstm8s_clk$CLK_GetSYSCLKSource$298 ==.
	XG$CLK_GetSYSCLKSource$0$0 ==.
	ret
	Sstm8s_clk$CLK_GetSYSCLKSource$299 ==.
	Sstm8s_clk$CLK_GetClockFreq$300 ==.
;	./libraries/src/stm8s_clk.c: 569: uint32_t CLK_GetClockFreq(void)
; genLabel
;	-----------------------------------------
;	 function CLK_GetClockFreq
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 4 bytes.
_CLK_GetClockFreq:
	Sstm8s_clk$CLK_GetClockFreq$301 ==.
	sub	sp, #4
	Sstm8s_clk$CLK_GetClockFreq$302 ==.
	Sstm8s_clk$CLK_GetClockFreq$303 ==.
;	./libraries/src/stm8s_clk.c: 576: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
; genPointerGet
	ld	a, 0x50c3
	ld	(0x04, sp), a
	Sstm8s_clk$CLK_GetClockFreq$304 ==.
;	./libraries/src/stm8s_clk.c: 578: if (clocksource == CLK_SOURCE_HSI)
; genCmpEQorNE
	ld	a, (0x04, sp)
	cp	a, #0xe1
	jrne	00120$
	jp	00121$
00120$:
	jp	00105$
00121$:
	Sstm8s_clk$CLK_GetClockFreq$305 ==.
; skipping generated iCode
	Sstm8s_clk$CLK_GetClockFreq$306 ==.
	Sstm8s_clk$CLK_GetClockFreq$307 ==.
;	./libraries/src/stm8s_clk.c: 580: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
; genPointerGet
	ld	a, 0x50c6
; genAnd
	and	a, #0x18
	Sstm8s_clk$CLK_GetClockFreq$308 ==.
;	./libraries/src/stm8s_clk.c: 581: tmp = (uint8_t)(tmp >> 3);
; genRightShiftLiteral
	srl	a
	srl	a
	srl	a
	Sstm8s_clk$CLK_GetClockFreq$309 ==.
;	./libraries/src/stm8s_clk.c: 582: presc = HSIDivFactor[tmp];
; skipping iCode since result will be rematerialized
; genPlus
	clrw	x
	ld	xl, a
	addw	x, #(_HSIDivFactor + 0)
; genPointerGet
	ld	a, (x)
	Sstm8s_clk$CLK_GetClockFreq$310 ==.
;	./libraries/src/stm8s_clk.c: 583: clockfrequency = HSI_VALUE / presc;
; genCast
; genAssign
	clrw	x
	ld	xl, a
	clrw	y
	Sstm8s_clk$CLK_GetClockFreq$311 ==.
; genIPush
	pushw	x
	Sstm8s_clk$CLK_GetClockFreq$312 ==.
	pushw	y
	Sstm8s_clk$CLK_GetClockFreq$313 ==.
; genIPush
	push	#0x00
	Sstm8s_clk$CLK_GetClockFreq$314 ==.
	push	#0x24
	Sstm8s_clk$CLK_GetClockFreq$315 ==.
	push	#0xf4
	Sstm8s_clk$CLK_GetClockFreq$316 ==.
	push	#0x00
	Sstm8s_clk$CLK_GetClockFreq$317 ==.
; genCall
	call	__divulong
	addw	sp, #8
	Sstm8s_clk$CLK_GetClockFreq$318 ==.
; genAssign
	ldw	(0x03, sp), x
; genGoto
	jp	00106$
; genLabel
00105$:
	Sstm8s_clk$CLK_GetClockFreq$319 ==.
;	./libraries/src/stm8s_clk.c: 585: else if ( clocksource == CLK_SOURCE_LSI)
; genCmpEQorNE
	ld	a, (0x04, sp)
	cp	a, #0xd2
	jrne	00123$
	jp	00124$
00123$:
	jp	00102$
00124$:
	Sstm8s_clk$CLK_GetClockFreq$320 ==.
; skipping generated iCode
	Sstm8s_clk$CLK_GetClockFreq$321 ==.
	Sstm8s_clk$CLK_GetClockFreq$322 ==.
;	./libraries/src/stm8s_clk.c: 587: clockfrequency = LSI_VALUE;
; genAssign
	ldw	x, #0xf400
	ldw	(0x03, sp), x
	ldw	y, #0x0001
	Sstm8s_clk$CLK_GetClockFreq$323 ==.
; genGoto
	jp	00106$
; genLabel
00102$:
	Sstm8s_clk$CLK_GetClockFreq$324 ==.
	Sstm8s_clk$CLK_GetClockFreq$325 ==.
;	./libraries/src/stm8s_clk.c: 591: clockfrequency = HSE_VALUE;
; genAssign
	ldw	x, #0x2400
	ldw	(0x03, sp), x
	ldw	y, #0x00f4
	Sstm8s_clk$CLK_GetClockFreq$326 ==.
; genLabel
00106$:
	Sstm8s_clk$CLK_GetClockFreq$327 ==.
;	./libraries/src/stm8s_clk.c: 594: return((uint32_t)clockfrequency);
; genReturn
	ldw	x, (0x03, sp)
; genLabel
00107$:
	Sstm8s_clk$CLK_GetClockFreq$328 ==.
;	./libraries/src/stm8s_clk.c: 595: }
; genEndFunction
	addw	sp, #4
	Sstm8s_clk$CLK_GetClockFreq$329 ==.
	Sstm8s_clk$CLK_GetClockFreq$330 ==.
	XG$CLK_GetClockFreq$0$0 ==.
	ret
	Sstm8s_clk$CLK_GetClockFreq$331 ==.
	Sstm8s_clk$CLK_AdjustHSICalibrationValue$332 ==.
;	./libraries/src/stm8s_clk.c: 604: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
; genLabel
;	-----------------------------------------
;	 function CLK_AdjustHSICalibrationValue
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CLK_AdjustHSICalibrationValue:
	Sstm8s_clk$CLK_AdjustHSICalibrationValue$333 ==.
	Sstm8s_clk$CLK_AdjustHSICalibrationValue$334 ==.
;	./libraries/src/stm8s_clk.c: 610: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
; genPointerGet
	ld	a, 0x50cc
; genAnd
	and	a, #0xf8
; genOr
	or	a, (0x03, sp)
; genPointerSet
	ld	0x50cc, a
; genLabel
00101$:
	Sstm8s_clk$CLK_AdjustHSICalibrationValue$335 ==.
;	./libraries/src/stm8s_clk.c: 611: }
; genEndFunction
	Sstm8s_clk$CLK_AdjustHSICalibrationValue$336 ==.
	XG$CLK_AdjustHSICalibrationValue$0$0 ==.
	ret
	Sstm8s_clk$CLK_AdjustHSICalibrationValue$337 ==.
	Sstm8s_clk$CLK_SYSCLKEmergencyClear$338 ==.
;	./libraries/src/stm8s_clk.c: 622: void CLK_SYSCLKEmergencyClear(void)
; genLabel
;	-----------------------------------------
;	 function CLK_SYSCLKEmergencyClear
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CLK_SYSCLKEmergencyClear:
	Sstm8s_clk$CLK_SYSCLKEmergencyClear$339 ==.
	Sstm8s_clk$CLK_SYSCLKEmergencyClear$340 ==.
;	./libraries/src/stm8s_clk.c: 624: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
; genPointerGet
	ld	a, 0x50c5
; genAnd
	and	a, #0xfe
; genPointerSet
	ld	0x50c5, a
; genLabel
00101$:
	Sstm8s_clk$CLK_SYSCLKEmergencyClear$341 ==.
;	./libraries/src/stm8s_clk.c: 625: }
; genEndFunction
	Sstm8s_clk$CLK_SYSCLKEmergencyClear$342 ==.
	XG$CLK_SYSCLKEmergencyClear$0$0 ==.
	ret
	Sstm8s_clk$CLK_SYSCLKEmergencyClear$343 ==.
	Sstm8s_clk$CLK_GetFlagStatus$344 ==.
;	./libraries/src/stm8s_clk.c: 634: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
; genLabel
;	-----------------------------------------
;	 function CLK_GetFlagStatus
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 2 bytes.
_CLK_GetFlagStatus:
	Sstm8s_clk$CLK_GetFlagStatus$345 ==.
	sub	sp, #2
	Sstm8s_clk$CLK_GetFlagStatus$346 ==.
	Sstm8s_clk$CLK_GetFlagStatus$347 ==.
;	./libraries/src/stm8s_clk.c: 644: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
; genCast
; genAssign
	ldw	x, (0x05, sp)
; genAnd
	clr	a
; genAssign
	ld	xl, a
	Sstm8s_clk$CLK_GetFlagStatus$348 ==.
;	./libraries/src/stm8s_clk.c: 647: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
; genCast
; genAssign
	ldw	(0x01, sp), x
; genCmpEQorNE
	ldw	x, (0x01, sp)
	cpw	x, #0x0100
	jrne	00144$
	jp	00145$
00144$:
	jp	00111$
00145$:
	Sstm8s_clk$CLK_GetFlagStatus$349 ==.
; skipping generated iCode
	Sstm8s_clk$CLK_GetFlagStatus$350 ==.
	Sstm8s_clk$CLK_GetFlagStatus$351 ==.
;	./libraries/src/stm8s_clk.c: 649: tmpreg = CLK->ICKR;
; genPointerGet
	ld	a, 0x50c0
	Sstm8s_clk$CLK_GetFlagStatus$352 ==.
; genGoto
	jp	00112$
; genLabel
00111$:
	Sstm8s_clk$CLK_GetFlagStatus$353 ==.
;	./libraries/src/stm8s_clk.c: 651: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
; genCmpEQorNE
	ldw	x, (0x01, sp)
	cpw	x, #0x0200
	jrne	00147$
	jp	00148$
00147$:
	jp	00108$
00148$:
	Sstm8s_clk$CLK_GetFlagStatus$354 ==.
; skipping generated iCode
	Sstm8s_clk$CLK_GetFlagStatus$355 ==.
	Sstm8s_clk$CLK_GetFlagStatus$356 ==.
;	./libraries/src/stm8s_clk.c: 653: tmpreg = CLK->ECKR;
; genPointerGet
	ld	a, 0x50c1
	Sstm8s_clk$CLK_GetFlagStatus$357 ==.
; genGoto
	jp	00112$
; genLabel
00108$:
	Sstm8s_clk$CLK_GetFlagStatus$358 ==.
;	./libraries/src/stm8s_clk.c: 655: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
; genCmpEQorNE
	ldw	x, (0x01, sp)
	cpw	x, #0x0300
	jrne	00150$
	jp	00151$
00150$:
	jp	00105$
00151$:
	Sstm8s_clk$CLK_GetFlagStatus$359 ==.
; skipping generated iCode
	Sstm8s_clk$CLK_GetFlagStatus$360 ==.
	Sstm8s_clk$CLK_GetFlagStatus$361 ==.
;	./libraries/src/stm8s_clk.c: 657: tmpreg = CLK->SWCR;
; genPointerGet
	ld	a, 0x50c5
	Sstm8s_clk$CLK_GetFlagStatus$362 ==.
; genGoto
	jp	00112$
; genLabel
00105$:
	Sstm8s_clk$CLK_GetFlagStatus$363 ==.
;	./libraries/src/stm8s_clk.c: 659: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
; genCmpEQorNE
	ldw	x, (0x01, sp)
	cpw	x, #0x0400
	jrne	00153$
	jp	00154$
00153$:
	jp	00102$
00154$:
	Sstm8s_clk$CLK_GetFlagStatus$364 ==.
; skipping generated iCode
	Sstm8s_clk$CLK_GetFlagStatus$365 ==.
	Sstm8s_clk$CLK_GetFlagStatus$366 ==.
;	./libraries/src/stm8s_clk.c: 661: tmpreg = CLK->CSSR;
; genPointerGet
	ld	a, 0x50c8
	Sstm8s_clk$CLK_GetFlagStatus$367 ==.
; genGoto
	jp	00112$
; genLabel
00102$:
	Sstm8s_clk$CLK_GetFlagStatus$368 ==.
	Sstm8s_clk$CLK_GetFlagStatus$369 ==.
;	./libraries/src/stm8s_clk.c: 665: tmpreg = CLK->CCOR;
; genPointerGet
	ld	a, 0x50c9
	Sstm8s_clk$CLK_GetFlagStatus$370 ==.
; genLabel
00112$:
	Sstm8s_clk$CLK_GetFlagStatus$371 ==.
;	./libraries/src/stm8s_clk.c: 668: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
; genCast
; genAssign
	push	a
	Sstm8s_clk$CLK_GetFlagStatus$372 ==.
	ld	a, (0x07, sp)
	ld	(0x03, sp), a
	pop	a
	Sstm8s_clk$CLK_GetFlagStatus$373 ==.
; genAnd
	and	a, (0x02, sp)
; genIfx
	tnz	a
	jrne	00155$
	jp	00114$
00155$:
	Sstm8s_clk$CLK_GetFlagStatus$374 ==.
	Sstm8s_clk$CLK_GetFlagStatus$375 ==.
;	./libraries/src/stm8s_clk.c: 670: bitstatus = SET;
; genAssign
	ld	a, #0x01
	Sstm8s_clk$CLK_GetFlagStatus$376 ==.
; genGoto
	jp	00115$
; genLabel
00114$:
	Sstm8s_clk$CLK_GetFlagStatus$377 ==.
	Sstm8s_clk$CLK_GetFlagStatus$378 ==.
;	./libraries/src/stm8s_clk.c: 674: bitstatus = RESET;
; genAssign
	clr	a
	Sstm8s_clk$CLK_GetFlagStatus$379 ==.
; genLabel
00115$:
	Sstm8s_clk$CLK_GetFlagStatus$380 ==.
;	./libraries/src/stm8s_clk.c: 678: return((FlagStatus)bitstatus);
; genReturn
; genLabel
00116$:
	Sstm8s_clk$CLK_GetFlagStatus$381 ==.
;	./libraries/src/stm8s_clk.c: 679: }
; genEndFunction
	addw	sp, #2
	Sstm8s_clk$CLK_GetFlagStatus$382 ==.
	Sstm8s_clk$CLK_GetFlagStatus$383 ==.
	XG$CLK_GetFlagStatus$0$0 ==.
	ret
	Sstm8s_clk$CLK_GetFlagStatus$384 ==.
	Sstm8s_clk$CLK_GetITStatus$385 ==.
;	./libraries/src/stm8s_clk.c: 687: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
; genLabel
;	-----------------------------------------
;	 function CLK_GetITStatus
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CLK_GetITStatus:
	Sstm8s_clk$CLK_GetITStatus$386 ==.
	Sstm8s_clk$CLK_GetITStatus$387 ==.
;	./libraries/src/stm8s_clk.c: 694: if (CLK_IT == CLK_IT_SWIF)
; genCmpEQorNE
	ld	a, (0x03, sp)
	cp	a, #0x1c
	jrne	00128$
	jp	00129$
00128$:
	jp	00108$
00129$:
	Sstm8s_clk$CLK_GetITStatus$388 ==.
; skipping generated iCode
	Sstm8s_clk$CLK_GetITStatus$389 ==.
	Sstm8s_clk$CLK_GetITStatus$390 ==.
;	./libraries/src/stm8s_clk.c: 697: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
; genPointerGet
	ld	a, 0x50c5
; genAnd
	and	a, (0x03, sp)
; genCmpEQorNE
	cp	a, #0x0c
	jrne	00131$
	jp	00132$
00131$:
	jp	00102$
00132$:
	Sstm8s_clk$CLK_GetITStatus$391 ==.
; skipping generated iCode
	Sstm8s_clk$CLK_GetITStatus$392 ==.
	Sstm8s_clk$CLK_GetITStatus$393 ==.
;	./libraries/src/stm8s_clk.c: 699: bitstatus = SET;
; genAssign
	ld	a, #0x01
	Sstm8s_clk$CLK_GetITStatus$394 ==.
; genGoto
	jp	00109$
; genLabel
00102$:
	Sstm8s_clk$CLK_GetITStatus$395 ==.
	Sstm8s_clk$CLK_GetITStatus$396 ==.
;	./libraries/src/stm8s_clk.c: 703: bitstatus = RESET;
; genAssign
	clr	a
	Sstm8s_clk$CLK_GetITStatus$397 ==.
; genGoto
	jp	00109$
; genLabel
00108$:
	Sstm8s_clk$CLK_GetITStatus$398 ==.
	Sstm8s_clk$CLK_GetITStatus$399 ==.
;	./libraries/src/stm8s_clk.c: 709: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
; genPointerGet
	ld	a, 0x50c8
; genAnd
	and	a, (0x03, sp)
; genCmpEQorNE
	cp	a, #0x0c
	jrne	00134$
	jp	00135$
00134$:
	jp	00105$
00135$:
	Sstm8s_clk$CLK_GetITStatus$400 ==.
; skipping generated iCode
	Sstm8s_clk$CLK_GetITStatus$401 ==.
	Sstm8s_clk$CLK_GetITStatus$402 ==.
;	./libraries/src/stm8s_clk.c: 711: bitstatus = SET;
; genAssign
	ld	a, #0x01
	Sstm8s_clk$CLK_GetITStatus$403 ==.
; genGoto
	jp	00109$
; genLabel
00105$:
	Sstm8s_clk$CLK_GetITStatus$404 ==.
	Sstm8s_clk$CLK_GetITStatus$405 ==.
;	./libraries/src/stm8s_clk.c: 715: bitstatus = RESET;
; genAssign
	clr	a
	Sstm8s_clk$CLK_GetITStatus$406 ==.
; genLabel
00109$:
	Sstm8s_clk$CLK_GetITStatus$407 ==.
;	./libraries/src/stm8s_clk.c: 720: return bitstatus;
; genReturn
; genLabel
00110$:
	Sstm8s_clk$CLK_GetITStatus$408 ==.
;	./libraries/src/stm8s_clk.c: 721: }
; genEndFunction
	Sstm8s_clk$CLK_GetITStatus$409 ==.
	XG$CLK_GetITStatus$0$0 ==.
	ret
	Sstm8s_clk$CLK_GetITStatus$410 ==.
	Sstm8s_clk$CLK_ClearITPendingBit$411 ==.
;	./libraries/src/stm8s_clk.c: 729: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
; genLabel
;	-----------------------------------------
;	 function CLK_ClearITPendingBit
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CLK_ClearITPendingBit:
	Sstm8s_clk$CLK_ClearITPendingBit$412 ==.
	Sstm8s_clk$CLK_ClearITPendingBit$413 ==.
;	./libraries/src/stm8s_clk.c: 734: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
; genCmpEQorNE
	ld	a, (0x03, sp)
	cp	a, #0x0c
	jrne	00112$
	jp	00113$
00112$:
	jp	00102$
00113$:
	Sstm8s_clk$CLK_ClearITPendingBit$414 ==.
; skipping generated iCode
	Sstm8s_clk$CLK_ClearITPendingBit$415 ==.
	Sstm8s_clk$CLK_ClearITPendingBit$416 ==.
;	./libraries/src/stm8s_clk.c: 737: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
; genPointerGet
	ld	a, 0x50c8
; genAnd
	and	a, #0xf7
; genPointerSet
	ld	0x50c8, a
	Sstm8s_clk$CLK_ClearITPendingBit$417 ==.
; genGoto
	jp	00104$
; genLabel
00102$:
	Sstm8s_clk$CLK_ClearITPendingBit$418 ==.
	Sstm8s_clk$CLK_ClearITPendingBit$419 ==.
;	./libraries/src/stm8s_clk.c: 742: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
; genPointerGet
	ld	a, 0x50c5
; genAnd
	and	a, #0xf7
; genPointerSet
	ld	0x50c5, a
	Sstm8s_clk$CLK_ClearITPendingBit$420 ==.
; genLabel
00104$:
	Sstm8s_clk$CLK_ClearITPendingBit$421 ==.
;	./libraries/src/stm8s_clk.c: 745: }
; genEndFunction
	Sstm8s_clk$CLK_ClearITPendingBit$422 ==.
	XG$CLK_ClearITPendingBit$0$0 ==.
	ret
	Sstm8s_clk$CLK_ClearITPendingBit$423 ==.
	.area CODE
	.area CONST
G$HSIDivFactor$0_0$0 == .
_HSIDivFactor:
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
G$CLKPrescTable$0_0$0 == .
_CLKPrescTable:
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x28	; 40
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
	.ascii "./libraries/src/stm8s_clk.c"
	.db	0
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.db	0
Ldebug_line_stmt:
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_DeInit$0)
	.db	3
	.sleb128	71
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_DeInit$2-Sstm8s_clk$CLK_DeInit$0
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_DeInit$3-Sstm8s_clk$CLK_DeInit$2
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_DeInit$4-Sstm8s_clk$CLK_DeInit$3
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_DeInit$5-Sstm8s_clk$CLK_DeInit$4
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_DeInit$6-Sstm8s_clk$CLK_DeInit$5
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_DeInit$7-Sstm8s_clk$CLK_DeInit$6
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_DeInit$8-Sstm8s_clk$CLK_DeInit$7
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_DeInit$9-Sstm8s_clk$CLK_DeInit$8
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_DeInit$10-Sstm8s_clk$CLK_DeInit$9
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_DeInit$11-Sstm8s_clk$CLK_DeInit$10
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_DeInit$12-Sstm8s_clk$CLK_DeInit$11
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_DeInit$13-Sstm8s_clk$CLK_DeInit$12
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_DeInit$14-Sstm8s_clk$CLK_DeInit$13
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_DeInit$15-Sstm8s_clk$CLK_DeInit$14
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_DeInit$16-Sstm8s_clk$CLK_DeInit$15
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_FastHaltWakeUpCmd$18)
	.db	3
	.sleb128	98
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_FastHaltWakeUpCmd$20-Sstm8s_clk$CLK_FastHaltWakeUpCmd$18
	.db	3
	.sleb128	8
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_FastHaltWakeUpCmd$21-Sstm8s_clk$CLK_FastHaltWakeUpCmd$20
	.db	3
	.sleb128	-3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_FastHaltWakeUpCmd$23-Sstm8s_clk$CLK_FastHaltWakeUpCmd$21
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_FastHaltWakeUpCmd$26-Sstm8s_clk$CLK_FastHaltWakeUpCmd$23
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_FastHaltWakeUpCmd$28-Sstm8s_clk$CLK_FastHaltWakeUpCmd$26
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_FastHaltWakeUpCmd$29-Sstm8s_clk$CLK_FastHaltWakeUpCmd$28
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_HSECmd$31)
	.db	3
	.sleb128	120
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_HSECmd$33-Sstm8s_clk$CLK_HSECmd$31
	.db	3
	.sleb128	8
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_HSECmd$34-Sstm8s_clk$CLK_HSECmd$33
	.db	3
	.sleb128	-3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_HSECmd$36-Sstm8s_clk$CLK_HSECmd$34
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_HSECmd$39-Sstm8s_clk$CLK_HSECmd$36
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_HSECmd$41-Sstm8s_clk$CLK_HSECmd$39
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_HSECmd$42-Sstm8s_clk$CLK_HSECmd$41
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_HSICmd$44)
	.db	3
	.sleb128	142
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_HSICmd$46-Sstm8s_clk$CLK_HSICmd$44
	.db	3
	.sleb128	8
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_HSICmd$47-Sstm8s_clk$CLK_HSICmd$46
	.db	3
	.sleb128	-3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_HSICmd$49-Sstm8s_clk$CLK_HSICmd$47
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_HSICmd$52-Sstm8s_clk$CLK_HSICmd$49
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_HSICmd$54-Sstm8s_clk$CLK_HSICmd$52
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_HSICmd$55-Sstm8s_clk$CLK_HSICmd$54
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_LSICmd$57)
	.db	3
	.sleb128	165
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_LSICmd$59-Sstm8s_clk$CLK_LSICmd$57
	.db	3
	.sleb128	8
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_LSICmd$60-Sstm8s_clk$CLK_LSICmd$59
	.db	3
	.sleb128	-3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_LSICmd$62-Sstm8s_clk$CLK_LSICmd$60
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_LSICmd$65-Sstm8s_clk$CLK_LSICmd$62
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_LSICmd$67-Sstm8s_clk$CLK_LSICmd$65
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_LSICmd$68-Sstm8s_clk$CLK_LSICmd$67
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_CCOCmd$70)
	.db	3
	.sleb128	188
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_CCOCmd$72-Sstm8s_clk$CLK_CCOCmd$70
	.db	3
	.sleb128	8
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_CCOCmd$73-Sstm8s_clk$CLK_CCOCmd$72
	.db	3
	.sleb128	-3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_CCOCmd$75-Sstm8s_clk$CLK_CCOCmd$73
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_CCOCmd$78-Sstm8s_clk$CLK_CCOCmd$75
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_CCOCmd$80-Sstm8s_clk$CLK_CCOCmd$78
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_CCOCmd$81-Sstm8s_clk$CLK_CCOCmd$80
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchCmd$83)
	.db	3
	.sleb128	212
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchCmd$85-Sstm8s_clk$CLK_ClockSwitchCmd$83
	.db	3
	.sleb128	8
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchCmd$86-Sstm8s_clk$CLK_ClockSwitchCmd$85
	.db	3
	.sleb128	-3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchCmd$88-Sstm8s_clk$CLK_ClockSwitchCmd$86
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchCmd$91-Sstm8s_clk$CLK_ClockSwitchCmd$88
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchCmd$93-Sstm8s_clk$CLK_ClockSwitchCmd$91
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_ClockSwitchCmd$94-Sstm8s_clk$CLK_ClockSwitchCmd$93
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$96)
	.db	3
	.sleb128	237
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$98-Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$96
	.db	3
	.sleb128	8
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$99-Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$98
	.db	3
	.sleb128	-3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$101-Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$99
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$104-Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$101
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$106-Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$104
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$107-Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$106
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$109)
	.db	3
	.sleb128	262
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_PeripheralClockConfig$112-Sstm8s_clk$CLK_PeripheralClockConfig$109
	.db	3
	.sleb128	11
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_PeripheralClockConfig$115-Sstm8s_clk$CLK_PeripheralClockConfig$112
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_PeripheralClockConfig$116-Sstm8s_clk$CLK_PeripheralClockConfig$115
	.db	3
	.sleb128	-10
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_PeripheralClockConfig$117-Sstm8s_clk$CLK_PeripheralClockConfig$116
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_PeripheralClockConfig$119-Sstm8s_clk$CLK_PeripheralClockConfig$117
	.db	3
	.sleb128	-3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_PeripheralClockConfig$121-Sstm8s_clk$CLK_PeripheralClockConfig$119
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_PeripheralClockConfig$124-Sstm8s_clk$CLK_PeripheralClockConfig$121
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_PeripheralClockConfig$126-Sstm8s_clk$CLK_PeripheralClockConfig$124
	.db	3
	.sleb128	8
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_PeripheralClockConfig$128-Sstm8s_clk$CLK_PeripheralClockConfig$126
	.db	3
	.sleb128	-3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_PeripheralClockConfig$130-Sstm8s_clk$CLK_PeripheralClockConfig$128
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_PeripheralClockConfig$133-Sstm8s_clk$CLK_PeripheralClockConfig$130
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_PeripheralClockConfig$135-Sstm8s_clk$CLK_PeripheralClockConfig$133
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_PeripheralClockConfig$137-Sstm8s_clk$CLK_PeripheralClockConfig$135
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$139)
	.db	3
	.sleb128	308
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$141-Sstm8s_clk$CLK_ClockSwitchConfig$139
	.db	3
	.sleb128	13
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$142-Sstm8s_clk$CLK_ClockSwitchConfig$141
	.db	3
	.sleb128	6
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$143-Sstm8s_clk$CLK_ClockSwitchConfig$142
	.db	3
	.sleb128	-3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$148-Sstm8s_clk$CLK_ClockSwitchConfig$143
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$150-Sstm8s_clk$CLK_ClockSwitchConfig$148
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$152-Sstm8s_clk$CLK_ClockSwitchConfig$150
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$155-Sstm8s_clk$CLK_ClockSwitchConfig$152
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$157-Sstm8s_clk$CLK_ClockSwitchConfig$155
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$159-Sstm8s_clk$CLK_ClockSwitchConfig$157
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$161-Sstm8s_clk$CLK_ClockSwitchConfig$159
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$163-Sstm8s_clk$CLK_ClockSwitchConfig$161
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$165-Sstm8s_clk$CLK_ClockSwitchConfig$163
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$168-Sstm8s_clk$CLK_ClockSwitchConfig$165
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$171-Sstm8s_clk$CLK_ClockSwitchConfig$168
	.db	3
	.sleb128	6
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$173-Sstm8s_clk$CLK_ClockSwitchConfig$171
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$176-Sstm8s_clk$CLK_ClockSwitchConfig$173
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$178-Sstm8s_clk$CLK_ClockSwitchConfig$176
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$180-Sstm8s_clk$CLK_ClockSwitchConfig$178
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$182-Sstm8s_clk$CLK_ClockSwitchConfig$180
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$184-Sstm8s_clk$CLK_ClockSwitchConfig$182
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$186-Sstm8s_clk$CLK_ClockSwitchConfig$184
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$187-Sstm8s_clk$CLK_ClockSwitchConfig$186
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$190-Sstm8s_clk$CLK_ClockSwitchConfig$187
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$192-Sstm8s_clk$CLK_ClockSwitchConfig$190
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$194-Sstm8s_clk$CLK_ClockSwitchConfig$192
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$197-Sstm8s_clk$CLK_ClockSwitchConfig$194
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$199-Sstm8s_clk$CLK_ClockSwitchConfig$197
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$202-Sstm8s_clk$CLK_ClockSwitchConfig$199
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$204-Sstm8s_clk$CLK_ClockSwitchConfig$202
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$207-Sstm8s_clk$CLK_ClockSwitchConfig$204
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$209-Sstm8s_clk$CLK_ClockSwitchConfig$207
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSwitchConfig$210-Sstm8s_clk$CLK_ClockSwitchConfig$209
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_ClockSwitchConfig$211-Sstm8s_clk$CLK_ClockSwitchConfig$210
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_HSIPrescalerConfig$213)
	.db	3
	.sleb128	414
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_HSIPrescalerConfig$215-Sstm8s_clk$CLK_HSIPrescalerConfig$213
	.db	3
	.sleb128	6
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_HSIPrescalerConfig$216-Sstm8s_clk$CLK_HSIPrescalerConfig$215
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_HSIPrescalerConfig$217-Sstm8s_clk$CLK_HSIPrescalerConfig$216
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_HSIPrescalerConfig$218-Sstm8s_clk$CLK_HSIPrescalerConfig$217
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_CCOConfig$220)
	.db	3
	.sleb128	435
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_CCOConfig$222-Sstm8s_clk$CLK_CCOConfig$220
	.db	3
	.sleb128	6
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_CCOConfig$223-Sstm8s_clk$CLK_CCOConfig$222
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_CCOConfig$224-Sstm8s_clk$CLK_CCOConfig$223
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_CCOConfig$225-Sstm8s_clk$CLK_CCOConfig$224
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_CCOConfig$226-Sstm8s_clk$CLK_CCOConfig$225
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_ITConfig$228)
	.db	3
	.sleb128	458
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ITConfig$231-Sstm8s_clk$CLK_ITConfig$228
	.db	3
	.sleb128	8
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ITConfig$234-Sstm8s_clk$CLK_ITConfig$231
	.db	3
	.sleb128	-2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ITConfig$236-Sstm8s_clk$CLK_ITConfig$234
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ITConfig$238-Sstm8s_clk$CLK_ITConfig$236
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ITConfig$239-Sstm8s_clk$CLK_ITConfig$238
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ITConfig$240-Sstm8s_clk$CLK_ITConfig$239
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ITConfig$241-Sstm8s_clk$CLK_ITConfig$240
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ITConfig$242-Sstm8s_clk$CLK_ITConfig$241
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ITConfig$244-Sstm8s_clk$CLK_ITConfig$242
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ITConfig$246-Sstm8s_clk$CLK_ITConfig$244
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ITConfig$248-Sstm8s_clk$CLK_ITConfig$246
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ITConfig$249-Sstm8s_clk$CLK_ITConfig$248
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ITConfig$250-Sstm8s_clk$CLK_ITConfig$249
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ITConfig$251-Sstm8s_clk$CLK_ITConfig$250
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ITConfig$253-Sstm8s_clk$CLK_ITConfig$251
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ITConfig$254-Sstm8s_clk$CLK_ITConfig$253
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_ITConfig$256-Sstm8s_clk$CLK_ITConfig$254
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_SYSCLKConfig$258)
	.db	3
	.sleb128	499
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_SYSCLKConfig$261-Sstm8s_clk$CLK_SYSCLKConfig$258
	.db	3
	.sleb128	7
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_SYSCLKConfig$262-Sstm8s_clk$CLK_SYSCLKConfig$261
	.db	3
	.sleb128	-2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_SYSCLKConfig$264-Sstm8s_clk$CLK_SYSCLKConfig$262
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_SYSCLKConfig$265-Sstm8s_clk$CLK_SYSCLKConfig$264
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_SYSCLKConfig$268-Sstm8s_clk$CLK_SYSCLKConfig$265
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_SYSCLKConfig$269-Sstm8s_clk$CLK_SYSCLKConfig$268
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_SYSCLKConfig$271-Sstm8s_clk$CLK_SYSCLKConfig$269
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_SYSCLKConfig$273-Sstm8s_clk$CLK_SYSCLKConfig$271
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_SWIMConfig$275)
	.db	3
	.sleb128	522
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_SWIMConfig$277-Sstm8s_clk$CLK_SWIMConfig$275
	.db	3
	.sleb128	8
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_SWIMConfig$278-Sstm8s_clk$CLK_SWIMConfig$277
	.db	3
	.sleb128	-3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_SWIMConfig$280-Sstm8s_clk$CLK_SWIMConfig$278
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_SWIMConfig$283-Sstm8s_clk$CLK_SWIMConfig$280
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_SWIMConfig$285-Sstm8s_clk$CLK_SWIMConfig$283
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_SWIMConfig$286-Sstm8s_clk$CLK_SWIMConfig$285
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_ClockSecuritySystemEnable$288)
	.db	3
	.sleb128	546
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSecuritySystemEnable$290-Sstm8s_clk$CLK_ClockSecuritySystemEnable$288
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClockSecuritySystemEnable$291-Sstm8s_clk$CLK_ClockSecuritySystemEnable$290
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_ClockSecuritySystemEnable$292-Sstm8s_clk$CLK_ClockSecuritySystemEnable$291
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_GetSYSCLKSource$294)
	.db	3
	.sleb128	558
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetSYSCLKSource$296-Sstm8s_clk$CLK_GetSYSCLKSource$294
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetSYSCLKSource$297-Sstm8s_clk$CLK_GetSYSCLKSource$296
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_GetSYSCLKSource$298-Sstm8s_clk$CLK_GetSYSCLKSource$297
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$300)
	.db	3
	.sleb128	568
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetClockFreq$303-Sstm8s_clk$CLK_GetClockFreq$300
	.db	3
	.sleb128	7
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetClockFreq$304-Sstm8s_clk$CLK_GetClockFreq$303
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetClockFreq$307-Sstm8s_clk$CLK_GetClockFreq$304
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetClockFreq$308-Sstm8s_clk$CLK_GetClockFreq$307
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetClockFreq$309-Sstm8s_clk$CLK_GetClockFreq$308
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetClockFreq$310-Sstm8s_clk$CLK_GetClockFreq$309
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetClockFreq$319-Sstm8s_clk$CLK_GetClockFreq$310
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetClockFreq$322-Sstm8s_clk$CLK_GetClockFreq$319
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetClockFreq$325-Sstm8s_clk$CLK_GetClockFreq$322
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetClockFreq$327-Sstm8s_clk$CLK_GetClockFreq$325
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetClockFreq$328-Sstm8s_clk$CLK_GetClockFreq$327
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_GetClockFreq$330-Sstm8s_clk$CLK_GetClockFreq$328
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_AdjustHSICalibrationValue$332)
	.db	3
	.sleb128	603
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_AdjustHSICalibrationValue$334-Sstm8s_clk$CLK_AdjustHSICalibrationValue$332
	.db	3
	.sleb128	6
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_AdjustHSICalibrationValue$335-Sstm8s_clk$CLK_AdjustHSICalibrationValue$334
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_AdjustHSICalibrationValue$336-Sstm8s_clk$CLK_AdjustHSICalibrationValue$335
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_SYSCLKEmergencyClear$338)
	.db	3
	.sleb128	621
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_SYSCLKEmergencyClear$340-Sstm8s_clk$CLK_SYSCLKEmergencyClear$338
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_SYSCLKEmergencyClear$341-Sstm8s_clk$CLK_SYSCLKEmergencyClear$340
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_SYSCLKEmergencyClear$342-Sstm8s_clk$CLK_SYSCLKEmergencyClear$341
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$344)
	.db	3
	.sleb128	633
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetFlagStatus$347-Sstm8s_clk$CLK_GetFlagStatus$344
	.db	3
	.sleb128	10
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetFlagStatus$348-Sstm8s_clk$CLK_GetFlagStatus$347
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetFlagStatus$351-Sstm8s_clk$CLK_GetFlagStatus$348
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetFlagStatus$353-Sstm8s_clk$CLK_GetFlagStatus$351
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetFlagStatus$356-Sstm8s_clk$CLK_GetFlagStatus$353
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetFlagStatus$358-Sstm8s_clk$CLK_GetFlagStatus$356
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetFlagStatus$361-Sstm8s_clk$CLK_GetFlagStatus$358
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetFlagStatus$363-Sstm8s_clk$CLK_GetFlagStatus$361
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetFlagStatus$366-Sstm8s_clk$CLK_GetFlagStatus$363
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetFlagStatus$369-Sstm8s_clk$CLK_GetFlagStatus$366
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetFlagStatus$371-Sstm8s_clk$CLK_GetFlagStatus$369
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetFlagStatus$375-Sstm8s_clk$CLK_GetFlagStatus$371
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetFlagStatus$378-Sstm8s_clk$CLK_GetFlagStatus$375
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetFlagStatus$380-Sstm8s_clk$CLK_GetFlagStatus$378
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetFlagStatus$381-Sstm8s_clk$CLK_GetFlagStatus$380
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_GetFlagStatus$383-Sstm8s_clk$CLK_GetFlagStatus$381
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$385)
	.db	3
	.sleb128	686
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetITStatus$387-Sstm8s_clk$CLK_GetITStatus$385
	.db	3
	.sleb128	7
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetITStatus$390-Sstm8s_clk$CLK_GetITStatus$387
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetITStatus$393-Sstm8s_clk$CLK_GetITStatus$390
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetITStatus$396-Sstm8s_clk$CLK_GetITStatus$393
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetITStatus$399-Sstm8s_clk$CLK_GetITStatus$396
	.db	3
	.sleb128	6
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetITStatus$402-Sstm8s_clk$CLK_GetITStatus$399
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetITStatus$405-Sstm8s_clk$CLK_GetITStatus$402
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetITStatus$407-Sstm8s_clk$CLK_GetITStatus$405
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_GetITStatus$408-Sstm8s_clk$CLK_GetITStatus$407
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_GetITStatus$409-Sstm8s_clk$CLK_GetITStatus$408
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_clk$CLK_ClearITPendingBit$411)
	.db	3
	.sleb128	728
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClearITPendingBit$413-Sstm8s_clk$CLK_ClearITPendingBit$411
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClearITPendingBit$416-Sstm8s_clk$CLK_ClearITPendingBit$413
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClearITPendingBit$419-Sstm8s_clk$CLK_ClearITPendingBit$416
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_clk$CLK_ClearITPendingBit$421-Sstm8s_clk$CLK_ClearITPendingBit$419
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	1+Sstm8s_clk$CLK_ClearITPendingBit$422-Sstm8s_clk$CLK_ClearITPendingBit$421
	.db	0
	.uleb128	1
	.db	1
Ldebug_line_end:

	.area .debug_loc (NOLOAD)
Ldebug_loc_start:
	.dw	0,(Sstm8s_clk$CLK_ClearITPendingBit$414)
	.dw	0,(Sstm8s_clk$CLK_ClearITPendingBit$423)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_clk$CLK_ClearITPendingBit$412)
	.dw	0,(Sstm8s_clk$CLK_ClearITPendingBit$414)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$400)
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$410)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$391)
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$400)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$388)
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$391)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$386)
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$388)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$382)
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$384)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$373)
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$382)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$372)
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$373)
	.dw	2
	.db	120
	.sleb128	4
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$364)
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$372)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$359)
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$364)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$354)
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$359)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$349)
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$354)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$346)
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$349)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$345)
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$346)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_SYSCLKEmergencyClear$339)
	.dw	0,(Sstm8s_clk$CLK_SYSCLKEmergencyClear$343)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_AdjustHSICalibrationValue$333)
	.dw	0,(Sstm8s_clk$CLK_AdjustHSICalibrationValue$337)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$329)
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$331)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$320)
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$329)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$318)
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$320)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$317)
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$318)
	.dw	2
	.db	120
	.sleb128	13
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$316)
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$317)
	.dw	2
	.db	120
	.sleb128	12
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$315)
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$316)
	.dw	2
	.db	120
	.sleb128	11
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$314)
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$315)
	.dw	2
	.db	120
	.sleb128	10
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$313)
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$314)
	.dw	2
	.db	120
	.sleb128	9
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$312)
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$313)
	.dw	2
	.db	120
	.sleb128	7
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$305)
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$312)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$302)
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$305)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$301)
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$302)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_GetSYSCLKSource$295)
	.dw	0,(Sstm8s_clk$CLK_GetSYSCLKSource$299)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_ClockSecuritySystemEnable$289)
	.dw	0,(Sstm8s_clk$CLK_ClockSecuritySystemEnable$293)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_SWIMConfig$276)
	.dw	0,(Sstm8s_clk$CLK_SWIMConfig$287)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_SYSCLKConfig$272)
	.dw	0,(Sstm8s_clk$CLK_SYSCLKConfig$274)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_clk$CLK_SYSCLKConfig$260)
	.dw	0,(Sstm8s_clk$CLK_SYSCLKConfig$272)
	.dw	2
	.db	120
	.sleb128	2
	.dw	0,(Sstm8s_clk$CLK_SYSCLKConfig$259)
	.dw	0,(Sstm8s_clk$CLK_SYSCLKConfig$260)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_ITConfig$255)
	.dw	0,(Sstm8s_clk$CLK_ITConfig$257)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_clk$CLK_ITConfig$233)
	.dw	0,(Sstm8s_clk$CLK_ITConfig$255)
	.dw	2
	.db	120
	.sleb128	2
	.dw	0,(Sstm8s_clk$CLK_ITConfig$232)
	.dw	0,(Sstm8s_clk$CLK_ITConfig$233)
	.dw	2
	.db	120
	.sleb128	2
	.dw	0,(Sstm8s_clk$CLK_ITConfig$230)
	.dw	0,(Sstm8s_clk$CLK_ITConfig$232)
	.dw	2
	.db	120
	.sleb128	2
	.dw	0,(Sstm8s_clk$CLK_ITConfig$229)
	.dw	0,(Sstm8s_clk$CLK_ITConfig$230)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_CCOConfig$221)
	.dw	0,(Sstm8s_clk$CLK_CCOConfig$227)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_HSIPrescalerConfig$214)
	.dw	0,(Sstm8s_clk$CLK_HSIPrescalerConfig$219)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$205)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$212)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$200)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$205)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$195)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$200)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$146)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$195)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$145)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$146)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$144)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$145)
	.dw	2
	.db	120
	.sleb128	2
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$140)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$144)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$136)
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$138)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$114)
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$136)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$113)
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$114)
	.dw	2
	.db	120
	.sleb128	4
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$111)
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$113)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$110)
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$111)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$97)
	.dw	0,(Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$108)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchCmd$84)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchCmd$95)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_CCOCmd$71)
	.dw	0,(Sstm8s_clk$CLK_CCOCmd$82)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_LSICmd$58)
	.dw	0,(Sstm8s_clk$CLK_LSICmd$69)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_HSICmd$45)
	.dw	0,(Sstm8s_clk$CLK_HSICmd$56)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_HSECmd$32)
	.dw	0,(Sstm8s_clk$CLK_HSECmd$43)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_FastHaltWakeUpCmd$19)
	.dw	0,(Sstm8s_clk$CLK_FastHaltWakeUpCmd$30)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_clk$CLK_DeInit$1)
	.dw	0,(Sstm8s_clk$CLK_DeInit$17)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0

	.area .debug_abbrev (NOLOAD)
Ldebug_abbrev:
	.uleb128	12
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
	.uleb128	16
	.uleb128	52
	.db	0
	.uleb128	2
	.uleb128	10
	.uleb128	3
	.uleb128	8
	.uleb128	63
	.uleb128	12
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	4
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
	.uleb128	14
	.uleb128	1
	.db	1
	.uleb128	1
	.uleb128	19
	.uleb128	11
	.uleb128	11
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	3
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
	.uleb128	11
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
	.uleb128	9
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
	.uleb128	13
	.uleb128	38
	.db	0
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	8
	.uleb128	11
	.db	1
	.uleb128	17
	.uleb128	1
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
	.uleb128	5
	.uleb128	11
	.db	0
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	0
	.uleb128	0
	.uleb128	7
	.uleb128	11
	.db	1
	.uleb128	1
	.uleb128	19
	.uleb128	17
	.uleb128	1
	.uleb128	0
	.uleb128	0
	.uleb128	2
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
	.uleb128	10
	.uleb128	11
	.db	1
	.uleb128	1
	.uleb128	19
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	0
	.uleb128	0
	.uleb128	15
	.uleb128	33
	.db	0
	.uleb128	47
	.uleb128	11
	.uleb128	0
	.uleb128	0
	.uleb128	6
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
	.ascii "./libraries/src/stm8s_clk.c"
	.db	0
	.dw	0,(Ldebug_line_start+-4)
	.db	1
	.ascii "SDCC version 4.0.2 #11645"
	.db	0
	.uleb128	2
	.ascii "CLK_DeInit"
	.db	0
	.dw	0,(_CLK_DeInit)
	.dw	0,(XG$CLK_DeInit$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+908)
	.uleb128	3
	.dw	0,172
	.ascii "CLK_FastHaltWakeUpCmd"
	.db	0
	.dw	0,(_CLK_FastHaltWakeUpCmd)
	.dw	0,(XG$CLK_FastHaltWakeUpCmd$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+888)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "NewState"
	.db	0
	.dw	0,172
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_FastHaltWakeUpCmd$22)
	.dw	0,(Sstm8s_clk$CLK_FastHaltWakeUpCmd$24)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_FastHaltWakeUpCmd$25)
	.dw	0,(Sstm8s_clk$CLK_FastHaltWakeUpCmd$27)
	.uleb128	0
	.uleb128	6
	.ascii "unsigned char"
	.db	0
	.db	1
	.db	8
	.uleb128	3
	.dw	0,254
	.ascii "CLK_HSECmd"
	.db	0
	.dw	0,(_CLK_HSECmd)
	.dw	0,(XG$CLK_HSECmd$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+868)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "NewState"
	.db	0
	.dw	0,172
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_HSECmd$35)
	.dw	0,(Sstm8s_clk$CLK_HSECmd$37)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_HSECmd$38)
	.dw	0,(Sstm8s_clk$CLK_HSECmd$40)
	.uleb128	0
	.uleb128	3
	.dw	0,319
	.ascii "CLK_HSICmd"
	.db	0
	.dw	0,(_CLK_HSICmd)
	.dw	0,(XG$CLK_HSICmd$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+848)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "NewState"
	.db	0
	.dw	0,172
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_HSICmd$48)
	.dw	0,(Sstm8s_clk$CLK_HSICmd$50)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_HSICmd$51)
	.dw	0,(Sstm8s_clk$CLK_HSICmd$53)
	.uleb128	0
	.uleb128	3
	.dw	0,384
	.ascii "CLK_LSICmd"
	.db	0
	.dw	0,(_CLK_LSICmd)
	.dw	0,(XG$CLK_LSICmd$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+828)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "NewState"
	.db	0
	.dw	0,172
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_LSICmd$61)
	.dw	0,(Sstm8s_clk$CLK_LSICmd$63)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_LSICmd$64)
	.dw	0,(Sstm8s_clk$CLK_LSICmd$66)
	.uleb128	0
	.uleb128	3
	.dw	0,449
	.ascii "CLK_CCOCmd"
	.db	0
	.dw	0,(_CLK_CCOCmd)
	.dw	0,(XG$CLK_CCOCmd$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+808)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "NewState"
	.db	0
	.dw	0,172
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_CCOCmd$74)
	.dw	0,(Sstm8s_clk$CLK_CCOCmd$76)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_CCOCmd$77)
	.dw	0,(Sstm8s_clk$CLK_CCOCmd$79)
	.uleb128	0
	.uleb128	3
	.dw	0,522
	.ascii "CLK_ClockSwitchCmd"
	.db	0
	.dw	0,(_CLK_ClockSwitchCmd)
	.dw	0,(XG$CLK_ClockSwitchCmd$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+788)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "NewState"
	.db	0
	.dw	0,172
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchCmd$87)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchCmd$89)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchCmd$90)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchCmd$92)
	.uleb128	0
	.uleb128	3
	.dw	0,604
	.ascii "CLK_SlowActiveHaltWakeUpCmd"
	.db	0
	.dw	0,(_CLK_SlowActiveHaltWakeUpCmd)
	.dw	0,(XG$CLK_SlowActiveHaltWakeUpCmd$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+768)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "NewState"
	.db	0
	.dw	0,172
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$100)
	.dw	0,(Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$102)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$103)
	.dw	0,(Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$105)
	.uleb128	0
	.uleb128	3
	.dw	0,741
	.ascii "CLK_PeripheralClockConfig"
	.db	0
	.dw	0,(_CLK_PeripheralClockConfig)
	.dw	0,(XG$CLK_PeripheralClockConfig$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+700)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "CLK_Peripheral"
	.db	0
	.dw	0,172
	.uleb128	4
	.db	2
	.db	145
	.sleb128	3
	.ascii "NewState"
	.db	0
	.dw	0,172
	.uleb128	7
	.dw	0,716
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$118)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$120)
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$122)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$123)
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$125)
	.uleb128	0
	.uleb128	8
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$127)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$129)
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$131)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$132)
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$134)
	.uleb128	0
	.uleb128	0
	.uleb128	9
	.dw	0,1087
	.ascii "CLK_ClockSwitchConfig"
	.db	0
	.dw	0,(_CLK_ClockSwitchConfig)
	.dw	0,(XG$CLK_ClockSwitchConfig$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+608)
	.dw	0,172
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "CLK_SwitchMode"
	.db	0
	.dw	0,172
	.uleb128	4
	.db	2
	.db	145
	.sleb128	3
	.ascii "CLK_NewClock"
	.db	0
	.dw	0,172
	.uleb128	4
	.db	2
	.db	145
	.sleb128	4
	.ascii "ITState"
	.db	0
	.dw	0,172
	.uleb128	4
	.db	2
	.db	145
	.sleb128	5
	.ascii "CLK_CurrentClockState"
	.db	0
	.dw	0,172
	.uleb128	10
	.dw	0,934
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$147)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$158)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$151)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$153)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$154)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$156)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$160)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$162)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$164)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$166)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$167)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$169)
	.uleb128	0
	.uleb128	10
	.dw	0,993
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$170)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$179)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$172)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$174)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$175)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$177)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$181)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$183)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$185)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$188)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$189)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$191)
	.uleb128	0
	.uleb128	7
	.dw	0,1030
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$193)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$196)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$198)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$201)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$203)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$206)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$208)
	.uleb128	0
	.uleb128	11
	.db	1
	.db	83
	.ascii "clock_master"
	.db	0
	.dw	0,172
	.uleb128	11
	.db	6
	.db	82
	.db	147
	.uleb128	1
	.db	81
	.db	147
	.uleb128	1
	.ascii "DownCounter"
	.db	0
	.dw	0,1087
	.uleb128	11
	.db	1
	.db	81
	.ascii "Swif"
	.db	0
	.dw	0,172
	.uleb128	0
	.uleb128	6
	.ascii "unsigned int"
	.db	0
	.db	2
	.db	7
	.uleb128	3
	.dw	0,1166
	.ascii "CLK_HSIPrescalerConfig"
	.db	0
	.dw	0,(_CLK_HSIPrescalerConfig)
	.dw	0,(XG$CLK_HSIPrescalerConfig$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+588)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "HSIPrescaler"
	.db	0
	.dw	0,172
	.uleb128	0
	.uleb128	3
	.dw	0,1215
	.ascii "CLK_CCOConfig"
	.db	0
	.dw	0,(_CLK_CCOConfig)
	.dw	0,(XG$CLK_CCOConfig$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+568)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "CLK_CCO"
	.db	0
	.dw	0,172
	.uleb128	0
	.uleb128	3
	.dw	0,1313
	.ascii "CLK_ITConfig"
	.db	0
	.dw	0,(_CLK_ITConfig)
	.dw	0,(XG$CLK_ITConfig$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+500)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "CLK_IT"
	.db	0
	.dw	0,172
	.uleb128	4
	.db	2
	.db	145
	.sleb128	3
	.ascii "NewState"
	.db	0
	.dw	0,172
	.uleb128	7
	.dw	0,1297
	.dw	0,(Sstm8s_clk$CLK_ITConfig$235)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_ITConfig$237)
	.dw	0,(Sstm8s_clk$CLK_ITConfig$243)
	.uleb128	0
	.uleb128	8
	.dw	0,(Sstm8s_clk$CLK_ITConfig$245)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_ITConfig$247)
	.dw	0,(Sstm8s_clk$CLK_ITConfig$252)
	.uleb128	0
	.uleb128	0
	.uleb128	3
	.dw	0,1389
	.ascii "CLK_SYSCLKConfig"
	.db	0
	.dw	0,(_CLK_SYSCLKConfig)
	.dw	0,(XG$CLK_SYSCLKConfig$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+456)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "CLK_Prescaler"
	.db	0
	.dw	0,172
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_SYSCLKConfig$263)
	.dw	0,(Sstm8s_clk$CLK_SYSCLKConfig$266)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_SYSCLKConfig$267)
	.dw	0,(Sstm8s_clk$CLK_SYSCLKConfig$270)
	.uleb128	0
	.uleb128	3
	.dw	0,1465
	.ascii "CLK_SWIMConfig"
	.db	0
	.dw	0,(_CLK_SWIMConfig)
	.dw	0,(XG$CLK_SWIMConfig$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+436)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "CLK_SWIMDivider"
	.db	0
	.dw	0,172
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_SWIMConfig$279)
	.dw	0,(Sstm8s_clk$CLK_SWIMConfig$281)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_SWIMConfig$282)
	.dw	0,(Sstm8s_clk$CLK_SWIMConfig$284)
	.uleb128	0
	.uleb128	2
	.ascii "CLK_ClockSecuritySystemEnable"
	.db	0
	.dw	0,(_CLK_ClockSecuritySystemEnable)
	.dw	0,(XG$CLK_ClockSecuritySystemEnable$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+416)
	.uleb128	12
	.ascii "CLK_GetSYSCLKSource"
	.db	0
	.dw	0,(_CLK_GetSYSCLKSource)
	.dw	0,(XG$CLK_GetSYSCLKSource$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+396)
	.dw	0,172
	.uleb128	6
	.ascii "unsigned long"
	.db	0
	.db	4
	.db	7
	.uleb128	9
	.dw	0,1710
	.ascii "CLK_GetClockFreq"
	.db	0
	.dw	0,(_CLK_GetClockFreq)
	.dw	0,(XG$CLK_GetClockFreq$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+244)
	.dw	0,1547
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$306)
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$311)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$321)
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$323)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$324)
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$326)
	.uleb128	11
	.db	14
	.db	84
	.db	147
	.uleb128	1
	.db	83
	.db	147
	.uleb128	1
	.db	145
	.sleb128	-2
	.db	147
	.uleb128	1
	.db	145
	.sleb128	-1
	.db	147
	.uleb128	1
	.ascii "clockfrequency"
	.db	0
	.dw	0,1547
	.uleb128	11
	.db	2
	.db	145
	.sleb128	-1
	.ascii "clocksource"
	.db	0
	.dw	0,172
	.uleb128	11
	.db	1
	.db	80
	.ascii "tmp"
	.db	0
	.dw	0,172
	.uleb128	11
	.db	1
	.db	80
	.ascii "presc"
	.db	0
	.dw	0,172
	.uleb128	0
	.uleb128	3
	.dw	0,1791
	.ascii "CLK_AdjustHSICalibrationValue"
	.db	0
	.dw	0,(_CLK_AdjustHSICalibrationValue)
	.dw	0,(XG$CLK_AdjustHSICalibrationValue$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+224)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "CLK_HSICalibrationValue"
	.db	0
	.dw	0,172
	.uleb128	0
	.uleb128	2
	.ascii "CLK_SYSCLKEmergencyClear"
	.db	0
	.dw	0,(_CLK_SYSCLKEmergencyClear)
	.dw	0,(XG$CLK_SYSCLKEmergencyClear$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+204)
	.uleb128	9
	.dw	0,2004
	.ascii "CLK_GetFlagStatus"
	.db	0
	.dw	0,(_CLK_GetFlagStatus)
	.dw	0,(XG$CLK_GetFlagStatus$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+88)
	.dw	0,172
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "CLK_FLAG"
	.db	0
	.dw	0,2004
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$350)
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$352)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$355)
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$357)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$360)
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$362)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$365)
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$367)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$368)
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$370)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$374)
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$376)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$377)
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$379)
	.uleb128	11
	.db	6
	.db	82
	.db	147
	.uleb128	1
	.db	81
	.db	147
	.uleb128	1
	.ascii "statusreg"
	.db	0
	.dw	0,1087
	.uleb128	11
	.db	1
	.db	80
	.ascii "tmpreg"
	.db	0
	.dw	0,172
	.uleb128	11
	.db	1
	.db	80
	.ascii "bitstatus"
	.db	0
	.dw	0,172
	.uleb128	0
	.uleb128	6
	.ascii "unsigned int"
	.db	0
	.db	2
	.db	7
	.uleb128	9
	.dw	0,2147
	.ascii "CLK_GetITStatus"
	.db	0
	.dw	0,(_CLK_GetITStatus)
	.dw	0,(XG$CLK_GetITStatus$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+32)
	.dw	0,172
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "CLK_IT"
	.db	0
	.dw	0,172
	.uleb128	7
	.dw	0,2101
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$389)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$392)
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$394)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$395)
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$397)
	.uleb128	0
	.uleb128	7
	.dw	0,2129
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$398)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$401)
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$403)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$404)
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$406)
	.uleb128	0
	.uleb128	11
	.db	1
	.db	80
	.ascii "bitstatus"
	.db	0
	.dw	0,172
	.uleb128	0
	.uleb128	3
	.dw	0,2221
	.ascii "CLK_ClearITPendingBit"
	.db	0
	.dw	0,(_CLK_ClearITPendingBit)
	.dw	0,(XG$CLK_ClearITPendingBit$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "CLK_IT"
	.db	0
	.dw	0,172
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_ClearITPendingBit$415)
	.dw	0,(Sstm8s_clk$CLK_ClearITPendingBit$417)
	.uleb128	5
	.dw	0,(Sstm8s_clk$CLK_ClearITPendingBit$418)
	.dw	0,(Sstm8s_clk$CLK_ClearITPendingBit$420)
	.uleb128	0
	.uleb128	13
	.dw	0,172
	.uleb128	14
	.dw	0,2239
	.db	4
	.dw	0,2221
	.uleb128	15
	.db	3
	.uleb128	0
	.uleb128	16
	.db	5
	.db	3
	.dw	0,(_HSIDivFactor)
	.ascii "HSIDivFactor"
	.db	0
	.db	1
	.dw	0,2226
	.uleb128	14
	.dw	0,2277
	.db	8
	.dw	0,2221
	.uleb128	15
	.db	7
	.uleb128	0
	.uleb128	16
	.db	5
	.db	3
	.dw	0,(_CLKPrescTable)
	.ascii "CLKPrescTable"
	.db	0
	.db	1
	.dw	0,2264
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
	.dw	0,71
	.ascii "CLK_DeInit"
	.db	0
	.dw	0,96
	.ascii "CLK_FastHaltWakeUpCmd"
	.db	0
	.dw	0,189
	.ascii "CLK_HSECmd"
	.db	0
	.dw	0,254
	.ascii "CLK_HSICmd"
	.db	0
	.dw	0,319
	.ascii "CLK_LSICmd"
	.db	0
	.dw	0,384
	.ascii "CLK_CCOCmd"
	.db	0
	.dw	0,449
	.ascii "CLK_ClockSwitchCmd"
	.db	0
	.dw	0,522
	.ascii "CLK_SlowActiveHaltWakeUpCmd"
	.db	0
	.dw	0,604
	.ascii "CLK_PeripheralClockConfig"
	.db	0
	.dw	0,741
	.ascii "CLK_ClockSwitchConfig"
	.db	0
	.dw	0,1103
	.ascii "CLK_HSIPrescalerConfig"
	.db	0
	.dw	0,1166
	.ascii "CLK_CCOConfig"
	.db	0
	.dw	0,1215
	.ascii "CLK_ITConfig"
	.db	0
	.dw	0,1313
	.ascii "CLK_SYSCLKConfig"
	.db	0
	.dw	0,1389
	.ascii "CLK_SWIMConfig"
	.db	0
	.dw	0,1465
	.ascii "CLK_ClockSecuritySystemEnable"
	.db	0
	.dw	0,1509
	.ascii "CLK_GetSYSCLKSource"
	.db	0
	.dw	0,1564
	.ascii "CLK_GetClockFreq"
	.db	0
	.dw	0,1710
	.ascii "CLK_AdjustHSICalibrationValue"
	.db	0
	.dw	0,1791
	.ascii "CLK_SYSCLKEmergencyClear"
	.db	0
	.dw	0,1830
	.ascii "CLK_GetFlagStatus"
	.db	0
	.dw	0,2020
	.ascii "CLK_GetITStatus"
	.db	0
	.dw	0,2147
	.ascii "CLK_ClearITPendingBit"
	.db	0
	.dw	0,2239
	.ascii "HSIDivFactor"
	.db	0
	.dw	0,2277
	.ascii "CLKPrescTable"
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
	.dw	0,26
	.dw	0,(Ldebug_CIE0_start-4)
	.dw	0,(Sstm8s_clk$CLK_ClearITPendingBit$412)	;initial loc
	.dw	0,Sstm8s_clk$CLK_ClearITPendingBit$423-Sstm8s_clk$CLK_ClearITPendingBit$412
	.db	1
	.dw	0,(Sstm8s_clk$CLK_ClearITPendingBit$412)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_clk$CLK_ClearITPendingBit$414)
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
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$386)	;initial loc
	.dw	0,Sstm8s_clk$CLK_GetITStatus$410-Sstm8s_clk$CLK_GetITStatus$386
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$386)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$388)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$391)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetITStatus$400)
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
	.dw	0,75
	.dw	0,(Ldebug_CIE2_start-4)
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$345)	;initial loc
	.dw	0,Sstm8s_clk$CLK_GetFlagStatus$384-Sstm8s_clk$CLK_GetFlagStatus$345
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$345)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$346)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$349)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$354)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$359)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$364)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$372)
	.db	14
	.uleb128	5
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$373)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetFlagStatus$382)
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
	.dw	0,(Sstm8s_clk$CLK_SYSCLKEmergencyClear$339)	;initial loc
	.dw	0,Sstm8s_clk$CLK_SYSCLKEmergencyClear$343-Sstm8s_clk$CLK_SYSCLKEmergencyClear$339
	.db	1
	.dw	0,(Sstm8s_clk$CLK_SYSCLKEmergencyClear$339)
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
	.dw	0,19
	.dw	0,(Ldebug_CIE4_start-4)
	.dw	0,(Sstm8s_clk$CLK_AdjustHSICalibrationValue$333)	;initial loc
	.dw	0,Sstm8s_clk$CLK_AdjustHSICalibrationValue$337-Sstm8s_clk$CLK_AdjustHSICalibrationValue$333
	.db	1
	.dw	0,(Sstm8s_clk$CLK_AdjustHSICalibrationValue$333)
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
	.dw	0,96
	.dw	0,(Ldebug_CIE5_start-4)
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$301)	;initial loc
	.dw	0,Sstm8s_clk$CLK_GetClockFreq$331-Sstm8s_clk$CLK_GetClockFreq$301
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$301)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$302)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$305)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$312)
	.db	14
	.uleb128	8
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$313)
	.db	14
	.uleb128	10
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$314)
	.db	14
	.uleb128	11
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$315)
	.db	14
	.uleb128	12
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$316)
	.db	14
	.uleb128	13
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$317)
	.db	14
	.uleb128	14
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$318)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$320)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetClockFreq$329)
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
	.dw	0,(Sstm8s_clk$CLK_GetSYSCLKSource$295)	;initial loc
	.dw	0,Sstm8s_clk$CLK_GetSYSCLKSource$299-Sstm8s_clk$CLK_GetSYSCLKSource$295
	.db	1
	.dw	0,(Sstm8s_clk$CLK_GetSYSCLKSource$295)
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
	.dw	0,(Sstm8s_clk$CLK_ClockSecuritySystemEnable$289)	;initial loc
	.dw	0,Sstm8s_clk$CLK_ClockSecuritySystemEnable$293-Sstm8s_clk$CLK_ClockSecuritySystemEnable$289
	.db	1
	.dw	0,(Sstm8s_clk$CLK_ClockSecuritySystemEnable$289)
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
	.dw	0,(Sstm8s_clk$CLK_SWIMConfig$276)	;initial loc
	.dw	0,Sstm8s_clk$CLK_SWIMConfig$287-Sstm8s_clk$CLK_SWIMConfig$276
	.db	1
	.dw	0,(Sstm8s_clk$CLK_SWIMConfig$276)
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
	.dw	0,33
	.dw	0,(Ldebug_CIE9_start-4)
	.dw	0,(Sstm8s_clk$CLK_SYSCLKConfig$259)	;initial loc
	.dw	0,Sstm8s_clk$CLK_SYSCLKConfig$274-Sstm8s_clk$CLK_SYSCLKConfig$259
	.db	1
	.dw	0,(Sstm8s_clk$CLK_SYSCLKConfig$259)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_clk$CLK_SYSCLKConfig$260)
	.db	14
	.uleb128	3
	.db	1
	.dw	0,(Sstm8s_clk$CLK_SYSCLKConfig$272)
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
	.dw	0,47
	.dw	0,(Ldebug_CIE10_start-4)
	.dw	0,(Sstm8s_clk$CLK_ITConfig$229)	;initial loc
	.dw	0,Sstm8s_clk$CLK_ITConfig$257-Sstm8s_clk$CLK_ITConfig$229
	.db	1
	.dw	0,(Sstm8s_clk$CLK_ITConfig$229)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_clk$CLK_ITConfig$230)
	.db	14
	.uleb128	3
	.db	1
	.dw	0,(Sstm8s_clk$CLK_ITConfig$232)
	.db	14
	.uleb128	3
	.db	1
	.dw	0,(Sstm8s_clk$CLK_ITConfig$233)
	.db	14
	.uleb128	3
	.db	1
	.dw	0,(Sstm8s_clk$CLK_ITConfig$255)
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
	.dw	0,19
	.dw	0,(Ldebug_CIE11_start-4)
	.dw	0,(Sstm8s_clk$CLK_CCOConfig$221)	;initial loc
	.dw	0,Sstm8s_clk$CLK_CCOConfig$227-Sstm8s_clk$CLK_CCOConfig$221
	.db	1
	.dw	0,(Sstm8s_clk$CLK_CCOConfig$221)
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
	.dw	0,19
	.dw	0,(Ldebug_CIE12_start-4)
	.dw	0,(Sstm8s_clk$CLK_HSIPrescalerConfig$214)	;initial loc
	.dw	0,Sstm8s_clk$CLK_HSIPrescalerConfig$219-Sstm8s_clk$CLK_HSIPrescalerConfig$214
	.db	1
	.dw	0,(Sstm8s_clk$CLK_HSIPrescalerConfig$214)
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
	.dw	0,61
	.dw	0,(Ldebug_CIE13_start-4)
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$140)	;initial loc
	.dw	0,Sstm8s_clk$CLK_ClockSwitchConfig$212-Sstm8s_clk$CLK_ClockSwitchConfig$140
	.db	1
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$140)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$144)
	.db	14
	.uleb128	3
	.db	1
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$145)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$146)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$195)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$200)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchConfig$205)
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
	.dw	0,47
	.dw	0,(Ldebug_CIE14_start-4)
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$110)	;initial loc
	.dw	0,Sstm8s_clk$CLK_PeripheralClockConfig$138-Sstm8s_clk$CLK_PeripheralClockConfig$110
	.db	1
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$110)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$111)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$113)
	.db	14
	.uleb128	5
	.db	1
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$114)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Sstm8s_clk$CLK_PeripheralClockConfig$136)
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
	.dw	0,(Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$97)	;initial loc
	.dw	0,Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$108-Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$97
	.db	1
	.dw	0,(Sstm8s_clk$CLK_SlowActiveHaltWakeUpCmd$97)
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
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchCmd$84)	;initial loc
	.dw	0,Sstm8s_clk$CLK_ClockSwitchCmd$95-Sstm8s_clk$CLK_ClockSwitchCmd$84
	.db	1
	.dw	0,(Sstm8s_clk$CLK_ClockSwitchCmd$84)
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
	.dw	0,(Sstm8s_clk$CLK_CCOCmd$71)	;initial loc
	.dw	0,Sstm8s_clk$CLK_CCOCmd$82-Sstm8s_clk$CLK_CCOCmd$71
	.db	1
	.dw	0,(Sstm8s_clk$CLK_CCOCmd$71)
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
	.dw	0,(Sstm8s_clk$CLK_LSICmd$58)	;initial loc
	.dw	0,Sstm8s_clk$CLK_LSICmd$69-Sstm8s_clk$CLK_LSICmd$58
	.db	1
	.dw	0,(Sstm8s_clk$CLK_LSICmd$58)
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
	.dw	0,19
	.dw	0,(Ldebug_CIE19_start-4)
	.dw	0,(Sstm8s_clk$CLK_HSICmd$45)	;initial loc
	.dw	0,Sstm8s_clk$CLK_HSICmd$56-Sstm8s_clk$CLK_HSICmd$45
	.db	1
	.dw	0,(Sstm8s_clk$CLK_HSICmd$45)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE20_end-Ldebug_CIE20_start
Ldebug_CIE20_start:
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
Ldebug_CIE20_end:
	.dw	0,19
	.dw	0,(Ldebug_CIE20_start-4)
	.dw	0,(Sstm8s_clk$CLK_HSECmd$32)	;initial loc
	.dw	0,Sstm8s_clk$CLK_HSECmd$43-Sstm8s_clk$CLK_HSECmd$32
	.db	1
	.dw	0,(Sstm8s_clk$CLK_HSECmd$32)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE21_end-Ldebug_CIE21_start
Ldebug_CIE21_start:
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
Ldebug_CIE21_end:
	.dw	0,19
	.dw	0,(Ldebug_CIE21_start-4)
	.dw	0,(Sstm8s_clk$CLK_FastHaltWakeUpCmd$19)	;initial loc
	.dw	0,Sstm8s_clk$CLK_FastHaltWakeUpCmd$30-Sstm8s_clk$CLK_FastHaltWakeUpCmd$19
	.db	1
	.dw	0,(Sstm8s_clk$CLK_FastHaltWakeUpCmd$19)
	.db	14
	.uleb128	2

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE22_end-Ldebug_CIE22_start
Ldebug_CIE22_start:
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
Ldebug_CIE22_end:
	.dw	0,19
	.dw	0,(Ldebug_CIE22_start-4)
	.dw	0,(Sstm8s_clk$CLK_DeInit$1)	;initial loc
	.dw	0,Sstm8s_clk$CLK_DeInit$17-Sstm8s_clk$CLK_DeInit$1
	.db	1
	.dw	0,(Sstm8s_clk$CLK_DeInit$1)
	.db	14
	.uleb128	2
