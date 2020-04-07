   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  15                     	bsct
  16  0000               _display_test:
  17  0000 01            	dc.b	1
  18  0001               _display_num:
  19  0001 41            	dc.b	65
  20  0002 00            	dc.b	0
  21  0003 00            	dc.b	0
  61                     ; 21 uint8_t dec2bcd(uint8_t val)
  61                     ; 22 {
  63                     	switch	.text
  64  0000               _dec2bcd:
  66  0000 88            	push	a
  67  0001 88            	push	a
  68       00000001      OFST:	set	1
  71                     ; 23     return (uint8_t)((val/10*16) + (val%10));
  73  0002 5f            	clrw	x
  74  0003 97            	ld	xl,a
  75  0004 a60a          	ld	a,#10
  76  0006 62            	div	x,a
  77  0007 5f            	clrw	x
  78  0008 97            	ld	xl,a
  79  0009 9f            	ld	a,xl
  80  000a 6b01          	ld	(OFST+0,sp),a
  82  000c 7b02          	ld	a,(OFST+1,sp)
  83  000e 5f            	clrw	x
  84  000f 97            	ld	xl,a
  85  0010 a60a          	ld	a,#10
  86  0012 62            	div	x,a
  87  0013 9f            	ld	a,xl
  88  0014 97            	ld	xl,a
  89  0015 a610          	ld	a,#16
  90  0017 42            	mul	x,a
  91  0018 9f            	ld	a,xl
  92  0019 1b01          	add	a,(OFST+0,sp)
  95  001b 85            	popw	x
  96  001c 81            	ret
 150                     ; 26 void set_display(uint8_t option, uint8_t value, uint8_t decimal)
 150                     ; 27 {
 151                     	switch	.text
 152  001d               _set_display:
 154  001d 89            	pushw	x
 155  001e 88            	push	a
 156       00000001      OFST:	set	1
 159                     ; 31     bcd = (uint8_t)dec2bcd(value);
 161  001f 9f            	ld	a,xl
 162  0020 adde          	call	_dec2bcd
 164  0022 6b01          	ld	(OFST+0,sp),a
 166                     ; 35     if (value > MAX_DISPLAY_VALUE)
 168  0024 7b03          	ld	a,(OFST+2,sp)
 169  0026 a164          	cp	a,#100
 170  0028 2504          	jrult	L55
 171                     ; 36         value = MAX_DISPLAY_VALUE;
 173  002a a663          	ld	a,#99
 174  002c 6b03          	ld	(OFST+2,sp),a
 175  002e               L55:
 176                     ; 38     display_num[DIG1_POS] = option;
 178  002e 7b02          	ld	a,(OFST+1,sp)
 179  0030 b701          	ld	_display_num,a
 180                     ; 39     display_num[DIG2_POS] = (uint8_t)(bcd >> 4);
 182  0032 7b01          	ld	a,(OFST+0,sp)
 183  0034 4e            	swap	a
 184  0035 a40f          	and	a,#15
 185  0037 b702          	ld	_display_num+1,a
 186                     ; 40     display_num[DIG3_POS] = (uint8_t)(bcd & 0x0F);
 188  0039 7b01          	ld	a,(OFST+0,sp)
 189  003b a40f          	and	a,#15
 190  003d b703          	ld	_display_num+2,a
 191                     ; 42 }
 194  003f 5b03          	addw	sp,#3
 195  0041 81            	ret
 240                     ; 44 void set_option_display(uint8_t option, uint8_t en_dp)
 240                     ; 45 {
 241                     	switch	.text
 242  0042               _set_option_display:
 246                     ; 47     display_num[DIG1_POS] = option;
 248  0042 9e            	ld	a,xh
 249  0043 b701          	ld	_display_num,a
 250                     ; 48     dp[DIG1_POS] = en_dp;
 252  0045 9f            	ld	a,xl
 253  0046 b700          	ld	_dp,a
 254                     ; 50 }
 257  0048 81            	ret
 295                     .const:	section	.text
 296  0000               L61:
 297  0000 00be          	dc.w	L101
 298  0002 0101          	dc.w	L301
 299  0004 0144          	dc.w	L501
 300  0006 0187          	dc.w	L701
 301  0008 01ca          	dc.w	L111
 302  000a 020d          	dc.w	L311
 303  000c 0250          	dc.w	L511
 304  000e 0293          	dc.w	L711
 305  0010 02d6          	dc.w	L121
 306  0012 0319          	dc.w	L321
 307                     ; 53 void wr_digit(uint8_t dig_pos)
 307                     ; 54 {
 308                     	switch	.text
 309  0049               _wr_digit:
 311  0049 88            	push	a
 312       00000000      OFST:	set	0
 315                     ; 57     if (dp[dig_pos]) {
 317  004a 5f            	clrw	x
 318  004b 97            	ld	xl,a
 319  004c 6d00          	tnz	(_dp,x)
 320  004e 270b          	jreq	L761
 321                     ; 58         dp_on();
 323  0050 4b04          	push	#4
 324  0052 ae500f        	ldw	x,#20495
 325  0055 cd0000        	call	_GPIO_WriteHigh
 327  0058 84            	pop	a
 329  0059 2009          	jra	L171
 330  005b               L761:
 331                     ; 60         dp_off();
 333  005b 4b04          	push	#4
 334  005d ae500f        	ldw	x,#20495
 335  0060 cd0000        	call	_GPIO_WriteLow
 337  0063 84            	pop	a
 338  0064               L171:
 339                     ; 63     switch (display_num[dig_pos]) {
 341  0064 7b01          	ld	a,(OFST+1,sp)
 342  0066 5f            	clrw	x
 343  0067 97            	ld	xl,a
 344  0068 e601          	ld	a,(_display_num,x)
 346                     ; 123         break;
 347  006a a10a          	cp	a,#10
 348  006c 2407          	jruge	L41
 349  006e 5f            	clrw	x
 350  006f 97            	ld	xl,a
 351  0070 58            	sllw	x
 352  0071 de0000        	ldw	x,(L61,x)
 353  0074 fc            	jp	(x)
 354  0075               L41:
 355  0075 a041          	sub	a,#65
 356  0077 2603          	jrne	L02
 357  0079 cc035c        	jp	L521
 358  007c               L02:
 359  007c a002          	sub	a,#2
 360  007e 2603          	jrne	L22
 361  0080 cc03e2        	jp	L131
 362  0083               L22:
 363  0083 a002          	sub	a,#2
 364  0085 2603          	jrne	L42
 365  0087 cc0468        	jp	L531
 366  008a               L42:
 367  008a 4a            	dec	a
 368  008b 2603          	jrne	L62
 369  008d cc04ab        	jp	L731
 370  0090               L62:
 371  0090 a002          	sub	a,#2
 372  0092 2603          	jrne	L03
 373  0094 cc04ee        	jp	L141
 374  0097               L03:
 375  0097 a004          	sub	a,#4
 376  0099 2603          	jrne	L23
 377  009b cc0531        	jp	L341
 378  009e               L23:
 379  009e a004          	sub	a,#4
 380  00a0 2603          	jrne	L43
 381  00a2 cc0573        	jp	L541
 382  00a5               L43:
 383  00a5 a005          	sub	a,#5
 384  00a7 2603          	jrne	L63
 385  00a9 cc05b4        	jp	L741
 386  00ac               L63:
 387  00ac a00d          	sub	a,#13
 388  00ae 2603          	jrne	L04
 389  00b0 cc039f        	jp	L721
 390  00b3               L04:
 391  00b3 a002          	sub	a,#2
 392  00b5 2603          	jrne	L24
 393  00b7 cc0425        	jp	L331
 394  00ba               L24:
 395  00ba acf305f3      	jpf	L571
 396  00be               L101:
 397                     ; 64     case 0x00:
 397                     ; 65         display_zero();
 399  00be 4b20          	push	#32
 400  00c0 ae500f        	ldw	x,#20495
 401  00c3 cd0000        	call	_GPIO_WriteHigh
 403  00c6 84            	pop	a
 406  00c7 4b04          	push	#4
 407  00c9 ae5000        	ldw	x,#20480
 408  00cc cd0000        	call	_GPIO_WriteHigh
 410  00cf 84            	pop	a
 413  00d0 4b80          	push	#128
 414  00d2 ae500a        	ldw	x,#20490
 415  00d5 cd0000        	call	_GPIO_WriteHigh
 417  00d8 84            	pop	a
 420  00d9 4b08          	push	#8
 421  00db ae500f        	ldw	x,#20495
 422  00de cd0000        	call	_GPIO_WriteHigh
 424  00e1 84            	pop	a
 427  00e2 4b02          	push	#2
 428  00e4 ae500f        	ldw	x,#20495
 429  00e7 cd0000        	call	_GPIO_WriteHigh
 431  00ea 84            	pop	a
 434  00eb 4b02          	push	#2
 435  00ed ae5000        	ldw	x,#20480
 436  00f0 cd0000        	call	_GPIO_WriteHigh
 438  00f3 84            	pop	a
 441  00f4 4b40          	push	#64
 442  00f6 ae500a        	ldw	x,#20490
 443  00f9 cd0000        	call	_GPIO_WriteLow
 445  00fc 84            	pop	a
 446                     ; 66         break;
 448  00fd acf305f3      	jpf	L571
 449  0101               L301:
 450                     ; 67     case 0x01:
 450                     ; 68         display_one();
 452  0101 4b20          	push	#32
 453  0103 ae500f        	ldw	x,#20495
 454  0106 cd0000        	call	_GPIO_WriteLow
 456  0109 84            	pop	a
 459  010a 4b04          	push	#4
 460  010c ae5000        	ldw	x,#20480
 461  010f cd0000        	call	_GPIO_WriteHigh
 463  0112 84            	pop	a
 466  0113 4b80          	push	#128
 467  0115 ae500a        	ldw	x,#20490
 468  0118 cd0000        	call	_GPIO_WriteHigh
 470  011b 84            	pop	a
 473  011c 4b08          	push	#8
 474  011e ae500f        	ldw	x,#20495
 475  0121 cd0000        	call	_GPIO_WriteLow
 477  0124 84            	pop	a
 480  0125 4b02          	push	#2
 481  0127 ae500f        	ldw	x,#20495
 482  012a cd0000        	call	_GPIO_WriteLow
 484  012d 84            	pop	a
 487  012e 4b02          	push	#2
 488  0130 ae5000        	ldw	x,#20480
 489  0133 cd0000        	call	_GPIO_WriteLow
 491  0136 84            	pop	a
 494  0137 4b40          	push	#64
 495  0139 ae500a        	ldw	x,#20490
 496  013c cd0000        	call	_GPIO_WriteLow
 498  013f 84            	pop	a
 499                     ; 69         break;
 501  0140 acf305f3      	jpf	L571
 502  0144               L501:
 503                     ; 70     case 0x02:
 503                     ; 71         display_two();
 505  0144 4b20          	push	#32
 506  0146 ae500f        	ldw	x,#20495
 507  0149 cd0000        	call	_GPIO_WriteHigh
 509  014c 84            	pop	a
 512  014d 4b04          	push	#4
 513  014f ae5000        	ldw	x,#20480
 514  0152 cd0000        	call	_GPIO_WriteHigh
 516  0155 84            	pop	a
 519  0156 4b80          	push	#128
 520  0158 ae500a        	ldw	x,#20490
 521  015b cd0000        	call	_GPIO_WriteLow
 523  015e 84            	pop	a
 526  015f 4b08          	push	#8
 527  0161 ae500f        	ldw	x,#20495
 528  0164 cd0000        	call	_GPIO_WriteHigh
 530  0167 84            	pop	a
 533  0168 4b02          	push	#2
 534  016a ae500f        	ldw	x,#20495
 535  016d cd0000        	call	_GPIO_WriteHigh
 537  0170 84            	pop	a
 540  0171 4b02          	push	#2
 541  0173 ae5000        	ldw	x,#20480
 542  0176 cd0000        	call	_GPIO_WriteLow
 544  0179 84            	pop	a
 547  017a 4b40          	push	#64
 548  017c ae500a        	ldw	x,#20490
 549  017f cd0000        	call	_GPIO_WriteHigh
 551  0182 84            	pop	a
 552                     ; 72         break;
 554  0183 acf305f3      	jpf	L571
 555  0187               L701:
 556                     ; 73     case 0x03:
 556                     ; 74         display_three();
 558  0187 4b20          	push	#32
 559  0189 ae500f        	ldw	x,#20495
 560  018c cd0000        	call	_GPIO_WriteHigh
 562  018f 84            	pop	a
 565  0190 4b04          	push	#4
 566  0192 ae5000        	ldw	x,#20480
 567  0195 cd0000        	call	_GPIO_WriteHigh
 569  0198 84            	pop	a
 572  0199 4b80          	push	#128
 573  019b ae500a        	ldw	x,#20490
 574  019e cd0000        	call	_GPIO_WriteHigh
 576  01a1 84            	pop	a
 579  01a2 4b08          	push	#8
 580  01a4 ae500f        	ldw	x,#20495
 581  01a7 cd0000        	call	_GPIO_WriteHigh
 583  01aa 84            	pop	a
 586  01ab 4b02          	push	#2
 587  01ad ae500f        	ldw	x,#20495
 588  01b0 cd0000        	call	_GPIO_WriteLow
 590  01b3 84            	pop	a
 593  01b4 4b02          	push	#2
 594  01b6 ae5000        	ldw	x,#20480
 595  01b9 cd0000        	call	_GPIO_WriteLow
 597  01bc 84            	pop	a
 600  01bd 4b40          	push	#64
 601  01bf ae500a        	ldw	x,#20490
 602  01c2 cd0000        	call	_GPIO_WriteHigh
 604  01c5 84            	pop	a
 605                     ; 75         break;
 607  01c6 acf305f3      	jpf	L571
 608  01ca               L111:
 609                     ; 76     case 0x04:
 609                     ; 77         display_four();
 611  01ca 4b20          	push	#32
 612  01cc ae500f        	ldw	x,#20495
 613  01cf cd0000        	call	_GPIO_WriteLow
 615  01d2 84            	pop	a
 618  01d3 4b04          	push	#4
 619  01d5 ae5000        	ldw	x,#20480
 620  01d8 cd0000        	call	_GPIO_WriteHigh
 622  01db 84            	pop	a
 625  01dc 4b80          	push	#128
 626  01de ae500a        	ldw	x,#20490
 627  01e1 cd0000        	call	_GPIO_WriteHigh
 629  01e4 84            	pop	a
 632  01e5 4b08          	push	#8
 633  01e7 ae500f        	ldw	x,#20495
 634  01ea cd0000        	call	_GPIO_WriteLow
 636  01ed 84            	pop	a
 639  01ee 4b02          	push	#2
 640  01f0 ae500f        	ldw	x,#20495
 641  01f3 cd0000        	call	_GPIO_WriteLow
 643  01f6 84            	pop	a
 646  01f7 4b02          	push	#2
 647  01f9 ae5000        	ldw	x,#20480
 648  01fc cd0000        	call	_GPIO_WriteHigh
 650  01ff 84            	pop	a
 653  0200 4b40          	push	#64
 654  0202 ae500a        	ldw	x,#20490
 655  0205 cd0000        	call	_GPIO_WriteHigh
 657  0208 84            	pop	a
 658                     ; 78         break;
 660  0209 acf305f3      	jpf	L571
 661  020d               L311:
 662                     ; 79     case 0x05:
 662                     ; 80         display_five();
 664  020d 4b20          	push	#32
 665  020f ae500f        	ldw	x,#20495
 666  0212 cd0000        	call	_GPIO_WriteHigh
 668  0215 84            	pop	a
 671  0216 4b04          	push	#4
 672  0218 ae5000        	ldw	x,#20480
 673  021b cd0000        	call	_GPIO_WriteLow
 675  021e 84            	pop	a
 678  021f 4b80          	push	#128
 679  0221 ae500a        	ldw	x,#20490
 680  0224 cd0000        	call	_GPIO_WriteHigh
 682  0227 84            	pop	a
 685  0228 4b08          	push	#8
 686  022a ae500f        	ldw	x,#20495
 687  022d cd0000        	call	_GPIO_WriteHigh
 689  0230 84            	pop	a
 692  0231 4b02          	push	#2
 693  0233 ae500f        	ldw	x,#20495
 694  0236 cd0000        	call	_GPIO_WriteLow
 696  0239 84            	pop	a
 699  023a 4b02          	push	#2
 700  023c ae5000        	ldw	x,#20480
 701  023f cd0000        	call	_GPIO_WriteHigh
 703  0242 84            	pop	a
 706  0243 4b40          	push	#64
 707  0245 ae500a        	ldw	x,#20490
 708  0248 cd0000        	call	_GPIO_WriteHigh
 710  024b 84            	pop	a
 711                     ; 81         break;
 713  024c acf305f3      	jpf	L571
 714  0250               L511:
 715                     ; 82     case 0x06:
 715                     ; 83         display_six();
 717  0250 4b20          	push	#32
 718  0252 ae500f        	ldw	x,#20495
 719  0255 cd0000        	call	_GPIO_WriteHigh
 721  0258 84            	pop	a
 724  0259 4b04          	push	#4
 725  025b ae5000        	ldw	x,#20480
 726  025e cd0000        	call	_GPIO_WriteLow
 728  0261 84            	pop	a
 731  0262 4b80          	push	#128
 732  0264 ae500a        	ldw	x,#20490
 733  0267 cd0000        	call	_GPIO_WriteHigh
 735  026a 84            	pop	a
 738  026b 4b08          	push	#8
 739  026d ae500f        	ldw	x,#20495
 740  0270 cd0000        	call	_GPIO_WriteHigh
 742  0273 84            	pop	a
 745  0274 4b02          	push	#2
 746  0276 ae500f        	ldw	x,#20495
 747  0279 cd0000        	call	_GPIO_WriteHigh
 749  027c 84            	pop	a
 752  027d 4b02          	push	#2
 753  027f ae5000        	ldw	x,#20480
 754  0282 cd0000        	call	_GPIO_WriteHigh
 756  0285 84            	pop	a
 759  0286 4b40          	push	#64
 760  0288 ae500a        	ldw	x,#20490
 761  028b cd0000        	call	_GPIO_WriteHigh
 763  028e 84            	pop	a
 764                     ; 84         break;
 766  028f acf305f3      	jpf	L571
 767  0293               L711:
 768                     ; 85     case 0x07:
 768                     ; 86         display_seven();
 770  0293 4b20          	push	#32
 771  0295 ae500f        	ldw	x,#20495
 772  0298 cd0000        	call	_GPIO_WriteHigh
 774  029b 84            	pop	a
 777  029c 4b04          	push	#4
 778  029e ae5000        	ldw	x,#20480
 779  02a1 cd0000        	call	_GPIO_WriteHigh
 781  02a4 84            	pop	a
 784  02a5 4b80          	push	#128
 785  02a7 ae500a        	ldw	x,#20490
 786  02aa cd0000        	call	_GPIO_WriteHigh
 788  02ad 84            	pop	a
 791  02ae 4b08          	push	#8
 792  02b0 ae500f        	ldw	x,#20495
 793  02b3 cd0000        	call	_GPIO_WriteLow
 795  02b6 84            	pop	a
 798  02b7 4b02          	push	#2
 799  02b9 ae500f        	ldw	x,#20495
 800  02bc cd0000        	call	_GPIO_WriteLow
 802  02bf 84            	pop	a
 805  02c0 4b02          	push	#2
 806  02c2 ae5000        	ldw	x,#20480
 807  02c5 cd0000        	call	_GPIO_WriteLow
 809  02c8 84            	pop	a
 812  02c9 4b40          	push	#64
 813  02cb ae500a        	ldw	x,#20490
 814  02ce cd0000        	call	_GPIO_WriteLow
 816  02d1 84            	pop	a
 817                     ; 87         break;
 819  02d2 acf305f3      	jpf	L571
 820  02d6               L121:
 821                     ; 88     case 0x08:
 821                     ; 89         display_eight();
 823  02d6 4b20          	push	#32
 824  02d8 ae500f        	ldw	x,#20495
 825  02db cd0000        	call	_GPIO_WriteHigh
 827  02de 84            	pop	a
 830  02df 4b04          	push	#4
 831  02e1 ae5000        	ldw	x,#20480
 832  02e4 cd0000        	call	_GPIO_WriteHigh
 834  02e7 84            	pop	a
 837  02e8 4b80          	push	#128
 838  02ea ae500a        	ldw	x,#20490
 839  02ed cd0000        	call	_GPIO_WriteHigh
 841  02f0 84            	pop	a
 844  02f1 4b08          	push	#8
 845  02f3 ae500f        	ldw	x,#20495
 846  02f6 cd0000        	call	_GPIO_WriteHigh
 848  02f9 84            	pop	a
 851  02fa 4b02          	push	#2
 852  02fc ae500f        	ldw	x,#20495
 853  02ff cd0000        	call	_GPIO_WriteHigh
 855  0302 84            	pop	a
 858  0303 4b02          	push	#2
 859  0305 ae5000        	ldw	x,#20480
 860  0308 cd0000        	call	_GPIO_WriteHigh
 862  030b 84            	pop	a
 865  030c 4b40          	push	#64
 866  030e ae500a        	ldw	x,#20490
 867  0311 cd0000        	call	_GPIO_WriteHigh
 869  0314 84            	pop	a
 870                     ; 90         break;
 872  0315 acf305f3      	jpf	L571
 873  0319               L321:
 874                     ; 91     case 0x09:
 874                     ; 92         display_nine();
 876  0319 4b20          	push	#32
 877  031b ae500f        	ldw	x,#20495
 878  031e cd0000        	call	_GPIO_WriteHigh
 880  0321 84            	pop	a
 883  0322 4b04          	push	#4
 884  0324 ae5000        	ldw	x,#20480
 885  0327 cd0000        	call	_GPIO_WriteHigh
 887  032a 84            	pop	a
 890  032b 4b80          	push	#128
 891  032d ae500a        	ldw	x,#20490
 892  0330 cd0000        	call	_GPIO_WriteHigh
 894  0333 84            	pop	a
 897  0334 4b08          	push	#8
 898  0336 ae500f        	ldw	x,#20495
 899  0339 cd0000        	call	_GPIO_WriteHigh
 901  033c 84            	pop	a
 904  033d 4b02          	push	#2
 905  033f ae500f        	ldw	x,#20495
 906  0342 cd0000        	call	_GPIO_WriteLow
 908  0345 84            	pop	a
 911  0346 4b02          	push	#2
 912  0348 ae5000        	ldw	x,#20480
 913  034b cd0000        	call	_GPIO_WriteHigh
 915  034e 84            	pop	a
 918  034f 4b40          	push	#64
 919  0351 ae500a        	ldw	x,#20490
 920  0354 cd0000        	call	_GPIO_WriteHigh
 922  0357 84            	pop	a
 923                     ; 93         break;
 925  0358 acf305f3      	jpf	L571
 926  035c               L521:
 927                     ; 94     case 'A':
 927                     ; 95         display_a();
 929  035c 4b20          	push	#32
 930  035e ae500f        	ldw	x,#20495
 931  0361 cd0000        	call	_GPIO_WriteHigh
 933  0364 84            	pop	a
 936  0365 4b04          	push	#4
 937  0367 ae5000        	ldw	x,#20480
 938  036a cd0000        	call	_GPIO_WriteHigh
 940  036d 84            	pop	a
 943  036e 4b80          	push	#128
 944  0370 ae500a        	ldw	x,#20490
 945  0373 cd0000        	call	_GPIO_WriteHigh
 947  0376 84            	pop	a
 950  0377 4b08          	push	#8
 951  0379 ae500f        	ldw	x,#20495
 952  037c cd0000        	call	_GPIO_WriteLow
 954  037f 84            	pop	a
 957  0380 4b02          	push	#2
 958  0382 ae500f        	ldw	x,#20495
 959  0385 cd0000        	call	_GPIO_WriteHigh
 961  0388 84            	pop	a
 964  0389 4b02          	push	#2
 965  038b ae5000        	ldw	x,#20480
 966  038e cd0000        	call	_GPIO_WriteHigh
 968  0391 84            	pop	a
 971  0392 4b40          	push	#64
 972  0394 ae500a        	ldw	x,#20490
 973  0397 cd0000        	call	_GPIO_WriteHigh
 975  039a 84            	pop	a
 976                     ; 96         break;
 978  039b acf305f3      	jpf	L571
 979  039f               L721:
 980                     ; 97     case 'b':
 980                     ; 98         display_b();
 982  039f 4b20          	push	#32
 983  03a1 ae500f        	ldw	x,#20495
 984  03a4 cd0000        	call	_GPIO_WriteLow
 986  03a7 84            	pop	a
 989  03a8 4b04          	push	#4
 990  03aa ae5000        	ldw	x,#20480
 991  03ad cd0000        	call	_GPIO_WriteLow
 993  03b0 84            	pop	a
 996  03b1 4b80          	push	#128
 997  03b3 ae500a        	ldw	x,#20490
 998  03b6 cd0000        	call	_GPIO_WriteHigh
1000  03b9 84            	pop	a
1003  03ba 4b08          	push	#8
1004  03bc ae500f        	ldw	x,#20495
1005  03bf cd0000        	call	_GPIO_WriteHigh
1007  03c2 84            	pop	a
1010  03c3 4b02          	push	#2
1011  03c5 ae500f        	ldw	x,#20495
1012  03c8 cd0000        	call	_GPIO_WriteHigh
1014  03cb 84            	pop	a
1017  03cc 4b02          	push	#2
1018  03ce ae5000        	ldw	x,#20480
1019  03d1 cd0000        	call	_GPIO_WriteHigh
1021  03d4 84            	pop	a
1024  03d5 4b40          	push	#64
1025  03d7 ae500a        	ldw	x,#20490
1026  03da cd0000        	call	_GPIO_WriteHigh
1028  03dd 84            	pop	a
1029                     ; 99         break;
1031  03de acf305f3      	jpf	L571
1032  03e2               L131:
1033                     ; 100     case 'C':
1033                     ; 101         display_c();
1035  03e2 4b20          	push	#32
1036  03e4 ae500f        	ldw	x,#20495
1037  03e7 cd0000        	call	_GPIO_WriteHigh
1039  03ea 84            	pop	a
1042  03eb 4b04          	push	#4
1043  03ed ae5000        	ldw	x,#20480
1044  03f0 cd0000        	call	_GPIO_WriteLow
1046  03f3 84            	pop	a
1049  03f4 4b80          	push	#128
1050  03f6 ae500a        	ldw	x,#20490
1051  03f9 cd0000        	call	_GPIO_WriteLow
1053  03fc 84            	pop	a
1056  03fd 4b08          	push	#8
1057  03ff ae500f        	ldw	x,#20495
1058  0402 cd0000        	call	_GPIO_WriteHigh
1060  0405 84            	pop	a
1063  0406 4b02          	push	#2
1064  0408 ae500f        	ldw	x,#20495
1065  040b cd0000        	call	_GPIO_WriteHigh
1067  040e 84            	pop	a
1070  040f 4b02          	push	#2
1071  0411 ae5000        	ldw	x,#20480
1072  0414 cd0000        	call	_GPIO_WriteHigh
1074  0417 84            	pop	a
1077  0418 4b40          	push	#64
1078  041a ae500a        	ldw	x,#20490
1079  041d cd0000        	call	_GPIO_WriteLow
1081  0420 84            	pop	a
1082                     ; 102         break;
1084  0421 acf305f3      	jpf	L571
1085  0425               L331:
1086                     ; 103     case 'd':
1086                     ; 104         display_d();
1088  0425 4b20          	push	#32
1089  0427 ae500f        	ldw	x,#20495
1090  042a cd0000        	call	_GPIO_WriteLow
1092  042d 84            	pop	a
1095  042e 4b04          	push	#4
1096  0430 ae5000        	ldw	x,#20480
1097  0433 cd0000        	call	_GPIO_WriteHigh
1099  0436 84            	pop	a
1102  0437 4b80          	push	#128
1103  0439 ae500a        	ldw	x,#20490
1104  043c cd0000        	call	_GPIO_WriteHigh
1106  043f 84            	pop	a
1109  0440 4b08          	push	#8
1110  0442 ae500f        	ldw	x,#20495
1111  0445 cd0000        	call	_GPIO_WriteHigh
1113  0448 84            	pop	a
1116  0449 4b02          	push	#2
1117  044b ae500f        	ldw	x,#20495
1118  044e cd0000        	call	_GPIO_WriteHigh
1120  0451 84            	pop	a
1123  0452 4b02          	push	#2
1124  0454 ae5000        	ldw	x,#20480
1125  0457 cd0000        	call	_GPIO_WriteLow
1127  045a 84            	pop	a
1130  045b 4b40          	push	#64
1131  045d ae500a        	ldw	x,#20490
1132  0460 cd0000        	call	_GPIO_WriteHigh
1134  0463 84            	pop	a
1135                     ; 105         break;
1137  0464 acf305f3      	jpf	L571
1138  0468               L531:
1139                     ; 106     case 'E':
1139                     ; 107         display_e();
1141  0468 4b20          	push	#32
1142  046a ae500f        	ldw	x,#20495
1143  046d cd0000        	call	_GPIO_WriteHigh
1145  0470 84            	pop	a
1148  0471 4b04          	push	#4
1149  0473 ae5000        	ldw	x,#20480
1150  0476 cd0000        	call	_GPIO_WriteLow
1152  0479 84            	pop	a
1155  047a 4b80          	push	#128
1156  047c ae500a        	ldw	x,#20490
1157  047f cd0000        	call	_GPIO_WriteLow
1159  0482 84            	pop	a
1162  0483 4b08          	push	#8
1163  0485 ae500f        	ldw	x,#20495
1164  0488 cd0000        	call	_GPIO_WriteHigh
1166  048b 84            	pop	a
1169  048c 4b02          	push	#2
1170  048e ae500f        	ldw	x,#20495
1171  0491 cd0000        	call	_GPIO_WriteHigh
1173  0494 84            	pop	a
1176  0495 4b02          	push	#2
1177  0497 ae5000        	ldw	x,#20480
1178  049a cd0000        	call	_GPIO_WriteHigh
1180  049d 84            	pop	a
1183  049e 4b40          	push	#64
1184  04a0 ae500a        	ldw	x,#20490
1185  04a3 cd0000        	call	_GPIO_WriteHigh
1187  04a6 84            	pop	a
1188                     ; 108         break;
1190  04a7 acf305f3      	jpf	L571
1191  04ab               L731:
1192                     ; 109     case 'F':
1192                     ; 110         display_f();
1194  04ab 4b20          	push	#32
1195  04ad ae500f        	ldw	x,#20495
1196  04b0 cd0000        	call	_GPIO_WriteHigh
1198  04b3 84            	pop	a
1201  04b4 4b04          	push	#4
1202  04b6 ae5000        	ldw	x,#20480
1203  04b9 cd0000        	call	_GPIO_WriteLow
1205  04bc 84            	pop	a
1208  04bd 4b80          	push	#128
1209  04bf ae500a        	ldw	x,#20490
1210  04c2 cd0000        	call	_GPIO_WriteLow
1212  04c5 84            	pop	a
1215  04c6 4b08          	push	#8
1216  04c8 ae500f        	ldw	x,#20495
1217  04cb cd0000        	call	_GPIO_WriteLow
1219  04ce 84            	pop	a
1222  04cf 4b02          	push	#2
1223  04d1 ae500f        	ldw	x,#20495
1224  04d4 cd0000        	call	_GPIO_WriteHigh
1226  04d7 84            	pop	a
1229  04d8 4b02          	push	#2
1230  04da ae5000        	ldw	x,#20480
1231  04dd cd0000        	call	_GPIO_WriteHigh
1233  04e0 84            	pop	a
1236  04e1 4b40          	push	#64
1237  04e3 ae500a        	ldw	x,#20490
1238  04e6 cd0000        	call	_GPIO_WriteHigh
1240  04e9 84            	pop	a
1241                     ; 111         break;
1243  04ea acf305f3      	jpf	L571
1244  04ee               L141:
1245                     ; 112     case 'H':
1245                     ; 113         display_h();
1247  04ee 4b20          	push	#32
1248  04f0 ae500f        	ldw	x,#20495
1249  04f3 cd0000        	call	_GPIO_WriteLow
1251  04f6 84            	pop	a
1254  04f7 4b04          	push	#4
1255  04f9 ae5000        	ldw	x,#20480
1256  04fc cd0000        	call	_GPIO_WriteHigh
1258  04ff 84            	pop	a
1261  0500 4b80          	push	#128
1262  0502 ae500a        	ldw	x,#20490
1263  0505 cd0000        	call	_GPIO_WriteHigh
1265  0508 84            	pop	a
1268  0509 4b08          	push	#8
1269  050b ae500f        	ldw	x,#20495
1270  050e cd0000        	call	_GPIO_WriteLow
1272  0511 84            	pop	a
1275  0512 4b02          	push	#2
1276  0514 ae500f        	ldw	x,#20495
1277  0517 cd0000        	call	_GPIO_WriteHigh
1279  051a 84            	pop	a
1282  051b 4b02          	push	#2
1283  051d ae5000        	ldw	x,#20480
1284  0520 cd0000        	call	_GPIO_WriteHigh
1286  0523 84            	pop	a
1289  0524 4b40          	push	#64
1290  0526 ae500a        	ldw	x,#20490
1291  0529 cd0000        	call	_GPIO_WriteHigh
1293  052c 84            	pop	a
1294                     ; 114         break;
1296  052d acf305f3      	jpf	L571
1297  0531               L341:
1298                     ; 115     case 'L':
1298                     ; 116         display_l();
1300  0531 4b20          	push	#32
1301  0533 ae500f        	ldw	x,#20495
1302  0536 cd0000        	call	_GPIO_WriteLow
1304  0539 84            	pop	a
1307  053a 4b04          	push	#4
1308  053c ae5000        	ldw	x,#20480
1309  053f cd0000        	call	_GPIO_WriteLow
1311  0542 84            	pop	a
1314  0543 4b80          	push	#128
1315  0545 ae500a        	ldw	x,#20490
1316  0548 cd0000        	call	_GPIO_WriteLow
1318  054b 84            	pop	a
1321  054c 4b08          	push	#8
1322  054e ae500f        	ldw	x,#20495
1323  0551 cd0000        	call	_GPIO_WriteHigh
1325  0554 84            	pop	a
1328  0555 4b02          	push	#2
1329  0557 ae500f        	ldw	x,#20495
1330  055a cd0000        	call	_GPIO_WriteHigh
1332  055d 84            	pop	a
1335  055e 4b02          	push	#2
1336  0560 ae5000        	ldw	x,#20480
1337  0563 cd0000        	call	_GPIO_WriteHigh
1339  0566 84            	pop	a
1342  0567 4b40          	push	#64
1343  0569 ae500a        	ldw	x,#20490
1344  056c cd0000        	call	_GPIO_WriteLow
1346  056f 84            	pop	a
1347                     ; 117         break;
1349  0570 cc05f3        	jra	L571
1350  0573               L541:
1351                     ; 118     case 'P':
1351                     ; 119         display_p();
1353  0573 4b20          	push	#32
1354  0575 ae500f        	ldw	x,#20495
1355  0578 cd0000        	call	_GPIO_WriteHigh
1357  057b 84            	pop	a
1360  057c 4b04          	push	#4
1361  057e ae5000        	ldw	x,#20480
1362  0581 cd0000        	call	_GPIO_WriteHigh
1364  0584 84            	pop	a
1367  0585 4b80          	push	#128
1368  0587 ae500a        	ldw	x,#20490
1369  058a cd0000        	call	_GPIO_WriteLow
1371  058d 84            	pop	a
1374  058e 4b08          	push	#8
1375  0590 ae500f        	ldw	x,#20495
1376  0593 cd0000        	call	_GPIO_WriteLow
1378  0596 84            	pop	a
1381  0597 4b02          	push	#2
1382  0599 ae500f        	ldw	x,#20495
1383  059c cd0000        	call	_GPIO_WriteHigh
1385  059f 84            	pop	a
1388  05a0 4b02          	push	#2
1389  05a2 ae5000        	ldw	x,#20480
1390  05a5 cd0000        	call	_GPIO_WriteHigh
1392  05a8 84            	pop	a
1395  05a9 4b40          	push	#64
1396  05ab ae500a        	ldw	x,#20490
1397  05ae cd0000        	call	_GPIO_WriteHigh
1399  05b1 84            	pop	a
1400                     ; 120         break;
1402  05b2 203f          	jra	L571
1403  05b4               L741:
1404                     ; 121     case 'U':
1404                     ; 122         display_u();
1406  05b4 4b20          	push	#32
1407  05b6 ae500f        	ldw	x,#20495
1408  05b9 cd0000        	call	_GPIO_WriteLow
1410  05bc 84            	pop	a
1413  05bd 4b04          	push	#4
1414  05bf ae5000        	ldw	x,#20480
1415  05c2 cd0000        	call	_GPIO_WriteHigh
1417  05c5 84            	pop	a
1420  05c6 4b80          	push	#128
1421  05c8 ae500a        	ldw	x,#20490
1422  05cb cd0000        	call	_GPIO_WriteHigh
1424  05ce 84            	pop	a
1427  05cf 4b08          	push	#8
1428  05d1 ae500f        	ldw	x,#20495
1429  05d4 cd0000        	call	_GPIO_WriteHigh
1431  05d7 84            	pop	a
1434  05d8 4b02          	push	#2
1435  05da ae500f        	ldw	x,#20495
1436  05dd cd0000        	call	_GPIO_WriteHigh
1438  05e0 84            	pop	a
1441  05e1 4b02          	push	#2
1442  05e3 ae5000        	ldw	x,#20480
1443  05e6 cd0000        	call	_GPIO_WriteHigh
1445  05e9 84            	pop	a
1448  05ea 4b40          	push	#64
1449  05ec ae500a        	ldw	x,#20490
1450  05ef cd0000        	call	_GPIO_WriteLow
1452  05f2 84            	pop	a
1453                     ; 123         break;
1455  05f3               L571:
1456                     ; 126 }
1459  05f3 84            	pop	a
1460  05f4 81            	ret
1484                     ; 128 void task_display(void)
1484                     ; 129 {
1485                     	switch	.text
1486  05f5               _task_display:
1490                     ; 131     if (!tick)
1492  05f5 3d00          	tnz	_tick
1493  05f7 2601          	jrne	L702
1494                     ; 132         return;
1497  05f9 81            	ret
1498  05fa               L702:
1499                     ; 135 }
1502  05fa 81            	ret
1505                     	bsct
1506  0004               L112_dig_pos:
1507  0004 00            	dc.b	0
1543                     ; 137 void tmr_display(void)
1543                     ; 138 {
1544                     	switch	.text
1545  05fb               _tmr_display:
1549                     ; 143     if (display_test)
1551  05fb 3d00          	tnz	_display_test
1552  05fd 2701          	jreq	L732
1553                     ; 144         return;
1556  05ff 81            	ret
1557  0600               L732:
1558                     ; 147     if (dig_pos > MAX_DIG_POS)
1560  0600 b604          	ld	a,L112_dig_pos
1561  0602 a104          	cp	a,#4
1562  0604 2502          	jrult	L142
1563                     ; 148         dig_pos = DIG1_POS;
1565  0606 3f04          	clr	L112_dig_pos
1566  0608               L142:
1567                     ; 150     dig1_off();
1569  0608 4b10          	push	#16
1570  060a ae500f        	ldw	x,#20495
1571  060d cd0000        	call	_GPIO_WriteHigh
1573  0610 84            	pop	a
1574                     ; 151     dig2_off();
1576  0611 4b20          	push	#32
1577  0613 ae5005        	ldw	x,#20485
1578  0616 cd0000        	call	_GPIO_WriteHigh
1580  0619 84            	pop	a
1581                     ; 152     dig3_off();
1583  061a 4b10          	push	#16
1584  061c ae5005        	ldw	x,#20485
1585  061f cd0000        	call	_GPIO_WriteHigh
1587  0622 84            	pop	a
1588                     ; 154     switch (dig_pos) {
1590  0623 b604          	ld	a,L112_dig_pos
1592                     ; 163         break;
1593  0625 4d            	tnz	a
1594  0626 2708          	jreq	L312
1595  0628 4a            	dec	a
1596  0629 2710          	jreq	L512
1597  062b 4a            	dec	a
1598  062c 2718          	jreq	L712
1599  062e 201f          	jra	L542
1600  0630               L312:
1601                     ; 155     case DIG1_POS:
1601                     ; 156         dig1_on();
1603  0630 4b10          	push	#16
1604  0632 ae500f        	ldw	x,#20495
1605  0635 cd0000        	call	_GPIO_WriteLow
1607  0638 84            	pop	a
1608                     ; 157         break;
1610  0639 2014          	jra	L542
1611  063b               L512:
1612                     ; 158     case DIG2_POS:
1612                     ; 159         dig2_on();
1614  063b 4b20          	push	#32
1615  063d ae5005        	ldw	x,#20485
1616  0640 cd0000        	call	_GPIO_WriteLow
1618  0643 84            	pop	a
1619                     ; 160         break;
1621  0644 2009          	jra	L542
1622  0646               L712:
1623                     ; 161     case DIG3_POS:
1623                     ; 162         dig3_on();
1625  0646 4b10          	push	#16
1626  0648 ae5005        	ldw	x,#20485
1627  064b cd0000        	call	_GPIO_WriteLow
1629  064e 84            	pop	a
1630                     ; 163         break;
1632  064f               L542:
1633                     ; 166     wr_digit(dig_pos);
1635  064f b604          	ld	a,L112_dig_pos
1636  0651 cd0049        	call	_wr_digit
1638                     ; 167     dig_pos++;
1640  0654 3c04          	inc	L112_dig_pos
1641                     ; 169 }
1644  0656 81            	ret
1670                     ; 172 void test_display(void)
1670                     ; 173 {
1671                     	switch	.text
1672  0657               _test_display:
1676                     ; 174     delay(DELAY_DISPLAY_TEST);
1678  0657 ae01f4        	ldw	x,#500
1679  065a 89            	pushw	x
1680  065b ae0000        	ldw	x,#0
1681  065e 89            	pushw	x
1682  065f cd0000        	call	_delay
1684  0662 5b04          	addw	sp,#4
1685                     ; 175     display_zero();
1687  0664 4b20          	push	#32
1688  0666 ae500f        	ldw	x,#20495
1689  0669 cd0000        	call	_GPIO_WriteHigh
1691  066c 84            	pop	a
1694  066d 4b04          	push	#4
1695  066f ae5000        	ldw	x,#20480
1696  0672 cd0000        	call	_GPIO_WriteHigh
1698  0675 84            	pop	a
1701  0676 4b80          	push	#128
1702  0678 ae500a        	ldw	x,#20490
1703  067b cd0000        	call	_GPIO_WriteHigh
1705  067e 84            	pop	a
1708  067f 4b08          	push	#8
1709  0681 ae500f        	ldw	x,#20495
1710  0684 cd0000        	call	_GPIO_WriteHigh
1712  0687 84            	pop	a
1715  0688 4b02          	push	#2
1716  068a ae500f        	ldw	x,#20495
1717  068d cd0000        	call	_GPIO_WriteHigh
1719  0690 84            	pop	a
1722  0691 4b02          	push	#2
1723  0693 ae5000        	ldw	x,#20480
1724  0696 cd0000        	call	_GPIO_WriteHigh
1726  0699 84            	pop	a
1729  069a 4b40          	push	#64
1730  069c ae500a        	ldw	x,#20490
1731  069f cd0000        	call	_GPIO_WriteLow
1733  06a2 84            	pop	a
1734                     ; 176     delay(DELAY_DISPLAY_TEST);
1736  06a3 ae01f4        	ldw	x,#500
1737  06a6 89            	pushw	x
1738  06a7 ae0000        	ldw	x,#0
1739  06aa 89            	pushw	x
1740  06ab cd0000        	call	_delay
1742  06ae 5b04          	addw	sp,#4
1743                     ; 177     display_one();
1745  06b0 4b20          	push	#32
1746  06b2 ae500f        	ldw	x,#20495
1747  06b5 cd0000        	call	_GPIO_WriteLow
1749  06b8 84            	pop	a
1752  06b9 4b04          	push	#4
1753  06bb ae5000        	ldw	x,#20480
1754  06be cd0000        	call	_GPIO_WriteHigh
1756  06c1 84            	pop	a
1759  06c2 4b80          	push	#128
1760  06c4 ae500a        	ldw	x,#20490
1761  06c7 cd0000        	call	_GPIO_WriteHigh
1763  06ca 84            	pop	a
1766  06cb 4b08          	push	#8
1767  06cd ae500f        	ldw	x,#20495
1768  06d0 cd0000        	call	_GPIO_WriteLow
1770  06d3 84            	pop	a
1773  06d4 4b02          	push	#2
1774  06d6 ae500f        	ldw	x,#20495
1775  06d9 cd0000        	call	_GPIO_WriteLow
1777  06dc 84            	pop	a
1780  06dd 4b02          	push	#2
1781  06df ae5000        	ldw	x,#20480
1782  06e2 cd0000        	call	_GPIO_WriteLow
1784  06e5 84            	pop	a
1787  06e6 4b40          	push	#64
1788  06e8 ae500a        	ldw	x,#20490
1789  06eb cd0000        	call	_GPIO_WriteLow
1791  06ee 84            	pop	a
1792                     ; 178     delay(DELAY_DISPLAY_TEST);
1794  06ef ae01f4        	ldw	x,#500
1795  06f2 89            	pushw	x
1796  06f3 ae0000        	ldw	x,#0
1797  06f6 89            	pushw	x
1798  06f7 cd0000        	call	_delay
1800  06fa 5b04          	addw	sp,#4
1801                     ; 179     display_two();
1803  06fc 4b20          	push	#32
1804  06fe ae500f        	ldw	x,#20495
1805  0701 cd0000        	call	_GPIO_WriteHigh
1807  0704 84            	pop	a
1810  0705 4b04          	push	#4
1811  0707 ae5000        	ldw	x,#20480
1812  070a cd0000        	call	_GPIO_WriteHigh
1814  070d 84            	pop	a
1817  070e 4b80          	push	#128
1818  0710 ae500a        	ldw	x,#20490
1819  0713 cd0000        	call	_GPIO_WriteLow
1821  0716 84            	pop	a
1824  0717 4b08          	push	#8
1825  0719 ae500f        	ldw	x,#20495
1826  071c cd0000        	call	_GPIO_WriteHigh
1828  071f 84            	pop	a
1831  0720 4b02          	push	#2
1832  0722 ae500f        	ldw	x,#20495
1833  0725 cd0000        	call	_GPIO_WriteHigh
1835  0728 84            	pop	a
1838  0729 4b02          	push	#2
1839  072b ae5000        	ldw	x,#20480
1840  072e cd0000        	call	_GPIO_WriteLow
1842  0731 84            	pop	a
1845  0732 4b40          	push	#64
1846  0734 ae500a        	ldw	x,#20490
1847  0737 cd0000        	call	_GPIO_WriteHigh
1849  073a 84            	pop	a
1850                     ; 180     delay(DELAY_DISPLAY_TEST);
1852  073b ae01f4        	ldw	x,#500
1853  073e 89            	pushw	x
1854  073f ae0000        	ldw	x,#0
1855  0742 89            	pushw	x
1856  0743 cd0000        	call	_delay
1858  0746 5b04          	addw	sp,#4
1859                     ; 181     display_three();
1861  0748 4b20          	push	#32
1862  074a ae500f        	ldw	x,#20495
1863  074d cd0000        	call	_GPIO_WriteHigh
1865  0750 84            	pop	a
1868  0751 4b04          	push	#4
1869  0753 ae5000        	ldw	x,#20480
1870  0756 cd0000        	call	_GPIO_WriteHigh
1872  0759 84            	pop	a
1875  075a 4b80          	push	#128
1876  075c ae500a        	ldw	x,#20490
1877  075f cd0000        	call	_GPIO_WriteHigh
1879  0762 84            	pop	a
1882  0763 4b08          	push	#8
1883  0765 ae500f        	ldw	x,#20495
1884  0768 cd0000        	call	_GPIO_WriteHigh
1886  076b 84            	pop	a
1889  076c 4b02          	push	#2
1890  076e ae500f        	ldw	x,#20495
1891  0771 cd0000        	call	_GPIO_WriteLow
1893  0774 84            	pop	a
1896  0775 4b02          	push	#2
1897  0777 ae5000        	ldw	x,#20480
1898  077a cd0000        	call	_GPIO_WriteLow
1900  077d 84            	pop	a
1903  077e 4b40          	push	#64
1904  0780 ae500a        	ldw	x,#20490
1905  0783 cd0000        	call	_GPIO_WriteHigh
1907  0786 84            	pop	a
1908                     ; 182     delay(DELAY_DISPLAY_TEST);
1910  0787 ae01f4        	ldw	x,#500
1911  078a 89            	pushw	x
1912  078b ae0000        	ldw	x,#0
1913  078e 89            	pushw	x
1914  078f cd0000        	call	_delay
1916  0792 5b04          	addw	sp,#4
1917                     ; 183     display_four();
1919  0794 4b20          	push	#32
1920  0796 ae500f        	ldw	x,#20495
1921  0799 cd0000        	call	_GPIO_WriteLow
1923  079c 84            	pop	a
1926  079d 4b04          	push	#4
1927  079f ae5000        	ldw	x,#20480
1928  07a2 cd0000        	call	_GPIO_WriteHigh
1930  07a5 84            	pop	a
1933  07a6 4b80          	push	#128
1934  07a8 ae500a        	ldw	x,#20490
1935  07ab cd0000        	call	_GPIO_WriteHigh
1937  07ae 84            	pop	a
1940  07af 4b08          	push	#8
1941  07b1 ae500f        	ldw	x,#20495
1942  07b4 cd0000        	call	_GPIO_WriteLow
1944  07b7 84            	pop	a
1947  07b8 4b02          	push	#2
1948  07ba ae500f        	ldw	x,#20495
1949  07bd cd0000        	call	_GPIO_WriteLow
1951  07c0 84            	pop	a
1954  07c1 4b02          	push	#2
1955  07c3 ae5000        	ldw	x,#20480
1956  07c6 cd0000        	call	_GPIO_WriteHigh
1958  07c9 84            	pop	a
1961  07ca 4b40          	push	#64
1962  07cc ae500a        	ldw	x,#20490
1963  07cf cd0000        	call	_GPIO_WriteHigh
1965  07d2 84            	pop	a
1966                     ; 184     delay(DELAY_DISPLAY_TEST);
1968  07d3 ae01f4        	ldw	x,#500
1969  07d6 89            	pushw	x
1970  07d7 ae0000        	ldw	x,#0
1971  07da 89            	pushw	x
1972  07db cd0000        	call	_delay
1974  07de 5b04          	addw	sp,#4
1975                     ; 185     display_five();
1977  07e0 4b20          	push	#32
1978  07e2 ae500f        	ldw	x,#20495
1979  07e5 cd0000        	call	_GPIO_WriteHigh
1981  07e8 84            	pop	a
1984  07e9 4b04          	push	#4
1985  07eb ae5000        	ldw	x,#20480
1986  07ee cd0000        	call	_GPIO_WriteLow
1988  07f1 84            	pop	a
1991  07f2 4b80          	push	#128
1992  07f4 ae500a        	ldw	x,#20490
1993  07f7 cd0000        	call	_GPIO_WriteHigh
1995  07fa 84            	pop	a
1998  07fb 4b08          	push	#8
1999  07fd ae500f        	ldw	x,#20495
2000  0800 cd0000        	call	_GPIO_WriteHigh
2002  0803 84            	pop	a
2005  0804 4b02          	push	#2
2006  0806 ae500f        	ldw	x,#20495
2007  0809 cd0000        	call	_GPIO_WriteLow
2009  080c 84            	pop	a
2012  080d 4b02          	push	#2
2013  080f ae5000        	ldw	x,#20480
2014  0812 cd0000        	call	_GPIO_WriteHigh
2016  0815 84            	pop	a
2019  0816 4b40          	push	#64
2020  0818 ae500a        	ldw	x,#20490
2021  081b cd0000        	call	_GPIO_WriteHigh
2023  081e 84            	pop	a
2024                     ; 186     delay(DELAY_DISPLAY_TEST);
2026  081f ae01f4        	ldw	x,#500
2027  0822 89            	pushw	x
2028  0823 ae0000        	ldw	x,#0
2029  0826 89            	pushw	x
2030  0827 cd0000        	call	_delay
2032  082a 5b04          	addw	sp,#4
2033                     ; 187     display_six();
2035  082c 4b20          	push	#32
2036  082e ae500f        	ldw	x,#20495
2037  0831 cd0000        	call	_GPIO_WriteHigh
2039  0834 84            	pop	a
2042  0835 4b04          	push	#4
2043  0837 ae5000        	ldw	x,#20480
2044  083a cd0000        	call	_GPIO_WriteLow
2046  083d 84            	pop	a
2049  083e 4b80          	push	#128
2050  0840 ae500a        	ldw	x,#20490
2051  0843 cd0000        	call	_GPIO_WriteHigh
2053  0846 84            	pop	a
2056  0847 4b08          	push	#8
2057  0849 ae500f        	ldw	x,#20495
2058  084c cd0000        	call	_GPIO_WriteHigh
2060  084f 84            	pop	a
2063  0850 4b02          	push	#2
2064  0852 ae500f        	ldw	x,#20495
2065  0855 cd0000        	call	_GPIO_WriteHigh
2067  0858 84            	pop	a
2070  0859 4b02          	push	#2
2071  085b ae5000        	ldw	x,#20480
2072  085e cd0000        	call	_GPIO_WriteHigh
2074  0861 84            	pop	a
2077  0862 4b40          	push	#64
2078  0864 ae500a        	ldw	x,#20490
2079  0867 cd0000        	call	_GPIO_WriteHigh
2081  086a 84            	pop	a
2082                     ; 188     delay(DELAY_DISPLAY_TEST);
2084  086b ae01f4        	ldw	x,#500
2085  086e 89            	pushw	x
2086  086f ae0000        	ldw	x,#0
2087  0872 89            	pushw	x
2088  0873 cd0000        	call	_delay
2090  0876 5b04          	addw	sp,#4
2091                     ; 189     display_seven();
2093  0878 4b20          	push	#32
2094  087a ae500f        	ldw	x,#20495
2095  087d cd0000        	call	_GPIO_WriteHigh
2097  0880 84            	pop	a
2100  0881 4b04          	push	#4
2101  0883 ae5000        	ldw	x,#20480
2102  0886 cd0000        	call	_GPIO_WriteHigh
2104  0889 84            	pop	a
2107  088a 4b80          	push	#128
2108  088c ae500a        	ldw	x,#20490
2109  088f cd0000        	call	_GPIO_WriteHigh
2111  0892 84            	pop	a
2114  0893 4b08          	push	#8
2115  0895 ae500f        	ldw	x,#20495
2116  0898 cd0000        	call	_GPIO_WriteLow
2118  089b 84            	pop	a
2121  089c 4b02          	push	#2
2122  089e ae500f        	ldw	x,#20495
2123  08a1 cd0000        	call	_GPIO_WriteLow
2125  08a4 84            	pop	a
2128  08a5 4b02          	push	#2
2129  08a7 ae5000        	ldw	x,#20480
2130  08aa cd0000        	call	_GPIO_WriteLow
2132  08ad 84            	pop	a
2135  08ae 4b40          	push	#64
2136  08b0 ae500a        	ldw	x,#20490
2137  08b3 cd0000        	call	_GPIO_WriteLow
2139  08b6 84            	pop	a
2140                     ; 190     delay(DELAY_DISPLAY_TEST);
2142  08b7 ae01f4        	ldw	x,#500
2143  08ba 89            	pushw	x
2144  08bb ae0000        	ldw	x,#0
2145  08be 89            	pushw	x
2146  08bf cd0000        	call	_delay
2148  08c2 5b04          	addw	sp,#4
2149                     ; 191     display_eight();
2151  08c4 4b20          	push	#32
2152  08c6 ae500f        	ldw	x,#20495
2153  08c9 cd0000        	call	_GPIO_WriteHigh
2155  08cc 84            	pop	a
2158  08cd 4b04          	push	#4
2159  08cf ae5000        	ldw	x,#20480
2160  08d2 cd0000        	call	_GPIO_WriteHigh
2162  08d5 84            	pop	a
2165  08d6 4b80          	push	#128
2166  08d8 ae500a        	ldw	x,#20490
2167  08db cd0000        	call	_GPIO_WriteHigh
2169  08de 84            	pop	a
2172  08df 4b08          	push	#8
2173  08e1 ae500f        	ldw	x,#20495
2174  08e4 cd0000        	call	_GPIO_WriteHigh
2176  08e7 84            	pop	a
2179  08e8 4b02          	push	#2
2180  08ea ae500f        	ldw	x,#20495
2181  08ed cd0000        	call	_GPIO_WriteHigh
2183  08f0 84            	pop	a
2186  08f1 4b02          	push	#2
2187  08f3 ae5000        	ldw	x,#20480
2188  08f6 cd0000        	call	_GPIO_WriteHigh
2190  08f9 84            	pop	a
2193  08fa 4b40          	push	#64
2194  08fc ae500a        	ldw	x,#20490
2195  08ff cd0000        	call	_GPIO_WriteHigh
2197  0902 84            	pop	a
2198                     ; 192     delay(DELAY_DISPLAY_TEST);
2200  0903 ae01f4        	ldw	x,#500
2201  0906 89            	pushw	x
2202  0907 ae0000        	ldw	x,#0
2203  090a 89            	pushw	x
2204  090b cd0000        	call	_delay
2206  090e 5b04          	addw	sp,#4
2207                     ; 193     display_nine();    
2209  0910 4b20          	push	#32
2210  0912 ae500f        	ldw	x,#20495
2211  0915 cd0000        	call	_GPIO_WriteHigh
2213  0918 84            	pop	a
2216  0919 4b04          	push	#4
2217  091b ae5000        	ldw	x,#20480
2218  091e cd0000        	call	_GPIO_WriteHigh
2220  0921 84            	pop	a
2223  0922 4b80          	push	#128
2224  0924 ae500a        	ldw	x,#20490
2225  0927 cd0000        	call	_GPIO_WriteHigh
2227  092a 84            	pop	a
2230  092b 4b08          	push	#8
2231  092d ae500f        	ldw	x,#20495
2232  0930 cd0000        	call	_GPIO_WriteHigh
2234  0933 84            	pop	a
2237  0934 4b02          	push	#2
2238  0936 ae500f        	ldw	x,#20495
2239  0939 cd0000        	call	_GPIO_WriteLow
2241  093c 84            	pop	a
2244  093d 4b02          	push	#2
2245  093f ae5000        	ldw	x,#20480
2246  0942 cd0000        	call	_GPIO_WriteHigh
2248  0945 84            	pop	a
2251  0946 4b40          	push	#64
2252  0948 ae500a        	ldw	x,#20490
2253  094b cd0000        	call	_GPIO_WriteHigh
2255  094e 84            	pop	a
2256                     ; 194     delay(DELAY_DISPLAY_TEST);
2258  094f ae01f4        	ldw	x,#500
2259  0952 89            	pushw	x
2260  0953 ae0000        	ldw	x,#0
2261  0956 89            	pushw	x
2262  0957 cd0000        	call	_delay
2264  095a 5b04          	addw	sp,#4
2265                     ; 195     display_off();
2267  095c 4b20          	push	#32
2268  095e ae500f        	ldw	x,#20495
2269  0961 cd0000        	call	_GPIO_WriteLow
2271  0964 84            	pop	a
2274  0965 4b04          	push	#4
2275  0967 ae5000        	ldw	x,#20480
2276  096a cd0000        	call	_GPIO_WriteLow
2278  096d 84            	pop	a
2281  096e 4b80          	push	#128
2282  0970 ae500a        	ldw	x,#20490
2283  0973 cd0000        	call	_GPIO_WriteLow
2285  0976 84            	pop	a
2288  0977 4b08          	push	#8
2289  0979 ae500f        	ldw	x,#20495
2290  097c cd0000        	call	_GPIO_WriteLow
2292  097f 84            	pop	a
2295  0980 4b02          	push	#2
2296  0982 ae500f        	ldw	x,#20495
2297  0985 cd0000        	call	_GPIO_WriteLow
2299  0988 84            	pop	a
2302  0989 4b02          	push	#2
2303  098b ae5000        	ldw	x,#20480
2304  098e cd0000        	call	_GPIO_WriteLow
2306  0991 84            	pop	a
2309  0992 4b40          	push	#64
2310  0994 ae500a        	ldw	x,#20490
2311  0997 cd0000        	call	_GPIO_WriteLow
2313  099a 84            	pop	a
2316  099b 4b04          	push	#4
2317  099d ae500f        	ldw	x,#20495
2318  09a0 cd0000        	call	_GPIO_WriteLow
2320  09a3 84            	pop	a
2321                     ; 196     dp_on();
2324  09a4 4b04          	push	#4
2325  09a6 ae500f        	ldw	x,#20495
2326  09a9 cd0000        	call	_GPIO_WriteHigh
2328  09ac 84            	pop	a
2329                     ; 197     delay(DELAY_DISPLAY_TEST);
2331  09ad ae01f4        	ldw	x,#500
2332  09b0 89            	pushw	x
2333  09b1 ae0000        	ldw	x,#0
2334  09b4 89            	pushw	x
2335  09b5 cd0000        	call	_delay
2337  09b8 5b04          	addw	sp,#4
2338                     ; 198     dp_off();
2340  09ba 4b04          	push	#4
2341  09bc ae500f        	ldw	x,#20495
2342  09bf cd0000        	call	_GPIO_WriteLow
2344  09c2 84            	pop	a
2345                     ; 199 }
2348  09c3 81            	ret
2376                     ; 202 void init_display(void)
2376                     ; 203 {
2377                     	switch	.text
2378  09c4               _init_display:
2382                     ; 207     seg_a_dir();
2384  09c4 4be0          	push	#224
2385  09c6 4b20          	push	#32
2386  09c8 ae500f        	ldw	x,#20495
2387  09cb cd0000        	call	_GPIO_Init
2389  09ce 85            	popw	x
2390                     ; 208     seg_b_dir();
2393  09cf 4be0          	push	#224
2394  09d1 4b04          	push	#4
2395  09d3 ae5000        	ldw	x,#20480
2396  09d6 cd0000        	call	_GPIO_Init
2398  09d9 85            	popw	x
2399                     ; 209     seg_c_dir();
2402  09da 4be0          	push	#224
2403  09dc 4b80          	push	#128
2404  09de ae500a        	ldw	x,#20490
2405  09e1 cd0000        	call	_GPIO_Init
2407  09e4 85            	popw	x
2408                     ; 210     seg_d_dir();
2411  09e5 4be0          	push	#224
2412  09e7 4b08          	push	#8
2413  09e9 ae500f        	ldw	x,#20495
2414  09ec cd0000        	call	_GPIO_Init
2416  09ef 85            	popw	x
2417                     ; 211     seg_e_dir();
2420  09f0 4be0          	push	#224
2421  09f2 4b02          	push	#2
2422  09f4 ae500f        	ldw	x,#20495
2423  09f7 cd0000        	call	_GPIO_Init
2425  09fa 85            	popw	x
2426                     ; 212     seg_f_dir();
2429  09fb 4be0          	push	#224
2430  09fd 4b02          	push	#2
2431  09ff ae5000        	ldw	x,#20480
2432  0a02 cd0000        	call	_GPIO_Init
2434  0a05 85            	popw	x
2435                     ; 213     seg_g_dir();
2438  0a06 4be0          	push	#224
2439  0a08 4b40          	push	#64
2440  0a0a ae500a        	ldw	x,#20490
2441  0a0d cd0000        	call	_GPIO_Init
2443  0a10 85            	popw	x
2444                     ; 214     dp_dir();
2447  0a11 4be0          	push	#224
2448  0a13 4b04          	push	#4
2449  0a15 ae500f        	ldw	x,#20495
2450  0a18 cd0000        	call	_GPIO_Init
2452  0a1b 85            	popw	x
2453                     ; 215     dig1_dir();
2456  0a1c 4be0          	push	#224
2457  0a1e 4b10          	push	#16
2458  0a20 ae500f        	ldw	x,#20495
2459  0a23 cd0000        	call	_GPIO_Init
2461  0a26 85            	popw	x
2462                     ; 216     dig2_dir();
2465  0a27 4be0          	push	#224
2466  0a29 4b20          	push	#32
2467  0a2b ae5005        	ldw	x,#20485
2468  0a2e cd0000        	call	_GPIO_Init
2470  0a31 85            	popw	x
2471                     ; 217     dig3_dir();
2474  0a32 4be0          	push	#224
2475  0a34 4b10          	push	#16
2476  0a36 ae5005        	ldw	x,#20485
2477  0a39 cd0000        	call	_GPIO_Init
2479  0a3c 85            	popw	x
2480                     ; 220     dig1_on();
2483  0a3d 4b10          	push	#16
2484  0a3f ae500f        	ldw	x,#20495
2485  0a42 cd0000        	call	_GPIO_WriteLow
2487  0a45 84            	pop	a
2488                     ; 221     dig2_on();
2490  0a46 4b20          	push	#32
2491  0a48 ae5005        	ldw	x,#20485
2492  0a4b cd0000        	call	_GPIO_WriteLow
2494  0a4e 84            	pop	a
2495                     ; 222     dig3_on();
2497  0a4f 4b10          	push	#16
2498  0a51 ae5005        	ldw	x,#20485
2499  0a54 cd0000        	call	_GPIO_WriteLow
2501  0a57 84            	pop	a
2502                     ; 224     display_all();
2504  0a58 4b20          	push	#32
2505  0a5a ae500f        	ldw	x,#20495
2506  0a5d cd0000        	call	_GPIO_WriteHigh
2508  0a60 84            	pop	a
2511  0a61 4b04          	push	#4
2512  0a63 ae5000        	ldw	x,#20480
2513  0a66 cd0000        	call	_GPIO_WriteHigh
2515  0a69 84            	pop	a
2518  0a6a 4b80          	push	#128
2519  0a6c ae500a        	ldw	x,#20490
2520  0a6f cd0000        	call	_GPIO_WriteHigh
2522  0a72 84            	pop	a
2525  0a73 4b08          	push	#8
2526  0a75 ae500f        	ldw	x,#20495
2527  0a78 cd0000        	call	_GPIO_WriteHigh
2529  0a7b 84            	pop	a
2532  0a7c 4b02          	push	#2
2533  0a7e ae500f        	ldw	x,#20495
2534  0a81 cd0000        	call	_GPIO_WriteHigh
2536  0a84 84            	pop	a
2539  0a85 4b02          	push	#2
2540  0a87 ae5000        	ldw	x,#20480
2541  0a8a cd0000        	call	_GPIO_WriteHigh
2543  0a8d 84            	pop	a
2546  0a8e 4b40          	push	#64
2547  0a90 ae500a        	ldw	x,#20490
2548  0a93 cd0000        	call	_GPIO_WriteHigh
2550  0a96 84            	pop	a
2553  0a97 4b04          	push	#4
2554  0a99 ae500f        	ldw	x,#20495
2555  0a9c cd0000        	call	_GPIO_WriteHigh
2557  0a9f 84            	pop	a
2558                     ; 225     delay(2*DELAY_DISPLAY_TEST);
2561  0aa0 ae03e8        	ldw	x,#1000
2562  0aa3 89            	pushw	x
2563  0aa4 ae0000        	ldw	x,#0
2564  0aa7 89            	pushw	x
2565  0aa8 cd0000        	call	_delay
2567  0aab 5b04          	addw	sp,#4
2568                     ; 226     display_off();
2570  0aad 4b20          	push	#32
2571  0aaf ae500f        	ldw	x,#20495
2572  0ab2 cd0000        	call	_GPIO_WriteLow
2574  0ab5 84            	pop	a
2577  0ab6 4b04          	push	#4
2578  0ab8 ae5000        	ldw	x,#20480
2579  0abb cd0000        	call	_GPIO_WriteLow
2581  0abe 84            	pop	a
2584  0abf 4b80          	push	#128
2585  0ac1 ae500a        	ldw	x,#20490
2586  0ac4 cd0000        	call	_GPIO_WriteLow
2588  0ac7 84            	pop	a
2591  0ac8 4b08          	push	#8
2592  0aca ae500f        	ldw	x,#20495
2593  0acd cd0000        	call	_GPIO_WriteLow
2595  0ad0 84            	pop	a
2598  0ad1 4b02          	push	#2
2599  0ad3 ae500f        	ldw	x,#20495
2600  0ad6 cd0000        	call	_GPIO_WriteLow
2602  0ad9 84            	pop	a
2605  0ada 4b02          	push	#2
2606  0adc ae5000        	ldw	x,#20480
2607  0adf cd0000        	call	_GPIO_WriteLow
2609  0ae2 84            	pop	a
2612  0ae3 4b40          	push	#64
2613  0ae5 ae500a        	ldw	x,#20490
2614  0ae8 cd0000        	call	_GPIO_WriteLow
2616  0aeb 84            	pop	a
2619  0aec 4b04          	push	#4
2620  0aee ae500f        	ldw	x,#20495
2621  0af1 cd0000        	call	_GPIO_WriteLow
2623  0af4 84            	pop	a
2624                     ; 227     delay(DELAY_DISPLAY_TEST);
2627  0af5 ae01f4        	ldw	x,#500
2628  0af8 89            	pushw	x
2629  0af9 ae0000        	ldw	x,#0
2630  0afc 89            	pushw	x
2631  0afd cd0000        	call	_delay
2633  0b00 5b04          	addw	sp,#4
2634                     ; 228     display_all();
2636  0b02 4b20          	push	#32
2637  0b04 ae500f        	ldw	x,#20495
2638  0b07 cd0000        	call	_GPIO_WriteHigh
2640  0b0a 84            	pop	a
2643  0b0b 4b04          	push	#4
2644  0b0d ae5000        	ldw	x,#20480
2645  0b10 cd0000        	call	_GPIO_WriteHigh
2647  0b13 84            	pop	a
2650  0b14 4b80          	push	#128
2651  0b16 ae500a        	ldw	x,#20490
2652  0b19 cd0000        	call	_GPIO_WriteHigh
2654  0b1c 84            	pop	a
2657  0b1d 4b08          	push	#8
2658  0b1f ae500f        	ldw	x,#20495
2659  0b22 cd0000        	call	_GPIO_WriteHigh
2661  0b25 84            	pop	a
2664  0b26 4b02          	push	#2
2665  0b28 ae500f        	ldw	x,#20495
2666  0b2b cd0000        	call	_GPIO_WriteHigh
2668  0b2e 84            	pop	a
2671  0b2f 4b02          	push	#2
2672  0b31 ae5000        	ldw	x,#20480
2673  0b34 cd0000        	call	_GPIO_WriteHigh
2675  0b37 84            	pop	a
2678  0b38 4b40          	push	#64
2679  0b3a ae500a        	ldw	x,#20490
2680  0b3d cd0000        	call	_GPIO_WriteHigh
2682  0b40 84            	pop	a
2685  0b41 4b04          	push	#4
2686  0b43 ae500f        	ldw	x,#20495
2687  0b46 cd0000        	call	_GPIO_WriteHigh
2689  0b49 84            	pop	a
2690                     ; 229     delay(2*DELAY_DISPLAY_TEST);
2693  0b4a ae03e8        	ldw	x,#1000
2694  0b4d 89            	pushw	x
2695  0b4e ae0000        	ldw	x,#0
2696  0b51 89            	pushw	x
2697  0b52 cd0000        	call	_delay
2699  0b55 5b04          	addw	sp,#4
2700                     ; 230     display_off();
2702  0b57 4b20          	push	#32
2703  0b59 ae500f        	ldw	x,#20495
2704  0b5c cd0000        	call	_GPIO_WriteLow
2706  0b5f 84            	pop	a
2709  0b60 4b04          	push	#4
2710  0b62 ae5000        	ldw	x,#20480
2711  0b65 cd0000        	call	_GPIO_WriteLow
2713  0b68 84            	pop	a
2716  0b69 4b80          	push	#128
2717  0b6b ae500a        	ldw	x,#20490
2718  0b6e cd0000        	call	_GPIO_WriteLow
2720  0b71 84            	pop	a
2723  0b72 4b08          	push	#8
2724  0b74 ae500f        	ldw	x,#20495
2725  0b77 cd0000        	call	_GPIO_WriteLow
2727  0b7a 84            	pop	a
2730  0b7b 4b02          	push	#2
2731  0b7d ae500f        	ldw	x,#20495
2732  0b80 cd0000        	call	_GPIO_WriteLow
2734  0b83 84            	pop	a
2737  0b84 4b02          	push	#2
2738  0b86 ae5000        	ldw	x,#20480
2739  0b89 cd0000        	call	_GPIO_WriteLow
2741  0b8c 84            	pop	a
2744  0b8d 4b40          	push	#64
2745  0b8f ae500a        	ldw	x,#20490
2746  0b92 cd0000        	call	_GPIO_WriteLow
2748  0b95 84            	pop	a
2751  0b96 4b04          	push	#4
2752  0b98 ae500f        	ldw	x,#20495
2753  0b9b cd0000        	call	_GPIO_WriteLow
2755  0b9e 84            	pop	a
2756                     ; 231     delay(DELAY_DISPLAY_TEST);
2759  0b9f ae01f4        	ldw	x,#500
2760  0ba2 89            	pushw	x
2761  0ba3 ae0000        	ldw	x,#0
2762  0ba6 89            	pushw	x
2763  0ba7 cd0000        	call	_delay
2765  0baa 5b04          	addw	sp,#4
2766                     ; 232     display_all();
2768  0bac 4b20          	push	#32
2769  0bae ae500f        	ldw	x,#20495
2770  0bb1 cd0000        	call	_GPIO_WriteHigh
2772  0bb4 84            	pop	a
2775  0bb5 4b04          	push	#4
2776  0bb7 ae5000        	ldw	x,#20480
2777  0bba cd0000        	call	_GPIO_WriteHigh
2779  0bbd 84            	pop	a
2782  0bbe 4b80          	push	#128
2783  0bc0 ae500a        	ldw	x,#20490
2784  0bc3 cd0000        	call	_GPIO_WriteHigh
2786  0bc6 84            	pop	a
2789  0bc7 4b08          	push	#8
2790  0bc9 ae500f        	ldw	x,#20495
2791  0bcc cd0000        	call	_GPIO_WriteHigh
2793  0bcf 84            	pop	a
2796  0bd0 4b02          	push	#2
2797  0bd2 ae500f        	ldw	x,#20495
2798  0bd5 cd0000        	call	_GPIO_WriteHigh
2800  0bd8 84            	pop	a
2803  0bd9 4b02          	push	#2
2804  0bdb ae5000        	ldw	x,#20480
2805  0bde cd0000        	call	_GPIO_WriteHigh
2807  0be1 84            	pop	a
2810  0be2 4b40          	push	#64
2811  0be4 ae500a        	ldw	x,#20490
2812  0be7 cd0000        	call	_GPIO_WriteHigh
2814  0bea 84            	pop	a
2817  0beb 4b04          	push	#4
2818  0bed ae500f        	ldw	x,#20495
2819  0bf0 cd0000        	call	_GPIO_WriteHigh
2821  0bf3 84            	pop	a
2822                     ; 233     delay(2*DELAY_DISPLAY_TEST);
2825  0bf4 ae03e8        	ldw	x,#1000
2826  0bf7 89            	pushw	x
2827  0bf8 ae0000        	ldw	x,#0
2828  0bfb 89            	pushw	x
2829  0bfc cd0000        	call	_delay
2831  0bff 5b04          	addw	sp,#4
2832                     ; 234     display_off();
2834  0c01 4b20          	push	#32
2835  0c03 ae500f        	ldw	x,#20495
2836  0c06 cd0000        	call	_GPIO_WriteLow
2838  0c09 84            	pop	a
2841  0c0a 4b04          	push	#4
2842  0c0c ae5000        	ldw	x,#20480
2843  0c0f cd0000        	call	_GPIO_WriteLow
2845  0c12 84            	pop	a
2848  0c13 4b80          	push	#128
2849  0c15 ae500a        	ldw	x,#20490
2850  0c18 cd0000        	call	_GPIO_WriteLow
2852  0c1b 84            	pop	a
2855  0c1c 4b08          	push	#8
2856  0c1e ae500f        	ldw	x,#20495
2857  0c21 cd0000        	call	_GPIO_WriteLow
2859  0c24 84            	pop	a
2862  0c25 4b02          	push	#2
2863  0c27 ae500f        	ldw	x,#20495
2864  0c2a cd0000        	call	_GPIO_WriteLow
2866  0c2d 84            	pop	a
2869  0c2e 4b02          	push	#2
2870  0c30 ae5000        	ldw	x,#20480
2871  0c33 cd0000        	call	_GPIO_WriteLow
2873  0c36 84            	pop	a
2876  0c37 4b40          	push	#64
2877  0c39 ae500a        	ldw	x,#20490
2878  0c3c cd0000        	call	_GPIO_WriteLow
2880  0c3f 84            	pop	a
2883  0c40 4b04          	push	#4
2884  0c42 ae500f        	ldw	x,#20495
2885  0c45 cd0000        	call	_GPIO_WriteLow
2887  0c48 84            	pop	a
2888                     ; 236     display_test = 0;
2891  0c49 3f00          	clr	_display_test
2892                     ; 239     dig1_off();
2894  0c4b 4b10          	push	#16
2895  0c4d ae500f        	ldw	x,#20495
2896  0c50 cd0000        	call	_GPIO_WriteHigh
2898  0c53 84            	pop	a
2899                     ; 240     dig2_off();
2901  0c54 4b20          	push	#32
2902  0c56 ae5005        	ldw	x,#20485
2903  0c59 cd0000        	call	_GPIO_WriteHigh
2905  0c5c 84            	pop	a
2906                     ; 241     dig3_off();
2908  0c5d 4b10          	push	#16
2909  0c5f ae5005        	ldw	x,#20485
2910  0c62 cd0000        	call	_GPIO_WriteHigh
2912  0c65 84            	pop	a
2913                     ; 244 }
2916  0c66 81            	ret
2960                     	xdef	_test_display
2961                     	xdef	_wr_digit
2962                     	xdef	_dec2bcd
2963                     	switch	.ubsct
2964  0000               _dp:
2965  0000 000000        	ds.b	3
2966                     	xdef	_dp
2967                     	xdef	_display_num
2968                     	xdef	_display_test
2969                     	xref.b	_tick
2970                     	xref	_delay
2971                     	xdef	_set_option_display
2972                     	xdef	_set_display
2973                     	xdef	_tmr_display
2974                     	xdef	_task_display
2975                     	xdef	_init_display
2976                     	xref	_GPIO_WriteLow
2977                     	xref	_GPIO_WriteHigh
2978                     	xref	_GPIO_Init
2998                     	end
