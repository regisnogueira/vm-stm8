   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  14                     .const:	section	.text
  15  0000               _menu_options:
  16  0000 41            	dc.b	65
  17  0001 62            	dc.b	98
  18  0002 43            	dc.b	67
  19  0003 64            	dc.b	100
  20  0004 45            	dc.b	69
  21  0005 46            	dc.b	70
  22  0006 48            	dc.b	72
  23  0007 4c            	dc.b	76
  24  0008 50            	dc.b	80
  25  0009 55            	dc.b	85
  61                     ; 13 void init_menu(void)
  61                     ; 14 {
  63                     	switch	.text
  64  0000               _init_menu:
  68                     ; 15     btn_set_dir();
  70  0000 4b60          	push	#96
  71  0002 4b08          	push	#8
  72  0004 ae500a        	ldw	x,#20490
  73  0007 cd0000        	call	_GPIO_Init
  75  000a 85            	popw	x
  76                     ; 16     btn_inc_dir();
  78  000b 4b60          	push	#96
  79  000d 4b20          	push	#32
  80  000f ae500a        	ldw	x,#20490
  81  0012 cd0000        	call	_GPIO_Init
  83  0015 85            	popw	x
  84                     ; 17     btn_dec_dir();
  86  0016 4b60          	push	#96
  87  0018 4b10          	push	#16
  88  001a ae500a        	ldw	x,#20490
  89  001d cd0000        	call	_GPIO_Init
  91  0020 85            	popw	x
  92                     ; 19     EXTI_DeInit();
  94  0021 cd0000        	call	_EXTI_DeInit
  96                     ; 21     disableInterrupts();
  99  0024 9b            sim
 101                     ; 22     EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);
 104  0025 ae0202        	ldw	x,#514
 105  0028 cd0000        	call	_EXTI_SetExtIntSensitivity
 107                     ; 23     EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
 109  002b 4f            	clr	a
 110  002c cd0000        	call	_EXTI_SetTLISensitivity
 112                     ; 24     ITC_SetSoftwarePriority(ITC_IRQ_PORTC , ITC_PRIORITYLEVEL_3);
 114  002f ae0503        	ldw	x,#1283
 115  0032 cd0000        	call	_ITC_SetSoftwarePriority
 117                     ; 25     enableInterrupts();
 120  0035 9a            rim
 122                     ; 26 }
 126  0036 81            	ret
 150                     ; 28 void tmr_menu(void)
 150                     ; 29 {
 151                     	switch	.text
 152  0037               _tmr_menu:
 156                     ; 31     _decrement(btn[BTN_SET_IDX].debounce);
 158  0037 be03          	ldw	x,_btn+3
 159  0039 2707          	jreq	L13
 162  003b be03          	ldw	x,_btn+3
 163  003d 1d0001        	subw	x,#1
 164  0040 bf03          	ldw	_btn+3,x
 165  0042               L13:
 166                     ; 32     _decrement(btn[BTN_INC_IDX].debounce);
 168  0042 be0d          	ldw	x,_btn+13
 169  0044 2707          	jreq	L33
 172  0046 be0d          	ldw	x,_btn+13
 173  0048 1d0001        	subw	x,#1
 174  004b bf0d          	ldw	_btn+13,x
 175  004d               L33:
 176                     ; 33     _decrement(btn[BTN_DEC_IDX].debounce);
 178  004d be08          	ldw	x,_btn+8
 179  004f 2707          	jreq	L53
 182  0051 be08          	ldw	x,_btn+8
 183  0053 1d0001        	subw	x,#1
 184  0056 bf08          	ldw	_btn+8,x
 185  0058               L53:
 186                     ; 34 }
 189  0058 81            	ret
 214                     ; 36 static void inc_option(void)
 214                     ; 37 {
 215                     	switch	.text
 216  0059               L73_inc_option:
 220                     ; 38     if (++menu.idx > sizeof(menu_options)-1)
 222  0059 3c0f          	inc	_menu
 223  005b b60f          	ld	a,_menu
 224  005d a10a          	cp	a,#10
 225  005f 2502          	jrult	L15
 226                     ; 39         menu.idx = 0;
 228  0061 3f0f          	clr	_menu
 229  0063               L15:
 230                     ; 40 }
 233  0063 81            	ret
 258                     ; 42 static void dec_option(void)
 258                     ; 43 {
 259                     	switch	.text
 260  0064               L35_dec_option:
 264                     ; 44     if (menu.idx) {
 266  0064 3d0f          	tnz	_menu
 267  0066 2704          	jreq	L56
 268                     ; 45         menu.idx--;
 270  0068 3a0f          	dec	_menu
 272  006a 2004          	jra	L76
 273  006c               L56:
 274                     ; 47         menu.idx = sizeof(menu_options) - 1;
 276  006c 3509000f      	mov	_menu,#9
 277  0070               L76:
 278                     ; 49 }
 281  0070 81            	ret
 306                     ; 51 void interrupt_buttons(void)
 306                     ; 52 {
 307                     	switch	.text
 308  0071               _interrupt_buttons:
 312                     ; 53     if ((GPIO_ReadInputData(BTN_PORT) & BTN_SET_PIN_NUM) == 0x00) {
 314  0071 ae500a        	ldw	x,#20490
 315  0074 cd0000        	call	_GPIO_ReadInputData
 317  0077 a508          	bcp	a,#8
 318  0079 260f          	jrne	L101
 319                     ; 54         if (!btn[BTN_SET_IDX].debounce) {
 321  007b be03          	ldw	x,_btn+3
 322  007d 263b          	jrne	L501
 323                     ; 55             btn[BTN_SET_IDX].debounce = BTN_DEBOUNCE;
 325  007f ae00fa        	ldw	x,#250
 326  0082 bf03          	ldw	_btn+3,x
 327                     ; 56             btn[BTN_SET_IDX].status = BTN_STAT_PRESSED;
 329  0084 35010000      	mov	_btn,#1
 330  0088 2030          	jra	L501
 331  008a               L101:
 332                     ; 59     if ((GPIO_ReadInputData(BTN_PORT) & BTN_INC_PIN_NUM) == 0x00) {
 334  008a ae500a        	ldw	x,#20490
 335  008d cd0000        	call	_GPIO_ReadInputData
 337  0090 a520          	bcp	a,#32
 338  0092 260f          	jrne	L701
 339                     ; 60         if (!btn[BTN_INC_IDX].debounce) {
 341  0094 be0d          	ldw	x,_btn+13
 342  0096 2622          	jrne	L501
 343                     ; 61             btn[BTN_INC_IDX].debounce = BTN_DEBOUNCE;
 345  0098 ae00fa        	ldw	x,#250
 346  009b bf0d          	ldw	_btn+13,x
 347                     ; 62             btn[BTN_INC_IDX].status = BTN_STAT_PRESSED;
 349  009d 3501000a      	mov	_btn+10,#1
 350  00a1 2017          	jra	L501
 351  00a3               L701:
 352                     ; 65     if ((GPIO_ReadInputData(BTN_PORT) & BTN_DEC_PIN_NUM) == 0x00) {
 354  00a3 ae500a        	ldw	x,#20490
 355  00a6 cd0000        	call	_GPIO_ReadInputData
 357  00a9 a510          	bcp	a,#16
 358  00ab 260d          	jrne	L501
 359                     ; 66         if (!btn[BTN_DEC_IDX].debounce) {
 361  00ad be08          	ldw	x,_btn+8
 362  00af 2609          	jrne	L501
 363                     ; 67             btn[BTN_DEC_IDX].debounce = BTN_DEBOUNCE;
 365  00b1 ae00fa        	ldw	x,#250
 366  00b4 bf08          	ldw	_btn+8,x
 367                     ; 68             btn[BTN_DEC_IDX].status = BTN_STAT_PRESSED;
 369  00b6 35010005      	mov	_btn+5,#1
 370  00ba               L501:
 371                     ; 71 }
 374  00ba 81            	ret
 402                     ; 73 void process_button(void)
 402                     ; 74 {
 403                     	switch	.text
 404  00bb               _process_button:
 408                     ; 75     if (btn[BTN_SET_IDX].status == BTN_STAT_PRESSED) {
 410  00bb b600          	ld	a,_btn
 411  00bd a101          	cp	a,#1
 412  00bf 260d          	jrne	L131
 413                     ; 76         btn[BTN_SET_IDX].status = BTN_STAT_FREE;
 415  00c1 3f00          	clr	_btn
 416                     ; 77         dp[DIG1_POS] = (uint8_t)!dp[DIG1_POS];
 418  00c3 3d00          	tnz	_dp
 419  00c5 2604          	jrne	L02
 420  00c7 a601          	ld	a,#1
 421  00c9 2001          	jra	L22
 422  00cb               L02:
 423  00cb 4f            	clr	a
 424  00cc               L22:
 425  00cc b700          	ld	_dp,a
 426  00ce               L131:
 427                     ; 79     if (btn[BTN_INC_IDX].status == BTN_STAT_PRESSED) {
 429  00ce b60a          	ld	a,_btn+10
 430  00d0 a101          	cp	a,#1
 431  00d2 2604          	jrne	L331
 432                     ; 80         btn[BTN_INC_IDX].status = BTN_STAT_FREE;
 434  00d4 3f0a          	clr	_btn+10
 435                     ; 81         inc_option();
 437  00d6 ad81          	call	L73_inc_option
 439  00d8               L331:
 440                     ; 83     if (btn[BTN_DEC_IDX].status == BTN_STAT_PRESSED) {
 442  00d8 b605          	ld	a,_btn+5
 443  00da a101          	cp	a,#1
 444  00dc 2604          	jrne	L531
 445                     ; 84         btn[BTN_DEC_IDX].status = BTN_STAT_FREE;
 447  00de 3f05          	clr	_btn+5
 448                     ; 85         dec_option();
 450  00e0 ad82          	call	L35_dec_option
 452  00e2               L531:
 453                     ; 87     if (!btn_set()) {
 455  00e2 4b08          	push	#8
 456  00e4 ae500a        	ldw	x,#20490
 457  00e7 cd0000        	call	_GPIO_ReadInputPin
 459  00ea 5b01          	addw	sp,#1
 460  00ec 4d            	tnz	a
 461  00ed 2605          	jrne	L731
 462                     ; 88         btn[BTN_SET_IDX].debounce = BTN_DEBOUNCE;
 464  00ef ae00fa        	ldw	x,#250
 465  00f2 bf03          	ldw	_btn+3,x
 466  00f4               L731:
 467                     ; 90     if (!btn_inc()) {
 469  00f4 4b20          	push	#32
 470  00f6 ae500a        	ldw	x,#20490
 471  00f9 cd0000        	call	_GPIO_ReadInputPin
 473  00fc 5b01          	addw	sp,#1
 474  00fe 4d            	tnz	a
 475  00ff 2605          	jrne	L141
 476                     ; 91         btn[BTN_INC_IDX].debounce = BTN_DEBOUNCE;
 478  0101 ae00fa        	ldw	x,#250
 479  0104 bf0d          	ldw	_btn+13,x
 480  0106               L141:
 481                     ; 93     if (!btn_dec()) {
 483  0106 4b10          	push	#16
 484  0108 ae500a        	ldw	x,#20490
 485  010b cd0000        	call	_GPIO_ReadInputPin
 487  010e 5b01          	addw	sp,#1
 488  0110 4d            	tnz	a
 489  0111 2605          	jrne	L341
 490                     ; 94         btn[BTN_DEC_IDX].debounce = BTN_DEBOUNCE;
 492  0113 ae00fa        	ldw	x,#250
 493  0116 bf08          	ldw	_btn+8,x
 494  0118               L341:
 495                     ; 96 }
 498  0118 81            	ret
 526                     ; 98 void task_menu(void)
 526                     ; 99 {
 527                     	switch	.text
 528  0119               _task_menu:
 532                     ; 100     process_button();
 534  0119 ada0          	call	_process_button
 536                     ; 101     if (!tick)
 538  011b 3d00          	tnz	_tick
 539  011d 2601          	jrne	L551
 540                     ; 102         return;
 543  011f 81            	ret
 544  0120               L551:
 545                     ; 103     set_option_display(menu_options[menu.idx]);
 547  0120 b60f          	ld	a,_menu
 548  0122 5f            	clrw	x
 549  0123 97            	ld	xl,a
 550  0124 d60000        	ld	a,(_menu_options,x)
 551  0127 cd0000        	call	_set_option_display
 553                     ; 104 }
 556  012a 81            	ret
 652                     	xdef	_process_button
 653                     	xdef	_interrupt_buttons
 654                     	switch	.ubsct
 655  0000               _btn:
 656  0000 000000000000  	ds.b	15
 657                     	xdef	_btn
 658  000f               _menu:
 659  000f 0000          	ds.b	2
 660                     	xdef	_menu
 661                     	xdef	_menu_options
 662                     	xref.b	_dp
 663                     	xref.b	_tick
 664                     	xref	_set_option_display
 665                     	xdef	_task_menu
 666                     	xdef	_tmr_menu
 667                     	xdef	_init_menu
 668                     	xref	_ITC_SetSoftwarePriority
 669                     	xref	_GPIO_ReadInputPin
 670                     	xref	_GPIO_ReadInputData
 671                     	xref	_GPIO_Init
 672                     	xref	_EXTI_SetTLISensitivity
 673                     	xref	_EXTI_SetExtIntSensitivity
 674                     	xref	_EXTI_DeInit
 694                     	end
