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
  67                     ; 18 void init_menu(void)
  67                     ; 19 {
  69                     	switch	.text
  70  0000               _init_menu:
  74                     ; 20     btn_set_dir();
  76  0000 4b60          	push	#96
  77  0002 4b08          	push	#8
  78  0004 ae500a        	ldw	x,#20490
  79  0007 cd0000        	call	_GPIO_Init
  81  000a 85            	popw	x
  82                     ; 21     btn_inc_dir();
  84  000b 4b60          	push	#96
  85  000d 4b20          	push	#32
  86  000f ae500a        	ldw	x,#20490
  87  0012 cd0000        	call	_GPIO_Init
  89  0015 85            	popw	x
  90                     ; 22     btn_dec_dir();
  92  0016 4b60          	push	#96
  93  0018 4b10          	push	#16
  94  001a ae500a        	ldw	x,#20490
  95  001d cd0000        	call	_GPIO_Init
  97  0020 85            	popw	x
  98                     ; 24     EXTI_DeInit();
 100  0021 cd0000        	call	_EXTI_DeInit
 102                     ; 26     disableInterrupts();
 105  0024 9b            sim
 107                     ; 27     EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);
 110  0025 ae0202        	ldw	x,#514
 111  0028 cd0000        	call	_EXTI_SetExtIntSensitivity
 113                     ; 28     EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
 115  002b 4f            	clr	a
 116  002c cd0000        	call	_EXTI_SetTLISensitivity
 118                     ; 29     ITC_SetSoftwarePriority(ITC_IRQ_PORTC , ITC_PRIORITYLEVEL_3);
 120  002f ae0503        	ldw	x,#1283
 121  0032 cd0000        	call	_ITC_SetSoftwarePriority
 123                     ; 30     enableInterrupts();
 126  0035 9a            rim
 128                     ; 31 }
 132  0036 81            	ret
 176                     ; 33 uint8_t get_menu_value(uint8_t idx)
 176                     ; 34 {
 177                     	switch	.text
 178  0037               _get_menu_value:
 180  0037 88            	push	a
 181       00000001      OFST:	set	1
 184                     ; 37     value = (uint8_t)get_eeprom_data(idx);
 186  0038 cd0000        	call	_get_eeprom_data
 188  003b 9f            	ld	a,xl
 189  003c 6b01          	ld	(OFST+0,sp),a
 191                     ; 39     return value;
 193  003e 7b01          	ld	a,(OFST+0,sp)
 196  0040 5b01          	addw	sp,#1
 197  0042 81            	ret
 222                     ; 42 void set_menu_value(void)
 222                     ; 43 {
 223                     	switch	.text
 224  0043               _set_menu_value:
 228                     ; 44     set_eeprom_data(menu.value, menu.idx);
 230  0043 3b0009        	push	_menu
 231  0046 b60a          	ld	a,_menu+1
 232  0048 5f            	clrw	x
 233  0049 97            	ld	xl,a
 234  004a cd0000        	call	_set_eeprom_data
 236  004d 84            	pop	a
 237                     ; 45     menu.write = 0;
 239  004e 3f0d          	clr	_menu+4
 240                     ; 46 }
 243  0050 81            	ret
 268                     ; 48 void tmr_menu(void)
 268                     ; 49 {
 269                     	switch	.text
 270  0051               _tmr_menu:
 274                     ; 50     _decrement(menu.tmr);
 276  0051 be0e          	ldw	x,_menu+5
 277  0053 2707          	jreq	L56
 280  0055 be0e          	ldw	x,_menu+5
 281  0057 1d0001        	subw	x,#1
 282  005a bf0e          	ldw	_menu+5,x
 283  005c               L56:
 284                     ; 51     _decrement(btn[BTN_SET_IDX].debounce);
 286  005c be01          	ldw	x,_btn+1
 287  005e 2707          	jreq	L76
 290  0060 be01          	ldw	x,_btn+1
 291  0062 1d0001        	subw	x,#1
 292  0065 bf01          	ldw	_btn+1,x
 293  0067               L76:
 294                     ; 52     _decrement(btn[BTN_INC_IDX].debounce);
 296  0067 be07          	ldw	x,_btn+7
 297  0069 2707          	jreq	L17
 300  006b be07          	ldw	x,_btn+7
 301  006d 1d0001        	subw	x,#1
 302  0070 bf07          	ldw	_btn+7,x
 303  0072               L17:
 304                     ; 53     _decrement(btn[BTN_DEC_IDX].debounce);
 306  0072 be04          	ldw	x,_btn+4
 307  0074 2707          	jreq	L37
 310  0076 be04          	ldw	x,_btn+4
 311  0078 1d0001        	subw	x,#1
 312  007b bf04          	ldw	_btn+4,x
 313  007d               L37:
 314                     ; 54 }
 317  007d 81            	ret
 343                     ; 56 static void inc_option(void)
 343                     ; 57 {
 344                     	switch	.text
 345  007e               L57_inc_option:
 349                     ; 58     if (++menu.idx > PAR_COUNT)
 351  007e 3c09          	inc	_menu
 352  0080 b609          	ld	a,_menu
 353  0082 a108          	cp	a,#8
 354  0084 2502          	jrult	L701
 355                     ; 59         menu.idx = 0;
 357  0086 3f09          	clr	_menu
 358  0088               L701:
 359                     ; 60     menu.value = get_menu_value(menu.idx);
 361  0088 b609          	ld	a,_menu
 362  008a adab          	call	_get_menu_value
 364  008c b70a          	ld	_menu+1,a
 365                     ; 61 }
 368  008e 81            	ret
 394                     ; 63 static void dec_option(void)
 394                     ; 64 {
 395                     	switch	.text
 396  008f               L111_dec_option:
 400                     ; 65     if (menu.idx) {
 402  008f 3d09          	tnz	_menu
 403  0091 2704          	jreq	L321
 404                     ; 66         menu.idx--;
 406  0093 3a09          	dec	_menu
 408  0095 2004          	jra	L521
 409  0097               L321:
 410                     ; 68         menu.idx = PAR_COUNT;
 412  0097 35070009      	mov	_menu,#7
 413  009b               L521:
 414                     ; 70     menu.value = get_menu_value(menu.idx);
 416  009b b609          	ld	a,_menu
 417  009d ad98          	call	_get_menu_value
 419  009f b70a          	ld	_menu+1,a
 420                     ; 71 }
 423  00a1 81            	ret
 447                     ; 73 static void inc_value(void)
 447                     ; 74 {
 448                     	switch	.text
 449  00a2               L721_inc_value:
 453                     ; 75     if (++menu.value > MAX_VALUE)
 455  00a2 3c0a          	inc	_menu+1
 456  00a4 b60a          	ld	a,_menu+1
 457  00a6 a164          	cp	a,#100
 458  00a8 2502          	jrult	L141
 459                     ; 76         menu.value = 0;
 461  00aa 3f0a          	clr	_menu+1
 462  00ac               L141:
 463                     ; 77 }
 466  00ac 81            	ret
 490                     ; 79 static void dec_value(void)
 490                     ; 80 {
 491                     	switch	.text
 492  00ad               L341_dec_value:
 496                     ; 81     if (menu.value) {
 498  00ad 3d0a          	tnz	_menu+1
 499  00af 2704          	jreq	L551
 500                     ; 82         menu.value--;
 502  00b1 3a0a          	dec	_menu+1
 504  00b3 2004          	jra	L751
 505  00b5               L551:
 506                     ; 84         menu.value = MAX_VALUE;
 508  00b5 3563000a      	mov	_menu+1,#99
 509  00b9               L751:
 510                     ; 86 }
 513  00b9 81            	ret
 539                     ; 88 void interrupt_buttons(void)
 539                     ; 89 {
 540                     	switch	.text
 541  00ba               _interrupt_buttons:
 545                     ; 90     if ((GPIO_ReadInputData(BTN_PORT) & BTN_SET_PIN_NUM) == 0x00) {
 547  00ba ae500a        	ldw	x,#20490
 548  00bd cd0000        	call	_GPIO_ReadInputData
 550  00c0 a508          	bcp	a,#8
 551  00c2 260f          	jrne	L171
 552                     ; 91         if (!btn[BTN_SET_IDX].debounce) {
 554  00c4 be01          	ldw	x,_btn+1
 555  00c6 2645          	jrne	L571
 556                     ; 92             btn[BTN_SET_IDX].debounce = BTN_DEBOUNCE;
 558  00c8 ae0032        	ldw	x,#50
 559  00cb bf01          	ldw	_btn+1,x
 560                     ; 93             btn[BTN_SET_IDX].status = BTN_STAT_PRESSED;
 562  00cd 35010000      	mov	_btn,#1
 563  00d1 203a          	jra	L571
 564  00d3               L171:
 565                     ; 96     if ((GPIO_ReadInputData(BTN_PORT) & BTN_INC_PIN_NUM) == 0x00) {
 567  00d3 ae500a        	ldw	x,#20490
 568  00d6 cd0000        	call	_GPIO_ReadInputData
 570  00d9 a520          	bcp	a,#32
 571  00db 2614          	jrne	L771
 572                     ; 97         if (!btn[BTN_INC_IDX].debounce) {
 574  00dd be07          	ldw	x,_btn+7
 575  00df 262c          	jrne	L571
 576                     ; 98             btn[BTN_INC_IDX].debounce = BTN_DEBOUNCE;
 578  00e1 ae0032        	ldw	x,#50
 579  00e4 bf07          	ldw	_btn+7,x
 580                     ; 99             btn[BTN_INC_IDX].status = BTN_STAT_PRESSED;
 582  00e6 35010006      	mov	_btn+6,#1
 583                     ; 100             menu.tmr = TIME_HOLD_BUTTON;
 585  00ea ae05dc        	ldw	x,#1500
 586  00ed bf0e          	ldw	_menu+5,x
 587  00ef 201c          	jra	L571
 588  00f1               L771:
 589                     ; 103     if ((GPIO_ReadInputData(BTN_PORT) & BTN_DEC_PIN_NUM) == 0x00) {
 591  00f1 ae500a        	ldw	x,#20490
 592  00f4 cd0000        	call	_GPIO_ReadInputData
 594  00f7 a510          	bcp	a,#16
 595  00f9 2612          	jrne	L571
 596                     ; 104         if (!btn[BTN_DEC_IDX].debounce) {
 598  00fb be04          	ldw	x,_btn+4
 599  00fd 260e          	jrne	L571
 600                     ; 105             btn[BTN_DEC_IDX].debounce = BTN_DEBOUNCE;
 602  00ff ae0032        	ldw	x,#50
 603  0102 bf04          	ldw	_btn+4,x
 604                     ; 106             btn[BTN_DEC_IDX].status = BTN_STAT_PRESSED;
 606  0104 35010003      	mov	_btn+3,#1
 607                     ; 107             menu.tmr = TIME_HOLD_BUTTON;
 609  0108 ae05dc        	ldw	x,#1500
 610  010b bf0e          	ldw	_menu+5,x
 611  010d               L571:
 612                     ; 110 }
 615  010d 81            	ret
 645                     ; 112 void process_button(void)
 645                     ; 113 {
 646                     	switch	.text
 647  010e               _process_button:
 651                     ; 114     if (btn[BTN_SET_IDX].status == BTN_STAT_PRESSED) {
 653  010e b600          	ld	a,_btn
 654  0110 a101          	cp	a,#1
 655  0112 2615          	jrne	L122
 656                     ; 115         btn[BTN_SET_IDX].status = BTN_STAT_FREE;
 658  0114 3f00          	clr	_btn
 659                     ; 116         if (menu.edit)
 661  0116 3d0c          	tnz	_menu+3
 662  0118 2704          	jreq	L322
 663                     ; 117             menu.write = 1; 
 665  011a 3501000d      	mov	_menu+4,#1
 666  011e               L322:
 667                     ; 118         menu.edit = (uint8_t)!menu.edit;
 669  011e 3d0c          	tnz	_menu+3
 670  0120 2604          	jrne	L03
 671  0122 a601          	ld	a,#1
 672  0124 2001          	jra	L23
 673  0126               L03:
 674  0126 4f            	clr	a
 675  0127               L23:
 676  0127 b70c          	ld	_menu+3,a
 677  0129               L122:
 678                     ; 120     if (btn[BTN_INC_IDX].status == BTN_STAT_PRESSED) {
 680  0129 b606          	ld	a,_btn+6
 681  012b a101          	cp	a,#1
 682  012d 260e          	jrne	L522
 683                     ; 121         btn[BTN_INC_IDX].status = BTN_STAT_FREE;
 685  012f 3f06          	clr	_btn+6
 686                     ; 122         if (!menu.edit)
 688  0131 3d0c          	tnz	_menu+3
 689  0133 2605          	jrne	L722
 690                     ; 123             inc_option();
 692  0135 cd007e        	call	L57_inc_option
 695  0138 2003          	jra	L522
 696  013a               L722:
 697                     ; 125             inc_value();
 699  013a cd00a2        	call	L721_inc_value
 701  013d               L522:
 702                     ; 127     if (btn[BTN_DEC_IDX].status == BTN_STAT_PRESSED) {
 704  013d b603          	ld	a,_btn+3
 705  013f a101          	cp	a,#1
 706  0141 260e          	jrne	L332
 707                     ; 128         btn[BTN_DEC_IDX].status = BTN_STAT_FREE;
 709  0143 3f03          	clr	_btn+3
 710                     ; 129         if (!menu.edit)
 712  0145 3d0c          	tnz	_menu+3
 713  0147 2605          	jrne	L532
 714                     ; 130             dec_option();
 716  0149 cd008f        	call	L111_dec_option
 719  014c 2003          	jra	L332
 720  014e               L532:
 721                     ; 132             dec_value();
 723  014e cd00ad        	call	L341_dec_value
 725  0151               L332:
 726                     ; 134     if (!btn_set()) {
 728  0151 4b08          	push	#8
 729  0153 ae500a        	ldw	x,#20490
 730  0156 cd0000        	call	_GPIO_ReadInputPin
 732  0159 5b01          	addw	sp,#1
 733  015b 4d            	tnz	a
 734  015c 2605          	jrne	L142
 735                     ; 135         btn[BTN_SET_IDX].debounce = BTN_DEBOUNCE;
 737  015e ae0032        	ldw	x,#50
 738  0161 bf01          	ldw	_btn+1,x
 739  0163               L142:
 740                     ; 137     if (!btn_inc()) {
 742  0163 4b20          	push	#32
 743  0165 ae500a        	ldw	x,#20490
 744  0168 cd0000        	call	_GPIO_ReadInputPin
 746  016b 5b01          	addw	sp,#1
 747  016d 4d            	tnz	a
 748  016e 2612          	jrne	L342
 749                     ; 138         btn[BTN_INC_IDX].debounce = BTN_DEBOUNCE;
 751  0170 ae0032        	ldw	x,#50
 752  0173 bf07          	ldw	_btn+7,x
 753                     ; 139         if (!menu.tmr) {
 755  0175 be0e          	ldw	x,_menu+5
 756  0177 2609          	jrne	L342
 757                     ; 140             btn[BTN_INC_IDX].status = BTN_STAT_PRESSED;
 759  0179 35010006      	mov	_btn+6,#1
 760                     ; 141             menu.tmr = TIME_CHANGE_VALUE;
 762  017d ae0064        	ldw	x,#100
 763  0180 bf0e          	ldw	_menu+5,x
 764  0182               L342:
 765                     ; 144     if (!btn_dec()) {
 767  0182 4b10          	push	#16
 768  0184 ae500a        	ldw	x,#20490
 769  0187 cd0000        	call	_GPIO_ReadInputPin
 771  018a 5b01          	addw	sp,#1
 772  018c 4d            	tnz	a
 773  018d 2612          	jrne	L742
 774                     ; 145         btn[BTN_DEC_IDX].debounce = BTN_DEBOUNCE;
 776  018f ae0032        	ldw	x,#50
 777  0192 bf04          	ldw	_btn+4,x
 778                     ; 146         if (!menu.tmr) {
 780  0194 be0e          	ldw	x,_menu+5
 781  0196 2609          	jrne	L742
 782                     ; 147             btn[BTN_DEC_IDX].status = BTN_STAT_PRESSED;
 784  0198 35010003      	mov	_btn+3,#1
 785                     ; 148             menu.tmr = TIME_CHANGE_VALUE;
 787  019c ae0064        	ldw	x,#100
 788  019f bf0e          	ldw	_menu+5,x
 789  01a1               L742:
 790                     ; 151 }
 793  01a1 81            	ret
 824                     ; 153 void task_menu(void)
 824                     ; 154 {
 825                     	switch	.text
 826  01a2               _task_menu:
 830                     ; 155     process_button();
 832  01a2 cd010e        	call	_process_button
 834                     ; 157     if (!tick)
 836  01a5 3d00          	tnz	_tick
 837  01a7 2601          	jrne	L362
 838                     ; 158         return;
 841  01a9 81            	ret
 842  01aa               L362:
 843                     ; 160     if (menu.write)
 845  01aa 3d0d          	tnz	_menu+4
 846  01ac 2703          	jreq	L562
 847                     ; 161         set_menu_value();
 849  01ae cd0043        	call	_set_menu_value
 851  01b1               L562:
 852                     ; 163     if (menu.edit) {
 854  01b1 3d0c          	tnz	_menu+3
 855  01b3 270d          	jreq	L762
 856                     ; 164         dp[DIG1_POS] = (uint8_t)!dp[DIG1_POS];    
 858  01b5 3d00          	tnz	_dp
 859  01b7 2604          	jrne	L63
 860  01b9 a601          	ld	a,#1
 861  01bb 2001          	jra	L04
 862  01bd               L63:
 863  01bd 4f            	clr	a
 864  01be               L04:
 865  01be b700          	ld	_dp,a
 867  01c0 2002          	jra	L172
 868  01c2               L762:
 869                     ; 166         dp[DIG1_POS] = 0;
 871  01c2 3f00          	clr	_dp
 872  01c4               L172:
 873                     ; 169     set_display_option(par[menu.idx].option);
 875  01c4 b609          	ld	a,_menu
 876  01c6 5f            	clrw	x
 877  01c7 97            	ld	xl,a
 878  01c8 58            	sllw	x
 879  01c9 d60000        	ld	a,(L3_par,x)
 880  01cc cd0000        	call	_set_display_option
 882                     ; 170     set_display_value(menu.value, par[menu.idx].dp);
 884  01cf b609          	ld	a,_menu
 885  01d1 5f            	clrw	x
 886  01d2 97            	ld	xl,a
 887  01d3 58            	sllw	x
 888  01d4 d60001        	ld	a,(L3_par+1,x)
 889  01d7 97            	ld	xl,a
 890  01d8 b60a          	ld	a,_menu+1
 891  01da 95            	ld	xh,a
 892  01db cd0000        	call	_set_display_value
 894                     ; 171 }
 897  01de 81            	ret
1037                     	xdef	_process_button
1038                     	xdef	_interrupt_buttons
1039                     	xdef	_set_menu_value
1040                     	xdef	_get_menu_value
1041                     	switch	.ubsct
1042  0000               _btn:
1043  0000 000000000000  	ds.b	9
1044                     	xdef	_btn
1045  0009               _menu:
1046  0009 000000000000  	ds.b	7
1047                     	xdef	_menu
1048                     	xref.b	_dp
1049                     	xref.b	_tick
1050                     	xref	_set_display_option
1051                     	xref	_set_display_value
1052                     	xref	_set_eeprom_data
1053                     	xref	_get_eeprom_data
1054                     	xdef	_task_menu
1055                     	xdef	_tmr_menu
1056                     	xdef	_init_menu
1057                     	xref	_ITC_SetSoftwarePriority
1058                     	xref	_GPIO_ReadInputPin
1059                     	xref	_GPIO_ReadInputData
1060                     	xref	_GPIO_Init
1061                     	xref	_EXTI_SetTLISensitivity
1062                     	xref	_EXTI_SetExtIntSensitivity
1063                     	xref	_EXTI_DeInit
1083                     	end
