   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  14                     .const:	section	.text
  15  0000               L3_par:
  16  0000 50            	dc.b	80
  17  0001 00            	dc.b	0
  18  0002 41            	dc.b	65
  19  0003 01            	dc.b	1
  20  0004 43            	dc.b	67
  21  0005 01            	dc.b	1
  22  0006 46            	dc.b	70
  23  0007 00            	dc.b	0
  24  0008 48            	dc.b	72
  25  0009 01            	dc.b	1
  26  000a 4c            	dc.b	76
  27  000b 00            	dc.b	0
  28  000c 55            	dc.b	85
  29  000d 01            	dc.b	1
  30  000e 45            	dc.b	69
  31  000f 00            	dc.b	0
  67                     ; 16 void init_menu(void)
  67                     ; 17 {
  69                     	switch	.text
  70  0000               _init_menu:
  74                     ; 18     btn_set_dir();
  76  0000 4b60          	push	#96
  77  0002 4b08          	push	#8
  78  0004 ae500a        	ldw	x,#20490
  79  0007 cd0000        	call	_GPIO_Init
  81  000a 85            	popw	x
  82                     ; 19     btn_inc_dir();
  84  000b 4b60          	push	#96
  85  000d 4b20          	push	#32
  86  000f ae500a        	ldw	x,#20490
  87  0012 cd0000        	call	_GPIO_Init
  89  0015 85            	popw	x
  90                     ; 20     btn_dec_dir();
  92  0016 4b60          	push	#96
  93  0018 4b10          	push	#16
  94  001a ae500a        	ldw	x,#20490
  95  001d cd0000        	call	_GPIO_Init
  97  0020 85            	popw	x
  98                     ; 22     EXTI_DeInit();
 100  0021 cd0000        	call	_EXTI_DeInit
 102                     ; 24     disableInterrupts();
 105  0024 9b            sim
 107                     ; 25     EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);
 110  0025 ae0202        	ldw	x,#514
 111  0028 cd0000        	call	_EXTI_SetExtIntSensitivity
 113                     ; 26     EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
 115  002b 4f            	clr	a
 116  002c cd0000        	call	_EXTI_SetTLISensitivity
 118                     ; 27     ITC_SetSoftwarePriority(ITC_IRQ_PORTC , ITC_PRIORITYLEVEL_3);
 120  002f ae0503        	ldw	x,#1283
 121  0032 cd0000        	call	_ITC_SetSoftwarePriority
 123                     ; 28     enableInterrupts();
 126  0035 9a            rim
 128                     ; 29 }
 132  0036 81            	ret
 157                     ; 31 void tmr_menu(void)
 157                     ; 32 {
 158                     	switch	.text
 159  0037               _tmr_menu:
 163                     ; 33     _decrement(menu.tmr);
 165  0037 3d12          	tnz	_menu+3
 166  0039 2702          	jreq	L33
 169  003b 3a12          	dec	_menu+3
 170  003d               L33:
 171                     ; 34     _decrement(btn[BTN_SET_IDX].debounce);
 173  003d be03          	ldw	x,_btn+3
 174  003f 2707          	jreq	L53
 177  0041 be03          	ldw	x,_btn+3
 178  0043 1d0001        	subw	x,#1
 179  0046 bf03          	ldw	_btn+3,x
 180  0048               L53:
 181                     ; 35     _decrement(btn[BTN_INC_IDX].debounce);
 183  0048 be0d          	ldw	x,_btn+13
 184  004a 2707          	jreq	L73
 187  004c be0d          	ldw	x,_btn+13
 188  004e 1d0001        	subw	x,#1
 189  0051 bf0d          	ldw	_btn+13,x
 190  0053               L73:
 191                     ; 36     _decrement(btn[BTN_DEC_IDX].debounce);
 193  0053 be08          	ldw	x,_btn+8
 194  0055 2707          	jreq	L14
 197  0057 be08          	ldw	x,_btn+8
 198  0059 1d0001        	subw	x,#1
 199  005c bf08          	ldw	_btn+8,x
 200  005e               L14:
 201                     ; 37 }
 204  005e 81            	ret
 229                     ; 39 static void inc_option(void)
 229                     ; 40 {
 230                     	switch	.text
 231  005f               L34_inc_option:
 235                     ; 41     if (++menu.idx > PAR_COUNT)
 237  005f 3c0f          	inc	_menu
 238  0061 b60f          	ld	a,_menu
 239  0063 a108          	cp	a,#8
 240  0065 2502          	jrult	L55
 241                     ; 42         menu.idx = 0;
 243  0067 3f0f          	clr	_menu
 244  0069               L55:
 245                     ; 43     menu.value = 0;
 247  0069 3f10          	clr	_menu+1
 248                     ; 44 }
 251  006b 81            	ret
 276                     ; 46 static void dec_option(void)
 276                     ; 47 {
 277                     	switch	.text
 278  006c               L75_dec_option:
 282                     ; 48     if (menu.idx) {
 284  006c 3d0f          	tnz	_menu
 285  006e 2704          	jreq	L17
 286                     ; 49         menu.idx--;
 288  0070 3a0f          	dec	_menu
 290  0072 2004          	jra	L37
 291  0074               L17:
 292                     ; 51         menu.idx = PAR_COUNT;
 294  0074 3507000f      	mov	_menu,#7
 295  0078               L37:
 296                     ; 53     menu.value = 0;
 298  0078 3f10          	clr	_menu+1
 299                     ; 54 }
 302  007a 81            	ret
 326                     ; 56 static void inc_value(void)
 326                     ; 57 {
 327                     	switch	.text
 328  007b               L57_inc_value:
 332                     ; 58     if (++menu.value > MAX_VALUE)
 334  007b 3c10          	inc	_menu+1
 335  007d b610          	ld	a,_menu+1
 336  007f a164          	cp	a,#100
 337  0081 2502          	jrult	L701
 338                     ; 59         menu.value = 0;
 340  0083 3f10          	clr	_menu+1
 341  0085               L701:
 342                     ; 60 }
 345  0085 81            	ret
 369                     ; 62 static void dec_value(void)
 369                     ; 63 {
 370                     	switch	.text
 371  0086               L111_dec_value:
 375                     ; 64     if (menu.value) {
 377  0086 3d10          	tnz	_menu+1
 378  0088 2702          	jreq	L321
 379                     ; 65         menu.value--;
 381  008a 3a10          	dec	_menu+1
 382  008c               L321:
 383                     ; 67 }
 386  008c 81            	ret
 411                     ; 69 void interrupt_buttons(void)
 411                     ; 70 {
 412                     	switch	.text
 413  008d               _interrupt_buttons:
 417                     ; 71     if ((GPIO_ReadInputData(BTN_PORT) & BTN_SET_PIN_NUM) == 0x00) {
 419  008d ae500a        	ldw	x,#20490
 420  0090 cd0000        	call	_GPIO_ReadInputData
 422  0093 a508          	bcp	a,#8
 423  0095 260f          	jrne	L531
 424                     ; 72         if (!btn[BTN_SET_IDX].debounce) {
 426  0097 be03          	ldw	x,_btn+3
 427  0099 263b          	jrne	L141
 428                     ; 73             btn[BTN_SET_IDX].debounce = BTN_DEBOUNCE;
 430  009b ae0032        	ldw	x,#50
 431  009e bf03          	ldw	_btn+3,x
 432                     ; 74             btn[BTN_SET_IDX].status = BTN_STAT_PRESSED;
 434  00a0 35010000      	mov	_btn,#1
 435  00a4 2030          	jra	L141
 436  00a6               L531:
 437                     ; 77     if ((GPIO_ReadInputData(BTN_PORT) & BTN_INC_PIN_NUM) == 0x00) {
 439  00a6 ae500a        	ldw	x,#20490
 440  00a9 cd0000        	call	_GPIO_ReadInputData
 442  00ac a520          	bcp	a,#32
 443  00ae 260f          	jrne	L341
 444                     ; 78         if (!btn[BTN_INC_IDX].debounce) {
 446  00b0 be0d          	ldw	x,_btn+13
 447  00b2 2622          	jrne	L141
 448                     ; 79             btn[BTN_INC_IDX].debounce = BTN_DEBOUNCE;
 450  00b4 ae0032        	ldw	x,#50
 451  00b7 bf0d          	ldw	_btn+13,x
 452                     ; 80             btn[BTN_INC_IDX].status = BTN_STAT_PRESSED;
 454  00b9 3501000a      	mov	_btn+10,#1
 455  00bd 2017          	jra	L141
 456  00bf               L341:
 457                     ; 83     if ((GPIO_ReadInputData(BTN_PORT) & BTN_DEC_PIN_NUM) == 0x00) {
 459  00bf ae500a        	ldw	x,#20490
 460  00c2 cd0000        	call	_GPIO_ReadInputData
 462  00c5 a510          	bcp	a,#16
 463  00c7 260d          	jrne	L141
 464                     ; 84         if (!btn[BTN_DEC_IDX].debounce) {
 466  00c9 be08          	ldw	x,_btn+8
 467  00cb 2609          	jrne	L141
 468                     ; 85             btn[BTN_DEC_IDX].debounce = BTN_DEBOUNCE;
 470  00cd ae0032        	ldw	x,#50
 471  00d0 bf08          	ldw	_btn+8,x
 472                     ; 86             btn[BTN_DEC_IDX].status = BTN_STAT_PRESSED;
 474  00d2 35010005      	mov	_btn+5,#1
 475  00d6               L141:
 476                     ; 89 }
 479  00d6 81            	ret
 509                     ; 91 void process_button(void)
 509                     ; 92 {
 510                     	switch	.text
 511  00d7               _process_button:
 515                     ; 93     if (btn[BTN_SET_IDX].status == BTN_STAT_PRESSED) {
 517  00d7 b600          	ld	a,_btn
 518  00d9 a101          	cp	a,#1
 519  00db 260d          	jrne	L561
 520                     ; 94         btn[BTN_SET_IDX].status = BTN_STAT_FREE;
 522  00dd 3f00          	clr	_btn
 523                     ; 95         menu.edit = (uint8_t)!menu.edit;
 525  00df 3d13          	tnz	_menu+4
 526  00e1 2604          	jrne	L42
 527  00e3 a601          	ld	a,#1
 528  00e5 2001          	jra	L62
 529  00e7               L42:
 530  00e7 4f            	clr	a
 531  00e8               L62:
 532  00e8 b713          	ld	_menu+4,a
 533  00ea               L561:
 534                     ; 97     if (btn[BTN_INC_IDX].status == BTN_STAT_PRESSED) {
 536  00ea b60a          	ld	a,_btn+10
 537  00ec a101          	cp	a,#1
 538  00ee 260e          	jrne	L761
 539                     ; 98         btn[BTN_INC_IDX].status = BTN_STAT_FREE;
 541  00f0 3f0a          	clr	_btn+10
 542                     ; 99         if (!menu.edit)
 544  00f2 3d13          	tnz	_menu+4
 545  00f4 2605          	jrne	L171
 546                     ; 100             inc_option();
 548  00f6 cd005f        	call	L34_inc_option
 551  00f9 2003          	jra	L761
 552  00fb               L171:
 553                     ; 102             inc_value();
 555  00fb cd007b        	call	L57_inc_value
 557  00fe               L761:
 558                     ; 104     if (btn[BTN_DEC_IDX].status == BTN_STAT_PRESSED) {
 560  00fe b605          	ld	a,_btn+5
 561  0100 a101          	cp	a,#1
 562  0102 260e          	jrne	L571
 563                     ; 105         btn[BTN_DEC_IDX].status = BTN_STAT_FREE;
 565  0104 3f05          	clr	_btn+5
 566                     ; 106         if (!menu.edit)
 568  0106 3d13          	tnz	_menu+4
 569  0108 2605          	jrne	L771
 570                     ; 107             dec_option();
 572  010a cd006c        	call	L75_dec_option
 575  010d 2003          	jra	L571
 576  010f               L771:
 577                     ; 109             dec_value();
 579  010f cd0086        	call	L111_dec_value
 581  0112               L571:
 582                     ; 111     if (!btn_set()) {
 584  0112 4b08          	push	#8
 585  0114 ae500a        	ldw	x,#20490
 586  0117 cd0000        	call	_GPIO_ReadInputPin
 588  011a 5b01          	addw	sp,#1
 589  011c 4d            	tnz	a
 590  011d 2605          	jrne	L302
 591                     ; 112         btn[BTN_SET_IDX].debounce = BTN_DEBOUNCE;
 593  011f ae0032        	ldw	x,#50
 594  0122 bf03          	ldw	_btn+3,x
 595  0124               L302:
 596                     ; 114     if (!btn_inc()) {
 598  0124 4b20          	push	#32
 599  0126 ae500a        	ldw	x,#20490
 600  0129 cd0000        	call	_GPIO_ReadInputPin
 602  012c 5b01          	addw	sp,#1
 603  012e 4d            	tnz	a
 604  012f 2605          	jrne	L502
 605                     ; 115         btn[BTN_INC_IDX].debounce = BTN_DEBOUNCE;
 607  0131 ae0032        	ldw	x,#50
 608  0134 bf0d          	ldw	_btn+13,x
 609  0136               L502:
 610                     ; 117     if (!btn_dec()) {
 612  0136 4b10          	push	#16
 613  0138 ae500a        	ldw	x,#20490
 614  013b cd0000        	call	_GPIO_ReadInputPin
 616  013e 5b01          	addw	sp,#1
 617  0140 4d            	tnz	a
 618  0141 2605          	jrne	L702
 619                     ; 118         btn[BTN_DEC_IDX].debounce = BTN_DEBOUNCE;
 621  0143 ae0032        	ldw	x,#50
 622  0146 bf08          	ldw	_btn+8,x
 623  0148               L702:
 624                     ; 120 }
 627  0148 81            	ret
 657                     ; 122 void task_menu(void)
 657                     ; 123 {
 658                     	switch	.text
 659  0149               _task_menu:
 663                     ; 124     process_button();
 665  0149 ad8c          	call	_process_button
 667                     ; 126     if (!tick)
 669  014b 3d00          	tnz	_tick
 670  014d 2601          	jrne	L122
 671                     ; 127         return;
 674  014f 81            	ret
 675  0150               L122:
 676                     ; 129     if (menu.edit) {
 678  0150 3d13          	tnz	_menu+4
 679  0152 270d          	jreq	L322
 680                     ; 130         dp[DIG1_POS] = (uint8_t)!dp[DIG1_POS];    
 682  0154 3d00          	tnz	_dp
 683  0156 2604          	jrne	L23
 684  0158 a601          	ld	a,#1
 685  015a 2001          	jra	L43
 686  015c               L23:
 687  015c 4f            	clr	a
 688  015d               L43:
 689  015d b700          	ld	_dp,a
 691  015f 2002          	jra	L522
 692  0161               L322:
 693                     ; 132         dp[DIG1_POS] = 0;
 695  0161 3f00          	clr	_dp
 696  0163               L522:
 697                     ; 136     set_display_option(par[menu.idx].option);
 699  0163 b60f          	ld	a,_menu
 700  0165 5f            	clrw	x
 701  0166 97            	ld	xl,a
 702  0167 58            	sllw	x
 703  0168 d60000        	ld	a,(L3_par,x)
 704  016b cd0000        	call	_set_display_option
 706                     ; 137     set_display_value(menu.value, par[menu.idx].dp);
 708  016e b60f          	ld	a,_menu
 709  0170 5f            	clrw	x
 710  0171 97            	ld	xl,a
 711  0172 58            	sllw	x
 712  0173 d60001        	ld	a,(L3_par+1,x)
 713  0176 97            	ld	xl,a
 714  0177 b610          	ld	a,_menu+1
 715  0179 95            	ld	xh,a
 716  017a cd0000        	call	_set_display_value
 718                     ; 138 }
 721  017d 81            	ret
 868                     	xdef	_process_button
 869                     	xdef	_interrupt_buttons
 870                     	switch	.ubsct
 871  0000               _btn:
 872  0000 000000000000  	ds.b	15
 873                     	xdef	_btn
 874  000f               _menu:
 875  000f 000000000000  	ds.b	6
 876                     	xdef	_menu
 877                     	xref.b	_dp
 878                     	xref.b	_tick
 879                     	xref	_set_display_option
 880                     	xref	_set_display_value
 881                     	xdef	_task_menu
 882                     	xdef	_tmr_menu
 883                     	xdef	_init_menu
 884                     	xref	_ITC_SetSoftwarePriority
 885                     	xref	_GPIO_ReadInputPin
 886                     	xref	_GPIO_ReadInputData
 887                     	xref	_GPIO_Init
 888                     	xref	_EXTI_SetTLISensitivity
 889                     	xref	_EXTI_SetExtIntSensitivity
 890                     	xref	_EXTI_DeInit
 910                     	end
