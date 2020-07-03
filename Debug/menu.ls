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
  25  0009 00            	dc.b	0
  26  000a 4c            	dc.b	76
  27  000b 01            	dc.b	1
  28  000c 55            	dc.b	85
  29  000d 00            	dc.b	0
  30  000e 45            	dc.b	69
  31  000f 01            	dc.b	1
  69                     ; 17 void init_menu(void)
  69                     ; 18 {
  71                     	switch	.text
  72  0000               _init_menu:
  76                     ; 20     btn_set_dir();
  78  0000 4b60          	push	#96
  79  0002 4b08          	push	#8
  80  0004 ae500a        	ldw	x,#20490
  81  0007 cd0000        	call	_GPIO_Init
  83  000a 85            	popw	x
  84                     ; 21     btn_inc_dir();
  86  000b 4b60          	push	#96
  87  000d 4b10          	push	#16
  88  000f ae500a        	ldw	x,#20490
  89  0012 cd0000        	call	_GPIO_Init
  91  0015 85            	popw	x
  92                     ; 22     btn_dec_dir();
  94  0016 4b60          	push	#96
  95  0018 4b20          	push	#32
  96  001a ae500a        	ldw	x,#20490
  97  001d cd0000        	call	_GPIO_Init
  99  0020 85            	popw	x
 100                     ; 24     EXTI_DeInit();
 102  0021 cd0000        	call	_EXTI_DeInit
 104                     ; 26     disableInterrupts();
 107  0024 9b            sim
 109                     ; 27     EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);
 112  0025 ae0202        	ldw	x,#514
 113  0028 cd0000        	call	_EXTI_SetExtIntSensitivity
 115                     ; 28     EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
 117  002b 4f            	clr	a
 118  002c cd0000        	call	_EXTI_SetTLISensitivity
 120                     ; 29     ITC_SetSoftwarePriority(ITC_IRQ_PORTC , ITC_PRIORITYLEVEL_3);
 122  002f ae0503        	ldw	x,#1283
 123  0032 cd0000        	call	_ITC_SetSoftwarePriority
 125                     ; 30     enableInterrupts();
 128  0035 9a            rim
 130                     ; 32     menu.idx = 0;
 133  0036 3f09          	clr	_menu
 134                     ; 33     menu.value = get_menu_value(menu.idx);
 136  0038 4f            	clr	a
 137  0039 ad05          	call	_get_menu_value
 139  003b 5f            	clrw	x
 140  003c 97            	ld	xl,a
 141  003d bf0c          	ldw	_menu+3,x
 142                     ; 35 }
 145  003f 81            	ret
 180                     ; 37 uint8_t get_menu_value(uint8_t idx)
 180                     ; 38 {
 181                     	switch	.text
 182  0040               _get_menu_value:
 186                     ; 40     return (uint8_t)get_eeprom_data(idx);
 188  0040 cd0000        	call	_get_eeprom_data
 190  0043 9f            	ld	a,xl
 193  0044 81            	ret
 218                     ; 46 void set_menu_value(void)
 218                     ; 47 {
 219                     	switch	.text
 220  0045               _set_menu_value:
 224                     ; 49     set_eeprom_data(menu.value, menu.idx);
 226  0045 3b0009        	push	_menu
 227  0048 be0c          	ldw	x,_menu+3
 228  004a cd0000        	call	_set_eeprom_data
 230  004d 84            	pop	a
 231                     ; 50     menu.write = 0;
 233  004e 3f0b          	clr	_menu+2
 234                     ; 53 }
 237  0050 81            	ret
 262                     ; 55 void tmr_menu(void)
 262                     ; 56 {
 263                     	switch	.text
 264  0051               _tmr_menu:
 268                     ; 58     _decrement(menu.tmr);
 270  0051 be0e          	ldw	x,_menu+5
 271  0053 2707          	jreq	L16
 274  0055 be0e          	ldw	x,_menu+5
 275  0057 1d0001        	subw	x,#1
 276  005a bf0e          	ldw	_menu+5,x
 277  005c               L16:
 278                     ; 59     _decrement(btn[BTN_SET_IDX].debounce);
 280  005c be01          	ldw	x,_btn+1
 281  005e 2707          	jreq	L36
 284  0060 be01          	ldw	x,_btn+1
 285  0062 1d0001        	subw	x,#1
 286  0065 bf01          	ldw	_btn+1,x
 287  0067               L36:
 288                     ; 60     _decrement(btn[BTN_INC_IDX].debounce);
 290  0067 be07          	ldw	x,_btn+7
 291  0069 2707          	jreq	L56
 294  006b be07          	ldw	x,_btn+7
 295  006d 1d0001        	subw	x,#1
 296  0070 bf07          	ldw	_btn+7,x
 297  0072               L56:
 298                     ; 61     _decrement(btn[BTN_DEC_IDX].debounce);
 300  0072 be04          	ldw	x,_btn+4
 301  0074 2707          	jreq	L76
 304  0076 be04          	ldw	x,_btn+4
 305  0078 1d0001        	subw	x,#1
 306  007b bf04          	ldw	_btn+4,x
 307  007d               L76:
 308                     ; 63 }
 311  007d 81            	ret
 336                     ; 65 static void inc_option(void)
 336                     ; 66 {
 337                     	switch	.text
 338  007e               L17_inc_option:
 342                     ; 68     menu.value = get_menu_value(menu.idx);
 344  007e b609          	ld	a,_menu
 345  0080 adbe          	call	_get_menu_value
 347  0082 5f            	clrw	x
 348  0083 97            	ld	xl,a
 349  0084 bf0c          	ldw	_menu+3,x
 350                     ; 70 }
 353  0086 81            	ret
 378                     ; 72 static void dec_option(void)
 378                     ; 73 {
 379                     	switch	.text
 380  0087               L301_dec_option:
 384                     ; 75     menu.value = get_menu_value(menu.idx);
 386  0087 b609          	ld	a,_menu
 387  0089 adb5          	call	_get_menu_value
 389  008b 5f            	clrw	x
 390  008c 97            	ld	xl,a
 391  008d bf0c          	ldw	_menu+3,x
 392                     ; 77 }
 395  008f 81            	ret
 419                     ; 79 static void inc_value(void)
 419                     ; 80 {
 420                     	switch	.text
 421  0090               L511_inc_value:
 425                     ; 82     if (++menu.value > MAX_VALUE)
 427  0090 be0c          	ldw	x,_menu+3
 428  0092 1c0001        	addw	x,#1
 429  0095 bf0c          	ldw	_menu+3,x
 430  0097 a30259        	cpw	x,#601
 431  009a 2503          	jrult	L721
 432                     ; 83         menu.value = 0;
 434  009c 5f            	clrw	x
 435  009d bf0c          	ldw	_menu+3,x
 436  009f               L721:
 437                     ; 85 }
 440  009f 81            	ret
 464                     ; 87 static void dec_value(void)
 464                     ; 88 {
 465                     	switch	.text
 466  00a0               L131_dec_value:
 470                     ; 90     if (menu.value) {
 472  00a0 be0c          	ldw	x,_menu+3
 473  00a2 2709          	jreq	L341
 474                     ; 91         menu.value--;
 476  00a4 be0c          	ldw	x,_menu+3
 477  00a6 1d0001        	subw	x,#1
 478  00a9 bf0c          	ldw	_menu+3,x
 480  00ab 2005          	jra	L541
 481  00ad               L341:
 482                     ; 93         menu.value = MAX_VALUE;
 484  00ad ae0258        	ldw	x,#600
 485  00b0 bf0c          	ldw	_menu+3,x
 486  00b2               L541:
 487                     ; 96 }
 490  00b2 81            	ret
 516                     ; 98 void interrupt_buttons(void)
 516                     ; 99 {
 517                     	switch	.text
 518  00b3               _interrupt_buttons:
 522                     ; 102     if ((GPIO_ReadInputData(BTN_PORT) & BTN_SET_PIN_NUM) == 0x00) {
 524  00b3 ae500a        	ldw	x,#20490
 525  00b6 cd0000        	call	_GPIO_ReadInputData
 527  00b9 a508          	bcp	a,#8
 528  00bb 260f          	jrne	L751
 529                     ; 103         if (!btn[BTN_SET_IDX].debounce) {
 531  00bd be01          	ldw	x,_btn+1
 532  00bf 2645          	jrne	L361
 533                     ; 104             btn[BTN_SET_IDX].debounce = BTN_DEBOUNCE;
 535  00c1 ae0032        	ldw	x,#50
 536  00c4 bf01          	ldw	_btn+1,x
 537                     ; 105             btn[BTN_SET_IDX].status = BTN_STAT_PRESSED;
 539  00c6 35010000      	mov	_btn,#1
 540  00ca 203a          	jra	L361
 541  00cc               L751:
 542                     ; 108     if ((GPIO_ReadInputData(BTN_PORT) & BTN_INC_PIN_NUM) == 0x00) {
 544  00cc ae500a        	ldw	x,#20490
 545  00cf cd0000        	call	_GPIO_ReadInputData
 547  00d2 a510          	bcp	a,#16
 548  00d4 2614          	jrne	L561
 549                     ; 109         if (!btn[BTN_INC_IDX].debounce) {
 551  00d6 be07          	ldw	x,_btn+7
 552  00d8 262c          	jrne	L361
 553                     ; 110             btn[BTN_INC_IDX].debounce = BTN_DEBOUNCE;
 555  00da ae0032        	ldw	x,#50
 556  00dd bf07          	ldw	_btn+7,x
 557                     ; 111             btn[BTN_INC_IDX].status = BTN_STAT_PRESSED;
 559  00df 35010006      	mov	_btn+6,#1
 560                     ; 112             menu.tmr = TIME_HOLD_BUTTON;
 562  00e3 ae05dc        	ldw	x,#1500
 563  00e6 bf0e          	ldw	_menu+5,x
 564  00e8 201c          	jra	L361
 565  00ea               L561:
 566                     ; 115     if ((GPIO_ReadInputData(BTN_PORT) & BTN_DEC_PIN_NUM) == 0x00) {
 568  00ea ae500a        	ldw	x,#20490
 569  00ed cd0000        	call	_GPIO_ReadInputData
 571  00f0 a520          	bcp	a,#32
 572  00f2 2612          	jrne	L361
 573                     ; 116         if (!btn[BTN_DEC_IDX].debounce) {
 575  00f4 be04          	ldw	x,_btn+4
 576  00f6 260e          	jrne	L361
 577                     ; 117             btn[BTN_DEC_IDX].debounce = BTN_DEBOUNCE;
 579  00f8 ae0032        	ldw	x,#50
 580  00fb bf04          	ldw	_btn+4,x
 581                     ; 118             btn[BTN_DEC_IDX].status = BTN_STAT_PRESSED;
 583  00fd 35010003      	mov	_btn+3,#1
 584                     ; 119             menu.tmr = TIME_HOLD_BUTTON;
 586  0101 ae05dc        	ldw	x,#1500
 587  0104 bf0e          	ldw	_menu+5,x
 588  0106               L361:
 589                     ; 123 }
 592  0106 81            	ret
 622                     ; 125 void process_button(void)
 622                     ; 126 {
 623                     	switch	.text
 624  0107               _process_button:
 628                     ; 128     if (btn[BTN_SET_IDX].status == BTN_STAT_PRESSED) {
 630  0107 b600          	ld	a,_btn
 631  0109 a101          	cp	a,#1
 632  010b 260a          	jrne	L702
 633                     ; 129         btn[BTN_SET_IDX].status = BTN_STAT_FREE;
 635  010d 3f00          	clr	_btn
 636                     ; 130         if (menu.edit)
 638  010f 3d0a          	tnz	_menu+1
 639  0111 2704          	jreq	L702
 640                     ; 131             menu.write = 1; 
 642  0113 3501000b      	mov	_menu+2,#1
 643  0117               L702:
 644                     ; 134     if (btn[BTN_INC_IDX].status == BTN_STAT_PRESSED) {
 646  0117 b606          	ld	a,_btn+6
 647  0119 a101          	cp	a,#1
 648  011b 260e          	jrne	L312
 649                     ; 135         btn[BTN_INC_IDX].status = BTN_STAT_FREE;
 651  011d 3f06          	clr	_btn+6
 652                     ; 136         if (!menu.edit)
 654  011f 3d0a          	tnz	_menu+1
 655  0121 2605          	jrne	L512
 656                     ; 137             inc_option();
 658  0123 cd007e        	call	L17_inc_option
 661  0126 2003          	jra	L312
 662  0128               L512:
 663                     ; 139             inc_value();
 665  0128 cd0090        	call	L511_inc_value
 667  012b               L312:
 668                     ; 141     if (btn[BTN_DEC_IDX].status == BTN_STAT_PRESSED) {
 670  012b b603          	ld	a,_btn+3
 671  012d a101          	cp	a,#1
 672  012f 260e          	jrne	L122
 673                     ; 142         btn[BTN_DEC_IDX].status = BTN_STAT_FREE;
 675  0131 3f03          	clr	_btn+3
 676                     ; 143         if (!menu.edit)
 678  0133 3d0a          	tnz	_menu+1
 679  0135 2605          	jrne	L322
 680                     ; 144             dec_option();
 682  0137 cd0087        	call	L301_dec_option
 685  013a 2003          	jra	L122
 686  013c               L322:
 687                     ; 146             dec_value();
 689  013c cd00a0        	call	L131_dec_value
 691  013f               L122:
 692                     ; 148     if (!btn_set()) {
 694  013f 4b08          	push	#8
 695  0141 ae500a        	ldw	x,#20490
 696  0144 cd0000        	call	_GPIO_ReadInputPin
 698  0147 5b01          	addw	sp,#1
 699  0149 4d            	tnz	a
 700  014a 2605          	jrne	L722
 701                     ; 149         btn[BTN_SET_IDX].debounce = BTN_DEBOUNCE;
 703  014c ae0032        	ldw	x,#50
 704  014f bf01          	ldw	_btn+1,x
 705  0151               L722:
 706                     ; 151     if (!btn_inc()) {
 708  0151 4b10          	push	#16
 709  0153 ae500a        	ldw	x,#20490
 710  0156 cd0000        	call	_GPIO_ReadInputPin
 712  0159 5b01          	addw	sp,#1
 713  015b 4d            	tnz	a
 714  015c 2612          	jrne	L132
 715                     ; 152         btn[BTN_INC_IDX].debounce = BTN_DEBOUNCE;
 717  015e ae0032        	ldw	x,#50
 718  0161 bf07          	ldw	_btn+7,x
 719                     ; 153         if (!menu.tmr) {
 721  0163 be0e          	ldw	x,_menu+5
 722  0165 2609          	jrne	L132
 723                     ; 154             btn[BTN_INC_IDX].status = BTN_STAT_PRESSED;
 725  0167 35010006      	mov	_btn+6,#1
 726                     ; 155             menu.tmr = TIME_CHANGE_VALUE;
 728  016b ae0064        	ldw	x,#100
 729  016e bf0e          	ldw	_menu+5,x
 730  0170               L132:
 731                     ; 158     if (!btn_dec()) {
 733  0170 4b20          	push	#32
 734  0172 ae500a        	ldw	x,#20490
 735  0175 cd0000        	call	_GPIO_ReadInputPin
 737  0178 5b01          	addw	sp,#1
 738  017a 4d            	tnz	a
 739  017b 2612          	jrne	L532
 740                     ; 159         btn[BTN_DEC_IDX].debounce = BTN_DEBOUNCE;
 742  017d ae0032        	ldw	x,#50
 743  0180 bf04          	ldw	_btn+4,x
 744                     ; 160         if (!menu.tmr) {
 746  0182 be0e          	ldw	x,_menu+5
 747  0184 2609          	jrne	L532
 748                     ; 161             btn[BTN_DEC_IDX].status = BTN_STAT_PRESSED;
 750  0186 35010003      	mov	_btn+3,#1
 751                     ; 162             menu.tmr = TIME_CHANGE_VALUE;
 753  018a ae0064        	ldw	x,#100
 754  018d bf0e          	ldw	_menu+5,x
 755  018f               L532:
 756                     ; 166 }
 759  018f 81            	ret
 762                     	bsct
 763  0000               L142_option_dp:
 764  0000 00            	dc.b	0
 802                     ; 168 void task_menu(void)
 802                     ; 169 {
 803                     	switch	.text
 804  0190               _task_menu:
 808                     ; 173     process_button();
 810  0190 cd0107        	call	_process_button
 812                     ; 175     if (!tick)
 814  0193 3d00          	tnz	_tick
 815  0195 2601          	jrne	L162
 816                     ; 176         return;
 819  0197 81            	ret
 820  0198               L162:
 821                     ; 178     if (menu.write)
 823  0198 3d0b          	tnz	_menu+2
 824  019a 2703          	jreq	L362
 825                     ; 179         set_menu_value();
 827  019c cd0045        	call	_set_menu_value
 829  019f               L362:
 830                     ; 182     menu.edit = 1;
 832  019f 3501000a      	mov	_menu+1,#1
 833                     ; 184     set_display_value(menu.value, 1);//par[menu.idx].dp);
 835  01a3 4b01          	push	#1
 836  01a5 be0c          	ldw	x,_menu+3
 837  01a7 cd0000        	call	_set_display_value
 839  01aa 84            	pop	a
 840                     ; 185     set_led_period(menu.value);
 842  01ab be0c          	ldw	x,_menu+3
 843  01ad cd0000        	call	_set_led_period
 845                     ; 187 }
 848  01b0 81            	ret
 981                     	xdef	_process_button
 982                     	xdef	_interrupt_buttons
 983                     	switch	.ubsct
 984  0000               _btn:
 985  0000 000000000000  	ds.b	9
 986                     	xdef	_btn
 987  0009               _menu:
 988  0009 000000000000  	ds.b	7
 989                     	xdef	_menu
 990                     	xref.b	_tick
 991                     	xref	_set_led_period
 992                     	xref	_set_display_value
 993                     	xref	_set_eeprom_data
 994                     	xref	_get_eeprom_data
 995                     	xdef	_task_menu
 996                     	xdef	_tmr_menu
 997                     	xdef	_set_menu_value
 998                     	xdef	_get_menu_value
 999                     	xdef	_init_menu
1000                     	xref	_ITC_SetSoftwarePriority
1001                     	xref	_GPIO_ReadInputPin
1002                     	xref	_GPIO_ReadInputData
1003                     	xref	_GPIO_Init
1004                     	xref	_EXTI_SetTLISensitivity
1005                     	xref	_EXTI_SetExtIntSensitivity
1006                     	xref	_EXTI_DeInit
1026                     	end
