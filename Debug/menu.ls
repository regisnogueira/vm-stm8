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
 166                     ; 31 uint8_t get_menu_value(uint8_t idx)
 166                     ; 32 {
 167                     	switch	.text
 168  0037               _get_menu_value:
 172                     ; 33     return 0;
 174  0037 4f            	clr	a
 177  0038 81            	ret
 202                     ; 36 void tmr_menu(void)
 202                     ; 37 {
 203                     	switch	.text
 204  0039               _tmr_menu:
 208                     ; 38     _decrement(menu.tmr);
 210  0039 be14          	ldw	x,_menu+5
 211  003b 2707          	jreq	L15
 214  003d be14          	ldw	x,_menu+5
 215  003f 1d0001        	subw	x,#1
 216  0042 bf14          	ldw	_menu+5,x
 217  0044               L15:
 218                     ; 39     _decrement(btn[BTN_SET_IDX].debounce);
 220  0044 be03          	ldw	x,_btn+3
 221  0046 2707          	jreq	L35
 224  0048 be03          	ldw	x,_btn+3
 225  004a 1d0001        	subw	x,#1
 226  004d bf03          	ldw	_btn+3,x
 227  004f               L35:
 228                     ; 40     _decrement(btn[BTN_INC_IDX].debounce);
 230  004f be0d          	ldw	x,_btn+13
 231  0051 2707          	jreq	L55
 234  0053 be0d          	ldw	x,_btn+13
 235  0055 1d0001        	subw	x,#1
 236  0058 bf0d          	ldw	_btn+13,x
 237  005a               L55:
 238                     ; 41     _decrement(btn[BTN_DEC_IDX].debounce);
 240  005a be08          	ldw	x,_btn+8
 241  005c 2707          	jreq	L75
 244  005e be08          	ldw	x,_btn+8
 245  0060 1d0001        	subw	x,#1
 246  0063 bf08          	ldw	_btn+8,x
 247  0065               L75:
 248                     ; 42 }
 251  0065 81            	ret
 277                     ; 44 static void inc_option(void)
 277                     ; 45 {
 278                     	switch	.text
 279  0066               L16_inc_option:
 283                     ; 46     if (++menu.idx > PAR_COUNT)
 285  0066 3c0f          	inc	_menu
 286  0068 b60f          	ld	a,_menu
 287  006a a108          	cp	a,#8
 288  006c 2502          	jrult	L37
 289                     ; 47         menu.idx = 0;
 291  006e 3f0f          	clr	_menu
 292  0070               L37:
 293                     ; 48     menu.value = get_menu_value(menu.idx);
 295  0070 b60f          	ld	a,_menu
 296  0072 adc3          	call	_get_menu_value
 298  0074 b710          	ld	_menu+1,a
 299                     ; 49 }
 302  0076 81            	ret
 328                     ; 51 static void dec_option(void)
 328                     ; 52 {
 329                     	switch	.text
 330  0077               L57_dec_option:
 334                     ; 53     if (menu.idx) {
 336  0077 3d0f          	tnz	_menu
 337  0079 2704          	jreq	L701
 338                     ; 54         menu.idx--;
 340  007b 3a0f          	dec	_menu
 342  007d 2004          	jra	L111
 343  007f               L701:
 344                     ; 56         menu.idx = PAR_COUNT;
 346  007f 3507000f      	mov	_menu,#7
 347  0083               L111:
 348                     ; 58     menu.value = get_menu_value(menu.idx);
 350  0083 b60f          	ld	a,_menu
 351  0085 adb0          	call	_get_menu_value
 353  0087 b710          	ld	_menu+1,a
 354                     ; 59 }
 357  0089 81            	ret
 381                     ; 61 static void inc_value(void)
 381                     ; 62 {
 382                     	switch	.text
 383  008a               L311_inc_value:
 387                     ; 63     if (++menu.value > MAX_VALUE)
 389  008a 3c10          	inc	_menu+1
 390  008c b610          	ld	a,_menu+1
 391  008e a164          	cp	a,#100
 392  0090 2502          	jrult	L521
 393                     ; 64         menu.value = 0;
 395  0092 3f10          	clr	_menu+1
 396  0094               L521:
 397                     ; 65 }
 400  0094 81            	ret
 424                     ; 67 static void dec_value(void)
 424                     ; 68 {
 425                     	switch	.text
 426  0095               L721_dec_value:
 430                     ; 69     if (menu.value) {
 432  0095 3d10          	tnz	_menu+1
 433  0097 2704          	jreq	L141
 434                     ; 70         menu.value--;
 436  0099 3a10          	dec	_menu+1
 438  009b 2004          	jra	L341
 439  009d               L141:
 440                     ; 72         menu.value = MAX_VALUE;
 442  009d 35630010      	mov	_menu+1,#99
 443  00a1               L341:
 444                     ; 74 }
 447  00a1 81            	ret
 473                     ; 76 void interrupt_buttons(void)
 473                     ; 77 {
 474                     	switch	.text
 475  00a2               _interrupt_buttons:
 479                     ; 78     if ((GPIO_ReadInputData(BTN_PORT) & BTN_SET_PIN_NUM) == 0x00) {
 481  00a2 ae500a        	ldw	x,#20490
 482  00a5 cd0000        	call	_GPIO_ReadInputData
 484  00a8 a508          	bcp	a,#8
 485  00aa 260f          	jrne	L551
 486                     ; 79         if (!btn[BTN_SET_IDX].debounce) {
 488  00ac be03          	ldw	x,_btn+3
 489  00ae 2645          	jrne	L161
 490                     ; 80             btn[BTN_SET_IDX].debounce = BTN_DEBOUNCE;
 492  00b0 ae0032        	ldw	x,#50
 493  00b3 bf03          	ldw	_btn+3,x
 494                     ; 81             btn[BTN_SET_IDX].status = BTN_STAT_PRESSED;
 496  00b5 35010000      	mov	_btn,#1
 497  00b9 203a          	jra	L161
 498  00bb               L551:
 499                     ; 84     if ((GPIO_ReadInputData(BTN_PORT) & BTN_INC_PIN_NUM) == 0x00) {
 501  00bb ae500a        	ldw	x,#20490
 502  00be cd0000        	call	_GPIO_ReadInputData
 504  00c1 a520          	bcp	a,#32
 505  00c3 2614          	jrne	L361
 506                     ; 85         if (!btn[BTN_INC_IDX].debounce) {
 508  00c5 be0d          	ldw	x,_btn+13
 509  00c7 262c          	jrne	L161
 510                     ; 86             btn[BTN_INC_IDX].debounce = BTN_DEBOUNCE;
 512  00c9 ae0032        	ldw	x,#50
 513  00cc bf0d          	ldw	_btn+13,x
 514                     ; 87             btn[BTN_INC_IDX].status = BTN_STAT_PRESSED;
 516  00ce 3501000a      	mov	_btn+10,#1
 517                     ; 88             menu.tmr = TIME_HOLD_BUTTON;
 519  00d2 ae05dc        	ldw	x,#1500
 520  00d5 bf14          	ldw	_menu+5,x
 521  00d7 201c          	jra	L161
 522  00d9               L361:
 523                     ; 91     if ((GPIO_ReadInputData(BTN_PORT) & BTN_DEC_PIN_NUM) == 0x00) {
 525  00d9 ae500a        	ldw	x,#20490
 526  00dc cd0000        	call	_GPIO_ReadInputData
 528  00df a510          	bcp	a,#16
 529  00e1 2612          	jrne	L161
 530                     ; 92         if (!btn[BTN_DEC_IDX].debounce) {
 532  00e3 be08          	ldw	x,_btn+8
 533  00e5 260e          	jrne	L161
 534                     ; 93             btn[BTN_DEC_IDX].debounce = BTN_DEBOUNCE;
 536  00e7 ae0032        	ldw	x,#50
 537  00ea bf08          	ldw	_btn+8,x
 538                     ; 94             btn[BTN_DEC_IDX].status = BTN_STAT_PRESSED;
 540  00ec 35010005      	mov	_btn+5,#1
 541                     ; 95             menu.tmr = TIME_HOLD_BUTTON;
 543  00f0 ae05dc        	ldw	x,#1500
 544  00f3 bf14          	ldw	_menu+5,x
 545  00f5               L161:
 546                     ; 98 }
 549  00f5 81            	ret
 579                     ; 100 void process_button(void)
 579                     ; 101 {
 580                     	switch	.text
 581  00f6               _process_button:
 585                     ; 102     if (btn[BTN_SET_IDX].status == BTN_STAT_PRESSED) {
 587  00f6 b600          	ld	a,_btn
 588  00f8 a101          	cp	a,#1
 589  00fa 260d          	jrne	L502
 590                     ; 103         btn[BTN_SET_IDX].status = BTN_STAT_FREE;
 592  00fc 3f00          	clr	_btn
 593                     ; 104         menu.edit = (uint8_t)!menu.edit;
 595  00fe 3d12          	tnz	_menu+3
 596  0100 2604          	jrne	L62
 597  0102 a601          	ld	a,#1
 598  0104 2001          	jra	L03
 599  0106               L62:
 600  0106 4f            	clr	a
 601  0107               L03:
 602  0107 b712          	ld	_menu+3,a
 603  0109               L502:
 604                     ; 106     if (btn[BTN_INC_IDX].status == BTN_STAT_PRESSED) {
 606  0109 b60a          	ld	a,_btn+10
 607  010b a101          	cp	a,#1
 608  010d 260e          	jrne	L702
 609                     ; 107         btn[BTN_INC_IDX].status = BTN_STAT_FREE;
 611  010f 3f0a          	clr	_btn+10
 612                     ; 108         if (!menu.edit)
 614  0111 3d12          	tnz	_menu+3
 615  0113 2605          	jrne	L112
 616                     ; 109             inc_option();
 618  0115 cd0066        	call	L16_inc_option
 621  0118 2003          	jra	L702
 622  011a               L112:
 623                     ; 111             inc_value();
 625  011a cd008a        	call	L311_inc_value
 627  011d               L702:
 628                     ; 113     if (btn[BTN_DEC_IDX].status == BTN_STAT_PRESSED) {
 630  011d b605          	ld	a,_btn+5
 631  011f a101          	cp	a,#1
 632  0121 260e          	jrne	L512
 633                     ; 114         btn[BTN_DEC_IDX].status = BTN_STAT_FREE;
 635  0123 3f05          	clr	_btn+5
 636                     ; 115         if (!menu.edit)
 638  0125 3d12          	tnz	_menu+3
 639  0127 2605          	jrne	L712
 640                     ; 116             dec_option();
 642  0129 cd0077        	call	L57_dec_option
 645  012c 2003          	jra	L512
 646  012e               L712:
 647                     ; 118             dec_value();
 649  012e cd0095        	call	L721_dec_value
 651  0131               L512:
 652                     ; 120     if (!btn_set()) {
 654  0131 4b08          	push	#8
 655  0133 ae500a        	ldw	x,#20490
 656  0136 cd0000        	call	_GPIO_ReadInputPin
 658  0139 5b01          	addw	sp,#1
 659  013b 4d            	tnz	a
 660  013c 2605          	jrne	L322
 661                     ; 121         btn[BTN_SET_IDX].debounce = BTN_DEBOUNCE;
 663  013e ae0032        	ldw	x,#50
 664  0141 bf03          	ldw	_btn+3,x
 665  0143               L322:
 666                     ; 123     if (!btn_inc()) {
 668  0143 4b20          	push	#32
 669  0145 ae500a        	ldw	x,#20490
 670  0148 cd0000        	call	_GPIO_ReadInputPin
 672  014b 5b01          	addw	sp,#1
 673  014d 4d            	tnz	a
 674  014e 2612          	jrne	L522
 675                     ; 124         btn[BTN_INC_IDX].debounce = BTN_DEBOUNCE;
 677  0150 ae0032        	ldw	x,#50
 678  0153 bf0d          	ldw	_btn+13,x
 679                     ; 125         if (!menu.tmr) {
 681  0155 be14          	ldw	x,_menu+5
 682  0157 2609          	jrne	L522
 683                     ; 126             btn[BTN_INC_IDX].status = BTN_STAT_PRESSED;
 685  0159 3501000a      	mov	_btn+10,#1
 686                     ; 127             menu.tmr = TIME_CHANGE_VALUE;
 688  015d ae0064        	ldw	x,#100
 689  0160 bf14          	ldw	_menu+5,x
 690  0162               L522:
 691                     ; 130     if (!btn_dec()) {
 693  0162 4b10          	push	#16
 694  0164 ae500a        	ldw	x,#20490
 695  0167 cd0000        	call	_GPIO_ReadInputPin
 697  016a 5b01          	addw	sp,#1
 698  016c 4d            	tnz	a
 699  016d 2612          	jrne	L132
 700                     ; 131         btn[BTN_DEC_IDX].debounce = BTN_DEBOUNCE;
 702  016f ae0032        	ldw	x,#50
 703  0172 bf08          	ldw	_btn+8,x
 704                     ; 132         if (!menu.tmr) {
 706  0174 be14          	ldw	x,_menu+5
 707  0176 2609          	jrne	L132
 708                     ; 133             btn[BTN_DEC_IDX].status = BTN_STAT_PRESSED;
 710  0178 35010005      	mov	_btn+5,#1
 711                     ; 134             menu.tmr = TIME_CHANGE_VALUE;
 713  017c ae0064        	ldw	x,#100
 714  017f bf14          	ldw	_menu+5,x
 715  0181               L132:
 716                     ; 137 }
 719  0181 81            	ret
 749                     ; 139 void task_menu(void)
 749                     ; 140 {
 750                     	switch	.text
 751  0182               _task_menu:
 755                     ; 141     process_button();
 757  0182 cd00f6        	call	_process_button
 759                     ; 143     if (!tick)
 761  0185 3d00          	tnz	_tick
 762  0187 2601          	jrne	L542
 763                     ; 144         return;
 766  0189 81            	ret
 767  018a               L542:
 768                     ; 146     if (menu.edit) {
 770  018a 3d12          	tnz	_menu+3
 771  018c 270d          	jreq	L742
 772                     ; 147         dp[DIG1_POS] = (uint8_t)!dp[DIG1_POS];    
 774  018e 3d00          	tnz	_dp
 775  0190 2604          	jrne	L43
 776  0192 a601          	ld	a,#1
 777  0194 2001          	jra	L63
 778  0196               L43:
 779  0196 4f            	clr	a
 780  0197               L63:
 781  0197 b700          	ld	_dp,a
 783  0199 2002          	jra	L152
 784  019b               L742:
 785                     ; 149         dp[DIG1_POS] = 0;
 787  019b 3f00          	clr	_dp
 788  019d               L152:
 789                     ; 152     set_display_option(par[menu.idx].option);
 791  019d b60f          	ld	a,_menu
 792  019f 5f            	clrw	x
 793  01a0 97            	ld	xl,a
 794  01a1 58            	sllw	x
 795  01a2 d60000        	ld	a,(L3_par,x)
 796  01a5 cd0000        	call	_set_display_option
 798                     ; 153     set_display_value(menu.value, par[menu.idx].dp);
 800  01a8 b60f          	ld	a,_menu
 801  01aa 5f            	clrw	x
 802  01ab 97            	ld	xl,a
 803  01ac 58            	sllw	x
 804  01ad d60001        	ld	a,(L3_par+1,x)
 805  01b0 97            	ld	xl,a
 806  01b1 b610          	ld	a,_menu+1
 807  01b3 95            	ld	xh,a
 808  01b4 cd0000        	call	_set_display_value
 810                     ; 154 }
 813  01b7 81            	ret
 960                     	xdef	_process_button
 961                     	xdef	_interrupt_buttons
 962                     	xdef	_get_menu_value
 963                     	switch	.ubsct
 964  0000               _btn:
 965  0000 000000000000  	ds.b	15
 966                     	xdef	_btn
 967  000f               _menu:
 968  000f 000000000000  	ds.b	7
 969                     	xdef	_menu
 970                     	xref.b	_dp
 971                     	xref.b	_tick
 972                     	xref	_set_display_option
 973                     	xref	_set_display_value
 974                     	xdef	_task_menu
 975                     	xdef	_tmr_menu
 976                     	xdef	_init_menu
 977                     	xref	_ITC_SetSoftwarePriority
 978                     	xref	_GPIO_ReadInputPin
 979                     	xref	_GPIO_ReadInputData
 980                     	xref	_GPIO_Init
 981                     	xref	_EXTI_SetTLISensitivity
 982                     	xref	_EXTI_SetExtIntSensitivity
 983                     	xref	_EXTI_DeInit
1003                     	end
