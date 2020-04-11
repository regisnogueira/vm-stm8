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
 154                     ; 26 void set_display_value(uint8_t value, uint8_t _dp)
 154                     ; 27 {
 155                     	switch	.text
 156  001d               _set_display_value:
 158  001d 89            	pushw	x
 159  001e 88            	push	a
 160       00000001      OFST:	set	1
 163                     ; 31     bcd = (uint8_t)dec2bcd(value);
 165  001f 9e            	ld	a,xh
 166  0020 adde          	call	_dec2bcd
 168  0022 6b01          	ld	(OFST+0,sp),a
 170                     ; 33     display_num[DIG2_POS] = (uint8_t)(bcd >> 4);
 172  0024 7b01          	ld	a,(OFST+0,sp)
 173  0026 4e            	swap	a
 174  0027 a40f          	and	a,#15
 175  0029 b702          	ld	_display_num+1,a
 176                     ; 34     display_num[DIG3_POS] = (uint8_t)(bcd & 0x0F);
 178  002b 7b01          	ld	a,(OFST+0,sp)
 179  002d a40f          	and	a,#15
 180  002f b703          	ld	_display_num+2,a
 181                     ; 36     dp[DIG2_POS] = _dp;
 183  0031 7b03          	ld	a,(OFST+2,sp)
 184  0033 b705          	ld	_dp+1,a
 185                     ; 38 }
 188  0035 5b03          	addw	sp,#3
 189  0037 81            	ret
 224                     ; 40 void set_display_option(uint8_t option)
 224                     ; 41 {
 225                     	switch	.text
 226  0038               _set_display_option:
 230                     ; 43     display_num[DIG1_POS] = option;
 232  0038 b701          	ld	_display_num,a
 233                     ; 45 }
 236  003a 81            	ret
 274                     .const:	section	.text
 275  0000               L61:
 276  0000 00b0          	dc.w	L37
 277  0002 00f3          	dc.w	L57
 278  0004 0136          	dc.w	L77
 279  0006 0179          	dc.w	L101
 280  0008 01bc          	dc.w	L301
 281  000a 01ff          	dc.w	L501
 282  000c 0242          	dc.w	L701
 283  000e 0285          	dc.w	L111
 284  0010 02c8          	dc.w	L311
 285  0012 030b          	dc.w	L511
 286                     ; 47 void wr_digit(uint8_t dig_pos)
 286                     ; 48 {
 287                     	switch	.text
 288  003b               _wr_digit:
 290  003b 88            	push	a
 291       00000000      OFST:	set	0
 294                     ; 51     if (dp[dig_pos]) {
 296  003c 5f            	clrw	x
 297  003d 97            	ld	xl,a
 298  003e 6d04          	tnz	(_dp,x)
 299  0040 270b          	jreq	L161
 300                     ; 52         dp_on();
 302  0042 4b04          	push	#4
 303  0044 ae500f        	ldw	x,#20495
 304  0047 cd0000        	call	_GPIO_WriteHigh
 306  004a 84            	pop	a
 308  004b 2009          	jra	L361
 309  004d               L161:
 310                     ; 54         dp_off();
 312  004d 4b04          	push	#4
 313  004f ae500f        	ldw	x,#20495
 314  0052 cd0000        	call	_GPIO_WriteLow
 316  0055 84            	pop	a
 317  0056               L361:
 318                     ; 57     switch (display_num[dig_pos]) {
 320  0056 7b01          	ld	a,(OFST+1,sp)
 321  0058 5f            	clrw	x
 322  0059 97            	ld	xl,a
 323  005a e601          	ld	a,(_display_num,x)
 325                     ; 117         break;
 326  005c a10a          	cp	a,#10
 327  005e 2407          	jruge	L41
 328  0060 5f            	clrw	x
 329  0061 97            	ld	xl,a
 330  0062 58            	sllw	x
 331  0063 de0000        	ldw	x,(L61,x)
 332  0066 fc            	jp	(x)
 333  0067               L41:
 334  0067 a041          	sub	a,#65
 335  0069 2603          	jrne	L02
 336  006b cc034e        	jp	L711
 337  006e               L02:
 338  006e a002          	sub	a,#2
 339  0070 2603          	jrne	L22
 340  0072 cc03d4        	jp	L321
 341  0075               L22:
 342  0075 a002          	sub	a,#2
 343  0077 2603          	jrne	L42
 344  0079 cc045a        	jp	L721
 345  007c               L42:
 346  007c 4a            	dec	a
 347  007d 2603          	jrne	L62
 348  007f cc049d        	jp	L131
 349  0082               L62:
 350  0082 a002          	sub	a,#2
 351  0084 2603          	jrne	L03
 352  0086 cc04e0        	jp	L331
 353  0089               L03:
 354  0089 a004          	sub	a,#4
 355  008b 2603          	jrne	L23
 356  008d cc0523        	jp	L531
 357  0090               L23:
 358  0090 a004          	sub	a,#4
 359  0092 2603          	jrne	L43
 360  0094 cc0565        	jp	L731
 361  0097               L43:
 362  0097 a005          	sub	a,#5
 363  0099 2603          	jrne	L63
 364  009b cc05a6        	jp	L141
 365  009e               L63:
 366  009e a00d          	sub	a,#13
 367  00a0 2603          	jrne	L04
 368  00a2 cc0391        	jp	L121
 369  00a5               L04:
 370  00a5 a002          	sub	a,#2
 371  00a7 2603          	jrne	L24
 372  00a9 cc0417        	jp	L521
 373  00ac               L24:
 374  00ac ace505e5      	jpf	L761
 375  00b0               L37:
 376                     ; 58     case 0x00:
 376                     ; 59         display_zero();
 378  00b0 4b20          	push	#32
 379  00b2 ae500f        	ldw	x,#20495
 380  00b5 cd0000        	call	_GPIO_WriteHigh
 382  00b8 84            	pop	a
 385  00b9 4b04          	push	#4
 386  00bb ae5000        	ldw	x,#20480
 387  00be cd0000        	call	_GPIO_WriteHigh
 389  00c1 84            	pop	a
 392  00c2 4b80          	push	#128
 393  00c4 ae500a        	ldw	x,#20490
 394  00c7 cd0000        	call	_GPIO_WriteHigh
 396  00ca 84            	pop	a
 399  00cb 4b08          	push	#8
 400  00cd ae500f        	ldw	x,#20495
 401  00d0 cd0000        	call	_GPIO_WriteHigh
 403  00d3 84            	pop	a
 406  00d4 4b02          	push	#2
 407  00d6 ae500f        	ldw	x,#20495
 408  00d9 cd0000        	call	_GPIO_WriteHigh
 410  00dc 84            	pop	a
 413  00dd 4b02          	push	#2
 414  00df ae5000        	ldw	x,#20480
 415  00e2 cd0000        	call	_GPIO_WriteHigh
 417  00e5 84            	pop	a
 420  00e6 4b40          	push	#64
 421  00e8 ae500a        	ldw	x,#20490
 422  00eb cd0000        	call	_GPIO_WriteLow
 424  00ee 84            	pop	a
 425                     ; 60         break;
 427  00ef ace505e5      	jpf	L761
 428  00f3               L57:
 429                     ; 61     case 0x01:
 429                     ; 62         display_one();
 431  00f3 4b20          	push	#32
 432  00f5 ae500f        	ldw	x,#20495
 433  00f8 cd0000        	call	_GPIO_WriteLow
 435  00fb 84            	pop	a
 438  00fc 4b04          	push	#4
 439  00fe ae5000        	ldw	x,#20480
 440  0101 cd0000        	call	_GPIO_WriteHigh
 442  0104 84            	pop	a
 445  0105 4b80          	push	#128
 446  0107 ae500a        	ldw	x,#20490
 447  010a cd0000        	call	_GPIO_WriteHigh
 449  010d 84            	pop	a
 452  010e 4b08          	push	#8
 453  0110 ae500f        	ldw	x,#20495
 454  0113 cd0000        	call	_GPIO_WriteLow
 456  0116 84            	pop	a
 459  0117 4b02          	push	#2
 460  0119 ae500f        	ldw	x,#20495
 461  011c cd0000        	call	_GPIO_WriteLow
 463  011f 84            	pop	a
 466  0120 4b02          	push	#2
 467  0122 ae5000        	ldw	x,#20480
 468  0125 cd0000        	call	_GPIO_WriteLow
 470  0128 84            	pop	a
 473  0129 4b40          	push	#64
 474  012b ae500a        	ldw	x,#20490
 475  012e cd0000        	call	_GPIO_WriteLow
 477  0131 84            	pop	a
 478                     ; 63         break;
 480  0132 ace505e5      	jpf	L761
 481  0136               L77:
 482                     ; 64     case 0x02:
 482                     ; 65         display_two();
 484  0136 4b20          	push	#32
 485  0138 ae500f        	ldw	x,#20495
 486  013b cd0000        	call	_GPIO_WriteHigh
 488  013e 84            	pop	a
 491  013f 4b04          	push	#4
 492  0141 ae5000        	ldw	x,#20480
 493  0144 cd0000        	call	_GPIO_WriteHigh
 495  0147 84            	pop	a
 498  0148 4b80          	push	#128
 499  014a ae500a        	ldw	x,#20490
 500  014d cd0000        	call	_GPIO_WriteLow
 502  0150 84            	pop	a
 505  0151 4b08          	push	#8
 506  0153 ae500f        	ldw	x,#20495
 507  0156 cd0000        	call	_GPIO_WriteHigh
 509  0159 84            	pop	a
 512  015a 4b02          	push	#2
 513  015c ae500f        	ldw	x,#20495
 514  015f cd0000        	call	_GPIO_WriteHigh
 516  0162 84            	pop	a
 519  0163 4b02          	push	#2
 520  0165 ae5000        	ldw	x,#20480
 521  0168 cd0000        	call	_GPIO_WriteLow
 523  016b 84            	pop	a
 526  016c 4b40          	push	#64
 527  016e ae500a        	ldw	x,#20490
 528  0171 cd0000        	call	_GPIO_WriteHigh
 530  0174 84            	pop	a
 531                     ; 66         break;
 533  0175 ace505e5      	jpf	L761
 534  0179               L101:
 535                     ; 67     case 0x03:
 535                     ; 68         display_three();
 537  0179 4b20          	push	#32
 538  017b ae500f        	ldw	x,#20495
 539  017e cd0000        	call	_GPIO_WriteHigh
 541  0181 84            	pop	a
 544  0182 4b04          	push	#4
 545  0184 ae5000        	ldw	x,#20480
 546  0187 cd0000        	call	_GPIO_WriteHigh
 548  018a 84            	pop	a
 551  018b 4b80          	push	#128
 552  018d ae500a        	ldw	x,#20490
 553  0190 cd0000        	call	_GPIO_WriteHigh
 555  0193 84            	pop	a
 558  0194 4b08          	push	#8
 559  0196 ae500f        	ldw	x,#20495
 560  0199 cd0000        	call	_GPIO_WriteHigh
 562  019c 84            	pop	a
 565  019d 4b02          	push	#2
 566  019f ae500f        	ldw	x,#20495
 567  01a2 cd0000        	call	_GPIO_WriteLow
 569  01a5 84            	pop	a
 572  01a6 4b02          	push	#2
 573  01a8 ae5000        	ldw	x,#20480
 574  01ab cd0000        	call	_GPIO_WriteLow
 576  01ae 84            	pop	a
 579  01af 4b40          	push	#64
 580  01b1 ae500a        	ldw	x,#20490
 581  01b4 cd0000        	call	_GPIO_WriteHigh
 583  01b7 84            	pop	a
 584                     ; 69         break;
 586  01b8 ace505e5      	jpf	L761
 587  01bc               L301:
 588                     ; 70     case 0x04:
 588                     ; 71         display_four();
 590  01bc 4b20          	push	#32
 591  01be ae500f        	ldw	x,#20495
 592  01c1 cd0000        	call	_GPIO_WriteLow
 594  01c4 84            	pop	a
 597  01c5 4b04          	push	#4
 598  01c7 ae5000        	ldw	x,#20480
 599  01ca cd0000        	call	_GPIO_WriteHigh
 601  01cd 84            	pop	a
 604  01ce 4b80          	push	#128
 605  01d0 ae500a        	ldw	x,#20490
 606  01d3 cd0000        	call	_GPIO_WriteHigh
 608  01d6 84            	pop	a
 611  01d7 4b08          	push	#8
 612  01d9 ae500f        	ldw	x,#20495
 613  01dc cd0000        	call	_GPIO_WriteLow
 615  01df 84            	pop	a
 618  01e0 4b02          	push	#2
 619  01e2 ae500f        	ldw	x,#20495
 620  01e5 cd0000        	call	_GPIO_WriteLow
 622  01e8 84            	pop	a
 625  01e9 4b02          	push	#2
 626  01eb ae5000        	ldw	x,#20480
 627  01ee cd0000        	call	_GPIO_WriteHigh
 629  01f1 84            	pop	a
 632  01f2 4b40          	push	#64
 633  01f4 ae500a        	ldw	x,#20490
 634  01f7 cd0000        	call	_GPIO_WriteHigh
 636  01fa 84            	pop	a
 637                     ; 72         break;
 639  01fb ace505e5      	jpf	L761
 640  01ff               L501:
 641                     ; 73     case 0x05:
 641                     ; 74         display_five();
 643  01ff 4b20          	push	#32
 644  0201 ae500f        	ldw	x,#20495
 645  0204 cd0000        	call	_GPIO_WriteHigh
 647  0207 84            	pop	a
 650  0208 4b04          	push	#4
 651  020a ae5000        	ldw	x,#20480
 652  020d cd0000        	call	_GPIO_WriteLow
 654  0210 84            	pop	a
 657  0211 4b80          	push	#128
 658  0213 ae500a        	ldw	x,#20490
 659  0216 cd0000        	call	_GPIO_WriteHigh
 661  0219 84            	pop	a
 664  021a 4b08          	push	#8
 665  021c ae500f        	ldw	x,#20495
 666  021f cd0000        	call	_GPIO_WriteHigh
 668  0222 84            	pop	a
 671  0223 4b02          	push	#2
 672  0225 ae500f        	ldw	x,#20495
 673  0228 cd0000        	call	_GPIO_WriteLow
 675  022b 84            	pop	a
 678  022c 4b02          	push	#2
 679  022e ae5000        	ldw	x,#20480
 680  0231 cd0000        	call	_GPIO_WriteHigh
 682  0234 84            	pop	a
 685  0235 4b40          	push	#64
 686  0237 ae500a        	ldw	x,#20490
 687  023a cd0000        	call	_GPIO_WriteHigh
 689  023d 84            	pop	a
 690                     ; 75         break;
 692  023e ace505e5      	jpf	L761
 693  0242               L701:
 694                     ; 76     case 0x06:
 694                     ; 77         display_six();
 696  0242 4b20          	push	#32
 697  0244 ae500f        	ldw	x,#20495
 698  0247 cd0000        	call	_GPIO_WriteHigh
 700  024a 84            	pop	a
 703  024b 4b04          	push	#4
 704  024d ae5000        	ldw	x,#20480
 705  0250 cd0000        	call	_GPIO_WriteLow
 707  0253 84            	pop	a
 710  0254 4b80          	push	#128
 711  0256 ae500a        	ldw	x,#20490
 712  0259 cd0000        	call	_GPIO_WriteHigh
 714  025c 84            	pop	a
 717  025d 4b08          	push	#8
 718  025f ae500f        	ldw	x,#20495
 719  0262 cd0000        	call	_GPIO_WriteHigh
 721  0265 84            	pop	a
 724  0266 4b02          	push	#2
 725  0268 ae500f        	ldw	x,#20495
 726  026b cd0000        	call	_GPIO_WriteHigh
 728  026e 84            	pop	a
 731  026f 4b02          	push	#2
 732  0271 ae5000        	ldw	x,#20480
 733  0274 cd0000        	call	_GPIO_WriteHigh
 735  0277 84            	pop	a
 738  0278 4b40          	push	#64
 739  027a ae500a        	ldw	x,#20490
 740  027d cd0000        	call	_GPIO_WriteHigh
 742  0280 84            	pop	a
 743                     ; 78         break;
 745  0281 ace505e5      	jpf	L761
 746  0285               L111:
 747                     ; 79     case 0x07:
 747                     ; 80         display_seven();
 749  0285 4b20          	push	#32
 750  0287 ae500f        	ldw	x,#20495
 751  028a cd0000        	call	_GPIO_WriteHigh
 753  028d 84            	pop	a
 756  028e 4b04          	push	#4
 757  0290 ae5000        	ldw	x,#20480
 758  0293 cd0000        	call	_GPIO_WriteHigh
 760  0296 84            	pop	a
 763  0297 4b80          	push	#128
 764  0299 ae500a        	ldw	x,#20490
 765  029c cd0000        	call	_GPIO_WriteHigh
 767  029f 84            	pop	a
 770  02a0 4b08          	push	#8
 771  02a2 ae500f        	ldw	x,#20495
 772  02a5 cd0000        	call	_GPIO_WriteLow
 774  02a8 84            	pop	a
 777  02a9 4b02          	push	#2
 778  02ab ae500f        	ldw	x,#20495
 779  02ae cd0000        	call	_GPIO_WriteLow
 781  02b1 84            	pop	a
 784  02b2 4b02          	push	#2
 785  02b4 ae5000        	ldw	x,#20480
 786  02b7 cd0000        	call	_GPIO_WriteLow
 788  02ba 84            	pop	a
 791  02bb 4b40          	push	#64
 792  02bd ae500a        	ldw	x,#20490
 793  02c0 cd0000        	call	_GPIO_WriteLow
 795  02c3 84            	pop	a
 796                     ; 81         break;
 798  02c4 ace505e5      	jpf	L761
 799  02c8               L311:
 800                     ; 82     case 0x08:
 800                     ; 83         display_eight();
 802  02c8 4b20          	push	#32
 803  02ca ae500f        	ldw	x,#20495
 804  02cd cd0000        	call	_GPIO_WriteHigh
 806  02d0 84            	pop	a
 809  02d1 4b04          	push	#4
 810  02d3 ae5000        	ldw	x,#20480
 811  02d6 cd0000        	call	_GPIO_WriteHigh
 813  02d9 84            	pop	a
 816  02da 4b80          	push	#128
 817  02dc ae500a        	ldw	x,#20490
 818  02df cd0000        	call	_GPIO_WriteHigh
 820  02e2 84            	pop	a
 823  02e3 4b08          	push	#8
 824  02e5 ae500f        	ldw	x,#20495
 825  02e8 cd0000        	call	_GPIO_WriteHigh
 827  02eb 84            	pop	a
 830  02ec 4b02          	push	#2
 831  02ee ae500f        	ldw	x,#20495
 832  02f1 cd0000        	call	_GPIO_WriteHigh
 834  02f4 84            	pop	a
 837  02f5 4b02          	push	#2
 838  02f7 ae5000        	ldw	x,#20480
 839  02fa cd0000        	call	_GPIO_WriteHigh
 841  02fd 84            	pop	a
 844  02fe 4b40          	push	#64
 845  0300 ae500a        	ldw	x,#20490
 846  0303 cd0000        	call	_GPIO_WriteHigh
 848  0306 84            	pop	a
 849                     ; 84         break;
 851  0307 ace505e5      	jpf	L761
 852  030b               L511:
 853                     ; 85     case 0x09:
 853                     ; 86         display_nine();
 855  030b 4b20          	push	#32
 856  030d ae500f        	ldw	x,#20495
 857  0310 cd0000        	call	_GPIO_WriteHigh
 859  0313 84            	pop	a
 862  0314 4b04          	push	#4
 863  0316 ae5000        	ldw	x,#20480
 864  0319 cd0000        	call	_GPIO_WriteHigh
 866  031c 84            	pop	a
 869  031d 4b80          	push	#128
 870  031f ae500a        	ldw	x,#20490
 871  0322 cd0000        	call	_GPIO_WriteHigh
 873  0325 84            	pop	a
 876  0326 4b08          	push	#8
 877  0328 ae500f        	ldw	x,#20495
 878  032b cd0000        	call	_GPIO_WriteHigh
 880  032e 84            	pop	a
 883  032f 4b02          	push	#2
 884  0331 ae500f        	ldw	x,#20495
 885  0334 cd0000        	call	_GPIO_WriteLow
 887  0337 84            	pop	a
 890  0338 4b02          	push	#2
 891  033a ae5000        	ldw	x,#20480
 892  033d cd0000        	call	_GPIO_WriteHigh
 894  0340 84            	pop	a
 897  0341 4b40          	push	#64
 898  0343 ae500a        	ldw	x,#20490
 899  0346 cd0000        	call	_GPIO_WriteHigh
 901  0349 84            	pop	a
 902                     ; 87         break;
 904  034a ace505e5      	jpf	L761
 905  034e               L711:
 906                     ; 88     case 'A':
 906                     ; 89         display_a();
 908  034e 4b20          	push	#32
 909  0350 ae500f        	ldw	x,#20495
 910  0353 cd0000        	call	_GPIO_WriteHigh
 912  0356 84            	pop	a
 915  0357 4b04          	push	#4
 916  0359 ae5000        	ldw	x,#20480
 917  035c cd0000        	call	_GPIO_WriteHigh
 919  035f 84            	pop	a
 922  0360 4b80          	push	#128
 923  0362 ae500a        	ldw	x,#20490
 924  0365 cd0000        	call	_GPIO_WriteHigh
 926  0368 84            	pop	a
 929  0369 4b08          	push	#8
 930  036b ae500f        	ldw	x,#20495
 931  036e cd0000        	call	_GPIO_WriteLow
 933  0371 84            	pop	a
 936  0372 4b02          	push	#2
 937  0374 ae500f        	ldw	x,#20495
 938  0377 cd0000        	call	_GPIO_WriteHigh
 940  037a 84            	pop	a
 943  037b 4b02          	push	#2
 944  037d ae5000        	ldw	x,#20480
 945  0380 cd0000        	call	_GPIO_WriteHigh
 947  0383 84            	pop	a
 950  0384 4b40          	push	#64
 951  0386 ae500a        	ldw	x,#20490
 952  0389 cd0000        	call	_GPIO_WriteHigh
 954  038c 84            	pop	a
 955                     ; 90         break;
 957  038d ace505e5      	jpf	L761
 958  0391               L121:
 959                     ; 91     case 'b':
 959                     ; 92         display_b();
 961  0391 4b20          	push	#32
 962  0393 ae500f        	ldw	x,#20495
 963  0396 cd0000        	call	_GPIO_WriteLow
 965  0399 84            	pop	a
 968  039a 4b04          	push	#4
 969  039c ae5000        	ldw	x,#20480
 970  039f cd0000        	call	_GPIO_WriteLow
 972  03a2 84            	pop	a
 975  03a3 4b80          	push	#128
 976  03a5 ae500a        	ldw	x,#20490
 977  03a8 cd0000        	call	_GPIO_WriteHigh
 979  03ab 84            	pop	a
 982  03ac 4b08          	push	#8
 983  03ae ae500f        	ldw	x,#20495
 984  03b1 cd0000        	call	_GPIO_WriteHigh
 986  03b4 84            	pop	a
 989  03b5 4b02          	push	#2
 990  03b7 ae500f        	ldw	x,#20495
 991  03ba cd0000        	call	_GPIO_WriteHigh
 993  03bd 84            	pop	a
 996  03be 4b02          	push	#2
 997  03c0 ae5000        	ldw	x,#20480
 998  03c3 cd0000        	call	_GPIO_WriteHigh
1000  03c6 84            	pop	a
1003  03c7 4b40          	push	#64
1004  03c9 ae500a        	ldw	x,#20490
1005  03cc cd0000        	call	_GPIO_WriteHigh
1007  03cf 84            	pop	a
1008                     ; 93         break;
1010  03d0 ace505e5      	jpf	L761
1011  03d4               L321:
1012                     ; 94     case 'C':
1012                     ; 95         display_c();
1014  03d4 4b20          	push	#32
1015  03d6 ae500f        	ldw	x,#20495
1016  03d9 cd0000        	call	_GPIO_WriteHigh
1018  03dc 84            	pop	a
1021  03dd 4b04          	push	#4
1022  03df ae5000        	ldw	x,#20480
1023  03e2 cd0000        	call	_GPIO_WriteLow
1025  03e5 84            	pop	a
1028  03e6 4b80          	push	#128
1029  03e8 ae500a        	ldw	x,#20490
1030  03eb cd0000        	call	_GPIO_WriteLow
1032  03ee 84            	pop	a
1035  03ef 4b08          	push	#8
1036  03f1 ae500f        	ldw	x,#20495
1037  03f4 cd0000        	call	_GPIO_WriteHigh
1039  03f7 84            	pop	a
1042  03f8 4b02          	push	#2
1043  03fa ae500f        	ldw	x,#20495
1044  03fd cd0000        	call	_GPIO_WriteHigh
1046  0400 84            	pop	a
1049  0401 4b02          	push	#2
1050  0403 ae5000        	ldw	x,#20480
1051  0406 cd0000        	call	_GPIO_WriteHigh
1053  0409 84            	pop	a
1056  040a 4b40          	push	#64
1057  040c ae500a        	ldw	x,#20490
1058  040f cd0000        	call	_GPIO_WriteLow
1060  0412 84            	pop	a
1061                     ; 96         break;
1063  0413 ace505e5      	jpf	L761
1064  0417               L521:
1065                     ; 97     case 'd':
1065                     ; 98         display_d();
1067  0417 4b20          	push	#32
1068  0419 ae500f        	ldw	x,#20495
1069  041c cd0000        	call	_GPIO_WriteLow
1071  041f 84            	pop	a
1074  0420 4b04          	push	#4
1075  0422 ae5000        	ldw	x,#20480
1076  0425 cd0000        	call	_GPIO_WriteHigh
1078  0428 84            	pop	a
1081  0429 4b80          	push	#128
1082  042b ae500a        	ldw	x,#20490
1083  042e cd0000        	call	_GPIO_WriteHigh
1085  0431 84            	pop	a
1088  0432 4b08          	push	#8
1089  0434 ae500f        	ldw	x,#20495
1090  0437 cd0000        	call	_GPIO_WriteHigh
1092  043a 84            	pop	a
1095  043b 4b02          	push	#2
1096  043d ae500f        	ldw	x,#20495
1097  0440 cd0000        	call	_GPIO_WriteHigh
1099  0443 84            	pop	a
1102  0444 4b02          	push	#2
1103  0446 ae5000        	ldw	x,#20480
1104  0449 cd0000        	call	_GPIO_WriteLow
1106  044c 84            	pop	a
1109  044d 4b40          	push	#64
1110  044f ae500a        	ldw	x,#20490
1111  0452 cd0000        	call	_GPIO_WriteHigh
1113  0455 84            	pop	a
1114                     ; 99         break;
1116  0456 ace505e5      	jpf	L761
1117  045a               L721:
1118                     ; 100     case 'E':
1118                     ; 101         display_e();
1120  045a 4b20          	push	#32
1121  045c ae500f        	ldw	x,#20495
1122  045f cd0000        	call	_GPIO_WriteHigh
1124  0462 84            	pop	a
1127  0463 4b04          	push	#4
1128  0465 ae5000        	ldw	x,#20480
1129  0468 cd0000        	call	_GPIO_WriteLow
1131  046b 84            	pop	a
1134  046c 4b80          	push	#128
1135  046e ae500a        	ldw	x,#20490
1136  0471 cd0000        	call	_GPIO_WriteLow
1138  0474 84            	pop	a
1141  0475 4b08          	push	#8
1142  0477 ae500f        	ldw	x,#20495
1143  047a cd0000        	call	_GPIO_WriteHigh
1145  047d 84            	pop	a
1148  047e 4b02          	push	#2
1149  0480 ae500f        	ldw	x,#20495
1150  0483 cd0000        	call	_GPIO_WriteHigh
1152  0486 84            	pop	a
1155  0487 4b02          	push	#2
1156  0489 ae5000        	ldw	x,#20480
1157  048c cd0000        	call	_GPIO_WriteHigh
1159  048f 84            	pop	a
1162  0490 4b40          	push	#64
1163  0492 ae500a        	ldw	x,#20490
1164  0495 cd0000        	call	_GPIO_WriteHigh
1166  0498 84            	pop	a
1167                     ; 102         break;
1169  0499 ace505e5      	jpf	L761
1170  049d               L131:
1171                     ; 103     case 'F':
1171                     ; 104         display_f();
1173  049d 4b20          	push	#32
1174  049f ae500f        	ldw	x,#20495
1175  04a2 cd0000        	call	_GPIO_WriteHigh
1177  04a5 84            	pop	a
1180  04a6 4b04          	push	#4
1181  04a8 ae5000        	ldw	x,#20480
1182  04ab cd0000        	call	_GPIO_WriteLow
1184  04ae 84            	pop	a
1187  04af 4b80          	push	#128
1188  04b1 ae500a        	ldw	x,#20490
1189  04b4 cd0000        	call	_GPIO_WriteLow
1191  04b7 84            	pop	a
1194  04b8 4b08          	push	#8
1195  04ba ae500f        	ldw	x,#20495
1196  04bd cd0000        	call	_GPIO_WriteLow
1198  04c0 84            	pop	a
1201  04c1 4b02          	push	#2
1202  04c3 ae500f        	ldw	x,#20495
1203  04c6 cd0000        	call	_GPIO_WriteHigh
1205  04c9 84            	pop	a
1208  04ca 4b02          	push	#2
1209  04cc ae5000        	ldw	x,#20480
1210  04cf cd0000        	call	_GPIO_WriteHigh
1212  04d2 84            	pop	a
1215  04d3 4b40          	push	#64
1216  04d5 ae500a        	ldw	x,#20490
1217  04d8 cd0000        	call	_GPIO_WriteHigh
1219  04db 84            	pop	a
1220                     ; 105         break;
1222  04dc ace505e5      	jpf	L761
1223  04e0               L331:
1224                     ; 106     case 'H':
1224                     ; 107         display_h();
1226  04e0 4b20          	push	#32
1227  04e2 ae500f        	ldw	x,#20495
1228  04e5 cd0000        	call	_GPIO_WriteLow
1230  04e8 84            	pop	a
1233  04e9 4b04          	push	#4
1234  04eb ae5000        	ldw	x,#20480
1235  04ee cd0000        	call	_GPIO_WriteHigh
1237  04f1 84            	pop	a
1240  04f2 4b80          	push	#128
1241  04f4 ae500a        	ldw	x,#20490
1242  04f7 cd0000        	call	_GPIO_WriteHigh
1244  04fa 84            	pop	a
1247  04fb 4b08          	push	#8
1248  04fd ae500f        	ldw	x,#20495
1249  0500 cd0000        	call	_GPIO_WriteLow
1251  0503 84            	pop	a
1254  0504 4b02          	push	#2
1255  0506 ae500f        	ldw	x,#20495
1256  0509 cd0000        	call	_GPIO_WriteHigh
1258  050c 84            	pop	a
1261  050d 4b02          	push	#2
1262  050f ae5000        	ldw	x,#20480
1263  0512 cd0000        	call	_GPIO_WriteHigh
1265  0515 84            	pop	a
1268  0516 4b40          	push	#64
1269  0518 ae500a        	ldw	x,#20490
1270  051b cd0000        	call	_GPIO_WriteHigh
1272  051e 84            	pop	a
1273                     ; 108         break;
1275  051f ace505e5      	jpf	L761
1276  0523               L531:
1277                     ; 109     case 'L':
1277                     ; 110         display_l();
1279  0523 4b20          	push	#32
1280  0525 ae500f        	ldw	x,#20495
1281  0528 cd0000        	call	_GPIO_WriteLow
1283  052b 84            	pop	a
1286  052c 4b04          	push	#4
1287  052e ae5000        	ldw	x,#20480
1288  0531 cd0000        	call	_GPIO_WriteLow
1290  0534 84            	pop	a
1293  0535 4b80          	push	#128
1294  0537 ae500a        	ldw	x,#20490
1295  053a cd0000        	call	_GPIO_WriteLow
1297  053d 84            	pop	a
1300  053e 4b08          	push	#8
1301  0540 ae500f        	ldw	x,#20495
1302  0543 cd0000        	call	_GPIO_WriteHigh
1304  0546 84            	pop	a
1307  0547 4b02          	push	#2
1308  0549 ae500f        	ldw	x,#20495
1309  054c cd0000        	call	_GPIO_WriteHigh
1311  054f 84            	pop	a
1314  0550 4b02          	push	#2
1315  0552 ae5000        	ldw	x,#20480
1316  0555 cd0000        	call	_GPIO_WriteHigh
1318  0558 84            	pop	a
1321  0559 4b40          	push	#64
1322  055b ae500a        	ldw	x,#20490
1323  055e cd0000        	call	_GPIO_WriteLow
1325  0561 84            	pop	a
1326                     ; 111         break;
1328  0562 cc05e5        	jra	L761
1329  0565               L731:
1330                     ; 112     case 'P':
1330                     ; 113         display_p();
1332  0565 4b20          	push	#32
1333  0567 ae500f        	ldw	x,#20495
1334  056a cd0000        	call	_GPIO_WriteHigh
1336  056d 84            	pop	a
1339  056e 4b04          	push	#4
1340  0570 ae5000        	ldw	x,#20480
1341  0573 cd0000        	call	_GPIO_WriteHigh
1343  0576 84            	pop	a
1346  0577 4b80          	push	#128
1347  0579 ae500a        	ldw	x,#20490
1348  057c cd0000        	call	_GPIO_WriteLow
1350  057f 84            	pop	a
1353  0580 4b08          	push	#8
1354  0582 ae500f        	ldw	x,#20495
1355  0585 cd0000        	call	_GPIO_WriteLow
1357  0588 84            	pop	a
1360  0589 4b02          	push	#2
1361  058b ae500f        	ldw	x,#20495
1362  058e cd0000        	call	_GPIO_WriteHigh
1364  0591 84            	pop	a
1367  0592 4b02          	push	#2
1368  0594 ae5000        	ldw	x,#20480
1369  0597 cd0000        	call	_GPIO_WriteHigh
1371  059a 84            	pop	a
1374  059b 4b40          	push	#64
1375  059d ae500a        	ldw	x,#20490
1376  05a0 cd0000        	call	_GPIO_WriteHigh
1378  05a3 84            	pop	a
1379                     ; 114         break;
1381  05a4 203f          	jra	L761
1382  05a6               L141:
1383                     ; 115     case 'U':
1383                     ; 116         display_u();
1385  05a6 4b20          	push	#32
1386  05a8 ae500f        	ldw	x,#20495
1387  05ab cd0000        	call	_GPIO_WriteLow
1389  05ae 84            	pop	a
1392  05af 4b04          	push	#4
1393  05b1 ae5000        	ldw	x,#20480
1394  05b4 cd0000        	call	_GPIO_WriteHigh
1396  05b7 84            	pop	a
1399  05b8 4b80          	push	#128
1400  05ba ae500a        	ldw	x,#20490
1401  05bd cd0000        	call	_GPIO_WriteHigh
1403  05c0 84            	pop	a
1406  05c1 4b08          	push	#8
1407  05c3 ae500f        	ldw	x,#20495
1408  05c6 cd0000        	call	_GPIO_WriteHigh
1410  05c9 84            	pop	a
1413  05ca 4b02          	push	#2
1414  05cc ae500f        	ldw	x,#20495
1415  05cf cd0000        	call	_GPIO_WriteHigh
1417  05d2 84            	pop	a
1420  05d3 4b02          	push	#2
1421  05d5 ae5000        	ldw	x,#20480
1422  05d8 cd0000        	call	_GPIO_WriteHigh
1424  05db 84            	pop	a
1427  05dc 4b40          	push	#64
1428  05de ae500a        	ldw	x,#20490
1429  05e1 cd0000        	call	_GPIO_WriteLow
1431  05e4 84            	pop	a
1432                     ; 117         break;
1434  05e5               L761:
1435                     ; 120 }
1438  05e5 84            	pop	a
1439  05e6 81            	ret
1463                     ; 122 void task_display(void)
1463                     ; 123 {
1464                     	switch	.text
1465  05e7               _task_display:
1469                     ; 125     if (!tick)
1471  05e7 3d00          	tnz	_tick
1472  05e9 2601          	jrne	L102
1473                     ; 126         return;
1476  05eb 81            	ret
1477  05ec               L102:
1478                     ; 129 }
1481  05ec 81            	ret
1484                     	bsct
1485  0007               L302_dig_pos:
1486  0007 00            	dc.b	0
1522                     ; 131 void tmr_display(void)
1522                     ; 132 {
1523                     	switch	.text
1524  05ed               _tmr_display:
1528                     ; 137     if (display_test)
1530  05ed 3d00          	tnz	_display_test
1531  05ef 2701          	jreq	L132
1532                     ; 138         return;
1535  05f1 81            	ret
1536  05f2               L132:
1537                     ; 141     if (dig_pos >= MAX_DIG_POS)
1539  05f2 b607          	ld	a,L302_dig_pos
1540  05f4 a103          	cp	a,#3
1541  05f6 2502          	jrult	L332
1542                     ; 142         dig_pos = DIG1_POS;
1544  05f8 3f07          	clr	L302_dig_pos
1545  05fa               L332:
1546                     ; 144     switch (dig_pos) {
1548  05fa b607          	ld	a,L302_dig_pos
1550                     ; 159         break;
1551  05fc 4d            	tnz	a
1552  05fd 2708          	jreq	L502
1553  05ff 4a            	dec	a
1554  0600 2722          	jreq	L702
1555  0602 4a            	dec	a
1556  0603 273c          	jreq	L112
1557  0605 2055          	jra	L732
1558  0607               L502:
1559                     ; 145     case DIG1_POS:
1559                     ; 146         dig1_on();
1561  0607 4b10          	push	#16
1562  0609 ae500f        	ldw	x,#20495
1563  060c cd0000        	call	_GPIO_WriteLow
1565  060f 84            	pop	a
1566                     ; 147         dig2_off();
1568  0610 4b20          	push	#32
1569  0612 ae5005        	ldw	x,#20485
1570  0615 cd0000        	call	_GPIO_WriteHigh
1572  0618 84            	pop	a
1573                     ; 148         dig3_off();
1575  0619 4b10          	push	#16
1576  061b ae5005        	ldw	x,#20485
1577  061e cd0000        	call	_GPIO_WriteHigh
1579  0621 84            	pop	a
1580                     ; 149         break;
1582  0622 2038          	jra	L732
1583  0624               L702:
1584                     ; 150     case DIG2_POS:
1584                     ; 151         dig1_off();
1586  0624 4b10          	push	#16
1587  0626 ae500f        	ldw	x,#20495
1588  0629 cd0000        	call	_GPIO_WriteHigh
1590  062c 84            	pop	a
1591                     ; 152         dig2_on();
1593  062d 4b20          	push	#32
1594  062f ae5005        	ldw	x,#20485
1595  0632 cd0000        	call	_GPIO_WriteLow
1597  0635 84            	pop	a
1598                     ; 153         dig3_off();
1600  0636 4b10          	push	#16
1601  0638 ae5005        	ldw	x,#20485
1602  063b cd0000        	call	_GPIO_WriteHigh
1604  063e 84            	pop	a
1605                     ; 154         break;
1607  063f 201b          	jra	L732
1608  0641               L112:
1609                     ; 155     case DIG3_POS:
1609                     ; 156         dig1_off();
1611  0641 4b10          	push	#16
1612  0643 ae500f        	ldw	x,#20495
1613  0646 cd0000        	call	_GPIO_WriteHigh
1615  0649 84            	pop	a
1616                     ; 157         dig2_off();
1618  064a 4b20          	push	#32
1619  064c ae5005        	ldw	x,#20485
1620  064f cd0000        	call	_GPIO_WriteHigh
1622  0652 84            	pop	a
1623                     ; 158         dig3_on();
1625  0653 4b10          	push	#16
1626  0655 ae5005        	ldw	x,#20485
1627  0658 cd0000        	call	_GPIO_WriteLow
1629  065b 84            	pop	a
1630                     ; 159         break;
1632  065c               L732:
1633                     ; 162     wr_digit(dig_pos);
1635  065c b607          	ld	a,L302_dig_pos
1636  065e cd003b        	call	_wr_digit
1638                     ; 163     dig_pos++;
1640  0661 3c07          	inc	L302_dig_pos
1641                     ; 165 }
1644  0663 81            	ret
1670                     ; 168 void test_display(void)
1670                     ; 169 {
1671                     	switch	.text
1672  0664               _test_display:
1676                     ; 170     delay(DELAY_DISPLAY_TEST);
1678  0664 ae00fa        	ldw	x,#250
1679  0667 89            	pushw	x
1680  0668 ae0000        	ldw	x,#0
1681  066b 89            	pushw	x
1682  066c cd0000        	call	_delay
1684  066f 5b04          	addw	sp,#4
1685                     ; 171     display_zero();
1687  0671 4b20          	push	#32
1688  0673 ae500f        	ldw	x,#20495
1689  0676 cd0000        	call	_GPIO_WriteHigh
1691  0679 84            	pop	a
1694  067a 4b04          	push	#4
1695  067c ae5000        	ldw	x,#20480
1696  067f cd0000        	call	_GPIO_WriteHigh
1698  0682 84            	pop	a
1701  0683 4b80          	push	#128
1702  0685 ae500a        	ldw	x,#20490
1703  0688 cd0000        	call	_GPIO_WriteHigh
1705  068b 84            	pop	a
1708  068c 4b08          	push	#8
1709  068e ae500f        	ldw	x,#20495
1710  0691 cd0000        	call	_GPIO_WriteHigh
1712  0694 84            	pop	a
1715  0695 4b02          	push	#2
1716  0697 ae500f        	ldw	x,#20495
1717  069a cd0000        	call	_GPIO_WriteHigh
1719  069d 84            	pop	a
1722  069e 4b02          	push	#2
1723  06a0 ae5000        	ldw	x,#20480
1724  06a3 cd0000        	call	_GPIO_WriteHigh
1726  06a6 84            	pop	a
1729  06a7 4b40          	push	#64
1730  06a9 ae500a        	ldw	x,#20490
1731  06ac cd0000        	call	_GPIO_WriteLow
1733  06af 84            	pop	a
1734                     ; 172     delay(DELAY_DISPLAY_TEST);
1736  06b0 ae00fa        	ldw	x,#250
1737  06b3 89            	pushw	x
1738  06b4 ae0000        	ldw	x,#0
1739  06b7 89            	pushw	x
1740  06b8 cd0000        	call	_delay
1742  06bb 5b04          	addw	sp,#4
1743                     ; 173     display_one();
1745  06bd 4b20          	push	#32
1746  06bf ae500f        	ldw	x,#20495
1747  06c2 cd0000        	call	_GPIO_WriteLow
1749  06c5 84            	pop	a
1752  06c6 4b04          	push	#4
1753  06c8 ae5000        	ldw	x,#20480
1754  06cb cd0000        	call	_GPIO_WriteHigh
1756  06ce 84            	pop	a
1759  06cf 4b80          	push	#128
1760  06d1 ae500a        	ldw	x,#20490
1761  06d4 cd0000        	call	_GPIO_WriteHigh
1763  06d7 84            	pop	a
1766  06d8 4b08          	push	#8
1767  06da ae500f        	ldw	x,#20495
1768  06dd cd0000        	call	_GPIO_WriteLow
1770  06e0 84            	pop	a
1773  06e1 4b02          	push	#2
1774  06e3 ae500f        	ldw	x,#20495
1775  06e6 cd0000        	call	_GPIO_WriteLow
1777  06e9 84            	pop	a
1780  06ea 4b02          	push	#2
1781  06ec ae5000        	ldw	x,#20480
1782  06ef cd0000        	call	_GPIO_WriteLow
1784  06f2 84            	pop	a
1787  06f3 4b40          	push	#64
1788  06f5 ae500a        	ldw	x,#20490
1789  06f8 cd0000        	call	_GPIO_WriteLow
1791  06fb 84            	pop	a
1792                     ; 174     delay(DELAY_DISPLAY_TEST);
1794  06fc ae00fa        	ldw	x,#250
1795  06ff 89            	pushw	x
1796  0700 ae0000        	ldw	x,#0
1797  0703 89            	pushw	x
1798  0704 cd0000        	call	_delay
1800  0707 5b04          	addw	sp,#4
1801                     ; 175     display_two();
1803  0709 4b20          	push	#32
1804  070b ae500f        	ldw	x,#20495
1805  070e cd0000        	call	_GPIO_WriteHigh
1807  0711 84            	pop	a
1810  0712 4b04          	push	#4
1811  0714 ae5000        	ldw	x,#20480
1812  0717 cd0000        	call	_GPIO_WriteHigh
1814  071a 84            	pop	a
1817  071b 4b80          	push	#128
1818  071d ae500a        	ldw	x,#20490
1819  0720 cd0000        	call	_GPIO_WriteLow
1821  0723 84            	pop	a
1824  0724 4b08          	push	#8
1825  0726 ae500f        	ldw	x,#20495
1826  0729 cd0000        	call	_GPIO_WriteHigh
1828  072c 84            	pop	a
1831  072d 4b02          	push	#2
1832  072f ae500f        	ldw	x,#20495
1833  0732 cd0000        	call	_GPIO_WriteHigh
1835  0735 84            	pop	a
1838  0736 4b02          	push	#2
1839  0738 ae5000        	ldw	x,#20480
1840  073b cd0000        	call	_GPIO_WriteLow
1842  073e 84            	pop	a
1845  073f 4b40          	push	#64
1846  0741 ae500a        	ldw	x,#20490
1847  0744 cd0000        	call	_GPIO_WriteHigh
1849  0747 84            	pop	a
1850                     ; 176     delay(DELAY_DISPLAY_TEST);
1852  0748 ae00fa        	ldw	x,#250
1853  074b 89            	pushw	x
1854  074c ae0000        	ldw	x,#0
1855  074f 89            	pushw	x
1856  0750 cd0000        	call	_delay
1858  0753 5b04          	addw	sp,#4
1859                     ; 177     display_three();
1861  0755 4b20          	push	#32
1862  0757 ae500f        	ldw	x,#20495
1863  075a cd0000        	call	_GPIO_WriteHigh
1865  075d 84            	pop	a
1868  075e 4b04          	push	#4
1869  0760 ae5000        	ldw	x,#20480
1870  0763 cd0000        	call	_GPIO_WriteHigh
1872  0766 84            	pop	a
1875  0767 4b80          	push	#128
1876  0769 ae500a        	ldw	x,#20490
1877  076c cd0000        	call	_GPIO_WriteHigh
1879  076f 84            	pop	a
1882  0770 4b08          	push	#8
1883  0772 ae500f        	ldw	x,#20495
1884  0775 cd0000        	call	_GPIO_WriteHigh
1886  0778 84            	pop	a
1889  0779 4b02          	push	#2
1890  077b ae500f        	ldw	x,#20495
1891  077e cd0000        	call	_GPIO_WriteLow
1893  0781 84            	pop	a
1896  0782 4b02          	push	#2
1897  0784 ae5000        	ldw	x,#20480
1898  0787 cd0000        	call	_GPIO_WriteLow
1900  078a 84            	pop	a
1903  078b 4b40          	push	#64
1904  078d ae500a        	ldw	x,#20490
1905  0790 cd0000        	call	_GPIO_WriteHigh
1907  0793 84            	pop	a
1908                     ; 178     delay(DELAY_DISPLAY_TEST);
1910  0794 ae00fa        	ldw	x,#250
1911  0797 89            	pushw	x
1912  0798 ae0000        	ldw	x,#0
1913  079b 89            	pushw	x
1914  079c cd0000        	call	_delay
1916  079f 5b04          	addw	sp,#4
1917                     ; 179     display_four();
1919  07a1 4b20          	push	#32
1920  07a3 ae500f        	ldw	x,#20495
1921  07a6 cd0000        	call	_GPIO_WriteLow
1923  07a9 84            	pop	a
1926  07aa 4b04          	push	#4
1927  07ac ae5000        	ldw	x,#20480
1928  07af cd0000        	call	_GPIO_WriteHigh
1930  07b2 84            	pop	a
1933  07b3 4b80          	push	#128
1934  07b5 ae500a        	ldw	x,#20490
1935  07b8 cd0000        	call	_GPIO_WriteHigh
1937  07bb 84            	pop	a
1940  07bc 4b08          	push	#8
1941  07be ae500f        	ldw	x,#20495
1942  07c1 cd0000        	call	_GPIO_WriteLow
1944  07c4 84            	pop	a
1947  07c5 4b02          	push	#2
1948  07c7 ae500f        	ldw	x,#20495
1949  07ca cd0000        	call	_GPIO_WriteLow
1951  07cd 84            	pop	a
1954  07ce 4b02          	push	#2
1955  07d0 ae5000        	ldw	x,#20480
1956  07d3 cd0000        	call	_GPIO_WriteHigh
1958  07d6 84            	pop	a
1961  07d7 4b40          	push	#64
1962  07d9 ae500a        	ldw	x,#20490
1963  07dc cd0000        	call	_GPIO_WriteHigh
1965  07df 84            	pop	a
1966                     ; 180     delay(DELAY_DISPLAY_TEST);
1968  07e0 ae00fa        	ldw	x,#250
1969  07e3 89            	pushw	x
1970  07e4 ae0000        	ldw	x,#0
1971  07e7 89            	pushw	x
1972  07e8 cd0000        	call	_delay
1974  07eb 5b04          	addw	sp,#4
1975                     ; 181     display_five();
1977  07ed 4b20          	push	#32
1978  07ef ae500f        	ldw	x,#20495
1979  07f2 cd0000        	call	_GPIO_WriteHigh
1981  07f5 84            	pop	a
1984  07f6 4b04          	push	#4
1985  07f8 ae5000        	ldw	x,#20480
1986  07fb cd0000        	call	_GPIO_WriteLow
1988  07fe 84            	pop	a
1991  07ff 4b80          	push	#128
1992  0801 ae500a        	ldw	x,#20490
1993  0804 cd0000        	call	_GPIO_WriteHigh
1995  0807 84            	pop	a
1998  0808 4b08          	push	#8
1999  080a ae500f        	ldw	x,#20495
2000  080d cd0000        	call	_GPIO_WriteHigh
2002  0810 84            	pop	a
2005  0811 4b02          	push	#2
2006  0813 ae500f        	ldw	x,#20495
2007  0816 cd0000        	call	_GPIO_WriteLow
2009  0819 84            	pop	a
2012  081a 4b02          	push	#2
2013  081c ae5000        	ldw	x,#20480
2014  081f cd0000        	call	_GPIO_WriteHigh
2016  0822 84            	pop	a
2019  0823 4b40          	push	#64
2020  0825 ae500a        	ldw	x,#20490
2021  0828 cd0000        	call	_GPIO_WriteHigh
2023  082b 84            	pop	a
2024                     ; 182     delay(DELAY_DISPLAY_TEST);
2026  082c ae00fa        	ldw	x,#250
2027  082f 89            	pushw	x
2028  0830 ae0000        	ldw	x,#0
2029  0833 89            	pushw	x
2030  0834 cd0000        	call	_delay
2032  0837 5b04          	addw	sp,#4
2033                     ; 183     display_six();
2035  0839 4b20          	push	#32
2036  083b ae500f        	ldw	x,#20495
2037  083e cd0000        	call	_GPIO_WriteHigh
2039  0841 84            	pop	a
2042  0842 4b04          	push	#4
2043  0844 ae5000        	ldw	x,#20480
2044  0847 cd0000        	call	_GPIO_WriteLow
2046  084a 84            	pop	a
2049  084b 4b80          	push	#128
2050  084d ae500a        	ldw	x,#20490
2051  0850 cd0000        	call	_GPIO_WriteHigh
2053  0853 84            	pop	a
2056  0854 4b08          	push	#8
2057  0856 ae500f        	ldw	x,#20495
2058  0859 cd0000        	call	_GPIO_WriteHigh
2060  085c 84            	pop	a
2063  085d 4b02          	push	#2
2064  085f ae500f        	ldw	x,#20495
2065  0862 cd0000        	call	_GPIO_WriteHigh
2067  0865 84            	pop	a
2070  0866 4b02          	push	#2
2071  0868 ae5000        	ldw	x,#20480
2072  086b cd0000        	call	_GPIO_WriteHigh
2074  086e 84            	pop	a
2077  086f 4b40          	push	#64
2078  0871 ae500a        	ldw	x,#20490
2079  0874 cd0000        	call	_GPIO_WriteHigh
2081  0877 84            	pop	a
2082                     ; 184     delay(DELAY_DISPLAY_TEST);
2084  0878 ae00fa        	ldw	x,#250
2085  087b 89            	pushw	x
2086  087c ae0000        	ldw	x,#0
2087  087f 89            	pushw	x
2088  0880 cd0000        	call	_delay
2090  0883 5b04          	addw	sp,#4
2091                     ; 185     display_seven();
2093  0885 4b20          	push	#32
2094  0887 ae500f        	ldw	x,#20495
2095  088a cd0000        	call	_GPIO_WriteHigh
2097  088d 84            	pop	a
2100  088e 4b04          	push	#4
2101  0890 ae5000        	ldw	x,#20480
2102  0893 cd0000        	call	_GPIO_WriteHigh
2104  0896 84            	pop	a
2107  0897 4b80          	push	#128
2108  0899 ae500a        	ldw	x,#20490
2109  089c cd0000        	call	_GPIO_WriteHigh
2111  089f 84            	pop	a
2114  08a0 4b08          	push	#8
2115  08a2 ae500f        	ldw	x,#20495
2116  08a5 cd0000        	call	_GPIO_WriteLow
2118  08a8 84            	pop	a
2121  08a9 4b02          	push	#2
2122  08ab ae500f        	ldw	x,#20495
2123  08ae cd0000        	call	_GPIO_WriteLow
2125  08b1 84            	pop	a
2128  08b2 4b02          	push	#2
2129  08b4 ae5000        	ldw	x,#20480
2130  08b7 cd0000        	call	_GPIO_WriteLow
2132  08ba 84            	pop	a
2135  08bb 4b40          	push	#64
2136  08bd ae500a        	ldw	x,#20490
2137  08c0 cd0000        	call	_GPIO_WriteLow
2139  08c3 84            	pop	a
2140                     ; 186     delay(DELAY_DISPLAY_TEST);
2142  08c4 ae00fa        	ldw	x,#250
2143  08c7 89            	pushw	x
2144  08c8 ae0000        	ldw	x,#0
2145  08cb 89            	pushw	x
2146  08cc cd0000        	call	_delay
2148  08cf 5b04          	addw	sp,#4
2149                     ; 187     display_eight();
2151  08d1 4b20          	push	#32
2152  08d3 ae500f        	ldw	x,#20495
2153  08d6 cd0000        	call	_GPIO_WriteHigh
2155  08d9 84            	pop	a
2158  08da 4b04          	push	#4
2159  08dc ae5000        	ldw	x,#20480
2160  08df cd0000        	call	_GPIO_WriteHigh
2162  08e2 84            	pop	a
2165  08e3 4b80          	push	#128
2166  08e5 ae500a        	ldw	x,#20490
2167  08e8 cd0000        	call	_GPIO_WriteHigh
2169  08eb 84            	pop	a
2172  08ec 4b08          	push	#8
2173  08ee ae500f        	ldw	x,#20495
2174  08f1 cd0000        	call	_GPIO_WriteHigh
2176  08f4 84            	pop	a
2179  08f5 4b02          	push	#2
2180  08f7 ae500f        	ldw	x,#20495
2181  08fa cd0000        	call	_GPIO_WriteHigh
2183  08fd 84            	pop	a
2186  08fe 4b02          	push	#2
2187  0900 ae5000        	ldw	x,#20480
2188  0903 cd0000        	call	_GPIO_WriteHigh
2190  0906 84            	pop	a
2193  0907 4b40          	push	#64
2194  0909 ae500a        	ldw	x,#20490
2195  090c cd0000        	call	_GPIO_WriteHigh
2197  090f 84            	pop	a
2198                     ; 188     delay(DELAY_DISPLAY_TEST);
2200  0910 ae00fa        	ldw	x,#250
2201  0913 89            	pushw	x
2202  0914 ae0000        	ldw	x,#0
2203  0917 89            	pushw	x
2204  0918 cd0000        	call	_delay
2206  091b 5b04          	addw	sp,#4
2207                     ; 189     display_nine();    
2209  091d 4b20          	push	#32
2210  091f ae500f        	ldw	x,#20495
2211  0922 cd0000        	call	_GPIO_WriteHigh
2213  0925 84            	pop	a
2216  0926 4b04          	push	#4
2217  0928 ae5000        	ldw	x,#20480
2218  092b cd0000        	call	_GPIO_WriteHigh
2220  092e 84            	pop	a
2223  092f 4b80          	push	#128
2224  0931 ae500a        	ldw	x,#20490
2225  0934 cd0000        	call	_GPIO_WriteHigh
2227  0937 84            	pop	a
2230  0938 4b08          	push	#8
2231  093a ae500f        	ldw	x,#20495
2232  093d cd0000        	call	_GPIO_WriteHigh
2234  0940 84            	pop	a
2237  0941 4b02          	push	#2
2238  0943 ae500f        	ldw	x,#20495
2239  0946 cd0000        	call	_GPIO_WriteLow
2241  0949 84            	pop	a
2244  094a 4b02          	push	#2
2245  094c ae5000        	ldw	x,#20480
2246  094f cd0000        	call	_GPIO_WriteHigh
2248  0952 84            	pop	a
2251  0953 4b40          	push	#64
2252  0955 ae500a        	ldw	x,#20490
2253  0958 cd0000        	call	_GPIO_WriteHigh
2255  095b 84            	pop	a
2256                     ; 190     delay(DELAY_DISPLAY_TEST);
2258  095c ae00fa        	ldw	x,#250
2259  095f 89            	pushw	x
2260  0960 ae0000        	ldw	x,#0
2261  0963 89            	pushw	x
2262  0964 cd0000        	call	_delay
2264  0967 5b04          	addw	sp,#4
2265                     ; 191     display_off();
2267  0969 4b20          	push	#32
2268  096b ae500f        	ldw	x,#20495
2269  096e cd0000        	call	_GPIO_WriteLow
2271  0971 84            	pop	a
2274  0972 4b04          	push	#4
2275  0974 ae5000        	ldw	x,#20480
2276  0977 cd0000        	call	_GPIO_WriteLow
2278  097a 84            	pop	a
2281  097b 4b80          	push	#128
2282  097d ae500a        	ldw	x,#20490
2283  0980 cd0000        	call	_GPIO_WriteLow
2285  0983 84            	pop	a
2288  0984 4b08          	push	#8
2289  0986 ae500f        	ldw	x,#20495
2290  0989 cd0000        	call	_GPIO_WriteLow
2292  098c 84            	pop	a
2295  098d 4b02          	push	#2
2296  098f ae500f        	ldw	x,#20495
2297  0992 cd0000        	call	_GPIO_WriteLow
2299  0995 84            	pop	a
2302  0996 4b02          	push	#2
2303  0998 ae5000        	ldw	x,#20480
2304  099b cd0000        	call	_GPIO_WriteLow
2306  099e 84            	pop	a
2309  099f 4b40          	push	#64
2310  09a1 ae500a        	ldw	x,#20490
2311  09a4 cd0000        	call	_GPIO_WriteLow
2313  09a7 84            	pop	a
2316  09a8 4b04          	push	#4
2317  09aa ae500f        	ldw	x,#20495
2318  09ad cd0000        	call	_GPIO_WriteLow
2320  09b0 84            	pop	a
2321                     ; 192     dp_on();
2324  09b1 4b04          	push	#4
2325  09b3 ae500f        	ldw	x,#20495
2326  09b6 cd0000        	call	_GPIO_WriteHigh
2328  09b9 84            	pop	a
2329                     ; 193     delay(DELAY_DISPLAY_TEST);
2331  09ba ae00fa        	ldw	x,#250
2332  09bd 89            	pushw	x
2333  09be ae0000        	ldw	x,#0
2334  09c1 89            	pushw	x
2335  09c2 cd0000        	call	_delay
2337  09c5 5b04          	addw	sp,#4
2338                     ; 194     dp_off();
2340  09c7 4b04          	push	#4
2341  09c9 ae500f        	ldw	x,#20495
2342  09cc cd0000        	call	_GPIO_WriteLow
2344  09cf 84            	pop	a
2345                     ; 195 }
2348  09d0 81            	ret
2376                     ; 198 void init_display(void)
2376                     ; 199 {
2377                     	switch	.text
2378  09d1               _init_display:
2382                     ; 201     seg_a_dir();
2384  09d1 4be0          	push	#224
2385  09d3 4b20          	push	#32
2386  09d5 ae500f        	ldw	x,#20495
2387  09d8 cd0000        	call	_GPIO_Init
2389  09db 85            	popw	x
2390                     ; 202     seg_b_dir();
2393  09dc 4be0          	push	#224
2394  09de 4b04          	push	#4
2395  09e0 ae5000        	ldw	x,#20480
2396  09e3 cd0000        	call	_GPIO_Init
2398  09e6 85            	popw	x
2399                     ; 203     seg_c_dir();
2402  09e7 4be0          	push	#224
2403  09e9 4b80          	push	#128
2404  09eb ae500a        	ldw	x,#20490
2405  09ee cd0000        	call	_GPIO_Init
2407  09f1 85            	popw	x
2408                     ; 204     seg_d_dir();
2411  09f2 4be0          	push	#224
2412  09f4 4b08          	push	#8
2413  09f6 ae500f        	ldw	x,#20495
2414  09f9 cd0000        	call	_GPIO_Init
2416  09fc 85            	popw	x
2417                     ; 205     seg_e_dir();
2420  09fd 4be0          	push	#224
2421  09ff 4b02          	push	#2
2422  0a01 ae500f        	ldw	x,#20495
2423  0a04 cd0000        	call	_GPIO_Init
2425  0a07 85            	popw	x
2426                     ; 206     seg_f_dir();
2429  0a08 4be0          	push	#224
2430  0a0a 4b02          	push	#2
2431  0a0c ae5000        	ldw	x,#20480
2432  0a0f cd0000        	call	_GPIO_Init
2434  0a12 85            	popw	x
2435                     ; 207     seg_g_dir();
2438  0a13 4be0          	push	#224
2439  0a15 4b40          	push	#64
2440  0a17 ae500a        	ldw	x,#20490
2441  0a1a cd0000        	call	_GPIO_Init
2443  0a1d 85            	popw	x
2444                     ; 208     dp_dir();
2447  0a1e 4be0          	push	#224
2448  0a20 4b04          	push	#4
2449  0a22 ae500f        	ldw	x,#20495
2450  0a25 cd0000        	call	_GPIO_Init
2452  0a28 85            	popw	x
2453                     ; 209     dig1_dir();
2456  0a29 4be0          	push	#224
2457  0a2b 4b10          	push	#16
2458  0a2d ae500f        	ldw	x,#20495
2459  0a30 cd0000        	call	_GPIO_Init
2461  0a33 85            	popw	x
2462                     ; 210     dig2_dir();
2465  0a34 4be0          	push	#224
2466  0a36 4b20          	push	#32
2467  0a38 ae5005        	ldw	x,#20485
2468  0a3b cd0000        	call	_GPIO_Init
2470  0a3e 85            	popw	x
2471                     ; 211     dig3_dir();
2474  0a3f 4be0          	push	#224
2475  0a41 4b10          	push	#16
2476  0a43 ae5005        	ldw	x,#20485
2477  0a46 cd0000        	call	_GPIO_Init
2479  0a49 85            	popw	x
2480                     ; 214     dig1_on();
2483  0a4a 4b10          	push	#16
2484  0a4c ae500f        	ldw	x,#20495
2485  0a4f cd0000        	call	_GPIO_WriteLow
2487  0a52 84            	pop	a
2488                     ; 215     dig2_on();
2490  0a53 4b20          	push	#32
2491  0a55 ae5005        	ldw	x,#20485
2492  0a58 cd0000        	call	_GPIO_WriteLow
2494  0a5b 84            	pop	a
2495                     ; 216     dig3_on();
2497  0a5c 4b10          	push	#16
2498  0a5e ae5005        	ldw	x,#20485
2499  0a61 cd0000        	call	_GPIO_WriteLow
2501  0a64 84            	pop	a
2502                     ; 218     display_all();
2504  0a65 4b20          	push	#32
2505  0a67 ae500f        	ldw	x,#20495
2506  0a6a cd0000        	call	_GPIO_WriteHigh
2508  0a6d 84            	pop	a
2511  0a6e 4b04          	push	#4
2512  0a70 ae5000        	ldw	x,#20480
2513  0a73 cd0000        	call	_GPIO_WriteHigh
2515  0a76 84            	pop	a
2518  0a77 4b80          	push	#128
2519  0a79 ae500a        	ldw	x,#20490
2520  0a7c cd0000        	call	_GPIO_WriteHigh
2522  0a7f 84            	pop	a
2525  0a80 4b08          	push	#8
2526  0a82 ae500f        	ldw	x,#20495
2527  0a85 cd0000        	call	_GPIO_WriteHigh
2529  0a88 84            	pop	a
2532  0a89 4b02          	push	#2
2533  0a8b ae500f        	ldw	x,#20495
2534  0a8e cd0000        	call	_GPIO_WriteHigh
2536  0a91 84            	pop	a
2539  0a92 4b02          	push	#2
2540  0a94 ae5000        	ldw	x,#20480
2541  0a97 cd0000        	call	_GPIO_WriteHigh
2543  0a9a 84            	pop	a
2546  0a9b 4b40          	push	#64
2547  0a9d ae500a        	ldw	x,#20490
2548  0aa0 cd0000        	call	_GPIO_WriteHigh
2550  0aa3 84            	pop	a
2553  0aa4 4b04          	push	#4
2554  0aa6 ae500f        	ldw	x,#20495
2555  0aa9 cd0000        	call	_GPIO_WriteHigh
2557  0aac 84            	pop	a
2558                     ; 219     delay(2*DELAY_DISPLAY_TEST);
2561  0aad ae01f4        	ldw	x,#500
2562  0ab0 89            	pushw	x
2563  0ab1 ae0000        	ldw	x,#0
2564  0ab4 89            	pushw	x
2565  0ab5 cd0000        	call	_delay
2567  0ab8 5b04          	addw	sp,#4
2568                     ; 220     display_off();
2570  0aba 4b20          	push	#32
2571  0abc ae500f        	ldw	x,#20495
2572  0abf cd0000        	call	_GPIO_WriteLow
2574  0ac2 84            	pop	a
2577  0ac3 4b04          	push	#4
2578  0ac5 ae5000        	ldw	x,#20480
2579  0ac8 cd0000        	call	_GPIO_WriteLow
2581  0acb 84            	pop	a
2584  0acc 4b80          	push	#128
2585  0ace ae500a        	ldw	x,#20490
2586  0ad1 cd0000        	call	_GPIO_WriteLow
2588  0ad4 84            	pop	a
2591  0ad5 4b08          	push	#8
2592  0ad7 ae500f        	ldw	x,#20495
2593  0ada cd0000        	call	_GPIO_WriteLow
2595  0add 84            	pop	a
2598  0ade 4b02          	push	#2
2599  0ae0 ae500f        	ldw	x,#20495
2600  0ae3 cd0000        	call	_GPIO_WriteLow
2602  0ae6 84            	pop	a
2605  0ae7 4b02          	push	#2
2606  0ae9 ae5000        	ldw	x,#20480
2607  0aec cd0000        	call	_GPIO_WriteLow
2609  0aef 84            	pop	a
2612  0af0 4b40          	push	#64
2613  0af2 ae500a        	ldw	x,#20490
2614  0af5 cd0000        	call	_GPIO_WriteLow
2616  0af8 84            	pop	a
2619  0af9 4b04          	push	#4
2620  0afb ae500f        	ldw	x,#20495
2621  0afe cd0000        	call	_GPIO_WriteLow
2623  0b01 84            	pop	a
2624                     ; 221     delay(DELAY_DISPLAY_TEST);
2627  0b02 ae00fa        	ldw	x,#250
2628  0b05 89            	pushw	x
2629  0b06 ae0000        	ldw	x,#0
2630  0b09 89            	pushw	x
2631  0b0a cd0000        	call	_delay
2633  0b0d 5b04          	addw	sp,#4
2634                     ; 222     display_all();
2636  0b0f 4b20          	push	#32
2637  0b11 ae500f        	ldw	x,#20495
2638  0b14 cd0000        	call	_GPIO_WriteHigh
2640  0b17 84            	pop	a
2643  0b18 4b04          	push	#4
2644  0b1a ae5000        	ldw	x,#20480
2645  0b1d cd0000        	call	_GPIO_WriteHigh
2647  0b20 84            	pop	a
2650  0b21 4b80          	push	#128
2651  0b23 ae500a        	ldw	x,#20490
2652  0b26 cd0000        	call	_GPIO_WriteHigh
2654  0b29 84            	pop	a
2657  0b2a 4b08          	push	#8
2658  0b2c ae500f        	ldw	x,#20495
2659  0b2f cd0000        	call	_GPIO_WriteHigh
2661  0b32 84            	pop	a
2664  0b33 4b02          	push	#2
2665  0b35 ae500f        	ldw	x,#20495
2666  0b38 cd0000        	call	_GPIO_WriteHigh
2668  0b3b 84            	pop	a
2671  0b3c 4b02          	push	#2
2672  0b3e ae5000        	ldw	x,#20480
2673  0b41 cd0000        	call	_GPIO_WriteHigh
2675  0b44 84            	pop	a
2678  0b45 4b40          	push	#64
2679  0b47 ae500a        	ldw	x,#20490
2680  0b4a cd0000        	call	_GPIO_WriteHigh
2682  0b4d 84            	pop	a
2685  0b4e 4b04          	push	#4
2686  0b50 ae500f        	ldw	x,#20495
2687  0b53 cd0000        	call	_GPIO_WriteHigh
2689  0b56 84            	pop	a
2690                     ; 223     delay(2*DELAY_DISPLAY_TEST);
2693  0b57 ae01f4        	ldw	x,#500
2694  0b5a 89            	pushw	x
2695  0b5b ae0000        	ldw	x,#0
2696  0b5e 89            	pushw	x
2697  0b5f cd0000        	call	_delay
2699  0b62 5b04          	addw	sp,#4
2700                     ; 224     display_off();
2702  0b64 4b20          	push	#32
2703  0b66 ae500f        	ldw	x,#20495
2704  0b69 cd0000        	call	_GPIO_WriteLow
2706  0b6c 84            	pop	a
2709  0b6d 4b04          	push	#4
2710  0b6f ae5000        	ldw	x,#20480
2711  0b72 cd0000        	call	_GPIO_WriteLow
2713  0b75 84            	pop	a
2716  0b76 4b80          	push	#128
2717  0b78 ae500a        	ldw	x,#20490
2718  0b7b cd0000        	call	_GPIO_WriteLow
2720  0b7e 84            	pop	a
2723  0b7f 4b08          	push	#8
2724  0b81 ae500f        	ldw	x,#20495
2725  0b84 cd0000        	call	_GPIO_WriteLow
2727  0b87 84            	pop	a
2730  0b88 4b02          	push	#2
2731  0b8a ae500f        	ldw	x,#20495
2732  0b8d cd0000        	call	_GPIO_WriteLow
2734  0b90 84            	pop	a
2737  0b91 4b02          	push	#2
2738  0b93 ae5000        	ldw	x,#20480
2739  0b96 cd0000        	call	_GPIO_WriteLow
2741  0b99 84            	pop	a
2744  0b9a 4b40          	push	#64
2745  0b9c ae500a        	ldw	x,#20490
2746  0b9f cd0000        	call	_GPIO_WriteLow
2748  0ba2 84            	pop	a
2751  0ba3 4b04          	push	#4
2752  0ba5 ae500f        	ldw	x,#20495
2753  0ba8 cd0000        	call	_GPIO_WriteLow
2755  0bab 84            	pop	a
2756                     ; 225     delay(DELAY_DISPLAY_TEST);
2759  0bac ae00fa        	ldw	x,#250
2760  0baf 89            	pushw	x
2761  0bb0 ae0000        	ldw	x,#0
2762  0bb3 89            	pushw	x
2763  0bb4 cd0000        	call	_delay
2765  0bb7 5b04          	addw	sp,#4
2766                     ; 226     display_all();
2768  0bb9 4b20          	push	#32
2769  0bbb ae500f        	ldw	x,#20495
2770  0bbe cd0000        	call	_GPIO_WriteHigh
2772  0bc1 84            	pop	a
2775  0bc2 4b04          	push	#4
2776  0bc4 ae5000        	ldw	x,#20480
2777  0bc7 cd0000        	call	_GPIO_WriteHigh
2779  0bca 84            	pop	a
2782  0bcb 4b80          	push	#128
2783  0bcd ae500a        	ldw	x,#20490
2784  0bd0 cd0000        	call	_GPIO_WriteHigh
2786  0bd3 84            	pop	a
2789  0bd4 4b08          	push	#8
2790  0bd6 ae500f        	ldw	x,#20495
2791  0bd9 cd0000        	call	_GPIO_WriteHigh
2793  0bdc 84            	pop	a
2796  0bdd 4b02          	push	#2
2797  0bdf ae500f        	ldw	x,#20495
2798  0be2 cd0000        	call	_GPIO_WriteHigh
2800  0be5 84            	pop	a
2803  0be6 4b02          	push	#2
2804  0be8 ae5000        	ldw	x,#20480
2805  0beb cd0000        	call	_GPIO_WriteHigh
2807  0bee 84            	pop	a
2810  0bef 4b40          	push	#64
2811  0bf1 ae500a        	ldw	x,#20490
2812  0bf4 cd0000        	call	_GPIO_WriteHigh
2814  0bf7 84            	pop	a
2817  0bf8 4b04          	push	#4
2818  0bfa ae500f        	ldw	x,#20495
2819  0bfd cd0000        	call	_GPIO_WriteHigh
2821  0c00 84            	pop	a
2822                     ; 227     delay(2*DELAY_DISPLAY_TEST);
2825  0c01 ae01f4        	ldw	x,#500
2826  0c04 89            	pushw	x
2827  0c05 ae0000        	ldw	x,#0
2828  0c08 89            	pushw	x
2829  0c09 cd0000        	call	_delay
2831  0c0c 5b04          	addw	sp,#4
2832                     ; 228     display_off();
2834  0c0e 4b20          	push	#32
2835  0c10 ae500f        	ldw	x,#20495
2836  0c13 cd0000        	call	_GPIO_WriteLow
2838  0c16 84            	pop	a
2841  0c17 4b04          	push	#4
2842  0c19 ae5000        	ldw	x,#20480
2843  0c1c cd0000        	call	_GPIO_WriteLow
2845  0c1f 84            	pop	a
2848  0c20 4b80          	push	#128
2849  0c22 ae500a        	ldw	x,#20490
2850  0c25 cd0000        	call	_GPIO_WriteLow
2852  0c28 84            	pop	a
2855  0c29 4b08          	push	#8
2856  0c2b ae500f        	ldw	x,#20495
2857  0c2e cd0000        	call	_GPIO_WriteLow
2859  0c31 84            	pop	a
2862  0c32 4b02          	push	#2
2863  0c34 ae500f        	ldw	x,#20495
2864  0c37 cd0000        	call	_GPIO_WriteLow
2866  0c3a 84            	pop	a
2869  0c3b 4b02          	push	#2
2870  0c3d ae5000        	ldw	x,#20480
2871  0c40 cd0000        	call	_GPIO_WriteLow
2873  0c43 84            	pop	a
2876  0c44 4b40          	push	#64
2877  0c46 ae500a        	ldw	x,#20490
2878  0c49 cd0000        	call	_GPIO_WriteLow
2880  0c4c 84            	pop	a
2883  0c4d 4b04          	push	#4
2884  0c4f ae500f        	ldw	x,#20495
2885  0c52 cd0000        	call	_GPIO_WriteLow
2887  0c55 84            	pop	a
2888                     ; 230     display_test = 0;
2891  0c56 3f00          	clr	_display_test
2892                     ; 233     dig1_off();
2894  0c58 4b10          	push	#16
2895  0c5a ae500f        	ldw	x,#20495
2896  0c5d cd0000        	call	_GPIO_WriteHigh
2898  0c60 84            	pop	a
2899                     ; 234     dig2_off();
2901  0c61 4b20          	push	#32
2902  0c63 ae5005        	ldw	x,#20485
2903  0c66 cd0000        	call	_GPIO_WriteHigh
2905  0c69 84            	pop	a
2906                     ; 235     dig3_off();
2908  0c6a 4b10          	push	#16
2909  0c6c ae5005        	ldw	x,#20485
2910  0c6f cd0000        	call	_GPIO_WriteHigh
2912  0c72 84            	pop	a
2913                     ; 238 }
2916  0c73 81            	ret
2960                     	xdef	_test_display
2961                     	xdef	_wr_digit
2962                     	xdef	_dec2bcd
2963                     	xdef	_dp
2964                     	xdef	_display_num
2965                     	xdef	_display_test
2966                     	xref.b	_tick
2967                     	xref	_delay
2968                     	xdef	_set_display_option
2969                     	xdef	_set_display_value
2970                     	xdef	_tmr_display
2971                     	xdef	_task_display
2972                     	xdef	_init_display
2973                     	xref	_GPIO_WriteLow
2974                     	xref	_GPIO_WriteHigh
2975                     	xref	_GPIO_Init
2994                     	end
