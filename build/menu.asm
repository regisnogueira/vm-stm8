;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.2 #11645 (Linux)
;--------------------------------------------------------
	.module menu
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _process_button
	.globl _interrupt_buttons
	.globl _set_led_period
	.globl _set_display_value
	.globl _set_eeprom_data
	.globl _get_eeprom_data
	.globl _ITC_SetSoftwarePriority
	.globl _GPIO_ReadInputPin
	.globl _GPIO_ReadInputData
	.globl _GPIO_Init
	.globl _EXTI_SetTLISensitivity
	.globl _EXTI_SetExtIntSensitivity
	.globl _EXTI_DeInit
	.globl _btn
	.globl _menu
	.globl _init_menu
	.globl _get_menu_value
	.globl _set_menu_value
	.globl _tmr_menu
	.globl _task_menu
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
G$menu$0_0$0==.
_menu::
	.ds 7
G$btn$0_0$0==.
_btn::
	.ds 9
Lmenu.task_menu$option_dp$1_0$364==.
_task_menu_option_dp_65536_364:
	.ds 1
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
	Smenu$task_menu$230 ==.
;	./user/menu.c: 171: static uint8_t option_dp = 0;
; genAssign
	clr	_task_menu_option_dp_65536_364+0
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
	Smenu$init_menu$0 ==.
;	./user/menu.c: 17: void init_menu(void)
; genLabel
;	-----------------------------------------
;	 function init_menu
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_init_menu:
	Smenu$init_menu$1 ==.
	Smenu$init_menu$2 ==.
;	./user/menu.c: 20: btn_set_dir();
; genIPush
	push	#0x60
	Smenu$init_menu$3 ==.
; genIPush
	push	#0x08
	Smenu$init_menu$4 ==.
; genIPush
	push	#0x0a
	Smenu$init_menu$5 ==.
	push	#0x50
	Smenu$init_menu$6 ==.
; genCall
	call	_GPIO_Init
	addw	sp, #4
	Smenu$init_menu$7 ==.
	Smenu$init_menu$8 ==.
;	./user/menu.c: 21: btn_inc_dir();
; genIPush
	push	#0x60
	Smenu$init_menu$9 ==.
; genIPush
	push	#0x10
	Smenu$init_menu$10 ==.
; genIPush
	push	#0x0a
	Smenu$init_menu$11 ==.
	push	#0x50
	Smenu$init_menu$12 ==.
; genCall
	call	_GPIO_Init
	addw	sp, #4
	Smenu$init_menu$13 ==.
	Smenu$init_menu$14 ==.
;	./user/menu.c: 22: btn_dec_dir();
; genIPush
	push	#0x60
	Smenu$init_menu$15 ==.
; genIPush
	push	#0x20
	Smenu$init_menu$16 ==.
; genIPush
	push	#0x0a
	Smenu$init_menu$17 ==.
	push	#0x50
	Smenu$init_menu$18 ==.
; genCall
	call	_GPIO_Init
	addw	sp, #4
	Smenu$init_menu$19 ==.
	Smenu$init_menu$20 ==.
;	./user/menu.c: 24: EXTI_DeInit();
; genCall
	call	_EXTI_DeInit
	Smenu$init_menu$21 ==.
;	./user/menu.c: 26: disableInterrupts();
;	genInline
	sim
	Smenu$init_menu$22 ==.
;	./user/menu.c: 27: EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);
; genIPush
	push	#0x02
	Smenu$init_menu$23 ==.
; genIPush
	push	#0x02
	Smenu$init_menu$24 ==.
; genCall
	call	_EXTI_SetExtIntSensitivity
	addw	sp, #2
	Smenu$init_menu$25 ==.
	Smenu$init_menu$26 ==.
;	./user/menu.c: 28: EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
; genIPush
	push	#0x00
	Smenu$init_menu$27 ==.
; genCall
	call	_EXTI_SetTLISensitivity
	pop	a
	Smenu$init_menu$28 ==.
	Smenu$init_menu$29 ==.
;	./user/menu.c: 29: ITC_SetSoftwarePriority(ITC_IRQ_PORTC , ITC_PRIORITYLEVEL_3);
; genIPush
	push	#0x03
	Smenu$init_menu$30 ==.
; genIPush
	push	#0x05
	Smenu$init_menu$31 ==.
; genCall
	call	_ITC_SetSoftwarePriority
	addw	sp, #2
	Smenu$init_menu$32 ==.
	Smenu$init_menu$33 ==.
;	./user/menu.c: 30: enableInterrupts();
;	genInline
	rim
	Smenu$init_menu$34 ==.
;	./user/menu.c: 32: menu.idx = 0;
; skipping iCode since result will be rematerialized
; genPointerSet
	mov	_menu+0, #0x00
	Smenu$init_menu$35 ==.
;	./user/menu.c: 33: menu.value = get_menu_value(menu.idx);
; skipping iCode since result will be rematerialized
; genPlus
	ldw	x, #(_menu + 0)+3
; genPointerGet
	ld	a, _menu+0
; genIPush
	pushw	x
	Smenu$init_menu$36 ==.
	push	a
	Smenu$init_menu$37 ==.
; genCall
	call	_get_menu_value
	addw	sp, #1
	Smenu$init_menu$38 ==.
	popw	x
	Smenu$init_menu$39 ==.
; genCast
; genAssign
	clrw	y
	ld	yl, a
; genPointerSet
	ldw	(x), y
; genLabel
00101$:
	Smenu$init_menu$40 ==.
;	./user/menu.c: 35: }
; genEndFunction
	Smenu$init_menu$41 ==.
	XG$init_menu$0$0 ==.
	ret
	Smenu$init_menu$42 ==.
	Smenu$get_menu_value$43 ==.
;	./user/menu.c: 37: uint8_t get_menu_value(uint8_t idx)
; genLabel
;	-----------------------------------------
;	 function get_menu_value
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_get_menu_value:
	Smenu$get_menu_value$44 ==.
	Smenu$get_menu_value$45 ==.
;	./user/menu.c: 40: return (uint8_t)get_eeprom_data(idx);
; genIPush
	ld	a, (0x03, sp)
	push	a
	Smenu$get_menu_value$46 ==.
; genCall
	call	_get_eeprom_data
	pop	a
	Smenu$get_menu_value$47 ==.
	ld	a, xl
; genCast
; genAssign
; genReturn
; genLabel
00101$:
	Smenu$get_menu_value$48 ==.
;	./user/menu.c: 44: }
; genEndFunction
	Smenu$get_menu_value$49 ==.
	XG$get_menu_value$0$0 ==.
	ret
	Smenu$get_menu_value$50 ==.
	Smenu$set_menu_value$51 ==.
;	./user/menu.c: 46: void set_menu_value(void)
; genLabel
;	-----------------------------------------
;	 function set_menu_value
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_set_menu_value:
	Smenu$set_menu_value$52 ==.
	Smenu$set_menu_value$53 ==.
;	./user/menu.c: 49: set_eeprom_data(menu.value, menu.idx);
; skipping iCode since result will be rematerialized
; genPointerGet
	ld	a, _menu+0
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genPointerGet
	ldw	x, _menu+3
; genIPush
	push	a
	Smenu$set_menu_value$54 ==.
; genIPush
	pushw	x
	Smenu$set_menu_value$55 ==.
; genCall
	call	_set_eeprom_data
	addw	sp, #3
	Smenu$set_menu_value$56 ==.
	Smenu$set_menu_value$57 ==.
;	./user/menu.c: 50: menu.write = 0;
; genPlus
	ldw	x, #(_menu + 0)+2
; genPointerSet
	clr	(x)
; genLabel
00101$:
	Smenu$set_menu_value$58 ==.
;	./user/menu.c: 53: }
; genEndFunction
	Smenu$set_menu_value$59 ==.
	XG$set_menu_value$0$0 ==.
	ret
	Smenu$set_menu_value$60 ==.
	Smenu$tmr_menu$61 ==.
;	./user/menu.c: 55: void tmr_menu(void)
; genLabel
;	-----------------------------------------
;	 function tmr_menu
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_tmr_menu:
	Smenu$tmr_menu$62 ==.
	Smenu$tmr_menu$63 ==.
;	./user/menu.c: 58: _decrement(menu.tmr);
; skipping iCode since result will be rematerialized
; genPointerGet
	ldw	x, _menu+5
; genIfx
	tnzw	x
	jrne	00131$
	jp	00102$
00131$:
; genMinus
	decw	x
; genPointerSet
	ldw	_menu+5, x
; genLabel
00102$:
	Smenu$tmr_menu$64 ==.
;	./user/menu.c: 59: _decrement(btn[BTN_SET_IDX].debounce);
; skipping iCode since result will be rematerialized
; genPlus
	ldw	y, #(_btn + 0)+1
; genPointerGet
	ldw	x, y
	ldw	x, (x)
; genIfx
	tnzw	x
	jrne	00132$
	jp	00104$
00132$:
; genMinus
	decw	x
; genPointerSet
	ldw	(y), x
; genLabel
00104$:
	Smenu$tmr_menu$65 ==.
;	./user/menu.c: 60: _decrement(btn[BTN_INC_IDX].debounce);
; genPlus
	ldw	y, #(_btn + 0)+7
; genPointerGet
	ldw	x, y
	ldw	x, (x)
; genIfx
	tnzw	x
	jrne	00133$
	jp	00106$
00133$:
; genMinus
	decw	x
; genPointerSet
	ldw	(y), x
; genLabel
00106$:
	Smenu$tmr_menu$66 ==.
;	./user/menu.c: 61: _decrement(btn[BTN_DEC_IDX].debounce);
; genPlus
	ldw	y, #(_btn + 0)+4
; genPointerGet
	ldw	x, y
	ldw	x, (x)
; genIfx
	tnzw	x
	jrne	00134$
	jp	00109$
00134$:
; genMinus
	decw	x
; genPointerSet
	ldw	(y), x
; genLabel
00109$:
	Smenu$tmr_menu$67 ==.
;	./user/menu.c: 63: }
; genEndFunction
	Smenu$tmr_menu$68 ==.
	XG$tmr_menu$0$0 ==.
	ret
	Smenu$tmr_menu$69 ==.
	Smenu$inc_option$70 ==.
;	./user/menu.c: 65: static void inc_option(void)
; genLabel
;	-----------------------------------------
;	 function inc_option
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_inc_option:
	Smenu$inc_option$71 ==.
	Smenu$inc_option$72 ==.
;	./user/menu.c: 68: menu.value = get_menu_value(menu.idx);
; skipping iCode since result will be rematerialized
; genPlus
	ldw	x, #(_menu + 0)+3
; genPointerGet
	ld	a, _menu+0
; genIPush
	pushw	x
	Smenu$inc_option$73 ==.
	push	a
	Smenu$inc_option$74 ==.
; genCall
	call	_get_menu_value
	addw	sp, #1
	Smenu$inc_option$75 ==.
	popw	x
	Smenu$inc_option$76 ==.
; genCast
; genAssign
	clrw	y
	ld	yl, a
; genPointerSet
	ldw	(x), y
; genLabel
00101$:
	Smenu$inc_option$77 ==.
;	./user/menu.c: 70: }
; genEndFunction
	Smenu$inc_option$78 ==.
	XFmenu$inc_option$0$0 ==.
	ret
	Smenu$inc_option$79 ==.
	Smenu$dec_option$80 ==.
;	./user/menu.c: 72: static void dec_option(void)
; genLabel
;	-----------------------------------------
;	 function dec_option
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_dec_option:
	Smenu$dec_option$81 ==.
	Smenu$dec_option$82 ==.
;	./user/menu.c: 75: menu.value = get_menu_value(menu.idx);
; skipping iCode since result will be rematerialized
; genPlus
	ldw	x, #(_menu + 0)+3
; genPointerGet
	ld	a, _menu+0
; genIPush
	pushw	x
	Smenu$dec_option$83 ==.
	push	a
	Smenu$dec_option$84 ==.
; genCall
	call	_get_menu_value
	addw	sp, #1
	Smenu$dec_option$85 ==.
	popw	x
	Smenu$dec_option$86 ==.
; genCast
; genAssign
	clrw	y
	ld	yl, a
; genPointerSet
	ldw	(x), y
; genLabel
00101$:
	Smenu$dec_option$87 ==.
;	./user/menu.c: 77: }
; genEndFunction
	Smenu$dec_option$88 ==.
	XFmenu$dec_option$0$0 ==.
	ret
	Smenu$dec_option$89 ==.
	Smenu$inc_value$90 ==.
;	./user/menu.c: 79: static void inc_value(void)
; genLabel
;	-----------------------------------------
;	 function inc_value
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_inc_value:
	Smenu$inc_value$91 ==.
	Smenu$inc_value$92 ==.
;	./user/menu.c: 82: if (++menu.value > MAX_VALUE)
; skipping iCode since result will be rematerialized
; genPointerGet
	ldw	x, _menu+3
; genPlus
	incw	x
; genPointerSet
	ldw	_menu+3, x
; genCast
; genAssign
; genCmp
; genCmpTop
	cpw	x, #0x0258
	jrugt	00110$
	jp	00103$
00110$:
; skipping generated iCode
	Smenu$inc_value$93 ==.
;	./user/menu.c: 83: menu.value = 0;
; genPointerSet
	ldw	x, #(_menu + 3)
	clr	(0x1, x)
	clr	(x)
; genLabel
00103$:
	Smenu$inc_value$94 ==.
;	./user/menu.c: 85: }
; genEndFunction
	Smenu$inc_value$95 ==.
	XFmenu$inc_value$0$0 ==.
	ret
	Smenu$inc_value$96 ==.
	Smenu$dec_value$97 ==.
;	./user/menu.c: 87: static void dec_value(void)
; genLabel
;	-----------------------------------------
;	 function dec_value
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_dec_value:
	Smenu$dec_value$98 ==.
	Smenu$dec_value$99 ==.
;	./user/menu.c: 90: if (menu.value) {
; skipping iCode since result will be rematerialized
; genPointerGet
	ldw	x, _menu+3
; genIfx
	tnzw	x
	jrne	00111$
	jp	00102$
00111$:
	Smenu$dec_value$100 ==.
	Smenu$dec_value$101 ==.
;	./user/menu.c: 91: menu.value--;
; genMinus
	decw	x
; genPointerSet
	ldw	_menu+3, x
	Smenu$dec_value$102 ==.
; genGoto
	jp	00104$
; genLabel
00102$:
	Smenu$dec_value$103 ==.
	Smenu$dec_value$104 ==.
;	./user/menu.c: 93: menu.value = MAX_VALUE;
; genPointerSet
	mov	_menu+4, #0x58
	mov	_menu+3, #0x02
	Smenu$dec_value$105 ==.
; genLabel
00104$:
	Smenu$dec_value$106 ==.
;	./user/menu.c: 96: }
; genEndFunction
	Smenu$dec_value$107 ==.
	XFmenu$dec_value$0$0 ==.
	ret
	Smenu$dec_value$108 ==.
	Smenu$interrupt_buttons$109 ==.
;	./user/menu.c: 98: void interrupt_buttons(void)
; genLabel
;	-----------------------------------------
;	 function interrupt_buttons
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 2 bytes.
_interrupt_buttons:
	Smenu$interrupt_buttons$110 ==.
	sub	sp, #2
	Smenu$interrupt_buttons$111 ==.
	Smenu$interrupt_buttons$112 ==.
;	./user/menu.c: 102: if ((GPIO_ReadInputData(BTN_PORT) & BTN_SET_PIN_NUM) == 0x00) {
; genIPush
	push	#0x0a
	Smenu$interrupt_buttons$113 ==.
	push	#0x50
	Smenu$interrupt_buttons$114 ==.
; genCall
	call	_GPIO_ReadInputData
	addw	sp, #2
	Smenu$interrupt_buttons$115 ==.
; genAnd
	bcp	a, #0x08
	jreq	00147$
	jp	00113$
00147$:
; skipping generated iCode
	Smenu$interrupt_buttons$116 ==.
	Smenu$interrupt_buttons$117 ==.
;	./user/menu.c: 103: if (!btn[BTN_SET_IDX].debounce) {
; skipping iCode since result will be rematerialized
; genPlus
	ldw	y, #(_btn + 0)+1
; genPointerGet
	ldw	x, y
	ldw	x, (x)
; genIfx
	tnzw	x
	jreq	00148$
	jp	00115$
00148$:
	Smenu$interrupt_buttons$118 ==.
	Smenu$interrupt_buttons$119 ==.
;	./user/menu.c: 104: btn[BTN_SET_IDX].debounce = BTN_DEBOUNCE;
; genPointerSet
	ldw	x, y
	ldw	y, #0x0032
	ldw	(x), y
	Smenu$interrupt_buttons$120 ==.
;	./user/menu.c: 105: btn[BTN_SET_IDX].status = BTN_STAT_PRESSED;
; genPointerSet
	mov	_btn+0, #0x01
	Smenu$interrupt_buttons$121 ==.
; genGoto
	jp	00115$
; genLabel
00113$:
	Smenu$interrupt_buttons$122 ==.
;	./user/menu.c: 108: if ((GPIO_ReadInputData(BTN_PORT) & BTN_INC_PIN_NUM) == 0x00) {
; genIPush
	push	#0x0a
	Smenu$interrupt_buttons$123 ==.
	push	#0x50
	Smenu$interrupt_buttons$124 ==.
; genCall
	call	_GPIO_ReadInputData
	addw	sp, #2
	Smenu$interrupt_buttons$125 ==.
; genAnd
	bcp	a, #0x10
	jreq	00149$
	jp	00110$
00149$:
; skipping generated iCode
	Smenu$interrupt_buttons$126 ==.
	Smenu$interrupt_buttons$127 ==.
;	./user/menu.c: 109: if (!btn[BTN_INC_IDX].debounce) {
; skipping iCode since result will be rematerialized
; genPlus
	ldw	x, #(_btn + 0)+6
	ldw	(0x01, sp), x
; genPlus
	ldw	y, #(_btn + 0)+7
; genPointerGet
	ldw	x, y
	ldw	x, (x)
; genIfx
	tnzw	x
	jreq	00150$
	jp	00115$
00150$:
	Smenu$interrupt_buttons$128 ==.
	Smenu$interrupt_buttons$129 ==.
;	./user/menu.c: 110: btn[BTN_INC_IDX].debounce = BTN_DEBOUNCE;
; genPointerSet
	ldw	x, y
	ldw	y, #0x0032
	ldw	(x), y
	Smenu$interrupt_buttons$130 ==.
;	./user/menu.c: 111: btn[BTN_INC_IDX].status = BTN_STAT_PRESSED;
; genPointerSet
	ldw	x, (0x01, sp)
	ld	a, #0x01
	ld	(x), a
	Smenu$interrupt_buttons$131 ==.
;	./user/menu.c: 112: menu.tmr = TIME_HOLD_BUTTON;
; skipping iCode since result will be rematerialized
; genPointerSet
	mov	_menu+6, #0xdc
	mov	_menu+5, #0x05
	Smenu$interrupt_buttons$132 ==.
; genGoto
	jp	00115$
; genLabel
00110$:
	Smenu$interrupt_buttons$133 ==.
;	./user/menu.c: 115: if ((GPIO_ReadInputData(BTN_PORT) & BTN_DEC_PIN_NUM) == 0x00) {
; genIPush
	push	#0x0a
	Smenu$interrupt_buttons$134 ==.
	push	#0x50
	Smenu$interrupt_buttons$135 ==.
; genCall
	call	_GPIO_ReadInputData
	addw	sp, #2
	Smenu$interrupt_buttons$136 ==.
; genAnd
	bcp	a, #0x20
	jreq	00151$
	jp	00115$
00151$:
; skipping generated iCode
	Smenu$interrupt_buttons$137 ==.
	Smenu$interrupt_buttons$138 ==.
;	./user/menu.c: 116: if (!btn[BTN_DEC_IDX].debounce) {
; skipping iCode since result will be rematerialized
; genPlus
	ldw	x, #(_btn + 0)+3
	ldw	(0x01, sp), x
; genPlus
	ldw	y, #(_btn + 0)+4
; genPointerGet
	ldw	x, y
	ldw	x, (x)
; genIfx
	tnzw	x
	jreq	00152$
	jp	00115$
00152$:
	Smenu$interrupt_buttons$139 ==.
	Smenu$interrupt_buttons$140 ==.
;	./user/menu.c: 117: btn[BTN_DEC_IDX].debounce = BTN_DEBOUNCE;
; genPointerSet
	ldw	x, y
	ldw	y, #0x0032
	ldw	(x), y
	Smenu$interrupt_buttons$141 ==.
;	./user/menu.c: 118: btn[BTN_DEC_IDX].status = BTN_STAT_PRESSED;
; genPointerSet
	ldw	x, (0x01, sp)
	ld	a, #0x01
	ld	(x), a
	Smenu$interrupt_buttons$142 ==.
;	./user/menu.c: 119: menu.tmr = TIME_HOLD_BUTTON;
; skipping iCode since result will be rematerialized
; genPointerSet
	mov	_menu+6, #0xdc
	mov	_menu+5, #0x05
	Smenu$interrupt_buttons$143 ==.
; genLabel
00115$:
	Smenu$interrupt_buttons$144 ==.
;	./user/menu.c: 123: }
; genEndFunction
	addw	sp, #2
	Smenu$interrupt_buttons$145 ==.
	Smenu$interrupt_buttons$146 ==.
	XG$interrupt_buttons$0$0 ==.
	ret
	Smenu$interrupt_buttons$147 ==.
	Smenu$process_button$148 ==.
;	./user/menu.c: 125: void process_button(void)
; genLabel
;	-----------------------------------------
;	 function process_button
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 4 bytes.
_process_button:
	Smenu$process_button$149 ==.
	sub	sp, #4
	Smenu$process_button$150 ==.
	Smenu$process_button$151 ==.
;	./user/menu.c: 128: if (btn[BTN_SET_IDX].status == BTN_STAT_PRESSED) {
; genAddrOf
	ldw	x, #_btn+0
; genPointerGet
	ld	a, (x)
; genCmpEQorNE
	dec	a
	jrne	00183$
	jp	00184$
00183$:
	jp	00104$
00184$:
	Smenu$process_button$152 ==.
; skipping generated iCode
	Smenu$process_button$153 ==.
	Smenu$process_button$154 ==.
;	./user/menu.c: 129: btn[BTN_SET_IDX].status = BTN_STAT_FREE;
; genPointerSet
	clr	(x)
	Smenu$process_button$155 ==.
;	./user/menu.c: 130: if (menu.edit)
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genPointerGet
	ld	a, _menu+1
; genIfx
	tnz	a
	jrne	00185$
	jp	00104$
00185$:
	Smenu$process_button$156 ==.
;	./user/menu.c: 131: menu.write = 1; 
; genPlus
	ldw	x, #(_menu + 0)+2
; genPointerSet
	ld	a, #0x01
	ld	(x), a
	Smenu$process_button$157 ==.
; genLabel
00104$:
	Smenu$process_button$158 ==.
;	./user/menu.c: 134: if (btn[BTN_INC_IDX].status == BTN_STAT_PRESSED) {
; skipping iCode since result will be rematerialized
; genPlus
	ldw	x, #(_btn + 0)+6
	ldw	(0x01, sp), x
; genPointerGet
	ldw	x, (0x01, sp)
	ld	a, (x)
; genCmpEQorNE
	dec	a
	jrne	00187$
	jp	00188$
00187$:
	jp	00109$
00188$:
	Smenu$process_button$159 ==.
; skipping generated iCode
	Smenu$process_button$160 ==.
	Smenu$process_button$161 ==.
;	./user/menu.c: 135: btn[BTN_INC_IDX].status = BTN_STAT_FREE;
; genPointerSet
	ldw	x, (0x01, sp)
	clr	(x)
	Smenu$process_button$162 ==.
;	./user/menu.c: 136: if (!menu.edit)
; skipping iCode since result will be rematerialized
; genPointerGet
	ld	a, _menu+1
; genIfx
	tnz	a
	jreq	00189$
	jp	00106$
00189$:
	Smenu$process_button$163 ==.
;	./user/menu.c: 137: inc_option();
; genCall
	call	_inc_option
; genGoto
	jp	00109$
; genLabel
00106$:
	Smenu$process_button$164 ==.
;	./user/menu.c: 139: inc_value();
; genCall
	call	_inc_value
	Smenu$process_button$165 ==.
; genLabel
00109$:
	Smenu$process_button$166 ==.
;	./user/menu.c: 141: if (btn[BTN_DEC_IDX].status == BTN_STAT_PRESSED) {
; genPlus
	ldw	x, #(_btn + 0)+3
	ldw	(0x03, sp), x
; genPointerGet
	ldw	x, (0x03, sp)
	ld	a, (x)
; genCmpEQorNE
	dec	a
	jrne	00191$
	jp	00192$
00191$:
	jp	00114$
00192$:
	Smenu$process_button$167 ==.
; skipping generated iCode
	Smenu$process_button$168 ==.
	Smenu$process_button$169 ==.
;	./user/menu.c: 142: btn[BTN_DEC_IDX].status = BTN_STAT_FREE;
; genPointerSet
	ldw	x, (0x03, sp)
	clr	(x)
	Smenu$process_button$170 ==.
;	./user/menu.c: 143: if (!menu.edit)
; skipping iCode since result will be rematerialized
; genPointerGet
	ld	a, _menu+1
; genIfx
	tnz	a
	jreq	00193$
	jp	00111$
00193$:
	Smenu$process_button$171 ==.
;	./user/menu.c: 144: dec_option();
; genCall
	call	_dec_option
; genGoto
	jp	00114$
; genLabel
00111$:
	Smenu$process_button$172 ==.
;	./user/menu.c: 146: dec_value();
; genCall
	call	_dec_value
	Smenu$process_button$173 ==.
; genLabel
00114$:
	Smenu$process_button$174 ==.
;	./user/menu.c: 148: if (!btn_set()) {
; genIPush
	push	#0x08
	Smenu$process_button$175 ==.
; genIPush
	push	#0x0a
	Smenu$process_button$176 ==.
	push	#0x50
	Smenu$process_button$177 ==.
; genCall
	call	_GPIO_ReadInputPin
	addw	sp, #3
	Smenu$process_button$178 ==.
; genIfx
	tnz	a
	jreq	00194$
	jp	00116$
00194$:
	Smenu$process_button$179 ==.
	Smenu$process_button$180 ==.
;	./user/menu.c: 149: btn[BTN_SET_IDX].debounce = BTN_DEBOUNCE;
; genPlus
	ldw	x, #(_btn + 0)+1
; genPointerSet
	ldw	y, #0x0032
	ldw	(x), y
	Smenu$process_button$181 ==.
; genLabel
00116$:
	Smenu$process_button$182 ==.
;	./user/menu.c: 151: if (!btn_inc()) {
; genIPush
	push	#0x10
	Smenu$process_button$183 ==.
; genIPush
	push	#0x0a
	Smenu$process_button$184 ==.
	push	#0x50
	Smenu$process_button$185 ==.
; genCall
	call	_GPIO_ReadInputPin
	addw	sp, #3
	Smenu$process_button$186 ==.
; genIfx
	tnz	a
	jreq	00195$
	jp	00120$
00195$:
	Smenu$process_button$187 ==.
	Smenu$process_button$188 ==.
;	./user/menu.c: 152: btn[BTN_INC_IDX].debounce = BTN_DEBOUNCE;
; genPlus
	ldw	x, #(_btn + 0)+7
; genPointerSet
	ldw	y, #0x0032
	ldw	(x), y
	Smenu$process_button$189 ==.
;	./user/menu.c: 153: if (!menu.tmr) {
; skipping iCode since result will be rematerialized
; genPointerGet
	ldw	x, _menu+5
; genIfx
	tnzw	x
	jreq	00196$
	jp	00120$
00196$:
	Smenu$process_button$190 ==.
	Smenu$process_button$191 ==.
;	./user/menu.c: 154: btn[BTN_INC_IDX].status = BTN_STAT_PRESSED;
; genPointerSet
	ldw	x, (0x01, sp)
	ld	a, #0x01
	ld	(x), a
	Smenu$process_button$192 ==.
;	./user/menu.c: 155: menu.tmr = TIME_CHANGE_VALUE;
; genPointerSet
	mov	_menu+6, #0x64
	mov	_menu+5, #0x00
	Smenu$process_button$193 ==.
; genLabel
00120$:
	Smenu$process_button$194 ==.
;	./user/menu.c: 158: if (!btn_dec()) {
; genIPush
	push	#0x20
	Smenu$process_button$195 ==.
; genIPush
	push	#0x0a
	Smenu$process_button$196 ==.
	push	#0x50
	Smenu$process_button$197 ==.
; genCall
	call	_GPIO_ReadInputPin
	addw	sp, #3
	Smenu$process_button$198 ==.
; genIfx
	tnz	a
	jreq	00197$
	jp	00125$
00197$:
	Smenu$process_button$199 ==.
	Smenu$process_button$200 ==.
;	./user/menu.c: 159: btn[BTN_DEC_IDX].debounce = BTN_DEBOUNCE;
; genPlus
	ldw	x, #(_btn + 0)+4
; genPointerSet
	ldw	y, #0x0032
	ldw	(x), y
	Smenu$process_button$201 ==.
;	./user/menu.c: 160: if (!menu.tmr) {
; skipping iCode since result will be rematerialized
; genPointerGet
	ldw	x, _menu+5
; genIfx
	tnzw	x
	jreq	00198$
	jp	00125$
00198$:
	Smenu$process_button$202 ==.
	Smenu$process_button$203 ==.
;	./user/menu.c: 161: btn[BTN_DEC_IDX].status = BTN_STAT_PRESSED;
; genPointerSet
	ldw	x, (0x03, sp)
	ld	a, #0x01
	ld	(x), a
	Smenu$process_button$204 ==.
;	./user/menu.c: 162: menu.tmr = TIME_CHANGE_VALUE;
; genPointerSet
	mov	_menu+6, #0x64
	mov	_menu+5, #0x00
	Smenu$process_button$205 ==.
; genLabel
00125$:
	Smenu$process_button$206 ==.
;	./user/menu.c: 166: }
; genEndFunction
	addw	sp, #4
	Smenu$process_button$207 ==.
	Smenu$process_button$208 ==.
	XG$process_button$0$0 ==.
	ret
	Smenu$process_button$209 ==.
	Smenu$task_menu$210 ==.
;	./user/menu.c: 168: void task_menu(void)
; genLabel
;	-----------------------------------------
;	 function task_menu
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_task_menu:
	Smenu$task_menu$211 ==.
	Smenu$task_menu$212 ==.
;	./user/menu.c: 173: process_button();
; genCall
	call	_process_button
	Smenu$task_menu$213 ==.
;	./user/menu.c: 175: if (!tick)
; genIfx
	tnz	_tick+0
	jreq	00117$
	jp	00102$
00117$:
	Smenu$task_menu$214 ==.
;	./user/menu.c: 176: return;
; genReturn
	jp	00105$
; genLabel
00102$:
	Smenu$task_menu$215 ==.
;	./user/menu.c: 178: if (menu.write)
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genPointerGet
	ld	a, _menu+2
; genIfx
	tnz	a
	jrne	00118$
	jp	00104$
00118$:
	Smenu$task_menu$216 ==.
;	./user/menu.c: 179: set_menu_value();
; genCall
	call	_set_menu_value
; genLabel
00104$:
	Smenu$task_menu$217 ==.
;	./user/menu.c: 182: menu.edit = 1;
; genPlus
	ldw	x, #(_menu + 0)+1
; genPointerSet
	ld	a, #0x01
	ld	(x), a
	Smenu$task_menu$218 ==.
;	./user/menu.c: 184: set_display_value(menu.value, 1);//par[menu.idx].dp);
; genPlus
	ldw	x, #(_menu + 0)+3
; genPointerGet
	ldw	y, x
	ldw	y, (y)
; genIPush
	pushw	x
	Smenu$task_menu$219 ==.
	push	#0x01
	Smenu$task_menu$220 ==.
; genIPush
	pushw	y
	Smenu$task_menu$221 ==.
; genCall
	call	_set_display_value
	addw	sp, #3
	Smenu$task_menu$222 ==.
	popw	x
	Smenu$task_menu$223 ==.
	Smenu$task_menu$224 ==.
;	./user/menu.c: 185: set_led_period(menu.value);
; genPointerGet
	ldw	x, (x)
; genIPush
	pushw	x
	Smenu$task_menu$225 ==.
; genCall
	call	_set_led_period
	addw	sp, #2
	Smenu$task_menu$226 ==.
; genLabel
00105$:
	Smenu$task_menu$227 ==.
;	./user/menu.c: 187: }
; genEndFunction
	Smenu$task_menu$228 ==.
	XG$task_menu$0$0 ==.
	ret
	Smenu$task_menu$229 ==.
	.area CODE
	.area CONST
Fmenu$par$0_0$0 == .
_par:
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x01	; 1
	.db #0x43	; 67	'C'
	.db #0x01	; 1
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x4c	; 76	'L'
	.db #0x01	; 1
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0x45	; 69	'E'
	.db #0x01	; 1
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
	.ascii "./user/menu.c"
	.db	0
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.db	0
Ldebug_line_stmt:
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smenu$init_menu$0)
	.db	3
	.sleb128	16
	.db	1
	.db	9
	.dw	Smenu$init_menu$2-Smenu$init_menu$0
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Smenu$init_menu$8-Smenu$init_menu$2
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$init_menu$14-Smenu$init_menu$8
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$init_menu$20-Smenu$init_menu$14
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Smenu$init_menu$21-Smenu$init_menu$20
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Smenu$init_menu$22-Smenu$init_menu$21
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$init_menu$26-Smenu$init_menu$22
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$init_menu$29-Smenu$init_menu$26
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$init_menu$33-Smenu$init_menu$29
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$init_menu$34-Smenu$init_menu$33
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Smenu$init_menu$35-Smenu$init_menu$34
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$init_menu$40-Smenu$init_menu$35
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Smenu$init_menu$41-Smenu$init_menu$40
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smenu$get_menu_value$43)
	.db	3
	.sleb128	36
	.db	1
	.db	9
	.dw	Smenu$get_menu_value$45-Smenu$get_menu_value$43
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Smenu$get_menu_value$48-Smenu$get_menu_value$45
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	1+Smenu$get_menu_value$49-Smenu$get_menu_value$48
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smenu$set_menu_value$51)
	.db	3
	.sleb128	45
	.db	1
	.db	9
	.dw	Smenu$set_menu_value$53-Smenu$set_menu_value$51
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Smenu$set_menu_value$57-Smenu$set_menu_value$53
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$set_menu_value$58-Smenu$set_menu_value$57
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	1+Smenu$set_menu_value$59-Smenu$set_menu_value$58
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smenu$tmr_menu$61)
	.db	3
	.sleb128	54
	.db	1
	.db	9
	.dw	Smenu$tmr_menu$63-Smenu$tmr_menu$61
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Smenu$tmr_menu$64-Smenu$tmr_menu$63
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$tmr_menu$65-Smenu$tmr_menu$64
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$tmr_menu$66-Smenu$tmr_menu$65
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$tmr_menu$67-Smenu$tmr_menu$66
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Smenu$tmr_menu$68-Smenu$tmr_menu$67
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smenu$inc_option$70)
	.db	3
	.sleb128	64
	.db	1
	.db	9
	.dw	Smenu$inc_option$72-Smenu$inc_option$70
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Smenu$inc_option$77-Smenu$inc_option$72
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Smenu$inc_option$78-Smenu$inc_option$77
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smenu$dec_option$80)
	.db	3
	.sleb128	71
	.db	1
	.db	9
	.dw	Smenu$dec_option$82-Smenu$dec_option$80
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Smenu$dec_option$87-Smenu$dec_option$82
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Smenu$dec_option$88-Smenu$dec_option$87
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smenu$inc_value$90)
	.db	3
	.sleb128	78
	.db	1
	.db	9
	.dw	Smenu$inc_value$92-Smenu$inc_value$90
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Smenu$inc_value$93-Smenu$inc_value$92
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$inc_value$94-Smenu$inc_value$93
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Smenu$inc_value$95-Smenu$inc_value$94
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smenu$dec_value$97)
	.db	3
	.sleb128	86
	.db	1
	.db	9
	.dw	Smenu$dec_value$99-Smenu$dec_value$97
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Smenu$dec_value$101-Smenu$dec_value$99
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$dec_value$104-Smenu$dec_value$101
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Smenu$dec_value$106-Smenu$dec_value$104
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	1+Smenu$dec_value$107-Smenu$dec_value$106
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smenu$interrupt_buttons$109)
	.db	3
	.sleb128	97
	.db	1
	.db	9
	.dw	Smenu$interrupt_buttons$112-Smenu$interrupt_buttons$109
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	Smenu$interrupt_buttons$117-Smenu$interrupt_buttons$112
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$interrupt_buttons$119-Smenu$interrupt_buttons$117
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$interrupt_buttons$120-Smenu$interrupt_buttons$119
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$interrupt_buttons$122-Smenu$interrupt_buttons$120
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Smenu$interrupt_buttons$127-Smenu$interrupt_buttons$122
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$interrupt_buttons$129-Smenu$interrupt_buttons$127
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$interrupt_buttons$130-Smenu$interrupt_buttons$129
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$interrupt_buttons$131-Smenu$interrupt_buttons$130
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$interrupt_buttons$133-Smenu$interrupt_buttons$131
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Smenu$interrupt_buttons$138-Smenu$interrupt_buttons$133
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$interrupt_buttons$140-Smenu$interrupt_buttons$138
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$interrupt_buttons$141-Smenu$interrupt_buttons$140
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$interrupt_buttons$142-Smenu$interrupt_buttons$141
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$interrupt_buttons$144-Smenu$interrupt_buttons$142
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	1+Smenu$interrupt_buttons$146-Smenu$interrupt_buttons$144
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smenu$process_button$148)
	.db	3
	.sleb128	124
	.db	1
	.db	9
	.dw	Smenu$process_button$151-Smenu$process_button$148
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Smenu$process_button$154-Smenu$process_button$151
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$process_button$155-Smenu$process_button$154
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$process_button$156-Smenu$process_button$155
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$process_button$158-Smenu$process_button$156
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Smenu$process_button$161-Smenu$process_button$158
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$process_button$162-Smenu$process_button$161
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$process_button$163-Smenu$process_button$162
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$process_button$164-Smenu$process_button$163
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Smenu$process_button$166-Smenu$process_button$164
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Smenu$process_button$169-Smenu$process_button$166
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$process_button$170-Smenu$process_button$169
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$process_button$171-Smenu$process_button$170
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$process_button$172-Smenu$process_button$171
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Smenu$process_button$174-Smenu$process_button$172
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Smenu$process_button$180-Smenu$process_button$174
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$process_button$182-Smenu$process_button$180
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Smenu$process_button$188-Smenu$process_button$182
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$process_button$189-Smenu$process_button$188
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$process_button$191-Smenu$process_button$189
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$process_button$192-Smenu$process_button$191
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$process_button$194-Smenu$process_button$192
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Smenu$process_button$200-Smenu$process_button$194
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$process_button$201-Smenu$process_button$200
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$process_button$203-Smenu$process_button$201
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$process_button$204-Smenu$process_button$203
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$process_button$206-Smenu$process_button$204
	.db	3
	.sleb128	4
	.db	1
	.db	9
	.dw	1+Smenu$process_button$208-Smenu$process_button$206
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smenu$task_menu$210)
	.db	3
	.sleb128	167
	.db	1
	.db	9
	.dw	Smenu$task_menu$212-Smenu$task_menu$210
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	Smenu$task_menu$213-Smenu$task_menu$212
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Smenu$task_menu$214-Smenu$task_menu$213
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$task_menu$215-Smenu$task_menu$214
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Smenu$task_menu$216-Smenu$task_menu$215
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$task_menu$217-Smenu$task_menu$216
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	Smenu$task_menu$218-Smenu$task_menu$217
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	Smenu$task_menu$224-Smenu$task_menu$218
	.db	3
	.sleb128	1
	.db	1
	.db	9
	.dw	Smenu$task_menu$227-Smenu$task_menu$224
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Smenu$task_menu$228-Smenu$task_menu$227
	.db	0
	.uleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smenu$task_menu$230)
	.db	3
	.sleb128	170
	.db	1
Ldebug_line_end:

	.area .debug_loc (NOLOAD)
Ldebug_loc_start:
	.dw	0,(Smenu$task_menu$226)
	.dw	0,(Smenu$task_menu$229)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Smenu$task_menu$225)
	.dw	0,(Smenu$task_menu$226)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Smenu$task_menu$223)
	.dw	0,(Smenu$task_menu$225)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Smenu$task_menu$222)
	.dw	0,(Smenu$task_menu$223)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Smenu$task_menu$221)
	.dw	0,(Smenu$task_menu$222)
	.dw	2
	.db	120
	.sleb128	6
	.dw	0,(Smenu$task_menu$220)
	.dw	0,(Smenu$task_menu$221)
	.dw	2
	.db	120
	.sleb128	4
	.dw	0,(Smenu$task_menu$219)
	.dw	0,(Smenu$task_menu$220)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Smenu$task_menu$211)
	.dw	0,(Smenu$task_menu$219)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Smenu$process_button$207)
	.dw	0,(Smenu$process_button$209)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Smenu$process_button$198)
	.dw	0,(Smenu$process_button$207)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Smenu$process_button$197)
	.dw	0,(Smenu$process_button$198)
	.dw	2
	.db	120
	.sleb128	8
	.dw	0,(Smenu$process_button$196)
	.dw	0,(Smenu$process_button$197)
	.dw	2
	.db	120
	.sleb128	7
	.dw	0,(Smenu$process_button$195)
	.dw	0,(Smenu$process_button$196)
	.dw	2
	.db	120
	.sleb128	6
	.dw	0,(Smenu$process_button$186)
	.dw	0,(Smenu$process_button$195)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Smenu$process_button$185)
	.dw	0,(Smenu$process_button$186)
	.dw	2
	.db	120
	.sleb128	8
	.dw	0,(Smenu$process_button$184)
	.dw	0,(Smenu$process_button$185)
	.dw	2
	.db	120
	.sleb128	7
	.dw	0,(Smenu$process_button$183)
	.dw	0,(Smenu$process_button$184)
	.dw	2
	.db	120
	.sleb128	6
	.dw	0,(Smenu$process_button$178)
	.dw	0,(Smenu$process_button$183)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Smenu$process_button$177)
	.dw	0,(Smenu$process_button$178)
	.dw	2
	.db	120
	.sleb128	8
	.dw	0,(Smenu$process_button$176)
	.dw	0,(Smenu$process_button$177)
	.dw	2
	.db	120
	.sleb128	7
	.dw	0,(Smenu$process_button$175)
	.dw	0,(Smenu$process_button$176)
	.dw	2
	.db	120
	.sleb128	6
	.dw	0,(Smenu$process_button$167)
	.dw	0,(Smenu$process_button$175)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Smenu$process_button$159)
	.dw	0,(Smenu$process_button$167)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Smenu$process_button$152)
	.dw	0,(Smenu$process_button$159)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Smenu$process_button$150)
	.dw	0,(Smenu$process_button$152)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Smenu$process_button$149)
	.dw	0,(Smenu$process_button$150)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Smenu$interrupt_buttons$145)
	.dw	0,(Smenu$interrupt_buttons$147)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Smenu$interrupt_buttons$136)
	.dw	0,(Smenu$interrupt_buttons$145)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Smenu$interrupt_buttons$135)
	.dw	0,(Smenu$interrupt_buttons$136)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Smenu$interrupt_buttons$134)
	.dw	0,(Smenu$interrupt_buttons$135)
	.dw	2
	.db	120
	.sleb128	4
	.dw	0,(Smenu$interrupt_buttons$125)
	.dw	0,(Smenu$interrupt_buttons$134)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Smenu$interrupt_buttons$124)
	.dw	0,(Smenu$interrupt_buttons$125)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Smenu$interrupt_buttons$123)
	.dw	0,(Smenu$interrupt_buttons$124)
	.dw	2
	.db	120
	.sleb128	4
	.dw	0,(Smenu$interrupt_buttons$115)
	.dw	0,(Smenu$interrupt_buttons$123)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Smenu$interrupt_buttons$114)
	.dw	0,(Smenu$interrupt_buttons$115)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Smenu$interrupt_buttons$113)
	.dw	0,(Smenu$interrupt_buttons$114)
	.dw	2
	.db	120
	.sleb128	4
	.dw	0,(Smenu$interrupt_buttons$111)
	.dw	0,(Smenu$interrupt_buttons$113)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Smenu$interrupt_buttons$110)
	.dw	0,(Smenu$interrupt_buttons$111)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Smenu$dec_value$98)
	.dw	0,(Smenu$dec_value$108)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Smenu$inc_value$91)
	.dw	0,(Smenu$inc_value$96)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Smenu$dec_option$86)
	.dw	0,(Smenu$dec_option$89)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Smenu$dec_option$85)
	.dw	0,(Smenu$dec_option$86)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Smenu$dec_option$84)
	.dw	0,(Smenu$dec_option$85)
	.dw	2
	.db	120
	.sleb128	4
	.dw	0,(Smenu$dec_option$83)
	.dw	0,(Smenu$dec_option$84)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Smenu$dec_option$81)
	.dw	0,(Smenu$dec_option$83)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Smenu$inc_option$76)
	.dw	0,(Smenu$inc_option$79)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Smenu$inc_option$75)
	.dw	0,(Smenu$inc_option$76)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Smenu$inc_option$74)
	.dw	0,(Smenu$inc_option$75)
	.dw	2
	.db	120
	.sleb128	4
	.dw	0,(Smenu$inc_option$73)
	.dw	0,(Smenu$inc_option$74)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Smenu$inc_option$71)
	.dw	0,(Smenu$inc_option$73)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Smenu$tmr_menu$62)
	.dw	0,(Smenu$tmr_menu$69)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Smenu$set_menu_value$56)
	.dw	0,(Smenu$set_menu_value$60)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Smenu$set_menu_value$55)
	.dw	0,(Smenu$set_menu_value$56)
	.dw	2
	.db	120
	.sleb128	4
	.dw	0,(Smenu$set_menu_value$54)
	.dw	0,(Smenu$set_menu_value$55)
	.dw	2
	.db	120
	.sleb128	2
	.dw	0,(Smenu$set_menu_value$52)
	.dw	0,(Smenu$set_menu_value$54)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Smenu$get_menu_value$47)
	.dw	0,(Smenu$get_menu_value$50)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Smenu$get_menu_value$46)
	.dw	0,(Smenu$get_menu_value$47)
	.dw	2
	.db	120
	.sleb128	2
	.dw	0,(Smenu$get_menu_value$44)
	.dw	0,(Smenu$get_menu_value$46)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Smenu$init_menu$39)
	.dw	0,(Smenu$init_menu$42)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Smenu$init_menu$38)
	.dw	0,(Smenu$init_menu$39)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Smenu$init_menu$37)
	.dw	0,(Smenu$init_menu$38)
	.dw	2
	.db	120
	.sleb128	4
	.dw	0,(Smenu$init_menu$36)
	.dw	0,(Smenu$init_menu$37)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Smenu$init_menu$32)
	.dw	0,(Smenu$init_menu$36)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Smenu$init_menu$31)
	.dw	0,(Smenu$init_menu$32)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Smenu$init_menu$30)
	.dw	0,(Smenu$init_menu$31)
	.dw	2
	.db	120
	.sleb128	2
	.dw	0,(Smenu$init_menu$28)
	.dw	0,(Smenu$init_menu$30)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Smenu$init_menu$27)
	.dw	0,(Smenu$init_menu$28)
	.dw	2
	.db	120
	.sleb128	2
	.dw	0,(Smenu$init_menu$25)
	.dw	0,(Smenu$init_menu$27)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Smenu$init_menu$24)
	.dw	0,(Smenu$init_menu$25)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Smenu$init_menu$23)
	.dw	0,(Smenu$init_menu$24)
	.dw	2
	.db	120
	.sleb128	2
	.dw	0,(Smenu$init_menu$19)
	.dw	0,(Smenu$init_menu$23)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Smenu$init_menu$18)
	.dw	0,(Smenu$init_menu$19)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Smenu$init_menu$17)
	.dw	0,(Smenu$init_menu$18)
	.dw	2
	.db	120
	.sleb128	4
	.dw	0,(Smenu$init_menu$16)
	.dw	0,(Smenu$init_menu$17)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Smenu$init_menu$15)
	.dw	0,(Smenu$init_menu$16)
	.dw	2
	.db	120
	.sleb128	2
	.dw	0,(Smenu$init_menu$13)
	.dw	0,(Smenu$init_menu$15)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Smenu$init_menu$12)
	.dw	0,(Smenu$init_menu$13)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Smenu$init_menu$11)
	.dw	0,(Smenu$init_menu$12)
	.dw	2
	.db	120
	.sleb128	4
	.dw	0,(Smenu$init_menu$10)
	.dw	0,(Smenu$init_menu$11)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Smenu$init_menu$9)
	.dw	0,(Smenu$init_menu$10)
	.dw	2
	.db	120
	.sleb128	2
	.dw	0,(Smenu$init_menu$7)
	.dw	0,(Smenu$init_menu$9)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Smenu$init_menu$6)
	.dw	0,(Smenu$init_menu$7)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Smenu$init_menu$5)
	.dw	0,(Smenu$init_menu$6)
	.dw	2
	.db	120
	.sleb128	4
	.dw	0,(Smenu$init_menu$4)
	.dw	0,(Smenu$init_menu$5)
	.dw	2
	.db	120
	.sleb128	3
	.dw	0,(Smenu$init_menu$3)
	.dw	0,(Smenu$init_menu$4)
	.dw	2
	.db	120
	.sleb128	2
	.dw	0,(Smenu$init_menu$1)
	.dw	0,(Smenu$init_menu$3)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0

	.area .debug_abbrev (NOLOAD)
Ldebug_abbrev:
	.uleb128	15
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
	.uleb128	5
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
	.uleb128	16
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
	.uleb128	6
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
	.uleb128	12
	.uleb128	52
	.db	0
	.uleb128	2
	.uleb128	10
	.uleb128	3
	.uleb128	8
	.uleb128	60
	.uleb128	12
	.uleb128	63
	.uleb128	12
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	10
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
	.uleb128	4
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
	.uleb128	9
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
	.uleb128	7
	.uleb128	11
	.db	0
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	0
	.uleb128	0
	.uleb128	14
	.uleb128	13
	.db	0
	.uleb128	3
	.uleb128	8
	.uleb128	56
	.uleb128	10
	.uleb128	73
	.uleb128	19
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
	.uleb128	11
	.uleb128	46
	.db	0
	.uleb128	3
	.uleb128	8
	.uleb128	17
	.uleb128	1
	.uleb128	63
	.uleb128	12
	.uleb128	0
	.uleb128	0
	.uleb128	17
	.uleb128	33
	.db	0
	.uleb128	47
	.uleb128	11
	.uleb128	0
	.uleb128	0
	.uleb128	13
	.uleb128	19
	.db	1
	.uleb128	1
	.uleb128	19
	.uleb128	3
	.uleb128	8
	.uleb128	11
	.uleb128	11
	.uleb128	0
	.uleb128	0
	.uleb128	3
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
	.ascii "./user/menu.c"
	.db	0
	.dw	0,(Ldebug_line_start+-4)
	.db	1
	.ascii "SDCC version 4.0.2 #11645"
	.db	0
	.uleb128	2
	.ascii "init_menu"
	.db	0
	.dw	0,(_init_menu)
	.dw	0,(XG$init_menu$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+776)
	.uleb128	3
	.ascii "unsigned char"
	.db	0
	.db	1
	.db	8
	.uleb128	4
	.dw	0,148
	.ascii "get_menu_value"
	.db	0
	.dw	0,(_get_menu_value)
	.dw	0,(XG$get_menu_value$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+732)
	.dw	0,81
	.uleb128	5
	.db	2
	.db	145
	.sleb128	2
	.ascii "idx"
	.db	0
	.dw	0,81
	.uleb128	0
	.uleb128	2
	.ascii "set_menu_value"
	.db	0
	.dw	0,(_set_menu_value)
	.dw	0,(XG$set_menu_value$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+676)
	.uleb128	2
	.ascii "tmr_menu"
	.db	0
	.dw	0,(_tmr_menu)
	.dw	0,(XG$tmr_menu$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+656)
	.uleb128	2
	.ascii "inc_option"
	.db	0
	.dw	0,(_inc_option)
	.dw	0,(XFmenu$inc_option$0$0+1)
	.db	0
	.dw	0,(Ldebug_loc_start+588)
	.uleb128	2
	.ascii "dec_option"
	.db	0
	.dw	0,(_dec_option)
	.dw	0,(XFmenu$dec_option$0$0+1)
	.db	0
	.dw	0,(Ldebug_loc_start+520)
	.uleb128	2
	.ascii "inc_value"
	.db	0
	.dw	0,(_inc_value)
	.dw	0,(XFmenu$inc_value$0$0+1)
	.db	0
	.dw	0,(Ldebug_loc_start+500)
	.uleb128	6
	.dw	0,321
	.ascii "dec_value"
	.db	0
	.dw	0,(_dec_value)
	.dw	0,(XFmenu$dec_value$0$0+1)
	.db	0
	.dw	0,(Ldebug_loc_start+480)
	.uleb128	7
	.dw	0,(Smenu$dec_value$100)
	.dw	0,(Smenu$dec_value$102)
	.uleb128	7
	.dw	0,(Smenu$dec_value$103)
	.dw	0,(Smenu$dec_value$105)
	.uleb128	0
	.uleb128	6
	.dw	0,411
	.ascii "interrupt_buttons"
	.db	0
	.dw	0,(_interrupt_buttons)
	.dw	0,(XG$interrupt_buttons$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+328)
	.uleb128	8
	.dw	0,376
	.dw	0,(Smenu$interrupt_buttons$116)
	.uleb128	7
	.dw	0,(Smenu$interrupt_buttons$118)
	.dw	0,(Smenu$interrupt_buttons$121)
	.uleb128	0
	.uleb128	8
	.dw	0,395
	.dw	0,(Smenu$interrupt_buttons$126)
	.uleb128	7
	.dw	0,(Smenu$interrupt_buttons$128)
	.dw	0,(Smenu$interrupt_buttons$132)
	.uleb128	0
	.uleb128	9
	.dw	0,(Smenu$interrupt_buttons$137)
	.uleb128	7
	.dw	0,(Smenu$interrupt_buttons$139)
	.dw	0,(Smenu$interrupt_buttons$143)
	.uleb128	0
	.uleb128	0
	.uleb128	6
	.dw	0,515
	.ascii "process_button"
	.db	0
	.dw	0,(_process_button)
	.dw	0,(XG$process_button$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+104)
	.uleb128	7
	.dw	0,(Smenu$process_button$153)
	.dw	0,(Smenu$process_button$157)
	.uleb128	7
	.dw	0,(Smenu$process_button$160)
	.dw	0,(Smenu$process_button$165)
	.uleb128	7
	.dw	0,(Smenu$process_button$168)
	.dw	0,(Smenu$process_button$173)
	.uleb128	7
	.dw	0,(Smenu$process_button$179)
	.dw	0,(Smenu$process_button$181)
	.uleb128	8
	.dw	0,499
	.dw	0,(Smenu$process_button$187)
	.uleb128	7
	.dw	0,(Smenu$process_button$190)
	.dw	0,(Smenu$process_button$193)
	.uleb128	0
	.uleb128	9
	.dw	0,(Smenu$process_button$199)
	.uleb128	7
	.dw	0,(Smenu$process_button$202)
	.dw	0,(Smenu$process_button$205)
	.uleb128	0
	.uleb128	0
	.uleb128	6
	.dw	0,565
	.ascii "task_menu"
	.db	0
	.dw	0,(_task_menu)
	.dw	0,(XG$task_menu$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start)
	.uleb128	10
	.db	5
	.db	3
	.dw	0,(_task_menu_option_dp_65536_364)
	.ascii "option_dp"
	.db	0
	.dw	0,81
	.uleb128	0
	.uleb128	11
	.ascii "task_menu"
	.db	0
	.dw	0,(_task_menu)
	.db	1
	.uleb128	12
	.db	5
	.db	3
	.dw	0,(_tick)
	.ascii "tick"
	.db	0
	.db	1
	.db	1
	.dw	0,81
	.uleb128	3
	.ascii "unsigned int"
	.db	0
	.db	2
	.db	7
	.uleb128	13
	.dw	0,698
	.ascii "__00000011"
	.db	0
	.db	7
	.uleb128	14
	.ascii "idx"
	.db	0
	.db	2
	.db	35
	.uleb128	0
	.dw	0,81
	.uleb128	14
	.ascii "edit"
	.db	0
	.db	2
	.db	35
	.uleb128	1
	.dw	0,81
	.uleb128	14
	.ascii "write"
	.db	0
	.db	2
	.db	35
	.uleb128	2
	.dw	0,81
	.uleb128	14
	.ascii "value"
	.db	0
	.db	2
	.db	35
	.uleb128	3
	.dw	0,599
	.uleb128	14
	.ascii "tmr"
	.db	0
	.db	2
	.db	35
	.uleb128	5
	.dw	0,599
	.uleb128	0
	.uleb128	15
	.db	5
	.db	3
	.dw	0,(_menu)
	.ascii "menu"
	.db	0
	.db	1
	.dw	0,615
	.uleb128	13
	.dw	0,765
	.ascii "__00000009"
	.db	0
	.db	3
	.uleb128	14
	.ascii "status"
	.db	0
	.db	2
	.db	35
	.uleb128	0
	.dw	0,81
	.uleb128	14
	.ascii "debounce"
	.db	0
	.db	2
	.db	35
	.uleb128	1
	.dw	0,599
	.uleb128	0
	.uleb128	16
	.dw	0,778
	.db	9
	.dw	0,715
	.uleb128	17
	.db	2
	.uleb128	0
	.uleb128	15
	.db	5
	.db	3
	.dw	0,(_btn)
	.ascii "btn"
	.db	0
	.db	1
	.dw	0,765
	.uleb128	13
	.dw	0,838
	.ascii "__00000010"
	.db	0
	.db	2
	.uleb128	14
	.ascii "option"
	.db	0
	.db	2
	.db	35
	.uleb128	0
	.dw	0,81
	.uleb128	14
	.ascii "dp"
	.db	0
	.db	2
	.db	35
	.uleb128	1
	.dw	0,81
	.uleb128	0
	.uleb128	16
	.dw	0,851
	.db	16
	.dw	0,794
	.uleb128	17
	.db	7
	.uleb128	0
	.uleb128	10
	.db	5
	.db	3
	.dw	0,(_par)
	.ascii "par"
	.db	0
	.dw	0,838
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
	.dw	0,57
	.ascii "init_menu"
	.db	0
	.dw	0,98
	.ascii "get_menu_value"
	.db	0
	.dw	0,148
	.ascii "set_menu_value"
	.db	0
	.dw	0,177
	.ascii "tmr_menu"
	.db	0
	.dw	0,321
	.ascii "interrupt_buttons"
	.db	0
	.dw	0,411
	.ascii "process_button"
	.db	0
	.dw	0,515
	.ascii "task_menu"
	.db	0
	.dw	0,565
	.ascii "task_menu"
	.db	0
	.dw	0,581
	.ascii "tick"
	.db	0
	.dw	0,698
	.ascii "menu"
	.db	0
	.dw	0,778
	.ascii "btn"
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
	.dw	0,12
	.dw	0,(Ldebug_CIE0_start-4)
	.dw	0,0	;initial loc
	.dw	0,(null)-(null)

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
	.dw	0,68
	.dw	0,(Ldebug_CIE1_start-4)
	.dw	0,(Smenu$task_menu$211)	;initial loc
	.dw	0,Smenu$task_menu$229-Smenu$task_menu$211
	.db	1
	.dw	0,(Smenu$task_menu$211)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Smenu$task_menu$219)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Smenu$task_menu$220)
	.db	14
	.uleb128	5
	.db	1
	.dw	0,(Smenu$task_menu$221)
	.db	14
	.uleb128	7
	.db	1
	.dw	0,(Smenu$task_menu$222)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Smenu$task_menu$223)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Smenu$task_menu$225)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Smenu$task_menu$226)
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
	.dw	0,138
	.dw	0,(Ldebug_CIE2_start-4)
	.dw	0,(Smenu$process_button$149)	;initial loc
	.dw	0,Smenu$process_button$209-Smenu$process_button$149
	.db	1
	.dw	0,(Smenu$process_button$149)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Smenu$process_button$150)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Smenu$process_button$152)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Smenu$process_button$159)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Smenu$process_button$167)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Smenu$process_button$175)
	.db	14
	.uleb128	7
	.db	1
	.dw	0,(Smenu$process_button$176)
	.db	14
	.uleb128	8
	.db	1
	.dw	0,(Smenu$process_button$177)
	.db	14
	.uleb128	9
	.db	1
	.dw	0,(Smenu$process_button$178)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Smenu$process_button$183)
	.db	14
	.uleb128	7
	.db	1
	.dw	0,(Smenu$process_button$184)
	.db	14
	.uleb128	8
	.db	1
	.dw	0,(Smenu$process_button$185)
	.db	14
	.uleb128	9
	.db	1
	.dw	0,(Smenu$process_button$186)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Smenu$process_button$195)
	.db	14
	.uleb128	7
	.db	1
	.dw	0,(Smenu$process_button$196)
	.db	14
	.uleb128	8
	.db	1
	.dw	0,(Smenu$process_button$197)
	.db	14
	.uleb128	9
	.db	1
	.dw	0,(Smenu$process_button$198)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Smenu$process_button$207)
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
	.dw	0,96
	.dw	0,(Ldebug_CIE3_start-4)
	.dw	0,(Smenu$interrupt_buttons$110)	;initial loc
	.dw	0,Smenu$interrupt_buttons$147-Smenu$interrupt_buttons$110
	.db	1
	.dw	0,(Smenu$interrupt_buttons$110)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Smenu$interrupt_buttons$111)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Smenu$interrupt_buttons$113)
	.db	14
	.uleb128	5
	.db	1
	.dw	0,(Smenu$interrupt_buttons$114)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Smenu$interrupt_buttons$115)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Smenu$interrupt_buttons$123)
	.db	14
	.uleb128	5
	.db	1
	.dw	0,(Smenu$interrupt_buttons$124)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Smenu$interrupt_buttons$125)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Smenu$interrupt_buttons$134)
	.db	14
	.uleb128	5
	.db	1
	.dw	0,(Smenu$interrupt_buttons$135)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Smenu$interrupt_buttons$136)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Smenu$interrupt_buttons$145)
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
	.dw	0,(Smenu$dec_value$98)	;initial loc
	.dw	0,Smenu$dec_value$108-Smenu$dec_value$98
	.db	1
	.dw	0,(Smenu$dec_value$98)
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
	.dw	0,(Smenu$inc_value$91)	;initial loc
	.dw	0,Smenu$inc_value$96-Smenu$inc_value$91
	.db	1
	.dw	0,(Smenu$inc_value$91)
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
	.dw	0,47
	.dw	0,(Ldebug_CIE6_start-4)
	.dw	0,(Smenu$dec_option$81)	;initial loc
	.dw	0,Smenu$dec_option$89-Smenu$dec_option$81
	.db	1
	.dw	0,(Smenu$dec_option$81)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Smenu$dec_option$83)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Smenu$dec_option$84)
	.db	14
	.uleb128	5
	.db	1
	.dw	0,(Smenu$dec_option$85)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Smenu$dec_option$86)
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
	.dw	0,47
	.dw	0,(Ldebug_CIE7_start-4)
	.dw	0,(Smenu$inc_option$71)	;initial loc
	.dw	0,Smenu$inc_option$79-Smenu$inc_option$71
	.db	1
	.dw	0,(Smenu$inc_option$71)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Smenu$inc_option$73)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Smenu$inc_option$74)
	.db	14
	.uleb128	5
	.db	1
	.dw	0,(Smenu$inc_option$75)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Smenu$inc_option$76)
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
	.dw	0,(Smenu$tmr_menu$62)	;initial loc
	.dw	0,Smenu$tmr_menu$69-Smenu$tmr_menu$62
	.db	1
	.dw	0,(Smenu$tmr_menu$62)
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
	.dw	0,40
	.dw	0,(Ldebug_CIE9_start-4)
	.dw	0,(Smenu$set_menu_value$52)	;initial loc
	.dw	0,Smenu$set_menu_value$60-Smenu$set_menu_value$52
	.db	1
	.dw	0,(Smenu$set_menu_value$52)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Smenu$set_menu_value$54)
	.db	14
	.uleb128	3
	.db	1
	.dw	0,(Smenu$set_menu_value$55)
	.db	14
	.uleb128	5
	.db	1
	.dw	0,(Smenu$set_menu_value$56)
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
	.dw	0,33
	.dw	0,(Ldebug_CIE10_start-4)
	.dw	0,(Smenu$get_menu_value$44)	;initial loc
	.dw	0,Smenu$get_menu_value$50-Smenu$get_menu_value$44
	.db	1
	.dw	0,(Smenu$get_menu_value$44)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Smenu$get_menu_value$46)
	.db	14
	.uleb128	3
	.db	1
	.dw	0,(Smenu$get_menu_value$47)
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
	.dw	0,208
	.dw	0,(Ldebug_CIE11_start-4)
	.dw	0,(Smenu$init_menu$1)	;initial loc
	.dw	0,Smenu$init_menu$42-Smenu$init_menu$1
	.db	1
	.dw	0,(Smenu$init_menu$1)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Smenu$init_menu$3)
	.db	14
	.uleb128	3
	.db	1
	.dw	0,(Smenu$init_menu$4)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Smenu$init_menu$5)
	.db	14
	.uleb128	5
	.db	1
	.dw	0,(Smenu$init_menu$6)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Smenu$init_menu$7)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Smenu$init_menu$9)
	.db	14
	.uleb128	3
	.db	1
	.dw	0,(Smenu$init_menu$10)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Smenu$init_menu$11)
	.db	14
	.uleb128	5
	.db	1
	.dw	0,(Smenu$init_menu$12)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Smenu$init_menu$13)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Smenu$init_menu$15)
	.db	14
	.uleb128	3
	.db	1
	.dw	0,(Smenu$init_menu$16)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Smenu$init_menu$17)
	.db	14
	.uleb128	5
	.db	1
	.dw	0,(Smenu$init_menu$18)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Smenu$init_menu$19)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Smenu$init_menu$23)
	.db	14
	.uleb128	3
	.db	1
	.dw	0,(Smenu$init_menu$24)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Smenu$init_menu$25)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Smenu$init_menu$27)
	.db	14
	.uleb128	3
	.db	1
	.dw	0,(Smenu$init_menu$28)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Smenu$init_menu$30)
	.db	14
	.uleb128	3
	.db	1
	.dw	0,(Smenu$init_menu$31)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Smenu$init_menu$32)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Smenu$init_menu$36)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Smenu$init_menu$37)
	.db	14
	.uleb128	5
	.db	1
	.dw	0,(Smenu$init_menu$38)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Smenu$init_menu$39)
	.db	14
	.uleb128	2
