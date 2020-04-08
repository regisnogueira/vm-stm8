   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  19                     	bsct
  20  0000               _display_num:
  21  0000 41            	dc.b	65
  22  0001 00            	dc.b	0
  23  0002 00            	dc.b	0
  24  0003               _dp:
  25  0003 00            	dc.b	0
  26  0004 00            	dc.b	0
  27  0005 00            	dc.b	0
  67                     ; 21 uint8_t dec2bcd(uint8_t val)
  67                     ; 22 {
  69                     	switch	.text
  70  0000               _dec2bcd:
  72  0000 88            	push	a
  73  0001 88            	push	a
  74       00000001      OFST:	set	1
  77                     ; 23     return (uint8_t)((val/10*16) + (val%10));
  79  0002 5f            	clrw	x
  80  0003 97            	ld	xl,a
  81  0004 a60a          	ld	a,#10
  82  0006 62            	div	x,a
  83  0007 6b01          	ld	(OFST+0,sp),a
  85  0009 5f            	clrw	x
  86  000a 7b02          	ld	a,(OFST+1,sp)
  87  000c 97            	ld	xl,a
  88  000d a60a          	ld	a,#10
  89  000f 62            	div	x,a
  90  0010 a610          	ld	a,#16
  91  0012 42            	mul	x,a
  92  0013 9f            	ld	a,xl
  93  0014 1b01          	add	a,(OFST+0,sp)
  96  0016 85            	popw	x
  97  0017 81            	ret	
 151                     ; 26 void set_display(uint8_t option, uint8_t value, uint8_t decimal)
 151                     ; 27 {
 152                     	switch	.text
 153  0018               _set_display:
 155  0018 89            	pushw	x
 156  0019 88            	push	a
 157       00000001      OFST:	set	1
 160                     ; 31     bcd = (uint8_t)dec2bcd(value);
 162  001a 9f            	ld	a,xl
 163  001b ade3          	call	_dec2bcd
 165  001d 6b01          	ld	(OFST+0,sp),a
 167                     ; 33     if (value > MAX_DISPLAY_VALUE)
 169  001f 7b03          	ld	a,(OFST+2,sp)
 170  0021 a164          	cp	a,#100
 171  0023 2504          	jrult	L55
 172                     ; 34         value = MAX_DISPLAY_VALUE;
 174  0025 a663          	ld	a,#99
 175  0027 6b03          	ld	(OFST+2,sp),a
 176  0029               L55:
 177                     ; 36     display_num[DIG1_POS] = option;
 179  0029 7b02          	ld	a,(OFST+1,sp)
 180  002b b700          	ld	_display_num,a
 181                     ; 37     display_num[DIG2_POS] = (uint8_t)(bcd >> 4);
 183  002d 7b01          	ld	a,(OFST+0,sp)
 184  002f 4e            	swap	a
 185  0030 a40f          	and	a,#15
 186  0032 b701          	ld	_display_num+1,a
 187                     ; 38     display_num[DIG3_POS] = (uint8_t)(bcd & 0x0F);
 189  0034 7b01          	ld	a,(OFST+0,sp)
 190  0036 a40f          	and	a,#15
 191  0038 b702          	ld	_display_num+2,a
 192                     ; 40 }
 195  003a 5b03          	addw	sp,#3
 196  003c 81            	ret	
 231                     ; 42 void set_option_display(uint8_t option)
 231                     ; 43 {
 232                     	switch	.text
 233  003d               _set_option_display:
 237                     ; 45     display_num[DIG1_POS] = option;
 239  003d b700          	ld	_display_num,a
 240                     ; 47 }
 243  003f 81            	ret	
 281                     .const:	section	.text
 282  0000               L454:
 283  0000 00b3          	dc.w	L57
 284  0002 00be          	dc.w	L77
 285  0004 00f6          	dc.w	L101
 286  0006 010d          	dc.w	L301
 287  0008 0130          	dc.w	L501
 288  000a 014f          	dc.w	L701
 289  000c 016e          	dc.w	L111
 290  000e 01af          	dc.w	L311
 291  0010 01ba          	dc.w	L511
 292  0012 01c7          	dc.w	L711
 293                     ; 49 void wr_digit(uint8_t dig_pos)
 293                     ; 50 {
 294                     	switch	.text
 295  0040               _wr_digit:
 297  0040 88            	push	a
 298       00000000      OFST:	set	0
 301                     ; 53     if (dp[dig_pos]) {
 303  0041 5f            	clrw	x
 304  0042 97            	ld	xl,a
 305  0043 e603          	ld	a,(_dp,x)
 306  0045 270a          	jreq	L361
 307                     ; 54         dp_on();
 309  0047 4b04          	push	#4
 310  0049 ae500f        	ldw	x,#20495
 311  004c cd0000        	call	_GPIO_WriteHigh
 314  004f 2008          	jra	L561
 315  0051               L361:
 316                     ; 56         dp_off();
 318  0051 4b04          	push	#4
 319  0053 ae500f        	ldw	x,#20495
 320  0056 cd0000        	call	_GPIO_WriteLow
 322  0059               L561:
 323  0059 84            	pop	a
 324                     ; 59     switch (display_num[dig_pos]) {
 326  005a 7b01          	ld	a,(OFST+1,sp)
 327  005c 5f            	clrw	x
 328  005d 97            	ld	xl,a
 329  005e e600          	ld	a,(_display_num,x)
 331                     ; 119         break;
 332  0060 a10a          	cp	a,#10
 333  0062 2407          	jruge	L254
 334  0064 5f            	clrw	x
 335  0065 97            	ld	xl,a
 336  0066 58            	sllw	x
 337  0067 de0000        	ldw	x,(L454,x)
 338  006a fc            	jp	(x)
 339  006b               L254:
 340  006b a041          	sub	a,#65
 341  006d 2603cc01d4    	jreq	L121
 342  0072 a002          	sub	a,#2
 343  0074 2603cc01e8    	jreq	L521
 344  0079 a002          	sub	a,#2
 345  007b 2603cc0214    	jreq	L131
 346  0080 4a            	dec	a
 347  0081 2603cc0225    	jreq	L331
 348  0086 a002          	sub	a,#2
 349  0088 2603cc0245    	jreq	L531
 350  008d a004          	sub	a,#4
 351  008f 2603cc0261    	jreq	L731
 352  0094 a004          	sub	a,#4
 353  0096 2603cc0276    	jreq	L141
 354  009b a005          	sub	a,#5
 355  009d 2603cc0282    	jreq	L341
 356  00a2 a00d          	sub	a,#13
 357  00a4 2603cc01de    	jreq	L321
 358  00a9 a002          	sub	a,#2
 359  00ab 2603cc01f2    	jreq	L721
 360  00b0 cc02ba        	jra	L171
 361  00b3               L57:
 362                     ; 60     case 0x00:
 362                     ; 61         display_zero();
 364  00b3 4b20          	push	#32
 365  00b5 ae500f        	ldw	x,#20495
 366  00b8 cd0000        	call	_GPIO_WriteHigh
 380                     ; 62         break;
 382  00bb cc028a        	jp	LC004
 383  00be               L77:
 384                     ; 63     case 0x01:
 384                     ; 64         display_one();
 386  00be 4b20          	push	#32
 387  00c0 ae500f        	ldw	x,#20495
 388  00c3 cd0000        	call	_GPIO_WriteLow
 404  00c6               LC006:
 405  00c6 84            	pop	a
 407  00c7 4b04          	push	#4
 408  00c9 ae5000        	ldw	x,#20480
 409  00cc cd0000        	call	_GPIO_WriteHigh
 410  00cf 84            	pop	a
 412  00d0 4b80          	push	#128
 413  00d2 ae500a        	ldw	x,#20490
 414  00d5 cd0000        	call	_GPIO_WriteHigh
 415  00d8 84            	pop	a
 417  00d9 4b08          	push	#8
 418  00db ae500f        	ldw	x,#20495
 419  00de cd0000        	call	_GPIO_WriteLow
 420  00e1 84            	pop	a
 422  00e2 4b02          	push	#2
 423  00e4 ae500f        	ldw	x,#20495
 424  00e7 cd0000        	call	_GPIO_WriteLow
 425  00ea 84            	pop	a
 427  00eb 4b02          	push	#2
 428  00ed ae5000        	ldw	x,#20480
 429  00f0 cd0000        	call	_GPIO_WriteLow
 433                     ; 65         break;
 435  00f3 cc02b0        	jp	LC002
 436  00f6               L101:
 437                     ; 66     case 0x02:
 437                     ; 67         display_two();
 439  00f6 cd02bc        	call	LC020
 442  00f9 4b04          	push	#4
 443  00fb ae5000        	ldw	x,#20480
 444  00fe cd0000        	call	_GPIO_WriteHigh
 446  0101 84            	pop	a
 449  0102 4b80          	push	#128
 450  0104 ae500a        	ldw	x,#20490
 451  0107 cd0000        	call	_GPIO_WriteLow
 461                     ; 68         break;
 463  010a cc01fd        	jp	LC017
 464  010d               L301:
 465                     ; 69     case 0x03:
 465                     ; 70         display_three();
 467  010d cd02bc        	call	LC020
 470  0110 4b04          	push	#4
 471  0112 ae5000        	ldw	x,#20480
 472  0115 cd0000        	call	_GPIO_WriteHigh
 474  0118 84            	pop	a
 477  0119 4b80          	push	#128
 478  011b ae500a        	ldw	x,#20490
 479  011e cd0000        	call	_GPIO_WriteHigh
 481  0121 84            	pop	a
 484  0122 cd02d9        	call	LC022
 487  0125 4b02          	push	#2
 488  0127 ae500f        	ldw	x,#20495
 489  012a cd0000        	call	_GPIO_WriteLow
 495                     ; 71         break;
 497  012d cc0209        	jp	LC016
 498  0130               L501:
 499                     ; 72     case 0x04:
 499                     ; 73         display_four();
 501  0130 cd02c6        	call	LC021
 504  0133 4b80          	push	#128
 505  0135 ae500a        	ldw	x,#20490
 506  0138 cd0000        	call	_GPIO_WriteHigh
 508  013b 84            	pop	a
 511  013c 4b08          	push	#8
 512  013e ae500f        	ldw	x,#20495
 513  0141 cd0000        	call	_GPIO_WriteLow
 517  0144               LC014:
 518  0144 84            	pop	a
 521  0145 4b02          	push	#2
 522  0147 ae500f        	ldw	x,#20495
 523  014a cd0000        	call	_GPIO_WriteLow
 529                     ; 74         break;
 531  014d 204b          	jp	LC008
 532  014f               L701:
 533                     ; 75     case 0x05:
 533                     ; 76         display_five();
 535  014f cd02bc        	call	LC020
 538  0152 4b04          	push	#4
 539  0154 ae5000        	ldw	x,#20480
 540  0157 cd0000        	call	_GPIO_WriteLow
 547  015a               LC015:
 548  015a 84            	pop	a
 550  015b 4b80          	push	#128
 551  015d ae500a        	ldw	x,#20490
 552  0160 cd0000        	call	_GPIO_WriteHigh
 553  0163 84            	pop	a
 555  0164 4b08          	push	#8
 556  0166 ae500f        	ldw	x,#20495
 557  0169 cd0000        	call	_GPIO_WriteHigh
 565                     ; 77         break;
 567  016c 20d6          	jp	LC014
 568  016e               L111:
 569                     ; 78     case 0x06:
 569                     ; 79         display_six();
 571  016e 4b20          	push	#32
 572  0170 ae500f        	ldw	x,#20495
 573  0173 cd0000        	call	_GPIO_WriteHigh
 577  0176               LC012:
 578  0176 84            	pop	a
 580  0177 4b04          	push	#4
 581  0179 ae5000        	ldw	x,#20480
 582  017c cd0000        	call	_GPIO_WriteLow
 586  017f               LC011:
 587  017f 84            	pop	a
 590  0180 4b80          	push	#128
 591  0182 ae500a        	ldw	x,#20490
 592  0185 cd0000        	call	_GPIO_WriteHigh
 596  0188               LC010:
 597  0188 84            	pop	a
 601  0189 4b08          	push	#8
 602  018b ae500f        	ldw	x,#20495
 603  018e cd0000        	call	_GPIO_WriteHigh
 607  0191               LC009:
 608  0191 84            	pop	a
 616  0192 4b02          	push	#2
 617  0194 ae500f        	ldw	x,#20495
 618  0197 cd0000        	call	_GPIO_WriteHigh
 622  019a               LC008:
 623  019a 84            	pop	a
 634  019b 4b02          	push	#2
 635  019d ae5000        	ldw	x,#20480
 636  01a0 cd0000        	call	_GPIO_WriteHigh
 640  01a3               LC007:
 641  01a3 84            	pop	a
 655  01a4 4b40          	push	#64
 656  01a6 ae500a        	ldw	x,#20490
 657  01a9 cd0000        	call	_GPIO_WriteHigh
 659                     ; 80         break;
 661  01ac cc02b9        	jp	LC001
 662  01af               L311:
 663                     ; 81     case 0x07:
 663                     ; 82         display_seven();
 665  01af 4b20          	push	#32
 666  01b1 ae500f        	ldw	x,#20495
 667  01b4 cd0000        	call	_GPIO_WriteHigh
 681                     ; 83         break;
 683  01b7 cc00c6        	jp	LC006
 684  01ba               L511:
 685                     ; 84     case 0x08:
 685                     ; 85         display_eight();
 687  01ba cd02bc        	call	LC020
 690  01bd 4b04          	push	#4
 691  01bf ae5000        	ldw	x,#20480
 692  01c2 cd0000        	call	_GPIO_WriteHigh
 704                     ; 86         break;
 706  01c5 20b8          	jp	LC011
 707  01c7               L711:
 708                     ; 87     case 0x09:
 708                     ; 88         display_nine();
 710  01c7 cd02bc        	call	LC020
 713  01ca 4b04          	push	#4
 714  01cc ae5000        	ldw	x,#20480
 715  01cf cd0000        	call	_GPIO_WriteHigh
 727                     ; 89         break;
 729  01d2 2086          	jp	LC015
 730  01d4               L121:
 731                     ; 90     case 'A':
 731                     ; 91         display_a();
 733  01d4 4b20          	push	#32
 734  01d6 ae500f        	ldw	x,#20495
 735  01d9 cd0000        	call	_GPIO_WriteHigh
 749                     ; 92         break;
 751  01dc 206f          	jp	LC019
 752  01de               L321:
 753                     ; 93     case 'b':
 753                     ; 94         display_b();
 755  01de 4b20          	push	#32
 756  01e0 ae500f        	ldw	x,#20495
 757  01e3 cd0000        	call	_GPIO_WriteLow
 771                     ; 95         break;
 773  01e6 208e          	jp	LC012
 774  01e8               L521:
 775                     ; 96     case 'C':
 775                     ; 97         display_c();
 777  01e8 4b20          	push	#32
 778  01ea ae500f        	ldw	x,#20495
 779  01ed cd0000        	call	_GPIO_WriteHigh
 793                     ; 98         break;
 795  01f0 2077          	jp	LC005
 796  01f2               L721:
 797                     ; 99     case 'd':
 797                     ; 100         display_d();
 799  01f2 cd02c6        	call	LC021
 802  01f5 4b80          	push	#128
 803  01f7 ae500a        	ldw	x,#20490
 804  01fa cd0000        	call	_GPIO_WriteHigh
 811  01fd               LC017:
 812  01fd 84            	pop	a
 814  01fe cd02d9        	call	LC022
 816  0201 4b02          	push	#2
 817  0203 ae500f        	ldw	x,#20495
 818  0206 cd0000        	call	_GPIO_WriteHigh
 822  0209               LC016:
 823  0209 84            	pop	a
 826  020a 4b02          	push	#2
 827  020c ae5000        	ldw	x,#20480
 828  020f cd0000        	call	_GPIO_WriteLow
 832                     ; 101         break;
 834  0212 208f          	jp	LC007
 835  0214               L131:
 836                     ; 102     case 'E':
 836                     ; 103         display_e();
 838  0214 cd02bc        	call	LC020
 841  0217 cd02e3        	call	LC023
 844  021a 4b80          	push	#128
 845  021c ae500a        	ldw	x,#20490
 846  021f cd0000        	call	_GPIO_WriteLow
 856                     ; 104         break;
 858  0222 cc0188        	jp	LC010
 859  0225               L331:
 860                     ; 105     case 'F':
 860                     ; 106         display_f();
 862  0225 cd02bc        	call	LC020
 865  0228 4b04          	push	#4
 866  022a ae5000        	ldw	x,#20480
 867  022d cd0000        	call	_GPIO_WriteLow
 871  0230               LC018:
 872  0230 84            	pop	a
 874  0231 4b80          	push	#128
 875  0233 ae500a        	ldw	x,#20490
 876  0236 cd0000        	call	_GPIO_WriteLow
 880  0239               LC013:
 881  0239 84            	pop	a
 885  023a 4b08          	push	#8
 886  023c ae500f        	ldw	x,#20495
 887  023f cd0000        	call	_GPIO_WriteLow
 895                     ; 107         break;
 897  0242 cc0191        	jp	LC009
 898  0245               L531:
 899                     ; 108     case 'H':
 899                     ; 109         display_h();
 901  0245 4b20          	push	#32
 902  0247 ae500f        	ldw	x,#20495
 903  024a cd0000        	call	_GPIO_WriteLow
 910  024d               LC019:
 911  024d 84            	pop	a
 913  024e 4b04          	push	#4
 914  0250 ae5000        	ldw	x,#20480
 915  0253 cd0000        	call	_GPIO_WriteHigh
 916  0256 84            	pop	a
 918  0257 4b80          	push	#128
 919  0259 ae500a        	ldw	x,#20490
 920  025c cd0000        	call	_GPIO_WriteHigh
 930                     ; 110         break;
 932  025f 20d8          	jp	LC013
 933  0261               L731:
 934                     ; 111     case 'L':
 934                     ; 112         display_l();
 936  0261 4b20          	push	#32
 937  0263 ae500f        	ldw	x,#20495
 938  0266 cd0000        	call	_GPIO_WriteLow
 945  0269               LC005:
 946  0269 84            	pop	a
 948  026a ad77          	call	LC023
 950  026c 4b80          	push	#128
 951  026e ae500a        	ldw	x,#20490
 952  0271 cd0000        	call	_GPIO_WriteLow
 962                     ; 113         break;
 964  0274 2026          	jp	LC003
 965  0276               L141:
 966                     ; 114     case 'P':
 966                     ; 115         display_p();
 968  0276 ad44          	call	LC020
 971  0278 4b04          	push	#4
 972  027a ae5000        	ldw	x,#20480
 973  027d cd0000        	call	_GPIO_WriteHigh
 985                     ; 116         break;
 987  0280 20ae          	jp	LC018
 988  0282               L341:
 989                     ; 117     case 'U':
 989                     ; 118         display_u();
 991  0282 4b20          	push	#32
 992  0284 ae500f        	ldw	x,#20495
 993  0287 cd0000        	call	_GPIO_WriteLow
1000  028a               LC004:
1001  028a 84            	pop	a
1003  028b 4b04          	push	#4
1004  028d ae5000        	ldw	x,#20480
1005  0290 cd0000        	call	_GPIO_WriteHigh
1006  0293 84            	pop	a
1008  0294 4b80          	push	#128
1009  0296 ae500a        	ldw	x,#20490
1010  0299 cd0000        	call	_GPIO_WriteHigh
1020  029c               LC003:
1021  029c 84            	pop	a
1025  029d ad3a          	call	LC022
1029  029f 4b02          	push	#2
1030  02a1 ae500f        	ldw	x,#20495
1031  02a4 cd0000        	call	_GPIO_WriteHigh
1032  02a7 84            	pop	a
1036  02a8 4b02          	push	#2
1037  02aa ae5000        	ldw	x,#20480
1038  02ad cd0000        	call	_GPIO_WriteHigh
1042  02b0               LC002:
1043  02b0 84            	pop	a
1049  02b1 4b40          	push	#64
1050  02b3 ae500a        	ldw	x,#20490
1051  02b6 cd0000        	call	_GPIO_WriteLow
1053  02b9               LC001:
1054  02b9 84            	pop	a
1055                     ; 119         break;
1057  02ba               L171:
1058                     ; 122 }
1061  02ba 84            	pop	a
1062  02bb 81            	ret	
1063  02bc               LC020:
1064  02bc 4b20          	push	#32
1065  02be ae500f        	ldw	x,#20495
1066  02c1 cd0000        	call	_GPIO_WriteHigh
1068  02c4 84            	pop	a
1069  02c5 81            	ret	
1070  02c6               LC021:
1071  02c6 4b20          	push	#32
1072  02c8 ae500f        	ldw	x,#20495
1073  02cb cd0000        	call	_GPIO_WriteLow
1075  02ce 84            	pop	a
1076                     ; 73         display_four();
1078  02cf 4b04          	push	#4
1079  02d1 ae5000        	ldw	x,#20480
1080  02d4 cd0000        	call	_GPIO_WriteHigh
1082  02d7 84            	pop	a
1083  02d8 81            	ret	
1084  02d9               LC022:
1085  02d9 4b08          	push	#8
1086  02db ae500f        	ldw	x,#20495
1087  02de cd0000        	call	_GPIO_WriteHigh
1089  02e1 84            	pop	a
1090  02e2 81            	ret	
1091  02e3               LC023:
1092  02e3 4b04          	push	#4
1093  02e5 ae5000        	ldw	x,#20480
1094  02e8 cd0000        	call	_GPIO_WriteLow
1096  02eb 84            	pop	a
1097  02ec 81            	ret	
1121                     ; 124 void task_display(void)
1121                     ; 125 {
1122                     	switch	.text
1123  02ed               _task_display:
1127                     ; 127     if (!tick)
1129                     ; 128         return;
1132                     ; 131 }
1135  02ed 81            	ret	
1138                     	bsct
1139  0006               L502_dig_pos:
1140  0006 00            	dc.b	0
1175                     ; 133 void tmr_display(void)
1175                     ; 134 {
1176                     	switch	.text
1177  02ee               _tmr_display:
1181                     ; 143     if (dig_pos >= MAX_DIG_POS)
1183  02ee b606          	ld	a,L502_dig_pos
1184  02f0 a103          	cp	a,#3
1185  02f2 2502          	jrult	L332
1186                     ; 144         dig_pos = DIG1_POS;
1188  02f4 3f06          	clr	L502_dig_pos
1189  02f6               L332:
1190                     ; 146     switch (dig_pos) {
1192  02f6 b606          	ld	a,L502_dig_pos
1194                     ; 161         break;
1195  02f8 2708          	jreq	L702
1196  02fa 4a            	dec	a
1197  02fb 2718          	jreq	L112
1198  02fd 4a            	dec	a
1199  02fe 272a          	jreq	L312
1200  0300 203c          	jra	L732
1201  0302               L702:
1202                     ; 147     case DIG1_POS:
1202                     ; 148         dig1_on();
1204  0302 4b10          	push	#16
1205  0304 ae500f        	ldw	x,#20495
1206  0307 cd0000        	call	_GPIO_WriteLow
1208  030a 84            	pop	a
1209                     ; 149         dig2_off();
1211  030b 4b20          	push	#32
1212  030d ae5005        	ldw	x,#20485
1213  0310 cd0000        	call	_GPIO_WriteHigh
1215                     ; 150         dig3_off();
1217                     ; 151         break;
1219  0313 200a          	jp	LC025
1220  0315               L112:
1221                     ; 152     case DIG2_POS:
1221                     ; 153         dig1_off();
1223  0315 ad2f          	call	LC026
1224                     ; 154         dig2_on();
1226  0317 4b20          	push	#32
1227  0319 ae5005        	ldw	x,#20485
1228  031c cd0000        	call	_GPIO_WriteLow
1230                     ; 155         dig3_off();
1232  031f               LC025:
1233  031f 84            	pop	a
1235  0320 4b10          	push	#16
1236  0322 ae5005        	ldw	x,#20485
1237  0325 cd0000        	call	_GPIO_WriteHigh
1239                     ; 156         break;
1241  0328 2013          	jp	LC024
1242  032a               L312:
1243                     ; 157     case DIG3_POS:
1243                     ; 158         dig1_off();
1245  032a ad1a          	call	LC026
1246                     ; 159         dig2_off();
1248  032c 4b20          	push	#32
1249  032e ae5005        	ldw	x,#20485
1250  0331 cd0000        	call	_GPIO_WriteHigh
1252  0334 84            	pop	a
1253                     ; 160         dig3_on();
1255  0335 4b10          	push	#16
1256  0337 ae5005        	ldw	x,#20485
1257  033a cd0000        	call	_GPIO_WriteLow
1259  033d               LC024:
1260  033d 84            	pop	a
1261                     ; 161         break;
1263  033e               L732:
1264                     ; 164     wr_digit(dig_pos);
1266  033e b606          	ld	a,L502_dig_pos
1267  0340 cd0040        	call	_wr_digit
1269                     ; 165     dig_pos++;
1271  0343 3c06          	inc	L502_dig_pos
1272                     ; 167 }
1275  0345 81            	ret	
1276  0346               LC026:
1277  0346 4b10          	push	#16
1278  0348 ae500f        	ldw	x,#20495
1279  034b cd0000        	call	_GPIO_WriteHigh
1281  034e 84            	pop	a
1282  034f 81            	ret	
1307                     ; 200 void init_display(void)
1307                     ; 201 {
1308                     	switch	.text
1309  0350               _init_display:
1313                     ; 203     seg_a_dir();
1315  0350 4be0          	push	#224
1316  0352 4b20          	push	#32
1317  0354 ae500f        	ldw	x,#20495
1318  0357 cd0000        	call	_GPIO_Init
1320  035a 85            	popw	x
1321                     ; 204     seg_b_dir();
1324  035b 4be0          	push	#224
1325  035d 4b04          	push	#4
1326  035f ae5000        	ldw	x,#20480
1327  0362 cd0000        	call	_GPIO_Init
1329  0365 85            	popw	x
1330                     ; 205     seg_c_dir();
1333  0366 4be0          	push	#224
1334  0368 4b80          	push	#128
1335  036a ae500a        	ldw	x,#20490
1336  036d cd0000        	call	_GPIO_Init
1338  0370 85            	popw	x
1339                     ; 206     seg_d_dir();
1342  0371 4be0          	push	#224
1343  0373 4b08          	push	#8
1344  0375 ae500f        	ldw	x,#20495
1345  0378 cd0000        	call	_GPIO_Init
1347  037b 85            	popw	x
1348                     ; 207     seg_e_dir();
1351  037c 4be0          	push	#224
1352  037e 4b02          	push	#2
1353  0380 ae500f        	ldw	x,#20495
1354  0383 cd0000        	call	_GPIO_Init
1356  0386 85            	popw	x
1357                     ; 208     seg_f_dir();
1360  0387 4be0          	push	#224
1361  0389 4b02          	push	#2
1362  038b ae5000        	ldw	x,#20480
1363  038e cd0000        	call	_GPIO_Init
1365  0391 85            	popw	x
1366                     ; 209     seg_g_dir();
1369  0392 4be0          	push	#224
1370  0394 4b40          	push	#64
1371  0396 ae500a        	ldw	x,#20490
1372  0399 cd0000        	call	_GPIO_Init
1374  039c 85            	popw	x
1375                     ; 210     dp_dir();
1378  039d 4be0          	push	#224
1379  039f 4b04          	push	#4
1380  03a1 ae500f        	ldw	x,#20495
1381  03a4 cd0000        	call	_GPIO_Init
1383  03a7 85            	popw	x
1384                     ; 211     dig1_dir();
1387  03a8 4be0          	push	#224
1388  03aa 4b10          	push	#16
1389  03ac ae500f        	ldw	x,#20495
1390  03af cd0000        	call	_GPIO_Init
1392  03b2 85            	popw	x
1393                     ; 212     dig2_dir();
1396  03b3 4be0          	push	#224
1397  03b5 4b20          	push	#32
1398  03b7 ae5005        	ldw	x,#20485
1399  03ba cd0000        	call	_GPIO_Init
1401  03bd 85            	popw	x
1402                     ; 213     dig3_dir();
1405  03be 4be0          	push	#224
1406  03c0 4b10          	push	#16
1407  03c2 ae5005        	ldw	x,#20485
1408  03c5 cd0000        	call	_GPIO_Init
1410  03c8 85            	popw	x
1411                     ; 235     dig1_off();
1414  03c9 4b10          	push	#16
1415  03cb ae500f        	ldw	x,#20495
1416  03ce cd0000        	call	_GPIO_WriteHigh
1418  03d1 84            	pop	a
1419                     ; 236     dig2_off();
1421  03d2 4b20          	push	#32
1422  03d4 ae5005        	ldw	x,#20485
1423  03d7 cd0000        	call	_GPIO_WriteHigh
1425  03da 84            	pop	a
1426                     ; 237     dig3_off();
1428  03db 4b10          	push	#16
1429  03dd ae5005        	ldw	x,#20485
1430  03e0 cd0000        	call	_GPIO_WriteHigh
1432  03e3 84            	pop	a
1433                     ; 240 }
1436  03e4 81            	ret	
1471                     	xdef	_wr_digit
1472                     	xdef	_dec2bcd
1473                     	xdef	_dp
1474                     	xdef	_display_num
1475                     	xref.b	_tick
1476                     	xdef	_set_option_display
1477                     	xdef	_set_display
1478                     	xdef	_tmr_display
1479                     	xdef	_task_display
1480                     	xdef	_init_display
1481                     	xref	_GPIO_WriteLow
1482                     	xref	_GPIO_WriteHigh
1483                     	xref	_GPIO_Init
1502                     	end
