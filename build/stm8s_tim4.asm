;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.2 #11645 (Linux)
;--------------------------------------------------------
	.module stm8s_tim4
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM4_DeInit
	.globl _TIM4_TimeBaseInit
	.globl _TIM4_Cmd
	.globl _TIM4_ITConfig
	.globl _TIM4_UpdateDisableConfig
	.globl _TIM4_UpdateRequestConfig
	.globl _TIM4_SelectOnePulseMode
	.globl _TIM4_PrescalerConfig
	.globl _TIM4_ARRPreloadConfig
	.globl _TIM4_GenerateEvent
	.globl _TIM4_SetCounter
	.globl _TIM4_SetAutoreload
	.globl _TIM4_GetCounter
	.globl _TIM4_GetPrescaler
	.globl _TIM4_GetFlagStatus
	.globl _TIM4_ClearFlag
	.globl _TIM4_GetITStatus
	.globl _TIM4_ClearITPendingBit
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
	Sstm8s_tim4$TIM4_DeInit$0 ==.
;	./libraries/src/stm8s_tim4.c: 49: void TIM4_DeInit(void)
; genLabel
;	-----------------------------------------
;	 function TIM4_DeInit
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM4_DeInit:
	Sstm8s_tim4$TIM4_DeInit$1 ==.
	Sstm8s_tim4$TIM4_DeInit$2 ==.
;	./libraries/src/stm8s_tim4.c: 51: TIM4->CR1 = TIM4_CR1_RESET_VALUE;
; genPointerSet
	mov	0x5340+0, #0x00
	Sstm8s_tim4$TIM4_DeInit$3 ==.
;	./libraries/src/stm8s_tim4.c: 52: TIM4->IER = TIM4_IER_RESET_VALUE;
; genPointerSet
	mov	0x5343+0, #0x00
	Sstm8s_tim4$TIM4_DeInit$4 ==.
;	./libraries/src/stm8s_tim4.c: 53: TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
; genPointerSet
	mov	0x5346+0, #0x00
	Sstm8s_tim4$TIM4_DeInit$5 ==.
;	./libraries/src/stm8s_tim4.c: 54: TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
; genPointerSet
	mov	0x5347+0, #0x00
	Sstm8s_tim4$TIM4_DeInit$6 ==.
;	./libraries/src/stm8s_tim4.c: 55: TIM4->ARR = TIM4_ARR_RESET_VALUE;
; genPointerSet
	mov	0x5348+0, #0xff
	Sstm8s_tim4$TIM4_DeInit$7 ==.
;	./libraries/src/stm8s_tim4.c: 56: TIM4->SR1 = TIM4_SR1_RESET_VALUE;
; genPointerSet
	mov	0x5344+0, #0x00
; genLabel
00101$:
	Sstm8s_tim4$TIM4_DeInit$8 ==.
;	./libraries/src/stm8s_tim4.c: 57: }
; genEndFunction
	Sstm8s_tim4$TIM4_DeInit$9 ==.
	XG$TIM4_DeInit$0$0 ==.
	ret
	Sstm8s_tim4$TIM4_DeInit$10 ==.
	Sstm8s_tim4$TIM4_TimeBaseInit$11 ==.
;	./libraries/src/stm8s_tim4.c: 65: void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
; genLabel
;	-----------------------------------------
;	 function TIM4_TimeBaseInit
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM4_TimeBaseInit:
	Sstm8s_tim4$TIM4_TimeBaseInit$12 ==.
	Sstm8s_tim4$TIM4_TimeBaseInit$13 ==.
;	./libraries/src/stm8s_tim4.c: 70: TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
; genPointerSet
	ldw	x, #0x5347
	ld	a, (0x03, sp)
	ld	(x), a
	Sstm8s_tim4$TIM4_TimeBaseInit$14 ==.
;	./libraries/src/stm8s_tim4.c: 72: TIM4->ARR = (uint8_t)(TIM4_Period);
; genPointerSet
	ldw	x, #0x5348
	ld	a, (0x04, sp)
	ld	(x), a
; genLabel
00101$:
	Sstm8s_tim4$TIM4_TimeBaseInit$15 ==.
;	./libraries/src/stm8s_tim4.c: 73: }
; genEndFunction
	Sstm8s_tim4$TIM4_TimeBaseInit$16 ==.
	XG$TIM4_TimeBaseInit$0$0 ==.
	ret
	Sstm8s_tim4$TIM4_TimeBaseInit$17 ==.
	Sstm8s_tim4$TIM4_Cmd$18 ==.
;	./libraries/src/stm8s_tim4.c: 81: void TIM4_Cmd(FunctionalState NewState)
; genLabel
;	-----------------------------------------
;	 function TIM4_Cmd
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM4_Cmd:
	Sstm8s_tim4$TIM4_Cmd$19 ==.
	Sstm8s_tim4$TIM4_Cmd$20 ==.
;	./libraries/src/stm8s_tim4.c: 89: TIM4->CR1 |= TIM4_CR1_CEN;
; genPointerGet
	ld	a, 0x5340
	Sstm8s_tim4$TIM4_Cmd$21 ==.
;	./libraries/src/stm8s_tim4.c: 87: if (NewState != DISABLE)
; genIfx
	tnz	(0x03, sp)
	jrne	00111$
	jp	00102$
00111$:
	Sstm8s_tim4$TIM4_Cmd$22 ==.
	Sstm8s_tim4$TIM4_Cmd$23 ==.
;	./libraries/src/stm8s_tim4.c: 89: TIM4->CR1 |= TIM4_CR1_CEN;
; genOr
	or	a, #0x01
; genPointerSet
	ld	0x5340, a
	Sstm8s_tim4$TIM4_Cmd$24 ==.
; genGoto
	jp	00104$
; genLabel
00102$:
	Sstm8s_tim4$TIM4_Cmd$25 ==.
	Sstm8s_tim4$TIM4_Cmd$26 ==.
;	./libraries/src/stm8s_tim4.c: 93: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
; genAnd
	and	a, #0xfe
; genPointerSet
	ld	0x5340, a
	Sstm8s_tim4$TIM4_Cmd$27 ==.
; genLabel
00104$:
	Sstm8s_tim4$TIM4_Cmd$28 ==.
;	./libraries/src/stm8s_tim4.c: 95: }
; genEndFunction
	Sstm8s_tim4$TIM4_Cmd$29 ==.
	XG$TIM4_Cmd$0$0 ==.
	ret
	Sstm8s_tim4$TIM4_Cmd$30 ==.
	Sstm8s_tim4$TIM4_ITConfig$31 ==.
;	./libraries/src/stm8s_tim4.c: 107: void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
; genLabel
;	-----------------------------------------
;	 function TIM4_ITConfig
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 1 bytes.
_TIM4_ITConfig:
	Sstm8s_tim4$TIM4_ITConfig$32 ==.
	push	a
	Sstm8s_tim4$TIM4_ITConfig$33 ==.
	Sstm8s_tim4$TIM4_ITConfig$34 ==.
;	./libraries/src/stm8s_tim4.c: 116: TIM4->IER |= (uint8_t)TIM4_IT;
; genPointerGet
	ld	a, 0x5343
	Sstm8s_tim4$TIM4_ITConfig$35 ==.
;	./libraries/src/stm8s_tim4.c: 113: if (NewState != DISABLE)
; genIfx
	tnz	(0x05, sp)
	jrne	00111$
	jp	00102$
00111$:
	Sstm8s_tim4$TIM4_ITConfig$36 ==.
	Sstm8s_tim4$TIM4_ITConfig$37 ==.
;	./libraries/src/stm8s_tim4.c: 116: TIM4->IER |= (uint8_t)TIM4_IT;
; genOr
	or	a, (0x04, sp)
; genPointerSet
	ld	0x5343, a
	Sstm8s_tim4$TIM4_ITConfig$38 ==.
; genGoto
	jp	00104$
; genLabel
00102$:
	Sstm8s_tim4$TIM4_ITConfig$39 ==.
	Sstm8s_tim4$TIM4_ITConfig$40 ==.
;	./libraries/src/stm8s_tim4.c: 121: TIM4->IER &= (uint8_t)(~TIM4_IT);
; genCpl
	push	a
	Sstm8s_tim4$TIM4_ITConfig$41 ==.
	ld	a, (0x05, sp)
	cpl	a
	ld	(0x02, sp), a
	pop	a
	Sstm8s_tim4$TIM4_ITConfig$42 ==.
; genAnd
	and	a, (0x01, sp)
; genPointerSet
	ld	0x5343, a
	Sstm8s_tim4$TIM4_ITConfig$43 ==.
; genLabel
00104$:
	Sstm8s_tim4$TIM4_ITConfig$44 ==.
;	./libraries/src/stm8s_tim4.c: 123: }
; genEndFunction
	pop	a
	Sstm8s_tim4$TIM4_ITConfig$45 ==.
	Sstm8s_tim4$TIM4_ITConfig$46 ==.
	XG$TIM4_ITConfig$0$0 ==.
	ret
	Sstm8s_tim4$TIM4_ITConfig$47 ==.
	Sstm8s_tim4$TIM4_UpdateDisableConfig$48 ==.
;	./libraries/src/stm8s_tim4.c: 131: void TIM4_UpdateDisableConfig(FunctionalState NewState)
; genLabel
;	-----------------------------------------
;	 function TIM4_UpdateDisableConfig
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM4_UpdateDisableConfig:
	Sstm8s_tim4$TIM4_UpdateDisableConfig$49 ==.
	Sstm8s_tim4$TIM4_UpdateDisableConfig$50 ==.
;	./libraries/src/stm8s_tim4.c: 139: TIM4->CR1 |= TIM4_CR1_UDIS;
; genPointerGet
	ld	a, 0x5340
	Sstm8s_tim4$TIM4_UpdateDisableConfig$51 ==.
;	./libraries/src/stm8s_tim4.c: 137: if (NewState != DISABLE)
; genIfx
	tnz	(0x03, sp)
	jrne	00111$
	jp	00102$
00111$:
	Sstm8s_tim4$TIM4_UpdateDisableConfig$52 ==.
	Sstm8s_tim4$TIM4_UpdateDisableConfig$53 ==.
;	./libraries/src/stm8s_tim4.c: 139: TIM4->CR1 |= TIM4_CR1_UDIS;
; genOr
	or	a, #0x02
; genPointerSet
	ld	0x5340, a
	Sstm8s_tim4$TIM4_UpdateDisableConfig$54 ==.
; genGoto
	jp	00104$
; genLabel
00102$:
	Sstm8s_tim4$TIM4_UpdateDisableConfig$55 ==.
	Sstm8s_tim4$TIM4_UpdateDisableConfig$56 ==.
;	./libraries/src/stm8s_tim4.c: 143: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
; genAnd
	and	a, #0xfd
; genPointerSet
	ld	0x5340, a
	Sstm8s_tim4$TIM4_UpdateDisableConfig$57 ==.
; genLabel
00104$:
	Sstm8s_tim4$TIM4_UpdateDisableConfig$58 ==.
;	./libraries/src/stm8s_tim4.c: 145: }
; genEndFunction
	Sstm8s_tim4$TIM4_UpdateDisableConfig$59 ==.
	XG$TIM4_UpdateDisableConfig$0$0 ==.
	ret
	Sstm8s_tim4$TIM4_UpdateDisableConfig$60 ==.
	Sstm8s_tim4$TIM4_UpdateRequestConfig$61 ==.
;	./libraries/src/stm8s_tim4.c: 155: void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
; genLabel
;	-----------------------------------------
;	 function TIM4_UpdateRequestConfig
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM4_UpdateRequestConfig:
	Sstm8s_tim4$TIM4_UpdateRequestConfig$62 ==.
	Sstm8s_tim4$TIM4_UpdateRequestConfig$63 ==.
;	./libraries/src/stm8s_tim4.c: 163: TIM4->CR1 |= TIM4_CR1_URS;
; genPointerGet
	ld	a, 0x5340
	Sstm8s_tim4$TIM4_UpdateRequestConfig$64 ==.
;	./libraries/src/stm8s_tim4.c: 161: if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
; genIfx
	tnz	(0x03, sp)
	jrne	00111$
	jp	00102$
00111$:
	Sstm8s_tim4$TIM4_UpdateRequestConfig$65 ==.
	Sstm8s_tim4$TIM4_UpdateRequestConfig$66 ==.
;	./libraries/src/stm8s_tim4.c: 163: TIM4->CR1 |= TIM4_CR1_URS;
; genOr
	or	a, #0x04
; genPointerSet
	ld	0x5340, a
	Sstm8s_tim4$TIM4_UpdateRequestConfig$67 ==.
; genGoto
	jp	00104$
; genLabel
00102$:
	Sstm8s_tim4$TIM4_UpdateRequestConfig$68 ==.
	Sstm8s_tim4$TIM4_UpdateRequestConfig$69 ==.
;	./libraries/src/stm8s_tim4.c: 167: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
; genAnd
	and	a, #0xfb
; genPointerSet
	ld	0x5340, a
	Sstm8s_tim4$TIM4_UpdateRequestConfig$70 ==.
; genLabel
00104$:
	Sstm8s_tim4$TIM4_UpdateRequestConfig$71 ==.
;	./libraries/src/stm8s_tim4.c: 169: }
; genEndFunction
	Sstm8s_tim4$TIM4_UpdateRequestConfig$72 ==.
	XG$TIM4_UpdateRequestConfig$0$0 ==.
	ret
	Sstm8s_tim4$TIM4_UpdateRequestConfig$73 ==.
	Sstm8s_tim4$TIM4_SelectOnePulseMode$74 ==.
;	./libraries/src/stm8s_tim4.c: 179: void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
; genLabel
;	-----------------------------------------
;	 function TIM4_SelectOnePulseMode
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM4_SelectOnePulseMode:
	Sstm8s_tim4$TIM4_SelectOnePulseMode$75 ==.
	Sstm8s_tim4$TIM4_SelectOnePulseMode$76 ==.
;	./libraries/src/stm8s_tim4.c: 187: TIM4->CR1 |= TIM4_CR1_OPM;
; genPointerGet
	ld	a, 0x5340
	Sstm8s_tim4$TIM4_SelectOnePulseMode$77 ==.
;	./libraries/src/stm8s_tim4.c: 185: if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
; genIfx
	tnz	(0x03, sp)
	jrne	00111$
	jp	00102$
00111$:
	Sstm8s_tim4$TIM4_SelectOnePulseMode$78 ==.
	Sstm8s_tim4$TIM4_SelectOnePulseMode$79 ==.
;	./libraries/src/stm8s_tim4.c: 187: TIM4->CR1 |= TIM4_CR1_OPM;
; genOr
	or	a, #0x08
; genPointerSet
	ld	0x5340, a
	Sstm8s_tim4$TIM4_SelectOnePulseMode$80 ==.
; genGoto
	jp	00104$
; genLabel
00102$:
	Sstm8s_tim4$TIM4_SelectOnePulseMode$81 ==.
	Sstm8s_tim4$TIM4_SelectOnePulseMode$82 ==.
;	./libraries/src/stm8s_tim4.c: 191: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
; genAnd
	and	a, #0xf7
; genPointerSet
	ld	0x5340, a
	Sstm8s_tim4$TIM4_SelectOnePulseMode$83 ==.
; genLabel
00104$:
	Sstm8s_tim4$TIM4_SelectOnePulseMode$84 ==.
;	./libraries/src/stm8s_tim4.c: 193: }
; genEndFunction
	Sstm8s_tim4$TIM4_SelectOnePulseMode$85 ==.
	XG$TIM4_SelectOnePulseMode$0$0 ==.
	ret
	Sstm8s_tim4$TIM4_SelectOnePulseMode$86 ==.
	Sstm8s_tim4$TIM4_PrescalerConfig$87 ==.
;	./libraries/src/stm8s_tim4.c: 215: void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
; genLabel
;	-----------------------------------------
;	 function TIM4_PrescalerConfig
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM4_PrescalerConfig:
	Sstm8s_tim4$TIM4_PrescalerConfig$88 ==.
	Sstm8s_tim4$TIM4_PrescalerConfig$89 ==.
;	./libraries/src/stm8s_tim4.c: 222: TIM4->PSCR = (uint8_t)Prescaler;
; genPointerSet
	ldw	x, #0x5347
	ld	a, (0x03, sp)
	ld	(x), a
	Sstm8s_tim4$TIM4_PrescalerConfig$90 ==.
;	./libraries/src/stm8s_tim4.c: 225: TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
; genPointerSet
	ldw	x, #0x5345
	ld	a, (0x04, sp)
	ld	(x), a
; genLabel
00101$:
	Sstm8s_tim4$TIM4_PrescalerConfig$91 ==.
;	./libraries/src/stm8s_tim4.c: 226: }
; genEndFunction
	Sstm8s_tim4$TIM4_PrescalerConfig$92 ==.
	XG$TIM4_PrescalerConfig$0$0 ==.
	ret
	Sstm8s_tim4$TIM4_PrescalerConfig$93 ==.
	Sstm8s_tim4$TIM4_ARRPreloadConfig$94 ==.
;	./libraries/src/stm8s_tim4.c: 234: void TIM4_ARRPreloadConfig(FunctionalState NewState)
; genLabel
;	-----------------------------------------
;	 function TIM4_ARRPreloadConfig
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM4_ARRPreloadConfig:
	Sstm8s_tim4$TIM4_ARRPreloadConfig$95 ==.
	Sstm8s_tim4$TIM4_ARRPreloadConfig$96 ==.
;	./libraries/src/stm8s_tim4.c: 242: TIM4->CR1 |= TIM4_CR1_ARPE;
; genPointerGet
	ld	a, 0x5340
	Sstm8s_tim4$TIM4_ARRPreloadConfig$97 ==.
;	./libraries/src/stm8s_tim4.c: 240: if (NewState != DISABLE)
; genIfx
	tnz	(0x03, sp)
	jrne	00111$
	jp	00102$
00111$:
	Sstm8s_tim4$TIM4_ARRPreloadConfig$98 ==.
	Sstm8s_tim4$TIM4_ARRPreloadConfig$99 ==.
;	./libraries/src/stm8s_tim4.c: 242: TIM4->CR1 |= TIM4_CR1_ARPE;
; genOr
	or	a, #0x80
; genPointerSet
	ld	0x5340, a
	Sstm8s_tim4$TIM4_ARRPreloadConfig$100 ==.
; genGoto
	jp	00104$
; genLabel
00102$:
	Sstm8s_tim4$TIM4_ARRPreloadConfig$101 ==.
	Sstm8s_tim4$TIM4_ARRPreloadConfig$102 ==.
;	./libraries/src/stm8s_tim4.c: 246: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
; genAnd
	and	a, #0x7f
; genPointerSet
	ld	0x5340, a
	Sstm8s_tim4$TIM4_ARRPreloadConfig$103 ==.
; genLabel
00104$:
	Sstm8s_tim4$TIM4_ARRPreloadConfig$104 ==.
;	./libraries/src/stm8s_tim4.c: 248: }
; genEndFunction
	Sstm8s_tim4$TIM4_ARRPreloadConfig$105 ==.
	XG$TIM4_ARRPreloadConfig$0$0 ==.
	ret
	Sstm8s_tim4$TIM4_ARRPreloadConfig$106 ==.
	Sstm8s_tim4$TIM4_GenerateEvent$107 ==.
;	./libraries/src/stm8s_tim4.c: 257: void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
; genLabel
;	-----------------------------------------
;	 function TIM4_GenerateEvent
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM4_GenerateEvent:
	Sstm8s_tim4$TIM4_GenerateEvent$108 ==.
	Sstm8s_tim4$TIM4_GenerateEvent$109 ==.
;	./libraries/src/stm8s_tim4.c: 263: TIM4->EGR = (uint8_t)(TIM4_EventSource);
; genPointerSet
	ldw	x, #0x5345
	ld	a, (0x03, sp)
	ld	(x), a
; genLabel
00101$:
	Sstm8s_tim4$TIM4_GenerateEvent$110 ==.
;	./libraries/src/stm8s_tim4.c: 264: }
; genEndFunction
	Sstm8s_tim4$TIM4_GenerateEvent$111 ==.
	XG$TIM4_GenerateEvent$0$0 ==.
	ret
	Sstm8s_tim4$TIM4_GenerateEvent$112 ==.
	Sstm8s_tim4$TIM4_SetCounter$113 ==.
;	./libraries/src/stm8s_tim4.c: 272: void TIM4_SetCounter(uint8_t Counter)
; genLabel
;	-----------------------------------------
;	 function TIM4_SetCounter
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM4_SetCounter:
	Sstm8s_tim4$TIM4_SetCounter$114 ==.
	Sstm8s_tim4$TIM4_SetCounter$115 ==.
;	./libraries/src/stm8s_tim4.c: 275: TIM4->CNTR = (uint8_t)(Counter);
; genPointerSet
	ldw	x, #0x5346
	ld	a, (0x03, sp)
	ld	(x), a
; genLabel
00101$:
	Sstm8s_tim4$TIM4_SetCounter$116 ==.
;	./libraries/src/stm8s_tim4.c: 276: }
; genEndFunction
	Sstm8s_tim4$TIM4_SetCounter$117 ==.
	XG$TIM4_SetCounter$0$0 ==.
	ret
	Sstm8s_tim4$TIM4_SetCounter$118 ==.
	Sstm8s_tim4$TIM4_SetAutoreload$119 ==.
;	./libraries/src/stm8s_tim4.c: 284: void TIM4_SetAutoreload(uint8_t Autoreload)
; genLabel
;	-----------------------------------------
;	 function TIM4_SetAutoreload
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM4_SetAutoreload:
	Sstm8s_tim4$TIM4_SetAutoreload$120 ==.
	Sstm8s_tim4$TIM4_SetAutoreload$121 ==.
;	./libraries/src/stm8s_tim4.c: 287: TIM4->ARR = (uint8_t)(Autoreload);
; genPointerSet
	ldw	x, #0x5348
	ld	a, (0x03, sp)
	ld	(x), a
; genLabel
00101$:
	Sstm8s_tim4$TIM4_SetAutoreload$122 ==.
;	./libraries/src/stm8s_tim4.c: 288: }
; genEndFunction
	Sstm8s_tim4$TIM4_SetAutoreload$123 ==.
	XG$TIM4_SetAutoreload$0$0 ==.
	ret
	Sstm8s_tim4$TIM4_SetAutoreload$124 ==.
	Sstm8s_tim4$TIM4_GetCounter$125 ==.
;	./libraries/src/stm8s_tim4.c: 295: uint8_t TIM4_GetCounter(void)
; genLabel
;	-----------------------------------------
;	 function TIM4_GetCounter
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM4_GetCounter:
	Sstm8s_tim4$TIM4_GetCounter$126 ==.
	Sstm8s_tim4$TIM4_GetCounter$127 ==.
;	./libraries/src/stm8s_tim4.c: 298: return (uint8_t)(TIM4->CNTR);
; genPointerGet
	ld	a, 0x5346
; genReturn
; genLabel
00101$:
	Sstm8s_tim4$TIM4_GetCounter$128 ==.
;	./libraries/src/stm8s_tim4.c: 299: }
; genEndFunction
	Sstm8s_tim4$TIM4_GetCounter$129 ==.
	XG$TIM4_GetCounter$0$0 ==.
	ret
	Sstm8s_tim4$TIM4_GetCounter$130 ==.
	Sstm8s_tim4$TIM4_GetPrescaler$131 ==.
;	./libraries/src/stm8s_tim4.c: 306: TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
; genLabel
;	-----------------------------------------
;	 function TIM4_GetPrescaler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM4_GetPrescaler:
	Sstm8s_tim4$TIM4_GetPrescaler$132 ==.
	Sstm8s_tim4$TIM4_GetPrescaler$133 ==.
;	./libraries/src/stm8s_tim4.c: 309: return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
; genPointerGet
	ld	a, 0x5347
; genReturn
; genLabel
00101$:
	Sstm8s_tim4$TIM4_GetPrescaler$134 ==.
;	./libraries/src/stm8s_tim4.c: 310: }
; genEndFunction
	Sstm8s_tim4$TIM4_GetPrescaler$135 ==.
	XG$TIM4_GetPrescaler$0$0 ==.
	ret
	Sstm8s_tim4$TIM4_GetPrescaler$136 ==.
	Sstm8s_tim4$TIM4_GetFlagStatus$137 ==.
;	./libraries/src/stm8s_tim4.c: 319: FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
; genLabel
;	-----------------------------------------
;	 function TIM4_GetFlagStatus
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM4_GetFlagStatus:
	Sstm8s_tim4$TIM4_GetFlagStatus$138 ==.
	Sstm8s_tim4$TIM4_GetFlagStatus$139 ==.
;	./libraries/src/stm8s_tim4.c: 326: if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
; genPointerGet
	ld	a, 0x5344
; genAnd
	and	a, (0x03, sp)
; genIfx
	tnz	a
	jrne	00111$
	jp	00102$
00111$:
	Sstm8s_tim4$TIM4_GetFlagStatus$140 ==.
	Sstm8s_tim4$TIM4_GetFlagStatus$141 ==.
;	./libraries/src/stm8s_tim4.c: 328: bitstatus = SET;
; genAssign
	ld	a, #0x01
	Sstm8s_tim4$TIM4_GetFlagStatus$142 ==.
; genGoto
	jp	00103$
; genLabel
00102$:
	Sstm8s_tim4$TIM4_GetFlagStatus$143 ==.
	Sstm8s_tim4$TIM4_GetFlagStatus$144 ==.
;	./libraries/src/stm8s_tim4.c: 332: bitstatus = RESET;
; genAssign
	clr	a
	Sstm8s_tim4$TIM4_GetFlagStatus$145 ==.
; genLabel
00103$:
	Sstm8s_tim4$TIM4_GetFlagStatus$146 ==.
;	./libraries/src/stm8s_tim4.c: 334: return ((FlagStatus)bitstatus);
; genReturn
; genLabel
00104$:
	Sstm8s_tim4$TIM4_GetFlagStatus$147 ==.
;	./libraries/src/stm8s_tim4.c: 335: }
; genEndFunction
	Sstm8s_tim4$TIM4_GetFlagStatus$148 ==.
	XG$TIM4_GetFlagStatus$0$0 ==.
	ret
	Sstm8s_tim4$TIM4_GetFlagStatus$149 ==.
	Sstm8s_tim4$TIM4_ClearFlag$150 ==.
;	./libraries/src/stm8s_tim4.c: 344: void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
; genLabel
;	-----------------------------------------
;	 function TIM4_ClearFlag
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM4_ClearFlag:
	Sstm8s_tim4$TIM4_ClearFlag$151 ==.
	Sstm8s_tim4$TIM4_ClearFlag$152 ==.
;	./libraries/src/stm8s_tim4.c: 350: TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
; genCpl
	ld	a, (0x03, sp)
	cpl	a
; genPointerSet
	ld	0x5344, a
; genLabel
00101$:
	Sstm8s_tim4$TIM4_ClearFlag$153 ==.
;	./libraries/src/stm8s_tim4.c: 351: }
; genEndFunction
	Sstm8s_tim4$TIM4_ClearFlag$154 ==.
	XG$TIM4_ClearFlag$0$0 ==.
	ret
	Sstm8s_tim4$TIM4_ClearFlag$155 ==.
	Sstm8s_tim4$TIM4_GetITStatus$156 ==.
;	./libraries/src/stm8s_tim4.c: 360: ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
; genLabel
;	-----------------------------------------
;	 function TIM4_GetITStatus
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 1 bytes.
_TIM4_GetITStatus:
	Sstm8s_tim4$TIM4_GetITStatus$157 ==.
	push	a
	Sstm8s_tim4$TIM4_GetITStatus$158 ==.
	Sstm8s_tim4$TIM4_GetITStatus$159 ==.
;	./libraries/src/stm8s_tim4.c: 369: itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
; genPointerGet
	ld	a, 0x5344
; genAnd
	and	a, (0x04, sp)
; genAssign
	ld	(0x01, sp), a
	Sstm8s_tim4$TIM4_GetITStatus$160 ==.
;	./libraries/src/stm8s_tim4.c: 371: itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
; genPointerGet
	ld	a, 0x5343
; genAnd
	and	a, (0x04, sp)
; genAssign
	Sstm8s_tim4$TIM4_GetITStatus$161 ==.
;	./libraries/src/stm8s_tim4.c: 373: if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
; genIfx
	tnz	(0x01, sp)
	jrne	00117$
	jp	00102$
00117$:
; genIfx
	tnz	a
	jrne	00118$
	jp	00102$
00118$:
	Sstm8s_tim4$TIM4_GetITStatus$162 ==.
	Sstm8s_tim4$TIM4_GetITStatus$163 ==.
;	./libraries/src/stm8s_tim4.c: 375: bitstatus = (ITStatus)SET;
; genAssign
	ld	a, #0x01
	Sstm8s_tim4$TIM4_GetITStatus$164 ==.
; genGoto
	jp	00103$
; genLabel
00102$:
	Sstm8s_tim4$TIM4_GetITStatus$165 ==.
	Sstm8s_tim4$TIM4_GetITStatus$166 ==.
;	./libraries/src/stm8s_tim4.c: 379: bitstatus = (ITStatus)RESET;
; genAssign
	clr	a
	Sstm8s_tim4$TIM4_GetITStatus$167 ==.
; genLabel
00103$:
	Sstm8s_tim4$TIM4_GetITStatus$168 ==.
;	./libraries/src/stm8s_tim4.c: 381: return ((ITStatus)bitstatus);
; genReturn
; genLabel
00105$:
	Sstm8s_tim4$TIM4_GetITStatus$169 ==.
;	./libraries/src/stm8s_tim4.c: 382: }
; genEndFunction
	addw	sp, #1
	Sstm8s_tim4$TIM4_GetITStatus$170 ==.
	Sstm8s_tim4$TIM4_GetITStatus$171 ==.
	XG$TIM4_GetITStatus$0$0 ==.
	ret
	Sstm8s_tim4$TIM4_GetITStatus$172 ==.
	Sstm8s_tim4$TIM4_ClearITPendingBit$173 ==.
;	./libraries/src/stm8s_tim4.c: 391: void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
; genLabel
;	-----------------------------------------
;	 function TIM4_ClearITPendingBit
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM4_ClearITPendingBit:
	Sstm8s_tim4$TIM4_ClearITPendingBit$174 ==.
	Sstm8s_tim4$TIM4_ClearITPendingBit$175 ==.
;	./libraries/src/stm8s_tim4.c: 397: TIM4->SR1 = (uint8_t)(~TIM4_IT);
; genCpl
	ld	a, (0x03, sp)
	cpl	a
; genPointerSet
	ld	0x5344, a
; genLabel
00101$:
	Sstm8s_tim4$TIM4_ClearITPendingBit$176 ==.
;	./libraries/src/stm8s_tim4.c: 398: }
; genEndFunction
	Sstm8s_tim4$TIM4_ClearITPendingBit$177 ==.
	XG$TIM4_ClearITPendingBit$0$0 ==.
	ret
	Sstm8s_tim4$TIM4_ClearITPendingBit$178 ==.
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
	.ascii "./libraries/src/stm8s_tim4.c"
	.db	0
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.db	0
Ldebug_line_stmt:
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_tim4$TIM4_DeInit$0)
	.db	3
	.sleb128	48
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_DeInit$2-Sstm8s_tim4$TIM4_DeInit$0
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_DeInit$3-Sstm8s_tim4$TIM4_DeInit$2
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_DeInit$4-Sstm8s_tim4$TIM4_DeInit$3
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_DeInit$5-Sstm8s_tim4$TIM4_DeInit$4
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_DeInit$6-Sstm8s_tim4$TIM4_DeInit$5
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_DeInit$7-Sstm8s_tim4$TIM4_DeInit$6
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_DeInit$8-Sstm8s_tim4$TIM4_DeInit$7
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_tim4$TIM4_DeInit$9-Sstm8s_tim4$TIM4_DeInit$8
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_tim4$TIM4_TimeBaseInit$11)
	.db	3
	.sleb128	64
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_TimeBaseInit$13-Sstm8s_tim4$TIM4_TimeBaseInit$11
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_TimeBaseInit$14-Sstm8s_tim4$TIM4_TimeBaseInit$13
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_TimeBaseInit$15-Sstm8s_tim4$TIM4_TimeBaseInit$14
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_tim4$TIM4_TimeBaseInit$16-Sstm8s_tim4$TIM4_TimeBaseInit$15
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_tim4$TIM4_Cmd$18)
	.db	3
	.sleb128	80
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_Cmd$20-Sstm8s_tim4$TIM4_Cmd$18
	.db	3
	.sleb128	8
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_Cmd$21-Sstm8s_tim4$TIM4_Cmd$20
	.db	3
	.sleb128	-2
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_Cmd$23-Sstm8s_tim4$TIM4_Cmd$21
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_Cmd$26-Sstm8s_tim4$TIM4_Cmd$23
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_Cmd$28-Sstm8s_tim4$TIM4_Cmd$26
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Sstm8s_tim4$TIM4_Cmd$29-Sstm8s_tim4$TIM4_Cmd$28
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$31)
	.db	3
	.sleb128	106
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_ITConfig$34-Sstm8s_tim4$TIM4_ITConfig$31
	.db	3
	.sleb128	9
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_ITConfig$35-Sstm8s_tim4$TIM4_ITConfig$34
	.db	3
	.sleb128	-3
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_ITConfig$37-Sstm8s_tim4$TIM4_ITConfig$35
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_ITConfig$40-Sstm8s_tim4$TIM4_ITConfig$37
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_ITConfig$44-Sstm8s_tim4$TIM4_ITConfig$40
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Sstm8s_tim4$TIM4_ITConfig$46-Sstm8s_tim4$TIM4_ITConfig$44
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_tim4$TIM4_UpdateDisableConfig$48)
	.db	3
	.sleb128	130
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_UpdateDisableConfig$50-Sstm8s_tim4$TIM4_UpdateDisableConfig$48
	.db	3
	.sleb128	8
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_UpdateDisableConfig$51-Sstm8s_tim4$TIM4_UpdateDisableConfig$50
	.db	3
	.sleb128	-2
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_UpdateDisableConfig$53-Sstm8s_tim4$TIM4_UpdateDisableConfig$51
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_UpdateDisableConfig$56-Sstm8s_tim4$TIM4_UpdateDisableConfig$53
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_UpdateDisableConfig$58-Sstm8s_tim4$TIM4_UpdateDisableConfig$56
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Sstm8s_tim4$TIM4_UpdateDisableConfig$59-Sstm8s_tim4$TIM4_UpdateDisableConfig$58
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_tim4$TIM4_UpdateRequestConfig$61)
	.db	3
	.sleb128	154
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_UpdateRequestConfig$63-Sstm8s_tim4$TIM4_UpdateRequestConfig$61
	.db	3
	.sleb128	8
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_UpdateRequestConfig$64-Sstm8s_tim4$TIM4_UpdateRequestConfig$63
	.db	3
	.sleb128	-2
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_UpdateRequestConfig$66-Sstm8s_tim4$TIM4_UpdateRequestConfig$64
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_UpdateRequestConfig$69-Sstm8s_tim4$TIM4_UpdateRequestConfig$66
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_UpdateRequestConfig$71-Sstm8s_tim4$TIM4_UpdateRequestConfig$69
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Sstm8s_tim4$TIM4_UpdateRequestConfig$72-Sstm8s_tim4$TIM4_UpdateRequestConfig$71
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_tim4$TIM4_SelectOnePulseMode$74)
	.db	3
	.sleb128	178
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_SelectOnePulseMode$76-Sstm8s_tim4$TIM4_SelectOnePulseMode$74
	.db	3
	.sleb128	8
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_SelectOnePulseMode$77-Sstm8s_tim4$TIM4_SelectOnePulseMode$76
	.db	3
	.sleb128	-2
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_SelectOnePulseMode$79-Sstm8s_tim4$TIM4_SelectOnePulseMode$77
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_SelectOnePulseMode$82-Sstm8s_tim4$TIM4_SelectOnePulseMode$79
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_SelectOnePulseMode$84-Sstm8s_tim4$TIM4_SelectOnePulseMode$82
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Sstm8s_tim4$TIM4_SelectOnePulseMode$85-Sstm8s_tim4$TIM4_SelectOnePulseMode$84
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_tim4$TIM4_PrescalerConfig$87)
	.db	3
	.sleb128	214
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_PrescalerConfig$89-Sstm8s_tim4$TIM4_PrescalerConfig$87
	.db	3
	.sleb128	7
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_PrescalerConfig$90-Sstm8s_tim4$TIM4_PrescalerConfig$89
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_PrescalerConfig$91-Sstm8s_tim4$TIM4_PrescalerConfig$90
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_tim4$TIM4_PrescalerConfig$92-Sstm8s_tim4$TIM4_PrescalerConfig$91
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_tim4$TIM4_ARRPreloadConfig$94)
	.db	3
	.sleb128	233
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_ARRPreloadConfig$96-Sstm8s_tim4$TIM4_ARRPreloadConfig$94
	.db	3
	.sleb128	8
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_ARRPreloadConfig$97-Sstm8s_tim4$TIM4_ARRPreloadConfig$96
	.db	3
	.sleb128	-2
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_ARRPreloadConfig$99-Sstm8s_tim4$TIM4_ARRPreloadConfig$97
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_ARRPreloadConfig$102-Sstm8s_tim4$TIM4_ARRPreloadConfig$99
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_ARRPreloadConfig$104-Sstm8s_tim4$TIM4_ARRPreloadConfig$102
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Sstm8s_tim4$TIM4_ARRPreloadConfig$105-Sstm8s_tim4$TIM4_ARRPreloadConfig$104
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_tim4$TIM4_GenerateEvent$107)
	.db	3
	.sleb128	256
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_GenerateEvent$109-Sstm8s_tim4$TIM4_GenerateEvent$107
	.db	3
	.sleb128	6
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_GenerateEvent$110-Sstm8s_tim4$TIM4_GenerateEvent$109
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_tim4$TIM4_GenerateEvent$111-Sstm8s_tim4$TIM4_GenerateEvent$110
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_tim4$TIM4_SetCounter$113)
	.db	3
	.sleb128	271
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_SetCounter$115-Sstm8s_tim4$TIM4_SetCounter$113
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_SetCounter$116-Sstm8s_tim4$TIM4_SetCounter$115
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_tim4$TIM4_SetCounter$117-Sstm8s_tim4$TIM4_SetCounter$116
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_tim4$TIM4_SetAutoreload$119)
	.db	3
	.sleb128	283
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_SetAutoreload$121-Sstm8s_tim4$TIM4_SetAutoreload$119
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_SetAutoreload$122-Sstm8s_tim4$TIM4_SetAutoreload$121
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_tim4$TIM4_SetAutoreload$123-Sstm8s_tim4$TIM4_SetAutoreload$122
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_tim4$TIM4_GetCounter$125)
	.db	3
	.sleb128	294
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_GetCounter$127-Sstm8s_tim4$TIM4_GetCounter$125
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_GetCounter$128-Sstm8s_tim4$TIM4_GetCounter$127
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_tim4$TIM4_GetCounter$129-Sstm8s_tim4$TIM4_GetCounter$128
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_tim4$TIM4_GetPrescaler$131)
	.db	3
	.sleb128	305
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_GetPrescaler$133-Sstm8s_tim4$TIM4_GetPrescaler$131
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_GetPrescaler$134-Sstm8s_tim4$TIM4_GetPrescaler$133
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_tim4$TIM4_GetPrescaler$135-Sstm8s_tim4$TIM4_GetPrescaler$134
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_tim4$TIM4_GetFlagStatus$137)
	.db	3
	.sleb128	318
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_GetFlagStatus$139-Sstm8s_tim4$TIM4_GetFlagStatus$137
	.db	3
	.sleb128	7
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_GetFlagStatus$141-Sstm8s_tim4$TIM4_GetFlagStatus$139
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_GetFlagStatus$144-Sstm8s_tim4$TIM4_GetFlagStatus$141
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_GetFlagStatus$146-Sstm8s_tim4$TIM4_GetFlagStatus$144
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_GetFlagStatus$147-Sstm8s_tim4$TIM4_GetFlagStatus$146
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_tim4$TIM4_GetFlagStatus$148-Sstm8s_tim4$TIM4_GetFlagStatus$147
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_tim4$TIM4_ClearFlag$150)
	.db	3
	.sleb128	343
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_ClearFlag$152-Sstm8s_tim4$TIM4_ClearFlag$150
	.db	3
	.sleb128	6
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_ClearFlag$153-Sstm8s_tim4$TIM4_ClearFlag$152
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_tim4$TIM4_ClearFlag$154-Sstm8s_tim4$TIM4_ClearFlag$153
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_tim4$TIM4_GetITStatus$156)
	.db	3
	.sleb128	359
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_GetITStatus$159-Sstm8s_tim4$TIM4_GetITStatus$156
	.db	3
	.sleb128	9
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_GetITStatus$160-Sstm8s_tim4$TIM4_GetITStatus$159
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_GetITStatus$161-Sstm8s_tim4$TIM4_GetITStatus$160
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_GetITStatus$163-Sstm8s_tim4$TIM4_GetITStatus$161
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_GetITStatus$166-Sstm8s_tim4$TIM4_GetITStatus$163
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_GetITStatus$168-Sstm8s_tim4$TIM4_GetITStatus$166
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_GetITStatus$169-Sstm8s_tim4$TIM4_GetITStatus$168
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_tim4$TIM4_GetITStatus$171-Sstm8s_tim4$TIM4_GetITStatus$169
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sstm8s_tim4$TIM4_ClearITPendingBit$173)
	.db	3
	.sleb128	390
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_ClearITPendingBit$175-Sstm8s_tim4$TIM4_ClearITPendingBit$173
	.db	3
	.sleb128	6
	.db	1
	.db	9
	.dw	Sstm8s_tim4$TIM4_ClearITPendingBit$176-Sstm8s_tim4$TIM4_ClearITPendingBit$175
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	1+Sstm8s_tim4$TIM4_ClearITPendingBit$177-Sstm8s_tim4$TIM4_ClearITPendingBit$176
	.db	0
	.uleb128	1
	.db	1
Ldebug_line_end:

	.area .debug_loc (NOLOAD)
Ldebug_loc_start:
	.dw	0,(Sstm8s_tim4$TIM4_ClearITPendingBit$174)
	.dw	0,(Sstm8s_tim4$TIM4_ClearITPendingBit$178)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_tim4$TIM4_GetITStatus$170)
	.dw	0,(Sstm8s_tim4$TIM4_GetITStatus$172)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_tim4$TIM4_GetITStatus$158)
	.dw	0,(Sstm8s_tim4$TIM4_GetITStatus$170)
	.dw	2
	.db	120
	.sleb128	2
	.dw	0,(Sstm8s_tim4$TIM4_GetITStatus$157)
	.dw	0,(Sstm8s_tim4$TIM4_GetITStatus$158)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_tim4$TIM4_ClearFlag$151)
	.dw	0,(Sstm8s_tim4$TIM4_ClearFlag$155)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_tim4$TIM4_GetFlagStatus$138)
	.dw	0,(Sstm8s_tim4$TIM4_GetFlagStatus$149)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_tim4$TIM4_GetPrescaler$132)
	.dw	0,(Sstm8s_tim4$TIM4_GetPrescaler$136)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_tim4$TIM4_GetCounter$126)
	.dw	0,(Sstm8s_tim4$TIM4_GetCounter$130)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_tim4$TIM4_SetAutoreload$120)
	.dw	0,(Sstm8s_tim4$TIM4_SetAutoreload$124)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_tim4$TIM4_SetCounter$114)
	.dw	0,(Sstm8s_tim4$TIM4_SetCounter$118)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_tim4$TIM4_GenerateEvent$108)
	.dw	0,(Sstm8s_tim4$TIM4_GenerateEvent$112)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_tim4$TIM4_ARRPreloadConfig$95)
	.dw	0,(Sstm8s_tim4$TIM4_ARRPreloadConfig$106)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_tim4$TIM4_PrescalerConfig$88)
	.dw	0,(Sstm8s_tim4$TIM4_PrescalerConfig$93)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_tim4$TIM4_SelectOnePulseMode$75)
	.dw	0,(Sstm8s_tim4$TIM4_SelectOnePulseMode$86)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_tim4$TIM4_UpdateRequestConfig$62)
	.dw	0,(Sstm8s_tim4$TIM4_UpdateRequestConfig$73)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_tim4$TIM4_UpdateDisableConfig$49)
	.dw	0,(Sstm8s_tim4$TIM4_UpdateDisableConfig$60)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$45)
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$47)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$42)
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$45)
	.dw	2
	.db	120
	.sleb128	2
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$41)
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$42)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$33)
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$41)
	.dw	2
	.db	120
	.sleb128	2
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$32)
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$33)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_tim4$TIM4_Cmd$19)
	.dw	0,(Sstm8s_tim4$TIM4_Cmd$30)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_tim4$TIM4_TimeBaseInit$12)
	.dw	0,(Sstm8s_tim4$TIM4_TimeBaseInit$17)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Sstm8s_tim4$TIM4_DeInit$1)
	.dw	0,(Sstm8s_tim4$TIM4_DeInit$10)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0

	.area .debug_abbrev (NOLOAD)
Ldebug_abbrev:
	.uleb128	7
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
	.uleb128	8
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
	.uleb128	6
	.uleb128	11
	.db	0
	.uleb128	17
	.uleb128	1
	.uleb128	18
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
	.ascii "./libraries/src/stm8s_tim4.c"
	.db	0
	.dw	0,(Ldebug_line_start+-4)
	.db	1
	.ascii "SDCC version 4.0.2 #11645"
	.db	0
	.uleb128	2
	.ascii "TIM4_DeInit"
	.db	0
	.dw	0,(_TIM4_DeInit)
	.dw	0,(XG$TIM4_DeInit$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+412)
	.uleb128	3
	.dw	0,178
	.ascii "TIM4_TimeBaseInit"
	.db	0
	.dw	0,(_TIM4_TimeBaseInit)
	.dw	0,(XG$TIM4_TimeBaseInit$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+392)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "TIM4_Prescaler"
	.db	0
	.dw	0,178
	.uleb128	4
	.db	2
	.db	145
	.sleb128	3
	.ascii "TIM4_Period"
	.db	0
	.dw	0,178
	.uleb128	0
	.uleb128	5
	.ascii "unsigned char"
	.db	0
	.db	1
	.db	8
	.uleb128	3
	.dw	0,258
	.ascii "TIM4_Cmd"
	.db	0
	.dw	0,(_TIM4_Cmd)
	.dw	0,(XG$TIM4_Cmd$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+372)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "NewState"
	.db	0
	.dw	0,178
	.uleb128	6
	.dw	0,(Sstm8s_tim4$TIM4_Cmd$22)
	.dw	0,(Sstm8s_tim4$TIM4_Cmd$24)
	.uleb128	6
	.dw	0,(Sstm8s_tim4$TIM4_Cmd$25)
	.dw	0,(Sstm8s_tim4$TIM4_Cmd$27)
	.uleb128	0
	.uleb128	3
	.dw	0,342
	.ascii "TIM4_ITConfig"
	.db	0
	.dw	0,(_TIM4_ITConfig)
	.dw	0,(XG$TIM4_ITConfig$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+304)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "TIM4_IT"
	.db	0
	.dw	0,178
	.uleb128	4
	.db	2
	.db	145
	.sleb128	3
	.ascii "NewState"
	.db	0
	.dw	0,178
	.uleb128	6
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$36)
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$38)
	.uleb128	6
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$39)
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$43)
	.uleb128	0
	.uleb128	3
	.dw	0,421
	.ascii "TIM4_UpdateDisableConfig"
	.db	0
	.dw	0,(_TIM4_UpdateDisableConfig)
	.dw	0,(XG$TIM4_UpdateDisableConfig$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+284)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "NewState"
	.db	0
	.dw	0,178
	.uleb128	6
	.dw	0,(Sstm8s_tim4$TIM4_UpdateDisableConfig$52)
	.dw	0,(Sstm8s_tim4$TIM4_UpdateDisableConfig$54)
	.uleb128	6
	.dw	0,(Sstm8s_tim4$TIM4_UpdateDisableConfig$55)
	.dw	0,(Sstm8s_tim4$TIM4_UpdateDisableConfig$57)
	.uleb128	0
	.uleb128	3
	.dw	0,509
	.ascii "TIM4_UpdateRequestConfig"
	.db	0
	.dw	0,(_TIM4_UpdateRequestConfig)
	.dw	0,(XG$TIM4_UpdateRequestConfig$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+264)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "TIM4_UpdateSource"
	.db	0
	.dw	0,178
	.uleb128	6
	.dw	0,(Sstm8s_tim4$TIM4_UpdateRequestConfig$65)
	.dw	0,(Sstm8s_tim4$TIM4_UpdateRequestConfig$67)
	.uleb128	6
	.dw	0,(Sstm8s_tim4$TIM4_UpdateRequestConfig$68)
	.dw	0,(Sstm8s_tim4$TIM4_UpdateRequestConfig$70)
	.uleb128	0
	.uleb128	3
	.dw	0,590
	.ascii "TIM4_SelectOnePulseMode"
	.db	0
	.dw	0,(_TIM4_SelectOnePulseMode)
	.dw	0,(XG$TIM4_SelectOnePulseMode$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+244)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "TIM4_OPMode"
	.db	0
	.dw	0,178
	.uleb128	6
	.dw	0,(Sstm8s_tim4$TIM4_SelectOnePulseMode$78)
	.dw	0,(Sstm8s_tim4$TIM4_SelectOnePulseMode$80)
	.uleb128	6
	.dw	0,(Sstm8s_tim4$TIM4_SelectOnePulseMode$81)
	.dw	0,(Sstm8s_tim4$TIM4_SelectOnePulseMode$83)
	.uleb128	0
	.uleb128	3
	.dw	0,675
	.ascii "TIM4_PrescalerConfig"
	.db	0
	.dw	0,(_TIM4_PrescalerConfig)
	.dw	0,(XG$TIM4_PrescalerConfig$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+224)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "Prescaler"
	.db	0
	.dw	0,178
	.uleb128	4
	.db	2
	.db	145
	.sleb128	3
	.ascii "TIM4_PSCReloadMode"
	.db	0
	.dw	0,178
	.uleb128	0
	.uleb128	3
	.dw	0,751
	.ascii "TIM4_ARRPreloadConfig"
	.db	0
	.dw	0,(_TIM4_ARRPreloadConfig)
	.dw	0,(XG$TIM4_ARRPreloadConfig$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+204)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "NewState"
	.db	0
	.dw	0,178
	.uleb128	6
	.dw	0,(Sstm8s_tim4$TIM4_ARRPreloadConfig$98)
	.dw	0,(Sstm8s_tim4$TIM4_ARRPreloadConfig$100)
	.uleb128	6
	.dw	0,(Sstm8s_tim4$TIM4_ARRPreloadConfig$101)
	.dw	0,(Sstm8s_tim4$TIM4_ARRPreloadConfig$103)
	.uleb128	0
	.uleb128	3
	.dw	0,814
	.ascii "TIM4_GenerateEvent"
	.db	0
	.dw	0,(_TIM4_GenerateEvent)
	.dw	0,(XG$TIM4_GenerateEvent$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+184)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "TIM4_EventSource"
	.db	0
	.dw	0,178
	.uleb128	0
	.uleb128	3
	.dw	0,865
	.ascii "TIM4_SetCounter"
	.db	0
	.dw	0,(_TIM4_SetCounter)
	.dw	0,(XG$TIM4_SetCounter$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+164)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "Counter"
	.db	0
	.dw	0,178
	.uleb128	0
	.uleb128	3
	.dw	0,922
	.ascii "TIM4_SetAutoreload"
	.db	0
	.dw	0,(_TIM4_SetAutoreload)
	.dw	0,(XG$TIM4_SetAutoreload$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+144)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "Autoreload"
	.db	0
	.dw	0,178
	.uleb128	0
	.uleb128	7
	.ascii "TIM4_GetCounter"
	.db	0
	.dw	0,(_TIM4_GetCounter)
	.dw	0,(XG$TIM4_GetCounter$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+124)
	.dw	0,178
	.uleb128	7
	.ascii "TIM4_GetPrescaler"
	.db	0
	.dw	0,(_TIM4_GetPrescaler)
	.dw	0,(XG$TIM4_GetPrescaler$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+104)
	.dw	0,178
	.uleb128	8
	.dw	0,1087
	.ascii "TIM4_GetFlagStatus"
	.db	0
	.dw	0,(_TIM4_GetFlagStatus)
	.dw	0,(XG$TIM4_GetFlagStatus$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+84)
	.dw	0,178
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "TIM4_FLAG"
	.db	0
	.dw	0,178
	.uleb128	6
	.dw	0,(Sstm8s_tim4$TIM4_GetFlagStatus$140)
	.dw	0,(Sstm8s_tim4$TIM4_GetFlagStatus$142)
	.uleb128	6
	.dw	0,(Sstm8s_tim4$TIM4_GetFlagStatus$143)
	.dw	0,(Sstm8s_tim4$TIM4_GetFlagStatus$145)
	.uleb128	9
	.db	1
	.db	80
	.ascii "bitstatus"
	.db	0
	.dw	0,178
	.uleb128	0
	.uleb128	3
	.dw	0,1139
	.ascii "TIM4_ClearFlag"
	.db	0
	.dw	0,(_TIM4_ClearFlag)
	.dw	0,(XG$TIM4_ClearFlag$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+64)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "TIM4_FLAG"
	.db	0
	.dw	0,178
	.uleb128	0
	.uleb128	8
	.dw	0,1263
	.ascii "TIM4_GetITStatus"
	.db	0
	.dw	0,(_TIM4_GetITStatus)
	.dw	0,(XG$TIM4_GetITStatus$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+20)
	.dw	0,178
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "TIM4_IT"
	.db	0
	.dw	0,178
	.uleb128	6
	.dw	0,(Sstm8s_tim4$TIM4_GetITStatus$162)
	.dw	0,(Sstm8s_tim4$TIM4_GetITStatus$164)
	.uleb128	6
	.dw	0,(Sstm8s_tim4$TIM4_GetITStatus$165)
	.dw	0,(Sstm8s_tim4$TIM4_GetITStatus$167)
	.uleb128	9
	.db	1
	.db	80
	.ascii "bitstatus"
	.db	0
	.dw	0,178
	.uleb128	9
	.db	2
	.db	145
	.sleb128	-1
	.ascii "itstatus"
	.db	0
	.dw	0,178
	.uleb128	9
	.db	1
	.db	80
	.ascii "itenable"
	.db	0
	.dw	0,178
	.uleb128	0
	.uleb128	10
	.ascii "TIM4_ClearITPendingBit"
	.db	0
	.dw	0,(_TIM4_ClearITPendingBit)
	.dw	0,(XG$TIM4_ClearITPendingBit$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	2
	.ascii "TIM4_IT"
	.db	0
	.dw	0,178
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
	.dw	0,72
	.ascii "TIM4_DeInit"
	.db	0
	.dw	0,98
	.ascii "TIM4_TimeBaseInit"
	.db	0
	.dw	0,195
	.ascii "TIM4_Cmd"
	.db	0
	.dw	0,258
	.ascii "TIM4_ITConfig"
	.db	0
	.dw	0,342
	.ascii "TIM4_UpdateDisableConfig"
	.db	0
	.dw	0,421
	.ascii "TIM4_UpdateRequestConfig"
	.db	0
	.dw	0,509
	.ascii "TIM4_SelectOnePulseMode"
	.db	0
	.dw	0,590
	.ascii "TIM4_PrescalerConfig"
	.db	0
	.dw	0,675
	.ascii "TIM4_ARRPreloadConfig"
	.db	0
	.dw	0,751
	.ascii "TIM4_GenerateEvent"
	.db	0
	.dw	0,814
	.ascii "TIM4_SetCounter"
	.db	0
	.dw	0,865
	.ascii "TIM4_SetAutoreload"
	.db	0
	.dw	0,922
	.ascii "TIM4_GetCounter"
	.db	0
	.dw	0,956
	.ascii "TIM4_GetPrescaler"
	.db	0
	.dw	0,992
	.ascii "TIM4_GetFlagStatus"
	.db	0
	.dw	0,1087
	.ascii "TIM4_ClearFlag"
	.db	0
	.dw	0,1139
	.ascii "TIM4_GetITStatus"
	.db	0
	.dw	0,1263
	.ascii "TIM4_ClearITPendingBit"
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
	.dw	0,19
	.dw	0,(Ldebug_CIE0_start-4)
	.dw	0,(Sstm8s_tim4$TIM4_ClearITPendingBit$174)	;initial loc
	.dw	0,Sstm8s_tim4$TIM4_ClearITPendingBit$178-Sstm8s_tim4$TIM4_ClearITPendingBit$174
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_ClearITPendingBit$174)
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
	.dw	0,33
	.dw	0,(Ldebug_CIE1_start-4)
	.dw	0,(Sstm8s_tim4$TIM4_GetITStatus$157)	;initial loc
	.dw	0,Sstm8s_tim4$TIM4_GetITStatus$172-Sstm8s_tim4$TIM4_GetITStatus$157
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_GetITStatus$157)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_GetITStatus$158)
	.db	14
	.uleb128	3
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_GetITStatus$170)
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
	.dw	0,(Sstm8s_tim4$TIM4_ClearFlag$151)	;initial loc
	.dw	0,Sstm8s_tim4$TIM4_ClearFlag$155-Sstm8s_tim4$TIM4_ClearFlag$151
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_ClearFlag$151)
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
	.dw	0,(Sstm8s_tim4$TIM4_GetFlagStatus$138)	;initial loc
	.dw	0,Sstm8s_tim4$TIM4_GetFlagStatus$149-Sstm8s_tim4$TIM4_GetFlagStatus$138
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_GetFlagStatus$138)
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
	.dw	0,(Sstm8s_tim4$TIM4_GetPrescaler$132)	;initial loc
	.dw	0,Sstm8s_tim4$TIM4_GetPrescaler$136-Sstm8s_tim4$TIM4_GetPrescaler$132
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_GetPrescaler$132)
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
	.dw	0,(Sstm8s_tim4$TIM4_GetCounter$126)	;initial loc
	.dw	0,Sstm8s_tim4$TIM4_GetCounter$130-Sstm8s_tim4$TIM4_GetCounter$126
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_GetCounter$126)
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
	.dw	0,(Sstm8s_tim4$TIM4_SetAutoreload$120)	;initial loc
	.dw	0,Sstm8s_tim4$TIM4_SetAutoreload$124-Sstm8s_tim4$TIM4_SetAutoreload$120
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_SetAutoreload$120)
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
	.dw	0,(Sstm8s_tim4$TIM4_SetCounter$114)	;initial loc
	.dw	0,Sstm8s_tim4$TIM4_SetCounter$118-Sstm8s_tim4$TIM4_SetCounter$114
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_SetCounter$114)
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
	.dw	0,(Sstm8s_tim4$TIM4_GenerateEvent$108)	;initial loc
	.dw	0,Sstm8s_tim4$TIM4_GenerateEvent$112-Sstm8s_tim4$TIM4_GenerateEvent$108
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_GenerateEvent$108)
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
	.dw	0,19
	.dw	0,(Ldebug_CIE9_start-4)
	.dw	0,(Sstm8s_tim4$TIM4_ARRPreloadConfig$95)	;initial loc
	.dw	0,Sstm8s_tim4$TIM4_ARRPreloadConfig$106-Sstm8s_tim4$TIM4_ARRPreloadConfig$95
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_ARRPreloadConfig$95)
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
	.dw	0,19
	.dw	0,(Ldebug_CIE10_start-4)
	.dw	0,(Sstm8s_tim4$TIM4_PrescalerConfig$88)	;initial loc
	.dw	0,Sstm8s_tim4$TIM4_PrescalerConfig$93-Sstm8s_tim4$TIM4_PrescalerConfig$88
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_PrescalerConfig$88)
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
	.dw	0,(Sstm8s_tim4$TIM4_SelectOnePulseMode$75)	;initial loc
	.dw	0,Sstm8s_tim4$TIM4_SelectOnePulseMode$86-Sstm8s_tim4$TIM4_SelectOnePulseMode$75
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_SelectOnePulseMode$75)
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
	.dw	0,(Sstm8s_tim4$TIM4_UpdateRequestConfig$62)	;initial loc
	.dw	0,Sstm8s_tim4$TIM4_UpdateRequestConfig$73-Sstm8s_tim4$TIM4_UpdateRequestConfig$62
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_UpdateRequestConfig$62)
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
	.dw	0,(Sstm8s_tim4$TIM4_UpdateDisableConfig$49)	;initial loc
	.dw	0,Sstm8s_tim4$TIM4_UpdateDisableConfig$60-Sstm8s_tim4$TIM4_UpdateDisableConfig$49
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_UpdateDisableConfig$49)
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
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$32)	;initial loc
	.dw	0,Sstm8s_tim4$TIM4_ITConfig$47-Sstm8s_tim4$TIM4_ITConfig$32
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$32)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$33)
	.db	14
	.uleb128	3
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$41)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$42)
	.db	14
	.uleb128	3
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_ITConfig$45)
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
	.dw	0,(Sstm8s_tim4$TIM4_Cmd$19)	;initial loc
	.dw	0,Sstm8s_tim4$TIM4_Cmd$30-Sstm8s_tim4$TIM4_Cmd$19
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_Cmd$19)
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
	.dw	0,(Sstm8s_tim4$TIM4_TimeBaseInit$12)	;initial loc
	.dw	0,Sstm8s_tim4$TIM4_TimeBaseInit$17-Sstm8s_tim4$TIM4_TimeBaseInit$12
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_TimeBaseInit$12)
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
	.dw	0,(Sstm8s_tim4$TIM4_DeInit$1)	;initial loc
	.dw	0,Sstm8s_tim4$TIM4_DeInit$10-Sstm8s_tim4$TIM4_DeInit$1
	.db	1
	.dw	0,(Sstm8s_tim4$TIM4_DeInit$1)
	.db	14
	.uleb128	2
