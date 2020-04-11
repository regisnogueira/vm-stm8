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
  69                     ; 18 void init_menu(void)
  69                     ; 19 {
  71                     	switch	.text
  72  0000               _init_menu:
  76                     ; 21     btn_set_dir();
  78  0000 4b60          	push	#96
  79  0002 4b08          	push	#8
  80  0004 ae500a        	ldw	x,#20490
  81  0007 cd0000        	call	_GPIO_Init
  83  000a 85            	popw	x
  84                     ; 22     btn_inc_dir();
  86  000b 4b60          	push	#96
  87  000d 4b20          	push	#32
  88  000f ae500a        	ldw	x,#20490
  89  0012 cd0000        	call	_GPIO_Init
  91  0015 85            	popw	x
  92                     ; 23     btn_dec_dir();
  94  0016 4b60          	push	#96
  95  0018 4b10          	push	#16
  96  001a ae500a        	ldw	x,#20490
  97  001d cd0000        	call	_GPIO_Init
  99  0020 85            	popw	x
 100                     ; 25     EXTI_DeInit();
 102  0021 cd0000        	call	_EXTI_DeInit
 104                     ; 27     disableInterrupts();
 107  0024 9b            sim
 109                     ; 28     EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);
 112  0025 ae0202        	ldw	x,#514
 113  0028 cd0000        	call	_EXTI_SetExtIntSensitivity
 115                     ; 29     EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
 117  002b 4f            	clr	a
 118  002c cd0000        	call	_EXTI_SetTLISensitivity
 120                     ; 30     ITC_SetSoftwarePriority(ITC_IRQ_PORTC , ITC_PRIORITYLEVEL_3);
 122  002f ae0503        	ldw	x,#1283
 123  0032 cd0000        	call	_ITC_SetSoftwarePriority
 125                     ; 31     enableInterrupts();
 128  0035 9a            rim
 130                     ; 33     menu.idx = 0;
 133  0036 3f09          	clr	_menu
 134                     ; 34     menu.value = get_menu_value(menu.idx);
 136  0038 4f            	clr	a
 137  0039 ad03          	call	_get_menu_value
 139  003b b70a          	ld	_menu+1,a
 140                     ; 36 }
 143  003d 81            	ret
 178                     ; 38 uint8_t get_menu_value(uint8_t idx)
 178                     ; 39 {
 179                     	switch	.text
 180  003e               _get_menu_value:
 184                     ; 41     return (uint8_t)get_eeprom_data(idx);
 186  003e cd0000        	call	_get_eeprom_data
 188  0041 9f            	ld	a,xl
 191  0042 81            	ret
 217                     ; 47 void set_menu_value(void)
 217                     ; 48 {
 218                     	switch	.text
 219  0043               _set_menu_value:
 223                     ; 50     set_eeprom_data(menu.value, menu.idx);
 225  0043 3b0009        	push	_menu
 226  0046 b60a          	ld	a,_menu+1
 227  0048 5f            	clrw	x
 228  0049 97            	ld	xl,a
 229  004a cd0000        	call	_set_eeprom_data
 231  004d 84            	pop	a
 232                     ; 51     menu.write = 0;
 234  004e 3f0c          	clr	_menu+3
 235                     ; 52     _beep(3);
 237  0050 ae0032        	ldw	x,#50
 238  0053 89            	pushw	x
 239  0054 ae0064        	ldw	x,#100
 240  0057 89            	pushw	x
 241  0058 a603          	ld	a,#3
 242  005a cd0000        	call	_set_buzzer
 244  005d 5b04          	addw	sp,#4
 245                     ; 54 }
 248  005f 81            	ret
 273                     ; 56 void tmr_menu(void)
 273                     ; 57 {
 274                     	switch	.text
 275  0060               _tmr_menu:
 279                     ; 59     _decrement(menu.tmr);
 281  0060 be0d          	ldw	x,_menu+4
 282  0062 2707          	jreq	L16
 285  0064 be0d          	ldw	x,_menu+4
 286  0066 1d0001        	subw	x,#1
 287  0069 bf0d          	ldw	_menu+4,x
 288  006b               L16:
 289                     ; 60     _decrement(btn[BTN_SET_IDX].debounce);
 291  006b be01          	ldw	x,_btn+1
 292  006d 2707          	jreq	L36
 295  006f be01          	ldw	x,_btn+1
 296  0071 1d0001        	subw	x,#1
 297  0074 bf01          	ldw	_btn+1,x
 298  0076               L36:
 299                     ; 61     _decrement(btn[BTN_INC_IDX].debounce);
 301  0076 be07          	ldw	x,_btn+7
 302  0078 2707          	jreq	L56
 305  007a be07          	ldw	x,_btn+7
 306  007c 1d0001        	subw	x,#1
 307  007f bf07          	ldw	_btn+7,x
 308  0081               L56:
 309                     ; 62     _decrement(btn[BTN_DEC_IDX].debounce);
 311  0081 be04          	ldw	x,_btn+4
 312  0083 2707          	jreq	L76
 315  0085 be04          	ldw	x,_btn+4
 316  0087 1d0001        	subw	x,#1
 317  008a bf04          	ldw	_btn+4,x
 318  008c               L76:
 319                     ; 64 }
 322  008c 81            	ret
 348                     ; 66 static void inc_option(void)
 348                     ; 67 {
 349                     	switch	.text
 350  008d               L17_inc_option:
 354                     ; 69     if (++menu.idx > PAR_COUNT)
 356  008d 3c09          	inc	_menu
 357  008f b609          	ld	a,_menu
 358  0091 a108          	cp	a,#8
 359  0093 2502          	jrult	L301
 360                     ; 70         menu.idx = 0;
 362  0095 3f09          	clr	_menu
 363  0097               L301:
 364                     ; 71     menu.value = get_menu_value(menu.idx);
 366  0097 b609          	ld	a,_menu
 367  0099 ada3          	call	_get_menu_value
 369  009b b70a          	ld	_menu+1,a
 370                     ; 73 }
 373  009d 81            	ret
 399                     ; 75 static void dec_option(void)
 399                     ; 76 {
 400                     	switch	.text
 401  009e               L501_dec_option:
 405                     ; 78     if (menu.idx) {
 407  009e 3d09          	tnz	_menu
 408  00a0 2704          	jreq	L711
 409                     ; 79         menu.idx--;
 411  00a2 3a09          	dec	_menu
 413  00a4 2004          	jra	L121
 414  00a6               L711:
 415                     ; 81         menu.idx = PAR_COUNT;
 417  00a6 35070009      	mov	_menu,#7
 418  00aa               L121:
 419                     ; 83     menu.value = get_menu_value(menu.idx);
 421  00aa b609          	ld	a,_menu
 422  00ac ad90          	call	_get_menu_value
 424  00ae b70a          	ld	_menu+1,a
 425                     ; 85 }
 428  00b0 81            	ret
 452                     ; 87 static void inc_value(void)
 452                     ; 88 {
 453                     	switch	.text
 454  00b1               L321_inc_value:
 458                     ; 90     if (++menu.value > MAX_VALUE)
 460  00b1 3c0a          	inc	_menu+1
 461  00b3 b60a          	ld	a,_menu+1
 462  00b5 a164          	cp	a,#100
 463  00b7 2502          	jrult	L531
 464                     ; 91         menu.value = 0;
 466  00b9 3f0a          	clr	_menu+1
 467  00bb               L531:
 468                     ; 93 }
 471  00bb 81            	ret
 495                     ; 95 static void dec_value(void)
 495                     ; 96 {
 496                     	switch	.text
 497  00bc               L731_dec_value:
 501                     ; 98     if (menu.value) {
 503  00bc 3d0a          	tnz	_menu+1
 504  00be 2704          	jreq	L151
 505                     ; 99         menu.value--;
 507  00c0 3a0a          	dec	_menu+1
 509  00c2 2004          	jra	L351
 510  00c4               L151:
 511                     ; 101         menu.value = MAX_VALUE;
 513  00c4 3563000a      	mov	_menu+1,#99
 514  00c8               L351:
 515                     ; 104 }
 518  00c8 81            	ret
 545                     ; 106 void interrupt_buttons(void)
 545                     ; 107 {
 546                     	switch	.text
 547  00c9               _interrupt_buttons:
 551                     ; 109     _beep(1);
 553  00c9 ae0032        	ldw	x,#50
 554  00cc 89            	pushw	x
 555  00cd ae0064        	ldw	x,#100
 556  00d0 89            	pushw	x
 557  00d1 a601          	ld	a,#1
 558  00d3 cd0000        	call	_set_buzzer
 560  00d6 5b04          	addw	sp,#4
 561                     ; 110     if ((GPIO_ReadInputData(BTN_PORT) & BTN_SET_PIN_NUM) == 0x00) {
 563  00d8 ae500a        	ldw	x,#20490
 564  00db cd0000        	call	_GPIO_ReadInputData
 566  00de a508          	bcp	a,#8
 567  00e0 260f          	jrne	L561
 568                     ; 111         if (!btn[BTN_SET_IDX].debounce) {
 570  00e2 be01          	ldw	x,_btn+1
 571  00e4 2645          	jrne	L171
 572                     ; 112             btn[BTN_SET_IDX].debounce = BTN_DEBOUNCE;
 574  00e6 ae0032        	ldw	x,#50
 575  00e9 bf01          	ldw	_btn+1,x
 576                     ; 113             btn[BTN_SET_IDX].status = BTN_STAT_PRESSED;
 578  00eb 35010000      	mov	_btn,#1
 579  00ef 203a          	jra	L171
 580  00f1               L561:
 581                     ; 116     if ((GPIO_ReadInputData(BTN_PORT) & BTN_INC_PIN_NUM) == 0x00) {
 583  00f1 ae500a        	ldw	x,#20490
 584  00f4 cd0000        	call	_GPIO_ReadInputData
 586  00f7 a520          	bcp	a,#32
 587  00f9 2614          	jrne	L371
 588                     ; 117         if (!btn[BTN_INC_IDX].debounce) {
 590  00fb be07          	ldw	x,_btn+7
 591  00fd 262c          	jrne	L171
 592                     ; 118             btn[BTN_INC_IDX].debounce = BTN_DEBOUNCE;
 594  00ff ae0032        	ldw	x,#50
 595  0102 bf07          	ldw	_btn+7,x
 596                     ; 119             btn[BTN_INC_IDX].status = BTN_STAT_PRESSED;
 598  0104 35010006      	mov	_btn+6,#1
 599                     ; 120             menu.tmr = TIME_HOLD_BUTTON;
 601  0108 ae05dc        	ldw	x,#1500
 602  010b bf0d          	ldw	_menu+4,x
 603  010d 201c          	jra	L171
 604  010f               L371:
 605                     ; 123     if ((GPIO_ReadInputData(BTN_PORT) & BTN_DEC_PIN_NUM) == 0x00) {
 607  010f ae500a        	ldw	x,#20490
 608  0112 cd0000        	call	_GPIO_ReadInputData
 610  0115 a510          	bcp	a,#16
 611  0117 2612          	jrne	L171
 612                     ; 124         if (!btn[BTN_DEC_IDX].debounce) {
 614  0119 be04          	ldw	x,_btn+4
 615  011b 260e          	jrne	L171
 616                     ; 125             btn[BTN_DEC_IDX].debounce = BTN_DEBOUNCE;
 618  011d ae0032        	ldw	x,#50
 619  0120 bf04          	ldw	_btn+4,x
 620                     ; 126             btn[BTN_DEC_IDX].status = BTN_STAT_PRESSED;
 622  0122 35010003      	mov	_btn+3,#1
 623                     ; 127             menu.tmr = TIME_HOLD_BUTTON;
 625  0126 ae05dc        	ldw	x,#1500
 626  0129 bf0d          	ldw	_menu+4,x
 627  012b               L171:
 628                     ; 131 }
 631  012b 81            	ret
 661                     ; 133 void process_button(void)
 661                     ; 134 {
 662                     	switch	.text
 663  012c               _process_button:
 667                     ; 136     if (btn[BTN_SET_IDX].status == BTN_STAT_PRESSED) {
 669  012c b600          	ld	a,_btn
 670  012e a101          	cp	a,#1
 671  0130 2615          	jrne	L512
 672                     ; 137         btn[BTN_SET_IDX].status = BTN_STAT_FREE;
 674  0132 3f00          	clr	_btn
 675                     ; 138         if (menu.edit)
 677  0134 3d0b          	tnz	_menu+2
 678  0136 2704          	jreq	L712
 679                     ; 139             menu.write = 1; 
 681  0138 3501000c      	mov	_menu+3,#1
 682  013c               L712:
 683                     ; 140         menu.edit = (uint8_t)!menu.edit;
 685  013c 3d0b          	tnz	_menu+2
 686  013e 2604          	jrne	L03
 687  0140 a601          	ld	a,#1
 688  0142 2001          	jra	L23
 689  0144               L03:
 690  0144 4f            	clr	a
 691  0145               L23:
 692  0145 b70b          	ld	_menu+2,a
 693  0147               L512:
 694                     ; 142     if (btn[BTN_INC_IDX].status == BTN_STAT_PRESSED) {
 696  0147 b606          	ld	a,_btn+6
 697  0149 a101          	cp	a,#1
 698  014b 260e          	jrne	L122
 699                     ; 143         btn[BTN_INC_IDX].status = BTN_STAT_FREE;
 701  014d 3f06          	clr	_btn+6
 702                     ; 144         if (!menu.edit)
 704  014f 3d0b          	tnz	_menu+2
 705  0151 2605          	jrne	L322
 706                     ; 145             inc_option();
 708  0153 cd008d        	call	L17_inc_option
 711  0156 2003          	jra	L122
 712  0158               L322:
 713                     ; 147             inc_value();
 715  0158 cd00b1        	call	L321_inc_value
 717  015b               L122:
 718                     ; 149     if (btn[BTN_DEC_IDX].status == BTN_STAT_PRESSED) {
 720  015b b603          	ld	a,_btn+3
 721  015d a101          	cp	a,#1
 722  015f 260e          	jrne	L722
 723                     ; 150         btn[BTN_DEC_IDX].status = BTN_STAT_FREE;
 725  0161 3f03          	clr	_btn+3
 726                     ; 151         if (!menu.edit)
 728  0163 3d0b          	tnz	_menu+2
 729  0165 2605          	jrne	L132
 730                     ; 152             dec_option();
 732  0167 cd009e        	call	L501_dec_option
 735  016a 2003          	jra	L722
 736  016c               L132:
 737                     ; 154             dec_value();
 739  016c cd00bc        	call	L731_dec_value
 741  016f               L722:
 742                     ; 156     if (!btn_set()) {
 744  016f 4b08          	push	#8
 745  0171 ae500a        	ldw	x,#20490
 746  0174 cd0000        	call	_GPIO_ReadInputPin
 748  0177 5b01          	addw	sp,#1
 749  0179 4d            	tnz	a
 750  017a 2605          	jrne	L532
 751                     ; 157         btn[BTN_SET_IDX].debounce = BTN_DEBOUNCE;
 753  017c ae0032        	ldw	x,#50
 754  017f bf01          	ldw	_btn+1,x
 755  0181               L532:
 756                     ; 159     if (!btn_inc()) {
 758  0181 4b20          	push	#32
 759  0183 ae500a        	ldw	x,#20490
 760  0186 cd0000        	call	_GPIO_ReadInputPin
 762  0189 5b01          	addw	sp,#1
 763  018b 4d            	tnz	a
 764  018c 2612          	jrne	L732
 765                     ; 160         btn[BTN_INC_IDX].debounce = BTN_DEBOUNCE;
 767  018e ae0032        	ldw	x,#50
 768  0191 bf07          	ldw	_btn+7,x
 769                     ; 161         if (!menu.tmr) {
 771  0193 be0d          	ldw	x,_menu+4
 772  0195 2609          	jrne	L732
 773                     ; 162             btn[BTN_INC_IDX].status = BTN_STAT_PRESSED;
 775  0197 35010006      	mov	_btn+6,#1
 776                     ; 163             menu.tmr = TIME_CHANGE_VALUE;
 778  019b ae0064        	ldw	x,#100
 779  019e bf0d          	ldw	_menu+4,x
 780  01a0               L732:
 781                     ; 166     if (!btn_dec()) {
 783  01a0 4b10          	push	#16
 784  01a2 ae500a        	ldw	x,#20490
 785  01a5 cd0000        	call	_GPIO_ReadInputPin
 787  01a8 5b01          	addw	sp,#1
 788  01aa 4d            	tnz	a
 789  01ab 2612          	jrne	L342
 790                     ; 167         btn[BTN_DEC_IDX].debounce = BTN_DEBOUNCE;
 792  01ad ae0032        	ldw	x,#50
 793  01b0 bf04          	ldw	_btn+4,x
 794                     ; 168         if (!menu.tmr) {
 796  01b2 be0d          	ldw	x,_menu+4
 797  01b4 2609          	jrne	L342
 798                     ; 169             btn[BTN_DEC_IDX].status = BTN_STAT_PRESSED;
 800  01b6 35010003      	mov	_btn+3,#1
 801                     ; 170             menu.tmr = TIME_CHANGE_VALUE;
 803  01ba ae0064        	ldw	x,#100
 804  01bd bf0d          	ldw	_menu+4,x
 805  01bf               L342:
 806                     ; 174 }
 809  01bf 81            	ret
 812                     	bsct
 813  0000               L742_option_dp:
 814  0000 00            	dc.b	0
 853                     ; 176 void task_menu(void)
 853                     ; 177 {
 854                     	switch	.text
 855  01c0               _task_menu:
 859                     ; 181     process_button();
 861  01c0 cd012c        	call	_process_button
 863                     ; 183     if (!tick)
 865  01c3 3d00          	tnz	_tick
 866  01c5 2601          	jrne	L762
 867                     ; 184         return;
 870  01c7 81            	ret
 871  01c8               L762:
 872                     ; 186     if (menu.write)
 874  01c8 3d0c          	tnz	_menu+3
 875  01ca 2703          	jreq	L172
 876                     ; 187         set_menu_value();
 878  01cc cd0043        	call	_set_menu_value
 880  01cf               L172:
 881                     ; 189     option_dp = (menu.edit) ? (option_dp^1u) : 0u;
 883  01cf 3d0b          	tnz	_menu+2
 884  01d1 2706          	jreq	L63
 885  01d3 b600          	ld	a,L742_option_dp
 886  01d5 a801          	xor	a,#1
 887  01d7 2001          	jra	L04
 888  01d9               L63:
 889  01d9 4f            	clr	a
 890  01da               L04:
 891  01da b700          	ld	L742_option_dp,a
 892                     ; 191     set_display_option(par[menu.idx].option, option_dp);
 894  01dc b600          	ld	a,L742_option_dp
 895  01de 97            	ld	xl,a
 896  01df b609          	ld	a,_menu
 897  01e1 905f          	clrw	y
 898  01e3 9097          	ld	yl,a
 899  01e5 9058          	sllw	y
 900  01e7 90d60000      	ld	a,(L3_par,y)
 901  01eb 95            	ld	xh,a
 902  01ec cd0000        	call	_set_display_option
 904                     ; 192     set_display_value(menu.value, par[menu.idx].dp);
 906  01ef b609          	ld	a,_menu
 907  01f1 5f            	clrw	x
 908  01f2 97            	ld	xl,a
 909  01f3 58            	sllw	x
 910  01f4 d60001        	ld	a,(L3_par+1,x)
 911  01f7 97            	ld	xl,a
 912  01f8 b60a          	ld	a,_menu+1
 913  01fa 95            	ld	xh,a
 914  01fb cd0000        	call	_set_display_value
 916                     ; 194 }
 919  01fe 81            	ret
1052                     	xdef	_process_button
1053                     	xdef	_interrupt_buttons
1054                     	switch	.ubsct
1055  0000               _btn:
1056  0000 000000000000  	ds.b	9
1057                     	xdef	_btn
1058  0009               _menu:
1059  0009 000000000000  	ds.b	6
1060                     	xdef	_menu
1061                     	xref.b	_tick
1062                     	xref	_set_display_option
1063                     	xref	_set_display_value
1064                     	xref	_set_eeprom_data
1065                     	xref	_get_eeprom_data
1066                     	xref	_set_buzzer
1067                     	xdef	_task_menu
1068                     	xdef	_tmr_menu
1069                     	xdef	_set_menu_value
1070                     	xdef	_get_menu_value
1071                     	xdef	_init_menu
1072                     	xref	_ITC_SetSoftwarePriority
1073                     	xref	_GPIO_ReadInputPin
1074                     	xref	_GPIO_ReadInputData
1075                     	xref	_GPIO_Init
1076                     	xref	_EXTI_SetTLISensitivity
1077                     	xref	_EXTI_SetExtIntSensitivity
1078                     	xref	_EXTI_DeInit
1098                     	end
