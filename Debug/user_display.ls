   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  14                     	bsct
  15  0000               _display_test:
  16  0000 01            	dc.b	1
  17  0001               _display_num:
  18  0001 41            	dc.b	65
  19  0002 00            	dc.b	0
  20  0003 00            	dc.b	0
  21  0004               _dp:
  22  0004 00            	dc.b	0
  23  0005 00            	dc.b	0
  24  0006 00            	dc.b	0
  64                     ; 21 uint8_t dec2bcd(uint8_t val)
  64                     ; 22 {
  66                     	switch	.text
  67  0000               _dec2bcd:
  69  0000 88            	push	a
  70  0001 88            	push	a
  71       00000001      OFST:	set	1
  74                     ; 23     return (uint8_t)((val/10*16) + (val%10));
  76  0002 5f            	clrw	x
  77  0003 97            	ld	xl,a
  78  0004 a60a          	ld	a,#10
  79  0006 62            	div	x,a
  80  0007 5f            	clrw	x
  81  0008 97            	ld	xl,a
  82  0009 9f            	ld	a,xl
  83  000a 6b01          	ld	(OFST+0,sp),a
  85  000c 7b02          	ld	a,(OFST+1,sp)
  86  000e 5f            	clrw	x
  87  000f 97            	ld	xl,a
  88  0010 a60a          	ld	a,#10
  89  0012 62            	div	x,a
  90  0013 9f            	ld	a,xl
  91  0014 97            	ld	xl,a
  92  0015 a610          	ld	a,#16
  93  0017 42            	mul	x,a
  94  0018 9f            	ld	a,xl
  95  0019 1b01          	add	a,(OFST+0,sp)
  98  001b 85            	popw	x
  99  001c 81            	ret
 153                     ; 26 void set_display(uint8_t option, uint8_t value, uint8_t decimal)
 153                     ; 27 {
 154                     	switch	.text
 155  001d               _set_display:
 157  001d 89            	pushw	x
 158  001e 88            	push	a
 159       00000001      OFST:	set	1
 162                     ; 31     bcd = (uint8_t)dec2bcd(value);
 164  001f 9f            	ld	a,xl
 165  0020 adde          	call	_dec2bcd
 167  0022 6b01          	ld	(OFST+0,sp),a
 169                     ; 33     if (value > MAX_DISPLAY_VALUE)
 171  0024 7b03          	ld	a,(OFST+2,sp)
 172  0026 a164          	cp	a,#100
 173  0028 2504          	jrult	L55
 174                     ; 34         value = MAX_DISPLAY_VALUE;
 176  002a a663          	ld	a,#99
 177  002c 6b03          	ld	(OFST+2,sp),a
 178  002e               L55:
 179                     ; 36     display_num[DIG1_POS] = option;
 181  002e 7b02          	ld	a,(OFST+1,sp)
 182  0030 b701          	ld	_display_num,a
 183                     ; 37     display_num[DIG2_POS] = (uint8_t)(bcd >> 4);
 185  0032 7b01          	ld	a,(OFST+0,sp)
 186  0034 4e            	swap	a
 187  0035 a40f          	and	a,#15
 188  0037 b702          	ld	_display_num+1,a
 189                     ; 38     display_num[DIG3_POS] = (uint8_t)(bcd & 0x0F);
 191  0039 7b01          	ld	a,(OFST+0,sp)
 192  003b a40f          	and	a,#15
 193  003d b703          	ld	_display_num+2,a
 194                     ; 40 }
 197  003f 5b03          	addw	sp,#3
 198  0041 81            	ret
 233                     ; 42 void set_option_display(uint8_t option)
 233                     ; 43 {
 234                     	switch	.text
 235  0042               _set_option_display:
 239                     ; 45     display_num[DIG1_POS] = option;
 241  0042 b701          	ld	_display_num,a
 242                     ; 47 }
 245  0044 81            	ret
 283                     .const:	section	.text
 284  0000               L61:
 285  0000 00ba          	dc.w	L57
 286  0002 00fd          	dc.w	L77
 287  0004 0140          	dc.w	L101
 288  0006 0183          	dc.w	L301
 289  0008 01c6          	dc.w	L501
 290  000a 0209          	dc.w	L701
 291  000c 024c          	dc.w	L111
 292  000e 028f          	dc.w	L311
 293  0010 02d2          	dc.w	L511
 294  0012 0315          	dc.w	L711
 295                     ; 49 void wr_digit(uint8_t dig_pos)
 295                     ; 50 {
 296                     	switch	.text
 297  0045               _wr_digit:
 299  0045 88            	push	a
 300       00000000      OFST:	set	0
 303                     ; 53     if (dp[dig_pos]) {
 305  0046 5f            	clrw	x
 306  0047 97            	ld	xl,a
 307  0048 6d04          	tnz	(_dp,x)
 308  004a 270b          	jreq	L361
 309                     ; 54         dp_on();
 311  004c 4b04          	push	#4
 312  004e ae500f        	ldw	x,#20495
 313  0051 cd0000        	call	_GPIO_WriteHigh
 315  0054 84            	pop	a
 317  0055 2009          	jra	L561
 318  0057               L361:
 319                     ; 56         dp_off();
 321  0057 4b04          	push	#4
 322  0059 ae500f        	ldw	x,#20495
 323  005c cd0000        	call	_GPIO_WriteLow
 325  005f 84            	pop	a
 326  0060               L561:
 327                     ; 59     switch (display_num[dig_pos]) {
 329  0060 7b01          	ld	a,(OFST+1,sp)
 330  0062 5f            	clrw	x
 331  0063 97            	ld	xl,a
 332  0064 e601          	ld	a,(_display_num,x)
 334                     ; 119         break;
 335  0066 a10a          	cp	a,#10
 336  0068 2407          	jruge	L41
 337  006a 5f            	clrw	x
 338  006b 97            	ld	xl,a
 339  006c 58            	sllw	x
 340  006d de0000        	ldw	x,(L61,x)
 341  0070 fc            	jp	(x)
 342  0071               L41:
 343  0071 a041          	sub	a,#65
 344  0073 2603          	jrne	L02
 345  0075 cc0358        	jp	L121
 346  0078               L02:
 347  0078 a002          	sub	a,#2
 348  007a 2603          	jrne	L22
 349  007c cc03de        	jp	L521
 350  007f               L22:
 351  007f a002          	sub	a,#2
 352  0081 2603          	jrne	L42
 353  0083 cc0464        	jp	L131
 354  0086               L42:
 355  0086 4a            	dec	a
 356  0087 2603          	jrne	L62
 357  0089 cc04a7        	jp	L331
 358  008c               L62:
 359  008c a002          	sub	a,#2
 360  008e 2603          	jrne	L03
 361  0090 cc04ea        	jp	L531
 362  0093               L03:
 363  0093 a004          	sub	a,#4
 364  0095 2603          	jrne	L23
 365  0097 cc052d        	jp	L731
 366  009a               L23:
 367  009a a004          	sub	a,#4
 368  009c 2603          	jrne	L43
 369  009e cc056f        	jp	L141
 370  00a1               L43:
 371  00a1 a005          	sub	a,#5
 372  00a3 2603          	jrne	L63
 373  00a5 cc05b0        	jp	L341
 374  00a8               L63:
 375  00a8 a00d          	sub	a,#13
 376  00aa 2603          	jrne	L04
 377  00ac cc039b        	jp	L321
 378  00af               L04:
 379  00af a002          	sub	a,#2
 380  00b1 2603          	jrne	L24
 381  00b3 cc0421        	jp	L721
 382  00b6               L24:
 383  00b6 acef05ef      	jpf	L171
 384  00ba               L57:
 385                     ; 60     case 0x00:
 385                     ; 61         display_zero();
 387  00ba 4b20          	push	#32
 388  00bc ae500f        	ldw	x,#20495
 389  00bf cd0000        	call	_GPIO_WriteHigh
 391  00c2 84            	pop	a
 394  00c3 4b04          	push	#4
 395  00c5 ae5000        	ldw	x,#20480
 396  00c8 cd0000        	call	_GPIO_WriteHigh
 398  00cb 84            	pop	a
 401  00cc 4b80          	push	#128
 402  00ce ae500a        	ldw	x,#20490
 403  00d1 cd0000        	call	_GPIO_WriteHigh
 405  00d4 84            	pop	a
 408  00d5 4b08          	push	#8
 409  00d7 ae500f        	ldw	x,#20495
 410  00da cd0000        	call	_GPIO_WriteHigh
 412  00dd 84            	pop	a
 415  00de 4b02          	push	#2
 416  00e0 ae500f        	ldw	x,#20495
 417  00e3 cd0000        	call	_GPIO_WriteHigh
 419  00e6 84            	pop	a
 422  00e7 4b02          	push	#2
 423  00e9 ae5000        	ldw	x,#20480
 424  00ec cd0000        	call	_GPIO_WriteHigh
 426  00ef 84            	pop	a
 429  00f0 4b40          	push	#64
 430  00f2 ae500a        	ldw	x,#20490
 431  00f5 cd0000        	call	_GPIO_WriteLow
 433  00f8 84            	pop	a
 434                     ; 62         break;
 436  00f9 acef05ef      	jpf	L171
 437  00fd               L77:
 438                     ; 63     case 0x01:
 438                     ; 64         display_one();
 440  00fd 4b20          	push	#32
 441  00ff ae500f        	ldw	x,#20495
 442  0102 cd0000        	call	_GPIO_WriteLow
 444  0105 84            	pop	a
 447  0106 4b04          	push	#4
 448  0108 ae5000        	ldw	x,#20480
 449  010b cd0000        	call	_GPIO_WriteHigh
 451  010e 84            	pop	a
 454  010f 4b80          	push	#128
 455  0111 ae500a        	ldw	x,#20490
 456  0114 cd0000        	call	_GPIO_WriteHigh
 458  0117 84            	pop	a
 461  0118 4b08          	push	#8
 462  011a ae500f        	ldw	x,#20495
 463  011d cd0000        	call	_GPIO_WriteLow
 465  0120 84            	pop	a
 468  0121 4b02          	push	#2
 469  0123 ae500f        	ldw	x,#20495
 470  0126 cd0000        	call	_GPIO_WriteLow
 472  0129 84            	pop	a
 475  012a 4b02          	push	#2
 476  012c ae5000        	ldw	x,#20480
 477  012f cd0000        	call	_GPIO_WriteLow
 479  0132 84            	pop	a
 482  0133 4b40          	push	#64
 483  0135 ae500a        	ldw	x,#20490
 484  0138 cd0000        	call	_GPIO_WriteLow
 486  013b 84            	pop	a
 487                     ; 65         break;
 489  013c acef05ef      	jpf	L171
 490  0140               L101:
 491                     ; 66     case 0x02:
 491                     ; 67         display_two();
 493  0140 4b20          	push	#32
 494  0142 ae500f        	ldw	x,#20495
 495  0145 cd0000        	call	_GPIO_WriteHigh
 497  0148 84            	pop	a
 500  0149 4b04          	push	#4
 501  014b ae5000        	ldw	x,#20480
 502  014e cd0000        	call	_GPIO_WriteHigh
 504  0151 84            	pop	a
 507  0152 4b80          	push	#128
 508  0154 ae500a        	ldw	x,#20490
 509  0157 cd0000        	call	_GPIO_WriteLow
 511  015a 84            	pop	a
 514  015b 4b08          	push	#8
 515  015d ae500f        	ldw	x,#20495
 516  0160 cd0000        	call	_GPIO_WriteHigh
 518  0163 84            	pop	a
 521  0164 4b02          	push	#2
 522  0166 ae500f        	ldw	x,#20495
 523  0169 cd0000        	call	_GPIO_WriteHigh
 525  016c 84            	pop	a
 528  016d 4b02          	push	#2
 529  016f ae5000        	ldw	x,#20480
 530  0172 cd0000        	call	_GPIO_WriteLow
 532  0175 84            	pop	a
 535  0176 4b40          	push	#64
 536  0178 ae500a        	ldw	x,#20490
 537  017b cd0000        	call	_GPIO_WriteHigh
 539  017e 84            	pop	a
 540                     ; 68         break;
 542  017f acef05ef      	jpf	L171
 543  0183               L301:
 544                     ; 69     case 0x03:
 544                     ; 70         display_three();
 546  0183 4b20          	push	#32
 547  0185 ae500f        	ldw	x,#20495
 548  0188 cd0000        	call	_GPIO_WriteHigh
 550  018b 84            	pop	a
 553  018c 4b04          	push	#4
 554  018e ae5000        	ldw	x,#20480
 555  0191 cd0000        	call	_GPIO_WriteHigh
 557  0194 84            	pop	a
 560  0195 4b80          	push	#128
 561  0197 ae500a        	ldw	x,#20490
 562  019a cd0000        	call	_GPIO_WriteHigh
 564  019d 84            	pop	a
 567  019e 4b08          	push	#8
 568  01a0 ae500f        	ldw	x,#20495
 569  01a3 cd0000        	call	_GPIO_WriteHigh
 571  01a6 84            	pop	a
 574  01a7 4b02          	push	#2
 575  01a9 ae500f        	ldw	x,#20495
 576  01ac cd0000        	call	_GPIO_WriteLow
 578  01af 84            	pop	a
 581  01b0 4b02          	push	#2
 582  01b2 ae5000        	ldw	x,#20480
 583  01b5 cd0000        	call	_GPIO_WriteLow
 585  01b8 84            	pop	a
 588  01b9 4b40          	push	#64
 589  01bb ae500a        	ldw	x,#20490
 590  01be cd0000        	call	_GPIO_WriteHigh
 592  01c1 84            	pop	a
 593                     ; 71         break;
 595  01c2 acef05ef      	jpf	L171
 596  01c6               L501:
 597                     ; 72     case 0x04:
 597                     ; 73         display_four();
 599  01c6 4b20          	push	#32
 600  01c8 ae500f        	ldw	x,#20495
 601  01cb cd0000        	call	_GPIO_WriteLow
 603  01ce 84            	pop	a
 606  01cf 4b04          	push	#4
 607  01d1 ae5000        	ldw	x,#20480
 608  01d4 cd0000        	call	_GPIO_WriteHigh
 610  01d7 84            	pop	a
 613  01d8 4b80          	push	#128
 614  01da ae500a        	ldw	x,#20490
 615  01dd cd0000        	call	_GPIO_WriteHigh
 617  01e0 84            	pop	a
 620  01e1 4b08          	push	#8
 621  01e3 ae500f        	ldw	x,#20495
 622  01e6 cd0000        	call	_GPIO_WriteLow
 624  01e9 84            	pop	a
 627  01ea 4b02          	push	#2
 628  01ec ae500f        	ldw	x,#20495
 629  01ef cd0000        	call	_GPIO_WriteLow
 631  01f2 84            	pop	a
 634  01f3 4b02          	push	#2
 635  01f5 ae5000        	ldw	x,#20480
 636  01f8 cd0000        	call	_GPIO_WriteHigh
 638  01fb 84            	pop	a
 641  01fc 4b40          	push	#64
 642  01fe ae500a        	ldw	x,#20490
 643  0201 cd0000        	call	_GPIO_WriteHigh
 645  0204 84            	pop	a
 646                     ; 74         break;
 648  0205 acef05ef      	jpf	L171
 649  0209               L701:
 650                     ; 75     case 0x05:
 650                     ; 76         display_five();
 652  0209 4b20          	push	#32
 653  020b ae500f        	ldw	x,#20495
 654  020e cd0000        	call	_GPIO_WriteHigh
 656  0211 84            	pop	a
 659  0212 4b04          	push	#4
 660  0214 ae5000        	ldw	x,#20480
 661  0217 cd0000        	call	_GPIO_WriteLow
 663  021a 84            	pop	a
 666  021b 4b80          	push	#128
 667  021d ae500a        	ldw	x,#20490
 668  0220 cd0000        	call	_GPIO_WriteHigh
 670  0223 84            	pop	a
 673  0224 4b08          	push	#8
 674  0226 ae500f        	ldw	x,#20495
 675  0229 cd0000        	call	_GPIO_WriteHigh
 677  022c 84            	pop	a
 680  022d 4b02          	push	#2
 681  022f ae500f        	ldw	x,#20495
 682  0232 cd0000        	call	_GPIO_WriteLow
 684  0235 84            	pop	a
 687  0236 4b02          	push	#2
 688  0238 ae5000        	ldw	x,#20480
 689  023b cd0000        	call	_GPIO_WriteHigh
 691  023e 84            	pop	a
 694  023f 4b40          	push	#64
 695  0241 ae500a        	ldw	x,#20490
 696  0244 cd0000        	call	_GPIO_WriteHigh
 698  0247 84            	pop	a
 699                     ; 77         break;
 701  0248 acef05ef      	jpf	L171
 702  024c               L111:
 703                     ; 78     case 0x06:
 703                     ; 79         display_six();
 705  024c 4b20          	push	#32
 706  024e ae500f        	ldw	x,#20495
 707  0251 cd0000        	call	_GPIO_WriteHigh
 709  0254 84            	pop	a
 712  0255 4b04          	push	#4
 713  0257 ae5000        	ldw	x,#20480
 714  025a cd0000        	call	_GPIO_WriteLow
 716  025d 84            	pop	a
 719  025e 4b80          	push	#128
 720  0260 ae500a        	ldw	x,#20490
 721  0263 cd0000        	call	_GPIO_WriteHigh
 723  0266 84            	pop	a
 726  0267 4b08          	push	#8
 727  0269 ae500f        	ldw	x,#20495
 728  026c cd0000        	call	_GPIO_WriteHigh
 730  026f 84            	pop	a
 733  0270 4b02          	push	#2
 734  0272 ae500f        	ldw	x,#20495
 735  0275 cd0000        	call	_GPIO_WriteHigh
 737  0278 84            	pop	a
 740  0279 4b02          	push	#2
 741  027b ae5000        	ldw	x,#20480
 742  027e cd0000        	call	_GPIO_WriteHigh
 744  0281 84            	pop	a
 747  0282 4b40          	push	#64
 748  0284 ae500a        	ldw	x,#20490
 749  0287 cd0000        	call	_GPIO_WriteHigh
 751  028a 84            	pop	a
 752                     ; 80         break;
 754  028b acef05ef      	jpf	L171
 755  028f               L311:
 756                     ; 81     case 0x07:
 756                     ; 82         display_seven();
 758  028f 4b20          	push	#32
 759  0291 ae500f        	ldw	x,#20495
 760  0294 cd0000        	call	_GPIO_WriteHigh
 762  0297 84            	pop	a
 765  0298 4b04          	push	#4
 766  029a ae5000        	ldw	x,#20480
 767  029d cd0000        	call	_GPIO_WriteHigh
 769  02a0 84            	pop	a
 772  02a1 4b80          	push	#128
 773  02a3 ae500a        	ldw	x,#20490
 774  02a6 cd0000        	call	_GPIO_WriteHigh
 776  02a9 84            	pop	a
 779  02aa 4b08          	push	#8
 780  02ac ae500f        	ldw	x,#20495
 781  02af cd0000        	call	_GPIO_WriteLow
 783  02b2 84            	pop	a
 786  02b3 4b02          	push	#2
 787  02b5 ae500f        	ldw	x,#20495
 788  02b8 cd0000        	call	_GPIO_WriteLow
 790  02bb 84            	pop	a
 793  02bc 4b02          	push	#2
 794  02be ae5000        	ldw	x,#20480
 795  02c1 cd0000        	call	_GPIO_WriteLow
 797  02c4 84            	pop	a
 800  02c5 4b40          	push	#64
 801  02c7 ae500a        	ldw	x,#20490
 802  02ca cd0000        	call	_GPIO_WriteLow
 804  02cd 84            	pop	a
 805                     ; 83         break;
 807  02ce acef05ef      	jpf	L171
 808  02d2               L511:
 809                     ; 84     case 0x08:
 809                     ; 85         display_eight();
 811  02d2 4b20          	push	#32
 812  02d4 ae500f        	ldw	x,#20495
 813  02d7 cd0000        	call	_GPIO_WriteHigh
 815  02da 84            	pop	a
 818  02db 4b04          	push	#4
 819  02dd ae5000        	ldw	x,#20480
 820  02e0 cd0000        	call	_GPIO_WriteHigh
 822  02e3 84            	pop	a
 825  02e4 4b80          	push	#128
 826  02e6 ae500a        	ldw	x,#20490
 827  02e9 cd0000        	call	_GPIO_WriteHigh
 829  02ec 84            	pop	a
 832  02ed 4b08          	push	#8
 833  02ef ae500f        	ldw	x,#20495
 834  02f2 cd0000        	call	_GPIO_WriteHigh
 836  02f5 84            	pop	a
 839  02f6 4b02          	push	#2
 840  02f8 ae500f        	ldw	x,#20495
 841  02fb cd0000        	call	_GPIO_WriteHigh
 843  02fe 84            	pop	a
 846  02ff 4b02          	push	#2
 847  0301 ae5000        	ldw	x,#20480
 848  0304 cd0000        	call	_GPIO_WriteHigh
 850  0307 84            	pop	a
 853  0308 4b40          	push	#64
 854  030a ae500a        	ldw	x,#20490
 855  030d cd0000        	call	_GPIO_WriteHigh
 857  0310 84            	pop	a
 858                     ; 86         break;
 860  0311 acef05ef      	jpf	L171
 861  0315               L711:
 862                     ; 87     case 0x09:
 862                     ; 88         display_nine();
 864  0315 4b20          	push	#32
 865  0317 ae500f        	ldw	x,#20495
 866  031a cd0000        	call	_GPIO_WriteHigh
 868  031d 84            	pop	a
 871  031e 4b04          	push	#4
 872  0320 ae5000        	ldw	x,#20480
 873  0323 cd0000        	call	_GPIO_WriteHigh
 875  0326 84            	pop	a
 878  0327 4b80          	push	#128
 879  0329 ae500a        	ldw	x,#20490
 880  032c cd0000        	call	_GPIO_WriteHigh
 882  032f 84            	pop	a
 885  0330 4b08          	push	#8
 886  0332 ae500f        	ldw	x,#20495
 887  0335 cd0000        	call	_GPIO_WriteHigh
 889  0338 84            	pop	a
 892  0339 4b02          	push	#2
 893  033b ae500f        	ldw	x,#20495
 894  033e cd0000        	call	_GPIO_WriteLow
 896  0341 84            	pop	a
 899  0342 4b02          	push	#2
 900  0344 ae5000        	ldw	x,#20480
 901  0347 cd0000        	call	_GPIO_WriteHigh
 903  034a 84            	pop	a
 906  034b 4b40          	push	#64
 907  034d ae500a        	ldw	x,#20490
 908  0350 cd0000        	call	_GPIO_WriteHigh
 910  0353 84            	pop	a
 911                     ; 89         break;
 913  0354 acef05ef      	jpf	L171
 914  0358               L121:
 915                     ; 90     case 'A':
 915                     ; 91         display_a();
 917  0358 4b20          	push	#32
 918  035a ae500f        	ldw	x,#20495
 919  035d cd0000        	call	_GPIO_WriteHigh
 921  0360 84            	pop	a
 924  0361 4b04          	push	#4
 925  0363 ae5000        	ldw	x,#20480
 926  0366 cd0000        	call	_GPIO_WriteHigh
 928  0369 84            	pop	a
 931  036a 4b80          	push	#128
 932  036c ae500a        	ldw	x,#20490
 933  036f cd0000        	call	_GPIO_WriteHigh
 935  0372 84            	pop	a
 938  0373 4b08          	push	#8
 939  0375 ae500f        	ldw	x,#20495
 940  0378 cd0000        	call	_GPIO_WriteLow
 942  037b 84            	pop	a
 945  037c 4b02          	push	#2
 946  037e ae500f        	ldw	x,#20495
 947  0381 cd0000        	call	_GPIO_WriteHigh
 949  0384 84            	pop	a
 952  0385 4b02          	push	#2
 953  0387 ae5000        	ldw	x,#20480
 954  038a cd0000        	call	_GPIO_WriteHigh
 956  038d 84            	pop	a
 959  038e 4b40          	push	#64
 960  0390 ae500a        	ldw	x,#20490
 961  0393 cd0000        	call	_GPIO_WriteHigh
 963  0396 84            	pop	a
 964                     ; 92         break;
 966  0397 acef05ef      	jpf	L171
 967  039b               L321:
 968                     ; 93     case 'b':
 968                     ; 94         display_b();
 970  039b 4b20          	push	#32
 971  039d ae500f        	ldw	x,#20495
 972  03a0 cd0000        	call	_GPIO_WriteLow
 974  03a3 84            	pop	a
 977  03a4 4b04          	push	#4
 978  03a6 ae5000        	ldw	x,#20480
 979  03a9 cd0000        	call	_GPIO_WriteLow
 981  03ac 84            	pop	a
 984  03ad 4b80          	push	#128
 985  03af ae500a        	ldw	x,#20490
 986  03b2 cd0000        	call	_GPIO_WriteHigh
 988  03b5 84            	pop	a
 991  03b6 4b08          	push	#8
 992  03b8 ae500f        	ldw	x,#20495
 993  03bb cd0000        	call	_GPIO_WriteHigh
 995  03be 84            	pop	a
 998  03bf 4b02          	push	#2
 999  03c1 ae500f        	ldw	x,#20495
1000  03c4 cd0000        	call	_GPIO_WriteHigh
1002  03c7 84            	pop	a
1005  03c8 4b02          	push	#2
1006  03ca ae5000        	ldw	x,#20480
1007  03cd cd0000        	call	_GPIO_WriteHigh
1009  03d0 84            	pop	a
1012  03d1 4b40          	push	#64
1013  03d3 ae500a        	ldw	x,#20490
1014  03d6 cd0000        	call	_GPIO_WriteHigh
1016  03d9 84            	pop	a
1017                     ; 95         break;
1019  03da acef05ef      	jpf	L171
1020  03de               L521:
1021                     ; 96     case 'C':
1021                     ; 97         display_c();
1023  03de 4b20          	push	#32
1024  03e0 ae500f        	ldw	x,#20495
1025  03e3 cd0000        	call	_GPIO_WriteHigh
1027  03e6 84            	pop	a
1030  03e7 4b04          	push	#4
1031  03e9 ae5000        	ldw	x,#20480
1032  03ec cd0000        	call	_GPIO_WriteLow
1034  03ef 84            	pop	a
1037  03f0 4b80          	push	#128
1038  03f2 ae500a        	ldw	x,#20490
1039  03f5 cd0000        	call	_GPIO_WriteLow
1041  03f8 84            	pop	a
1044  03f9 4b08          	push	#8
1045  03fb ae500f        	ldw	x,#20495
1046  03fe cd0000        	call	_GPIO_WriteHigh
1048  0401 84            	pop	a
1051  0402 4b02          	push	#2
1052  0404 ae500f        	ldw	x,#20495
1053  0407 cd0000        	call	_GPIO_WriteHigh
1055  040a 84            	pop	a
1058  040b 4b02          	push	#2
1059  040d ae5000        	ldw	x,#20480
1060  0410 cd0000        	call	_GPIO_WriteHigh
1062  0413 84            	pop	a
1065  0414 4b40          	push	#64
1066  0416 ae500a        	ldw	x,#20490
1067  0419 cd0000        	call	_GPIO_WriteLow
1069  041c 84            	pop	a
1070                     ; 98         break;
1072  041d acef05ef      	jpf	L171
1073  0421               L721:
1074                     ; 99     case 'd':
1074                     ; 100         display_d();
1076  0421 4b20          	push	#32
1077  0423 ae500f        	ldw	x,#20495
1078  0426 cd0000        	call	_GPIO_WriteLow
1080  0429 84            	pop	a
1083  042a 4b04          	push	#4
1084  042c ae5000        	ldw	x,#20480
1085  042f cd0000        	call	_GPIO_WriteHigh
1087  0432 84            	pop	a
1090  0433 4b80          	push	#128
1091  0435 ae500a        	ldw	x,#20490
1092  0438 cd0000        	call	_GPIO_WriteHigh
1094  043b 84            	pop	a
1097  043c 4b08          	push	#8
1098  043e ae500f        	ldw	x,#20495
1099  0441 cd0000        	call	_GPIO_WriteHigh
1101  0444 84            	pop	a
1104  0445 4b02          	push	#2
1105  0447 ae500f        	ldw	x,#20495
1106  044a cd0000        	call	_GPIO_WriteHigh
1108  044d 84            	pop	a
1111  044e 4b02          	push	#2
1112  0450 ae5000        	ldw	x,#20480
1113  0453 cd0000        	call	_GPIO_WriteLow
1115  0456 84            	pop	a
1118  0457 4b40          	push	#64
1119  0459 ae500a        	ldw	x,#20490
1120  045c cd0000        	call	_GPIO_WriteHigh
1122  045f 84            	pop	a
1123                     ; 101         break;
1125  0460 acef05ef      	jpf	L171
1126  0464               L131:
1127                     ; 102     case 'E':
1127                     ; 103         display_e();
1129  0464 4b20          	push	#32
1130  0466 ae500f        	ldw	x,#20495
1131  0469 cd0000        	call	_GPIO_WriteHigh
1133  046c 84            	pop	a
1136  046d 4b04          	push	#4
1137  046f ae5000        	ldw	x,#20480
1138  0472 cd0000        	call	_GPIO_WriteLow
1140  0475 84            	pop	a
1143  0476 4b80          	push	#128
1144  0478 ae500a        	ldw	x,#20490
1145  047b cd0000        	call	_GPIO_WriteLow
1147  047e 84            	pop	a
1150  047f 4b08          	push	#8
1151  0481 ae500f        	ldw	x,#20495
1152  0484 cd0000        	call	_GPIO_WriteHigh
1154  0487 84            	pop	a
1157  0488 4b02          	push	#2
1158  048a ae500f        	ldw	x,#20495
1159  048d cd0000        	call	_GPIO_WriteHigh
1161  0490 84            	pop	a
1164  0491 4b02          	push	#2
1165  0493 ae5000        	ldw	x,#20480
1166  0496 cd0000        	call	_GPIO_WriteHigh
1168  0499 84            	pop	a
1171  049a 4b40          	push	#64
1172  049c ae500a        	ldw	x,#20490
1173  049f cd0000        	call	_GPIO_WriteHigh
1175  04a2 84            	pop	a
1176                     ; 104         break;
1178  04a3 acef05ef      	jpf	L171
1179  04a7               L331:
1180                     ; 105     case 'F':
1180                     ; 106         display_f();
1182  04a7 4b20          	push	#32
1183  04a9 ae500f        	ldw	x,#20495
1184  04ac cd0000        	call	_GPIO_WriteHigh
1186  04af 84            	pop	a
1189  04b0 4b04          	push	#4
1190  04b2 ae5000        	ldw	x,#20480
1191  04b5 cd0000        	call	_GPIO_WriteLow
1193  04b8 84            	pop	a
1196  04b9 4b80          	push	#128
1197  04bb ae500a        	ldw	x,#20490
1198  04be cd0000        	call	_GPIO_WriteLow
1200  04c1 84            	pop	a
1203  04c2 4b08          	push	#8
1204  04c4 ae500f        	ldw	x,#20495
1205  04c7 cd0000        	call	_GPIO_WriteLow
1207  04ca 84            	pop	a
1210  04cb 4b02          	push	#2
1211  04cd ae500f        	ldw	x,#20495
1212  04d0 cd0000        	call	_GPIO_WriteHigh
1214  04d3 84            	pop	a
1217  04d4 4b02          	push	#2
1218  04d6 ae5000        	ldw	x,#20480
1219  04d9 cd0000        	call	_GPIO_WriteHigh
1221  04dc 84            	pop	a
1224  04dd 4b40          	push	#64
1225  04df ae500a        	ldw	x,#20490
1226  04e2 cd0000        	call	_GPIO_WriteHigh
1228  04e5 84            	pop	a
1229                     ; 107         break;
1231  04e6 acef05ef      	jpf	L171
1232  04ea               L531:
1233                     ; 108     case 'H':
1233                     ; 109         display_h();
1235  04ea 4b20          	push	#32
1236  04ec ae500f        	ldw	x,#20495
1237  04ef cd0000        	call	_GPIO_WriteLow
1239  04f2 84            	pop	a
1242  04f3 4b04          	push	#4
1243  04f5 ae5000        	ldw	x,#20480
1244  04f8 cd0000        	call	_GPIO_WriteHigh
1246  04fb 84            	pop	a
1249  04fc 4b80          	push	#128
1250  04fe ae500a        	ldw	x,#20490
1251  0501 cd0000        	call	_GPIO_WriteHigh
1253  0504 84            	pop	a
1256  0505 4b08          	push	#8
1257  0507 ae500f        	ldw	x,#20495
1258  050a cd0000        	call	_GPIO_WriteLow
1260  050d 84            	pop	a
1263  050e 4b02          	push	#2
1264  0510 ae500f        	ldw	x,#20495
1265  0513 cd0000        	call	_GPIO_WriteHigh
1267  0516 84            	pop	a
1270  0517 4b02          	push	#2
1271  0519 ae5000        	ldw	x,#20480
1272  051c cd0000        	call	_GPIO_WriteHigh
1274  051f 84            	pop	a
1277  0520 4b40          	push	#64
1278  0522 ae500a        	ldw	x,#20490
1279  0525 cd0000        	call	_GPIO_WriteHigh
1281  0528 84            	pop	a
1282                     ; 110         break;
1284  0529 acef05ef      	jpf	L171
1285  052d               L731:
1286                     ; 111     case 'L':
1286                     ; 112         display_l();
1288  052d 4b20          	push	#32
1289  052f ae500f        	ldw	x,#20495
1290  0532 cd0000        	call	_GPIO_WriteLow
1292  0535 84            	pop	a
1295  0536 4b04          	push	#4
1296  0538 ae5000        	ldw	x,#20480
1297  053b cd0000        	call	_GPIO_WriteLow
1299  053e 84            	pop	a
1302  053f 4b80          	push	#128
1303  0541 ae500a        	ldw	x,#20490
1304  0544 cd0000        	call	_GPIO_WriteLow
1306  0547 84            	pop	a
1309  0548 4b08          	push	#8
1310  054a ae500f        	ldw	x,#20495
1311  054d cd0000        	call	_GPIO_WriteHigh
1313  0550 84            	pop	a
1316  0551 4b02          	push	#2
1317  0553 ae500f        	ldw	x,#20495
1318  0556 cd0000        	call	_GPIO_WriteHigh
1320  0559 84            	pop	a
1323  055a 4b02          	push	#2
1324  055c ae5000        	ldw	x,#20480
1325  055f cd0000        	call	_GPIO_WriteHigh
1327  0562 84            	pop	a
1330  0563 4b40          	push	#64
1331  0565 ae500a        	ldw	x,#20490
1332  0568 cd0000        	call	_GPIO_WriteLow
1334  056b 84            	pop	a
1335                     ; 113         break;
1337  056c cc05ef        	jra	L171
1338  056f               L141:
1339                     ; 114     case 'P':
1339                     ; 115         display_p();
1341  056f 4b20          	push	#32
1342  0571 ae500f        	ldw	x,#20495
1343  0574 cd0000        	call	_GPIO_WriteHigh
1345  0577 84            	pop	a
1348  0578 4b04          	push	#4
1349  057a ae5000        	ldw	x,#20480
1350  057d cd0000        	call	_GPIO_WriteHigh
1352  0580 84            	pop	a
1355  0581 4b80          	push	#128
1356  0583 ae500a        	ldw	x,#20490
1357  0586 cd0000        	call	_GPIO_WriteLow
1359  0589 84            	pop	a
1362  058a 4b08          	push	#8
1363  058c ae500f        	ldw	x,#20495
1364  058f cd0000        	call	_GPIO_WriteLow
1366  0592 84            	pop	a
1369  0593 4b02          	push	#2
1370  0595 ae500f        	ldw	x,#20495
1371  0598 cd0000        	call	_GPIO_WriteHigh
1373  059b 84            	pop	a
1376  059c 4b02          	push	#2
1377  059e ae5000        	ldw	x,#20480
1378  05a1 cd0000        	call	_GPIO_WriteHigh
1380  05a4 84            	pop	a
1383  05a5 4b40          	push	#64
1384  05a7 ae500a        	ldw	x,#20490
1385  05aa cd0000        	call	_GPIO_WriteHigh
1387  05ad 84            	pop	a
1388                     ; 116         break;
1390  05ae 203f          	jra	L171
1391  05b0               L341:
1392                     ; 117     case 'U':
1392                     ; 118         display_u();
1394  05b0 4b20          	push	#32
1395  05b2 ae500f        	ldw	x,#20495
1396  05b5 cd0000        	call	_GPIO_WriteLow
1398  05b8 84            	pop	a
1401  05b9 4b04          	push	#4
1402  05bb ae5000        	ldw	x,#20480
1403  05be cd0000        	call	_GPIO_WriteHigh
1405  05c1 84            	pop	a
1408  05c2 4b80          	push	#128
1409  05c4 ae500a        	ldw	x,#20490
1410  05c7 cd0000        	call	_GPIO_WriteHigh
1412  05ca 84            	pop	a
1415  05cb 4b08          	push	#8
1416  05cd ae500f        	ldw	x,#20495
1417  05d0 cd0000        	call	_GPIO_WriteHigh
1419  05d3 84            	pop	a
1422  05d4 4b02          	push	#2
1423  05d6 ae500f        	ldw	x,#20495
1424  05d9 cd0000        	call	_GPIO_WriteHigh
1426  05dc 84            	pop	a
1429  05dd 4b02          	push	#2
1430  05df ae5000        	ldw	x,#20480
1431  05e2 cd0000        	call	_GPIO_WriteHigh
1433  05e5 84            	pop	a
1436  05e6 4b40          	push	#64
1437  05e8 ae500a        	ldw	x,#20490
1438  05eb cd0000        	call	_GPIO_WriteLow
1440  05ee 84            	pop	a
1441                     ; 119         break;
1443  05ef               L171:
1444                     ; 122 }
1447  05ef 84            	pop	a
1448  05f0 81            	ret
1472                     ; 124 void task_display(void)
1472                     ; 125 {
1473                     	switch	.text
1474  05f1               _task_display:
1478                     ; 127     if (!tick)
1480  05f1 3d00          	tnz	_tick
1481  05f3 2601          	jrne	L302
1482                     ; 128         return;
1485  05f5 81            	ret
1486  05f6               L302:
1487                     ; 131 }
1490  05f6 81            	ret
1493                     	bsct
1494  0007               L502_dig_pos:
1495  0007 00            	dc.b	0
1531                     ; 133 void tmr_display(void)
1531                     ; 134 {
1532                     	switch	.text
1533  05f7               _tmr_display:
1537                     ; 139     if (display_test)
1539  05f7 3d00          	tnz	_display_test
1540  05f9 2701          	jreq	L332
1541                     ; 140         return;
1544  05fb 81            	ret
1545  05fc               L332:
1546                     ; 143     if (dig_pos >= MAX_DIG_POS)
1548  05fc b607          	ld	a,L502_dig_pos
1549  05fe a103          	cp	a,#3
1550  0600 2502          	jrult	L532
1551                     ; 144         dig_pos = DIG1_POS;
1553  0602 3f07          	clr	L502_dig_pos
1554  0604               L532:
1555                     ; 146     switch (dig_pos) {
1557  0604 b607          	ld	a,L502_dig_pos
1559                     ; 161         break;
1560  0606 4d            	tnz	a
1561  0607 2708          	jreq	L702
1562  0609 4a            	dec	a
1563  060a 2722          	jreq	L112
1564  060c 4a            	dec	a
1565  060d 273c          	jreq	L312
1566  060f 2055          	jra	L142
1567  0611               L702:
1568                     ; 147     case DIG1_POS:
1568                     ; 148         dig1_on();
1570  0611 4b10          	push	#16
1571  0613 ae500f        	ldw	x,#20495
1572  0616 cd0000        	call	_GPIO_WriteLow
1574  0619 84            	pop	a
1575                     ; 149         dig2_off();
1577  061a 4b20          	push	#32
1578  061c ae5005        	ldw	x,#20485
1579  061f cd0000        	call	_GPIO_WriteHigh
1581  0622 84            	pop	a
1582                     ; 150         dig3_off();
1584  0623 4b10          	push	#16
1585  0625 ae5005        	ldw	x,#20485
1586  0628 cd0000        	call	_GPIO_WriteHigh
1588  062b 84            	pop	a
1589                     ; 151         break;
1591  062c 2038          	jra	L142
1592  062e               L112:
1593                     ; 152     case DIG2_POS:
1593                     ; 153         dig1_off();
1595  062e 4b10          	push	#16
1596  0630 ae500f        	ldw	x,#20495
1597  0633 cd0000        	call	_GPIO_WriteHigh
1599  0636 84            	pop	a
1600                     ; 154         dig2_on();
1602  0637 4b20          	push	#32
1603  0639 ae5005        	ldw	x,#20485
1604  063c cd0000        	call	_GPIO_WriteLow
1606  063f 84            	pop	a
1607                     ; 155         dig3_off();
1609  0640 4b10          	push	#16
1610  0642 ae5005        	ldw	x,#20485
1611  0645 cd0000        	call	_GPIO_WriteHigh
1613  0648 84            	pop	a
1614                     ; 156         break;
1616  0649 201b          	jra	L142
1617  064b               L312:
1618                     ; 157     case DIG3_POS:
1618                     ; 158         dig1_off();
1620  064b 4b10          	push	#16
1621  064d ae500f        	ldw	x,#20495
1622  0650 cd0000        	call	_GPIO_WriteHigh
1624  0653 84            	pop	a
1625                     ; 159         dig2_off();
1627  0654 4b20          	push	#32
1628  0656 ae5005        	ldw	x,#20485
1629  0659 cd0000        	call	_GPIO_WriteHigh
1631  065c 84            	pop	a
1632                     ; 160         dig3_on();
1634  065d 4b10          	push	#16
1635  065f ae5005        	ldw	x,#20485
1636  0662 cd0000        	call	_GPIO_WriteLow
1638  0665 84            	pop	a
1639                     ; 161         break;
1641  0666               L142:
1642                     ; 164     wr_digit(dig_pos);
1644  0666 b607          	ld	a,L502_dig_pos
1645  0668 cd0045        	call	_wr_digit
1647                     ; 165     dig_pos++;
1649  066b 3c07          	inc	L502_dig_pos
1650                     ; 167 }
1653  066d 81            	ret
1679                     ; 170 void test_display(void)
1679                     ; 171 {
1680                     	switch	.text
1681  066e               _test_display:
1685                     ; 172     delay(DELAY_DISPLAY_TEST);
1687  066e ae00fa        	ldw	x,#250
1688  0671 89            	pushw	x
1689  0672 ae0000        	ldw	x,#0
1690  0675 89            	pushw	x
1691  0676 cd0000        	call	_delay
1693  0679 5b04          	addw	sp,#4
1694                     ; 173     display_zero();
1696  067b 4b20          	push	#32
1697  067d ae500f        	ldw	x,#20495
1698  0680 cd0000        	call	_GPIO_WriteHigh
1700  0683 84            	pop	a
1703  0684 4b04          	push	#4
1704  0686 ae5000        	ldw	x,#20480
1705  0689 cd0000        	call	_GPIO_WriteHigh
1707  068c 84            	pop	a
1710  068d 4b80          	push	#128
1711  068f ae500a        	ldw	x,#20490
1712  0692 cd0000        	call	_GPIO_WriteHigh
1714  0695 84            	pop	a
1717  0696 4b08          	push	#8
1718  0698 ae500f        	ldw	x,#20495
1719  069b cd0000        	call	_GPIO_WriteHigh
1721  069e 84            	pop	a
1724  069f 4b02          	push	#2
1725  06a1 ae500f        	ldw	x,#20495
1726  06a4 cd0000        	call	_GPIO_WriteHigh
1728  06a7 84            	pop	a
1731  06a8 4b02          	push	#2
1732  06aa ae5000        	ldw	x,#20480
1733  06ad cd0000        	call	_GPIO_WriteHigh
1735  06b0 84            	pop	a
1738  06b1 4b40          	push	#64
1739  06b3 ae500a        	ldw	x,#20490
1740  06b6 cd0000        	call	_GPIO_WriteLow
1742  06b9 84            	pop	a
1743                     ; 174     delay(DELAY_DISPLAY_TEST);
1745  06ba ae00fa        	ldw	x,#250
1746  06bd 89            	pushw	x
1747  06be ae0000        	ldw	x,#0
1748  06c1 89            	pushw	x
1749  06c2 cd0000        	call	_delay
1751  06c5 5b04          	addw	sp,#4
1752                     ; 175     display_one();
1754  06c7 4b20          	push	#32
1755  06c9 ae500f        	ldw	x,#20495
1756  06cc cd0000        	call	_GPIO_WriteLow
1758  06cf 84            	pop	a
1761  06d0 4b04          	push	#4
1762  06d2 ae5000        	ldw	x,#20480
1763  06d5 cd0000        	call	_GPIO_WriteHigh
1765  06d8 84            	pop	a
1768  06d9 4b80          	push	#128
1769  06db ae500a        	ldw	x,#20490
1770  06de cd0000        	call	_GPIO_WriteHigh
1772  06e1 84            	pop	a
1775  06e2 4b08          	push	#8
1776  06e4 ae500f        	ldw	x,#20495
1777  06e7 cd0000        	call	_GPIO_WriteLow
1779  06ea 84            	pop	a
1782  06eb 4b02          	push	#2
1783  06ed ae500f        	ldw	x,#20495
1784  06f0 cd0000        	call	_GPIO_WriteLow
1786  06f3 84            	pop	a
1789  06f4 4b02          	push	#2
1790  06f6 ae5000        	ldw	x,#20480
1791  06f9 cd0000        	call	_GPIO_WriteLow
1793  06fc 84            	pop	a
1796  06fd 4b40          	push	#64
1797  06ff ae500a        	ldw	x,#20490
1798  0702 cd0000        	call	_GPIO_WriteLow
1800  0705 84            	pop	a
1801                     ; 176     delay(DELAY_DISPLAY_TEST);
1803  0706 ae00fa        	ldw	x,#250
1804  0709 89            	pushw	x
1805  070a ae0000        	ldw	x,#0
1806  070d 89            	pushw	x
1807  070e cd0000        	call	_delay
1809  0711 5b04          	addw	sp,#4
1810                     ; 177     display_two();
1812  0713 4b20          	push	#32
1813  0715 ae500f        	ldw	x,#20495
1814  0718 cd0000        	call	_GPIO_WriteHigh
1816  071b 84            	pop	a
1819  071c 4b04          	push	#4
1820  071e ae5000        	ldw	x,#20480
1821  0721 cd0000        	call	_GPIO_WriteHigh
1823  0724 84            	pop	a
1826  0725 4b80          	push	#128
1827  0727 ae500a        	ldw	x,#20490
1828  072a cd0000        	call	_GPIO_WriteLow
1830  072d 84            	pop	a
1833  072e 4b08          	push	#8
1834  0730 ae500f        	ldw	x,#20495
1835  0733 cd0000        	call	_GPIO_WriteHigh
1837  0736 84            	pop	a
1840  0737 4b02          	push	#2
1841  0739 ae500f        	ldw	x,#20495
1842  073c cd0000        	call	_GPIO_WriteHigh
1844  073f 84            	pop	a
1847  0740 4b02          	push	#2
1848  0742 ae5000        	ldw	x,#20480
1849  0745 cd0000        	call	_GPIO_WriteLow
1851  0748 84            	pop	a
1854  0749 4b40          	push	#64
1855  074b ae500a        	ldw	x,#20490
1856  074e cd0000        	call	_GPIO_WriteHigh
1858  0751 84            	pop	a
1859                     ; 178     delay(DELAY_DISPLAY_TEST);
1861  0752 ae00fa        	ldw	x,#250
1862  0755 89            	pushw	x
1863  0756 ae0000        	ldw	x,#0
1864  0759 89            	pushw	x
1865  075a cd0000        	call	_delay
1867  075d 5b04          	addw	sp,#4
1868                     ; 179     display_three();
1870  075f 4b20          	push	#32
1871  0761 ae500f        	ldw	x,#20495
1872  0764 cd0000        	call	_GPIO_WriteHigh
1874  0767 84            	pop	a
1877  0768 4b04          	push	#4
1878  076a ae5000        	ldw	x,#20480
1879  076d cd0000        	call	_GPIO_WriteHigh
1881  0770 84            	pop	a
1884  0771 4b80          	push	#128
1885  0773 ae500a        	ldw	x,#20490
1886  0776 cd0000        	call	_GPIO_WriteHigh
1888  0779 84            	pop	a
1891  077a 4b08          	push	#8
1892  077c ae500f        	ldw	x,#20495
1893  077f cd0000        	call	_GPIO_WriteHigh
1895  0782 84            	pop	a
1898  0783 4b02          	push	#2
1899  0785 ae500f        	ldw	x,#20495
1900  0788 cd0000        	call	_GPIO_WriteLow
1902  078b 84            	pop	a
1905  078c 4b02          	push	#2
1906  078e ae5000        	ldw	x,#20480
1907  0791 cd0000        	call	_GPIO_WriteLow
1909  0794 84            	pop	a
1912  0795 4b40          	push	#64
1913  0797 ae500a        	ldw	x,#20490
1914  079a cd0000        	call	_GPIO_WriteHigh
1916  079d 84            	pop	a
1917                     ; 180     delay(DELAY_DISPLAY_TEST);
1919  079e ae00fa        	ldw	x,#250
1920  07a1 89            	pushw	x
1921  07a2 ae0000        	ldw	x,#0
1922  07a5 89            	pushw	x
1923  07a6 cd0000        	call	_delay
1925  07a9 5b04          	addw	sp,#4
1926                     ; 181     display_four();
1928  07ab 4b20          	push	#32
1929  07ad ae500f        	ldw	x,#20495
1930  07b0 cd0000        	call	_GPIO_WriteLow
1932  07b3 84            	pop	a
1935  07b4 4b04          	push	#4
1936  07b6 ae5000        	ldw	x,#20480
1937  07b9 cd0000        	call	_GPIO_WriteHigh
1939  07bc 84            	pop	a
1942  07bd 4b80          	push	#128
1943  07bf ae500a        	ldw	x,#20490
1944  07c2 cd0000        	call	_GPIO_WriteHigh
1946  07c5 84            	pop	a
1949  07c6 4b08          	push	#8
1950  07c8 ae500f        	ldw	x,#20495
1951  07cb cd0000        	call	_GPIO_WriteLow
1953  07ce 84            	pop	a
1956  07cf 4b02          	push	#2
1957  07d1 ae500f        	ldw	x,#20495
1958  07d4 cd0000        	call	_GPIO_WriteLow
1960  07d7 84            	pop	a
1963  07d8 4b02          	push	#2
1964  07da ae5000        	ldw	x,#20480
1965  07dd cd0000        	call	_GPIO_WriteHigh
1967  07e0 84            	pop	a
1970  07e1 4b40          	push	#64
1971  07e3 ae500a        	ldw	x,#20490
1972  07e6 cd0000        	call	_GPIO_WriteHigh
1974  07e9 84            	pop	a
1975                     ; 182     delay(DELAY_DISPLAY_TEST);
1977  07ea ae00fa        	ldw	x,#250
1978  07ed 89            	pushw	x
1979  07ee ae0000        	ldw	x,#0
1980  07f1 89            	pushw	x
1981  07f2 cd0000        	call	_delay
1983  07f5 5b04          	addw	sp,#4
1984                     ; 183     display_five();
1986  07f7 4b20          	push	#32
1987  07f9 ae500f        	ldw	x,#20495
1988  07fc cd0000        	call	_GPIO_WriteHigh
1990  07ff 84            	pop	a
1993  0800 4b04          	push	#4
1994  0802 ae5000        	ldw	x,#20480
1995  0805 cd0000        	call	_GPIO_WriteLow
1997  0808 84            	pop	a
2000  0809 4b80          	push	#128
2001  080b ae500a        	ldw	x,#20490
2002  080e cd0000        	call	_GPIO_WriteHigh
2004  0811 84            	pop	a
2007  0812 4b08          	push	#8
2008  0814 ae500f        	ldw	x,#20495
2009  0817 cd0000        	call	_GPIO_WriteHigh
2011  081a 84            	pop	a
2014  081b 4b02          	push	#2
2015  081d ae500f        	ldw	x,#20495
2016  0820 cd0000        	call	_GPIO_WriteLow
2018  0823 84            	pop	a
2021  0824 4b02          	push	#2
2022  0826 ae5000        	ldw	x,#20480
2023  0829 cd0000        	call	_GPIO_WriteHigh
2025  082c 84            	pop	a
2028  082d 4b40          	push	#64
2029  082f ae500a        	ldw	x,#20490
2030  0832 cd0000        	call	_GPIO_WriteHigh
2032  0835 84            	pop	a
2033                     ; 184     delay(DELAY_DISPLAY_TEST);
2035  0836 ae00fa        	ldw	x,#250
2036  0839 89            	pushw	x
2037  083a ae0000        	ldw	x,#0
2038  083d 89            	pushw	x
2039  083e cd0000        	call	_delay
2041  0841 5b04          	addw	sp,#4
2042                     ; 185     display_six();
2044  0843 4b20          	push	#32
2045  0845 ae500f        	ldw	x,#20495
2046  0848 cd0000        	call	_GPIO_WriteHigh
2048  084b 84            	pop	a
2051  084c 4b04          	push	#4
2052  084e ae5000        	ldw	x,#20480
2053  0851 cd0000        	call	_GPIO_WriteLow
2055  0854 84            	pop	a
2058  0855 4b80          	push	#128
2059  0857 ae500a        	ldw	x,#20490
2060  085a cd0000        	call	_GPIO_WriteHigh
2062  085d 84            	pop	a
2065  085e 4b08          	push	#8
2066  0860 ae500f        	ldw	x,#20495
2067  0863 cd0000        	call	_GPIO_WriteHigh
2069  0866 84            	pop	a
2072  0867 4b02          	push	#2
2073  0869 ae500f        	ldw	x,#20495
2074  086c cd0000        	call	_GPIO_WriteHigh
2076  086f 84            	pop	a
2079  0870 4b02          	push	#2
2080  0872 ae5000        	ldw	x,#20480
2081  0875 cd0000        	call	_GPIO_WriteHigh
2083  0878 84            	pop	a
2086  0879 4b40          	push	#64
2087  087b ae500a        	ldw	x,#20490
2088  087e cd0000        	call	_GPIO_WriteHigh
2090  0881 84            	pop	a
2091                     ; 186     delay(DELAY_DISPLAY_TEST);
2093  0882 ae00fa        	ldw	x,#250
2094  0885 89            	pushw	x
2095  0886 ae0000        	ldw	x,#0
2096  0889 89            	pushw	x
2097  088a cd0000        	call	_delay
2099  088d 5b04          	addw	sp,#4
2100                     ; 187     display_seven();
2102  088f 4b20          	push	#32
2103  0891 ae500f        	ldw	x,#20495
2104  0894 cd0000        	call	_GPIO_WriteHigh
2106  0897 84            	pop	a
2109  0898 4b04          	push	#4
2110  089a ae5000        	ldw	x,#20480
2111  089d cd0000        	call	_GPIO_WriteHigh
2113  08a0 84            	pop	a
2116  08a1 4b80          	push	#128
2117  08a3 ae500a        	ldw	x,#20490
2118  08a6 cd0000        	call	_GPIO_WriteHigh
2120  08a9 84            	pop	a
2123  08aa 4b08          	push	#8
2124  08ac ae500f        	ldw	x,#20495
2125  08af cd0000        	call	_GPIO_WriteLow
2127  08b2 84            	pop	a
2130  08b3 4b02          	push	#2
2131  08b5 ae500f        	ldw	x,#20495
2132  08b8 cd0000        	call	_GPIO_WriteLow
2134  08bb 84            	pop	a
2137  08bc 4b02          	push	#2
2138  08be ae5000        	ldw	x,#20480
2139  08c1 cd0000        	call	_GPIO_WriteLow
2141  08c4 84            	pop	a
2144  08c5 4b40          	push	#64
2145  08c7 ae500a        	ldw	x,#20490
2146  08ca cd0000        	call	_GPIO_WriteLow
2148  08cd 84            	pop	a
2149                     ; 188     delay(DELAY_DISPLAY_TEST);
2151  08ce ae00fa        	ldw	x,#250
2152  08d1 89            	pushw	x
2153  08d2 ae0000        	ldw	x,#0
2154  08d5 89            	pushw	x
2155  08d6 cd0000        	call	_delay
2157  08d9 5b04          	addw	sp,#4
2158                     ; 189     display_eight();
2160  08db 4b20          	push	#32
2161  08dd ae500f        	ldw	x,#20495
2162  08e0 cd0000        	call	_GPIO_WriteHigh
2164  08e3 84            	pop	a
2167  08e4 4b04          	push	#4
2168  08e6 ae5000        	ldw	x,#20480
2169  08e9 cd0000        	call	_GPIO_WriteHigh
2171  08ec 84            	pop	a
2174  08ed 4b80          	push	#128
2175  08ef ae500a        	ldw	x,#20490
2176  08f2 cd0000        	call	_GPIO_WriteHigh
2178  08f5 84            	pop	a
2181  08f6 4b08          	push	#8
2182  08f8 ae500f        	ldw	x,#20495
2183  08fb cd0000        	call	_GPIO_WriteHigh
2185  08fe 84            	pop	a
2188  08ff 4b02          	push	#2
2189  0901 ae500f        	ldw	x,#20495
2190  0904 cd0000        	call	_GPIO_WriteHigh
2192  0907 84            	pop	a
2195  0908 4b02          	push	#2
2196  090a ae5000        	ldw	x,#20480
2197  090d cd0000        	call	_GPIO_WriteHigh
2199  0910 84            	pop	a
2202  0911 4b40          	push	#64
2203  0913 ae500a        	ldw	x,#20490
2204  0916 cd0000        	call	_GPIO_WriteHigh
2206  0919 84            	pop	a
2207                     ; 190     delay(DELAY_DISPLAY_TEST);
2209  091a ae00fa        	ldw	x,#250
2210  091d 89            	pushw	x
2211  091e ae0000        	ldw	x,#0
2212  0921 89            	pushw	x
2213  0922 cd0000        	call	_delay
2215  0925 5b04          	addw	sp,#4
2216                     ; 191     display_nine();    
2218  0927 4b20          	push	#32
2219  0929 ae500f        	ldw	x,#20495
2220  092c cd0000        	call	_GPIO_WriteHigh
2222  092f 84            	pop	a
2225  0930 4b04          	push	#4
2226  0932 ae5000        	ldw	x,#20480
2227  0935 cd0000        	call	_GPIO_WriteHigh
2229  0938 84            	pop	a
2232  0939 4b80          	push	#128
2233  093b ae500a        	ldw	x,#20490
2234  093e cd0000        	call	_GPIO_WriteHigh
2236  0941 84            	pop	a
2239  0942 4b08          	push	#8
2240  0944 ae500f        	ldw	x,#20495
2241  0947 cd0000        	call	_GPIO_WriteHigh
2243  094a 84            	pop	a
2246  094b 4b02          	push	#2
2247  094d ae500f        	ldw	x,#20495
2248  0950 cd0000        	call	_GPIO_WriteLow
2250  0953 84            	pop	a
2253  0954 4b02          	push	#2
2254  0956 ae5000        	ldw	x,#20480
2255  0959 cd0000        	call	_GPIO_WriteHigh
2257  095c 84            	pop	a
2260  095d 4b40          	push	#64
2261  095f ae500a        	ldw	x,#20490
2262  0962 cd0000        	call	_GPIO_WriteHigh
2264  0965 84            	pop	a
2265                     ; 192     delay(DELAY_DISPLAY_TEST);
2267  0966 ae00fa        	ldw	x,#250
2268  0969 89            	pushw	x
2269  096a ae0000        	ldw	x,#0
2270  096d 89            	pushw	x
2271  096e cd0000        	call	_delay
2273  0971 5b04          	addw	sp,#4
2274                     ; 193     display_off();
2276  0973 4b20          	push	#32
2277  0975 ae500f        	ldw	x,#20495
2278  0978 cd0000        	call	_GPIO_WriteLow
2280  097b 84            	pop	a
2283  097c 4b04          	push	#4
2284  097e ae5000        	ldw	x,#20480
2285  0981 cd0000        	call	_GPIO_WriteLow
2287  0984 84            	pop	a
2290  0985 4b80          	push	#128
2291  0987 ae500a        	ldw	x,#20490
2292  098a cd0000        	call	_GPIO_WriteLow
2294  098d 84            	pop	a
2297  098e 4b08          	push	#8
2298  0990 ae500f        	ldw	x,#20495
2299  0993 cd0000        	call	_GPIO_WriteLow
2301  0996 84            	pop	a
2304  0997 4b02          	push	#2
2305  0999 ae500f        	ldw	x,#20495
2306  099c cd0000        	call	_GPIO_WriteLow
2308  099f 84            	pop	a
2311  09a0 4b02          	push	#2
2312  09a2 ae5000        	ldw	x,#20480
2313  09a5 cd0000        	call	_GPIO_WriteLow
2315  09a8 84            	pop	a
2318  09a9 4b40          	push	#64
2319  09ab ae500a        	ldw	x,#20490
2320  09ae cd0000        	call	_GPIO_WriteLow
2322  09b1 84            	pop	a
2325  09b2 4b04          	push	#4
2326  09b4 ae500f        	ldw	x,#20495
2327  09b7 cd0000        	call	_GPIO_WriteLow
2329  09ba 84            	pop	a
2330                     ; 194     dp_on();
2333  09bb 4b04          	push	#4
2334  09bd ae500f        	ldw	x,#20495
2335  09c0 cd0000        	call	_GPIO_WriteHigh
2337  09c3 84            	pop	a
2338                     ; 195     delay(DELAY_DISPLAY_TEST);
2340  09c4 ae00fa        	ldw	x,#250
2341  09c7 89            	pushw	x
2342  09c8 ae0000        	ldw	x,#0
2343  09cb 89            	pushw	x
2344  09cc cd0000        	call	_delay
2346  09cf 5b04          	addw	sp,#4
2347                     ; 196     dp_off();
2349  09d1 4b04          	push	#4
2350  09d3 ae500f        	ldw	x,#20495
2351  09d6 cd0000        	call	_GPIO_WriteLow
2353  09d9 84            	pop	a
2354                     ; 197 }
2357  09da 81            	ret
2385                     ; 200 void init_display(void)
2385                     ; 201 {
2386                     	switch	.text
2387  09db               _init_display:
2391                     ; 203     seg_a_dir();
2393  09db 4be0          	push	#224
2394  09dd 4b20          	push	#32
2395  09df ae500f        	ldw	x,#20495
2396  09e2 cd0000        	call	_GPIO_Init
2398  09e5 85            	popw	x
2399                     ; 204     seg_b_dir();
2402  09e6 4be0          	push	#224
2403  09e8 4b04          	push	#4
2404  09ea ae5000        	ldw	x,#20480
2405  09ed cd0000        	call	_GPIO_Init
2407  09f0 85            	popw	x
2408                     ; 205     seg_c_dir();
2411  09f1 4be0          	push	#224
2412  09f3 4b80          	push	#128
2413  09f5 ae500a        	ldw	x,#20490
2414  09f8 cd0000        	call	_GPIO_Init
2416  09fb 85            	popw	x
2417                     ; 206     seg_d_dir();
2420  09fc 4be0          	push	#224
2421  09fe 4b08          	push	#8
2422  0a00 ae500f        	ldw	x,#20495
2423  0a03 cd0000        	call	_GPIO_Init
2425  0a06 85            	popw	x
2426                     ; 207     seg_e_dir();
2429  0a07 4be0          	push	#224
2430  0a09 4b02          	push	#2
2431  0a0b ae500f        	ldw	x,#20495
2432  0a0e cd0000        	call	_GPIO_Init
2434  0a11 85            	popw	x
2435                     ; 208     seg_f_dir();
2438  0a12 4be0          	push	#224
2439  0a14 4b02          	push	#2
2440  0a16 ae5000        	ldw	x,#20480
2441  0a19 cd0000        	call	_GPIO_Init
2443  0a1c 85            	popw	x
2444                     ; 209     seg_g_dir();
2447  0a1d 4be0          	push	#224
2448  0a1f 4b40          	push	#64
2449  0a21 ae500a        	ldw	x,#20490
2450  0a24 cd0000        	call	_GPIO_Init
2452  0a27 85            	popw	x
2453                     ; 210     dp_dir();
2456  0a28 4be0          	push	#224
2457  0a2a 4b04          	push	#4
2458  0a2c ae500f        	ldw	x,#20495
2459  0a2f cd0000        	call	_GPIO_Init
2461  0a32 85            	popw	x
2462                     ; 211     dig1_dir();
2465  0a33 4be0          	push	#224
2466  0a35 4b10          	push	#16
2467  0a37 ae500f        	ldw	x,#20495
2468  0a3a cd0000        	call	_GPIO_Init
2470  0a3d 85            	popw	x
2471                     ; 212     dig2_dir();
2474  0a3e 4be0          	push	#224
2475  0a40 4b20          	push	#32
2476  0a42 ae5005        	ldw	x,#20485
2477  0a45 cd0000        	call	_GPIO_Init
2479  0a48 85            	popw	x
2480                     ; 213     dig3_dir();
2483  0a49 4be0          	push	#224
2484  0a4b 4b10          	push	#16
2485  0a4d ae5005        	ldw	x,#20485
2486  0a50 cd0000        	call	_GPIO_Init
2488  0a53 85            	popw	x
2489                     ; 216     dig1_on();
2492  0a54 4b10          	push	#16
2493  0a56 ae500f        	ldw	x,#20495
2494  0a59 cd0000        	call	_GPIO_WriteLow
2496  0a5c 84            	pop	a
2497                     ; 217     dig2_on();
2499  0a5d 4b20          	push	#32
2500  0a5f ae5005        	ldw	x,#20485
2501  0a62 cd0000        	call	_GPIO_WriteLow
2503  0a65 84            	pop	a
2504                     ; 218     dig3_on();
2506  0a66 4b10          	push	#16
2507  0a68 ae5005        	ldw	x,#20485
2508  0a6b cd0000        	call	_GPIO_WriteLow
2510  0a6e 84            	pop	a
2511                     ; 220     display_all();
2513  0a6f 4b20          	push	#32
2514  0a71 ae500f        	ldw	x,#20495
2515  0a74 cd0000        	call	_GPIO_WriteHigh
2517  0a77 84            	pop	a
2520  0a78 4b04          	push	#4
2521  0a7a ae5000        	ldw	x,#20480
2522  0a7d cd0000        	call	_GPIO_WriteHigh
2524  0a80 84            	pop	a
2527  0a81 4b80          	push	#128
2528  0a83 ae500a        	ldw	x,#20490
2529  0a86 cd0000        	call	_GPIO_WriteHigh
2531  0a89 84            	pop	a
2534  0a8a 4b08          	push	#8
2535  0a8c ae500f        	ldw	x,#20495
2536  0a8f cd0000        	call	_GPIO_WriteHigh
2538  0a92 84            	pop	a
2541  0a93 4b02          	push	#2
2542  0a95 ae500f        	ldw	x,#20495
2543  0a98 cd0000        	call	_GPIO_WriteHigh
2545  0a9b 84            	pop	a
2548  0a9c 4b02          	push	#2
2549  0a9e ae5000        	ldw	x,#20480
2550  0aa1 cd0000        	call	_GPIO_WriteHigh
2552  0aa4 84            	pop	a
2555  0aa5 4b40          	push	#64
2556  0aa7 ae500a        	ldw	x,#20490
2557  0aaa cd0000        	call	_GPIO_WriteHigh
2559  0aad 84            	pop	a
2562  0aae 4b04          	push	#4
2563  0ab0 ae500f        	ldw	x,#20495
2564  0ab3 cd0000        	call	_GPIO_WriteHigh
2566  0ab6 84            	pop	a
2567                     ; 221     delay(2*DELAY_DISPLAY_TEST);
2570  0ab7 ae01f4        	ldw	x,#500
2571  0aba 89            	pushw	x
2572  0abb ae0000        	ldw	x,#0
2573  0abe 89            	pushw	x
2574  0abf cd0000        	call	_delay
2576  0ac2 5b04          	addw	sp,#4
2577                     ; 222     display_off();
2579  0ac4 4b20          	push	#32
2580  0ac6 ae500f        	ldw	x,#20495
2581  0ac9 cd0000        	call	_GPIO_WriteLow
2583  0acc 84            	pop	a
2586  0acd 4b04          	push	#4
2587  0acf ae5000        	ldw	x,#20480
2588  0ad2 cd0000        	call	_GPIO_WriteLow
2590  0ad5 84            	pop	a
2593  0ad6 4b80          	push	#128
2594  0ad8 ae500a        	ldw	x,#20490
2595  0adb cd0000        	call	_GPIO_WriteLow
2597  0ade 84            	pop	a
2600  0adf 4b08          	push	#8
2601  0ae1 ae500f        	ldw	x,#20495
2602  0ae4 cd0000        	call	_GPIO_WriteLow
2604  0ae7 84            	pop	a
2607  0ae8 4b02          	push	#2
2608  0aea ae500f        	ldw	x,#20495
2609  0aed cd0000        	call	_GPIO_WriteLow
2611  0af0 84            	pop	a
2614  0af1 4b02          	push	#2
2615  0af3 ae5000        	ldw	x,#20480
2616  0af6 cd0000        	call	_GPIO_WriteLow
2618  0af9 84            	pop	a
2621  0afa 4b40          	push	#64
2622  0afc ae500a        	ldw	x,#20490
2623  0aff cd0000        	call	_GPIO_WriteLow
2625  0b02 84            	pop	a
2628  0b03 4b04          	push	#4
2629  0b05 ae500f        	ldw	x,#20495
2630  0b08 cd0000        	call	_GPIO_WriteLow
2632  0b0b 84            	pop	a
2633                     ; 223     delay(DELAY_DISPLAY_TEST);
2636  0b0c ae00fa        	ldw	x,#250
2637  0b0f 89            	pushw	x
2638  0b10 ae0000        	ldw	x,#0
2639  0b13 89            	pushw	x
2640  0b14 cd0000        	call	_delay
2642  0b17 5b04          	addw	sp,#4
2643                     ; 224     display_all();
2645  0b19 4b20          	push	#32
2646  0b1b ae500f        	ldw	x,#20495
2647  0b1e cd0000        	call	_GPIO_WriteHigh
2649  0b21 84            	pop	a
2652  0b22 4b04          	push	#4
2653  0b24 ae5000        	ldw	x,#20480
2654  0b27 cd0000        	call	_GPIO_WriteHigh
2656  0b2a 84            	pop	a
2659  0b2b 4b80          	push	#128
2660  0b2d ae500a        	ldw	x,#20490
2661  0b30 cd0000        	call	_GPIO_WriteHigh
2663  0b33 84            	pop	a
2666  0b34 4b08          	push	#8
2667  0b36 ae500f        	ldw	x,#20495
2668  0b39 cd0000        	call	_GPIO_WriteHigh
2670  0b3c 84            	pop	a
2673  0b3d 4b02          	push	#2
2674  0b3f ae500f        	ldw	x,#20495
2675  0b42 cd0000        	call	_GPIO_WriteHigh
2677  0b45 84            	pop	a
2680  0b46 4b02          	push	#2
2681  0b48 ae5000        	ldw	x,#20480
2682  0b4b cd0000        	call	_GPIO_WriteHigh
2684  0b4e 84            	pop	a
2687  0b4f 4b40          	push	#64
2688  0b51 ae500a        	ldw	x,#20490
2689  0b54 cd0000        	call	_GPIO_WriteHigh
2691  0b57 84            	pop	a
2694  0b58 4b04          	push	#4
2695  0b5a ae500f        	ldw	x,#20495
2696  0b5d cd0000        	call	_GPIO_WriteHigh
2698  0b60 84            	pop	a
2699                     ; 225     delay(2*DELAY_DISPLAY_TEST);
2702  0b61 ae01f4        	ldw	x,#500
2703  0b64 89            	pushw	x
2704  0b65 ae0000        	ldw	x,#0
2705  0b68 89            	pushw	x
2706  0b69 cd0000        	call	_delay
2708  0b6c 5b04          	addw	sp,#4
2709                     ; 226     display_off();
2711  0b6e 4b20          	push	#32
2712  0b70 ae500f        	ldw	x,#20495
2713  0b73 cd0000        	call	_GPIO_WriteLow
2715  0b76 84            	pop	a
2718  0b77 4b04          	push	#4
2719  0b79 ae5000        	ldw	x,#20480
2720  0b7c cd0000        	call	_GPIO_WriteLow
2722  0b7f 84            	pop	a
2725  0b80 4b80          	push	#128
2726  0b82 ae500a        	ldw	x,#20490
2727  0b85 cd0000        	call	_GPIO_WriteLow
2729  0b88 84            	pop	a
2732  0b89 4b08          	push	#8
2733  0b8b ae500f        	ldw	x,#20495
2734  0b8e cd0000        	call	_GPIO_WriteLow
2736  0b91 84            	pop	a
2739  0b92 4b02          	push	#2
2740  0b94 ae500f        	ldw	x,#20495
2741  0b97 cd0000        	call	_GPIO_WriteLow
2743  0b9a 84            	pop	a
2746  0b9b 4b02          	push	#2
2747  0b9d ae5000        	ldw	x,#20480
2748  0ba0 cd0000        	call	_GPIO_WriteLow
2750  0ba3 84            	pop	a
2753  0ba4 4b40          	push	#64
2754  0ba6 ae500a        	ldw	x,#20490
2755  0ba9 cd0000        	call	_GPIO_WriteLow
2757  0bac 84            	pop	a
2760  0bad 4b04          	push	#4
2761  0baf ae500f        	ldw	x,#20495
2762  0bb2 cd0000        	call	_GPIO_WriteLow
2764  0bb5 84            	pop	a
2765                     ; 227     delay(DELAY_DISPLAY_TEST);
2768  0bb6 ae00fa        	ldw	x,#250
2769  0bb9 89            	pushw	x
2770  0bba ae0000        	ldw	x,#0
2771  0bbd 89            	pushw	x
2772  0bbe cd0000        	call	_delay
2774  0bc1 5b04          	addw	sp,#4
2775                     ; 228     display_all();
2777  0bc3 4b20          	push	#32
2778  0bc5 ae500f        	ldw	x,#20495
2779  0bc8 cd0000        	call	_GPIO_WriteHigh
2781  0bcb 84            	pop	a
2784  0bcc 4b04          	push	#4
2785  0bce ae5000        	ldw	x,#20480
2786  0bd1 cd0000        	call	_GPIO_WriteHigh
2788  0bd4 84            	pop	a
2791  0bd5 4b80          	push	#128
2792  0bd7 ae500a        	ldw	x,#20490
2793  0bda cd0000        	call	_GPIO_WriteHigh
2795  0bdd 84            	pop	a
2798  0bde 4b08          	push	#8
2799  0be0 ae500f        	ldw	x,#20495
2800  0be3 cd0000        	call	_GPIO_WriteHigh
2802  0be6 84            	pop	a
2805  0be7 4b02          	push	#2
2806  0be9 ae500f        	ldw	x,#20495
2807  0bec cd0000        	call	_GPIO_WriteHigh
2809  0bef 84            	pop	a
2812  0bf0 4b02          	push	#2
2813  0bf2 ae5000        	ldw	x,#20480
2814  0bf5 cd0000        	call	_GPIO_WriteHigh
2816  0bf8 84            	pop	a
2819  0bf9 4b40          	push	#64
2820  0bfb ae500a        	ldw	x,#20490
2821  0bfe cd0000        	call	_GPIO_WriteHigh
2823  0c01 84            	pop	a
2826  0c02 4b04          	push	#4
2827  0c04 ae500f        	ldw	x,#20495
2828  0c07 cd0000        	call	_GPIO_WriteHigh
2830  0c0a 84            	pop	a
2831                     ; 229     delay(2*DELAY_DISPLAY_TEST);
2834  0c0b ae01f4        	ldw	x,#500
2835  0c0e 89            	pushw	x
2836  0c0f ae0000        	ldw	x,#0
2837  0c12 89            	pushw	x
2838  0c13 cd0000        	call	_delay
2840  0c16 5b04          	addw	sp,#4
2841                     ; 230     display_off();
2843  0c18 4b20          	push	#32
2844  0c1a ae500f        	ldw	x,#20495
2845  0c1d cd0000        	call	_GPIO_WriteLow
2847  0c20 84            	pop	a
2850  0c21 4b04          	push	#4
2851  0c23 ae5000        	ldw	x,#20480
2852  0c26 cd0000        	call	_GPIO_WriteLow
2854  0c29 84            	pop	a
2857  0c2a 4b80          	push	#128
2858  0c2c ae500a        	ldw	x,#20490
2859  0c2f cd0000        	call	_GPIO_WriteLow
2861  0c32 84            	pop	a
2864  0c33 4b08          	push	#8
2865  0c35 ae500f        	ldw	x,#20495
2866  0c38 cd0000        	call	_GPIO_WriteLow
2868  0c3b 84            	pop	a
2871  0c3c 4b02          	push	#2
2872  0c3e ae500f        	ldw	x,#20495
2873  0c41 cd0000        	call	_GPIO_WriteLow
2875  0c44 84            	pop	a
2878  0c45 4b02          	push	#2
2879  0c47 ae5000        	ldw	x,#20480
2880  0c4a cd0000        	call	_GPIO_WriteLow
2882  0c4d 84            	pop	a
2885  0c4e 4b40          	push	#64
2886  0c50 ae500a        	ldw	x,#20490
2887  0c53 cd0000        	call	_GPIO_WriteLow
2889  0c56 84            	pop	a
2892  0c57 4b04          	push	#4
2893  0c59 ae500f        	ldw	x,#20495
2894  0c5c cd0000        	call	_GPIO_WriteLow
2896  0c5f 84            	pop	a
2897                     ; 232     display_test = 0;
2900  0c60 3f00          	clr	_display_test
2901                     ; 235     dig1_off();
2903  0c62 4b10          	push	#16
2904  0c64 ae500f        	ldw	x,#20495
2905  0c67 cd0000        	call	_GPIO_WriteHigh
2907  0c6a 84            	pop	a
2908                     ; 236     dig2_off();
2910  0c6b 4b20          	push	#32
2911  0c6d ae5005        	ldw	x,#20485
2912  0c70 cd0000        	call	_GPIO_WriteHigh
2914  0c73 84            	pop	a
2915                     ; 237     dig3_off();
2917  0c74 4b10          	push	#16
2918  0c76 ae5005        	ldw	x,#20485
2919  0c79 cd0000        	call	_GPIO_WriteHigh
2921  0c7c 84            	pop	a
2922                     ; 240 }
2925  0c7d 81            	ret
2969                     	xdef	_test_display
2970                     	xdef	_wr_digit
2971                     	xdef	_dec2bcd
2972                     	xdef	_dp
2973                     	xdef	_display_num
2974                     	xdef	_display_test
2975                     	xref.b	_tick
2976                     	xref	_delay
2977                     	xdef	_set_option_display
2978                     	xdef	_set_display
2979                     	xdef	_tmr_display
2980                     	xdef	_task_display
2981                     	xdef	_init_display
2982                     	xref	_GPIO_WriteLow
2983                     	xref	_GPIO_WriteHigh
2984                     	xref	_GPIO_Init
3003                     	end
