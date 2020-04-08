   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  15                     	bsct
  16  0000               _display_num:
  17  0000 41            	dc.b	65
  18  0001 00            	dc.b	0
  19  0002 00            	dc.b	0
  20  0003               _dp:
  21  0003 00            	dc.b	0
  22  0004 00            	dc.b	0
  23  0005 00            	dc.b	0
  63                     ; 21 uint8_t dec2bcd(uint8_t val)
  63                     ; 22 {
  65                     	switch	.text
  66  0000               _dec2bcd:
  68  0000 88            	push	a
  69  0001 88            	push	a
  70       00000001      OFST:	set	1
  73                     ; 23     return (uint8_t)((val/10*16) + (val%10));
  75  0002 5f            	clrw	x
  76  0003 97            	ld	xl,a
  77  0004 a60a          	ld	a,#10
  78  0006 62            	div	x,a
  79  0007 5f            	clrw	x
  80  0008 97            	ld	xl,a
  81  0009 9f            	ld	a,xl
  82  000a 6b01          	ld	(OFST+0,sp),a
  84  000c 7b02          	ld	a,(OFST+1,sp)
  85  000e 5f            	clrw	x
  86  000f 97            	ld	xl,a
  87  0010 a60a          	ld	a,#10
  88  0012 62            	div	x,a
  89  0013 9f            	ld	a,xl
  90  0014 97            	ld	xl,a
  91  0015 a610          	ld	a,#16
  92  0017 42            	mul	x,a
  93  0018 9f            	ld	a,xl
  94  0019 1b01          	add	a,(OFST+0,sp)
  97  001b 85            	popw	x
  98  001c 81            	ret
 152                     ; 26 void set_display(uint8_t option, uint8_t value, uint8_t decimal)
 152                     ; 27 {
 153                     	switch	.text
 154  001d               _set_display:
 156  001d 89            	pushw	x
 157  001e 88            	push	a
 158       00000001      OFST:	set	1
 161                     ; 31     bcd = (uint8_t)dec2bcd(value);
 163  001f 9f            	ld	a,xl
 164  0020 adde          	call	_dec2bcd
 166  0022 6b01          	ld	(OFST+0,sp),a
 168                     ; 33     if (value > MAX_DISPLAY_VALUE)
 170  0024 7b03          	ld	a,(OFST+2,sp)
 171  0026 a164          	cp	a,#100
 172  0028 2504          	jrult	L55
 173                     ; 34         value = MAX_DISPLAY_VALUE;
 175  002a a663          	ld	a,#99
 176  002c 6b03          	ld	(OFST+2,sp),a
 177  002e               L55:
 178                     ; 36     display_num[DIG1_POS] = option;
 180  002e 7b02          	ld	a,(OFST+1,sp)
 181  0030 b700          	ld	_display_num,a
 182                     ; 37     display_num[DIG2_POS] = (uint8_t)(bcd >> 4);
 184  0032 7b01          	ld	a,(OFST+0,sp)
 185  0034 4e            	swap	a
 186  0035 a40f          	and	a,#15
 187  0037 b701          	ld	_display_num+1,a
 188                     ; 38     display_num[DIG3_POS] = (uint8_t)(bcd & 0x0F);
 190  0039 7b01          	ld	a,(OFST+0,sp)
 191  003b a40f          	and	a,#15
 192  003d b702          	ld	_display_num+2,a
 193                     ; 40 }
 196  003f 5b03          	addw	sp,#3
 197  0041 81            	ret
 242                     ; 42 void set_option_display(uint8_t option, uint8_t en_dp)
 242                     ; 43 {
 243                     	switch	.text
 244  0042               _set_option_display:
 248                     ; 45     display_num[DIG1_POS] = option;
 250  0042 9e            	ld	a,xh
 251  0043 b700          	ld	_display_num,a
 252                     ; 46     dp[DIG1_POS] = en_dp;
 254  0045 9f            	ld	a,xl
 255  0046 b703          	ld	_dp,a
 256                     ; 48 }
 259  0048 81            	ret
 297                     .const:	section	.text
 298  0000               L61:
 299  0000 00be          	dc.w	L101
 300  0002 0101          	dc.w	L301
 301  0004 0144          	dc.w	L501
 302  0006 0187          	dc.w	L701
 303  0008 01ca          	dc.w	L111
 304  000a 020d          	dc.w	L311
 305  000c 0250          	dc.w	L511
 306  000e 0293          	dc.w	L711
 307  0010 02d6          	dc.w	L121
 308  0012 0319          	dc.w	L321
 309                     ; 50 void wr_digit(uint8_t dig_pos)
 309                     ; 51 {
 310                     	switch	.text
 311  0049               _wr_digit:
 313  0049 88            	push	a
 314       00000000      OFST:	set	0
 317                     ; 54     if (dp[dig_pos]) {
 319  004a 5f            	clrw	x
 320  004b 97            	ld	xl,a
 321  004c 6d03          	tnz	(_dp,x)
 322  004e 270b          	jreq	L761
 323                     ; 55         dp_on();
 325  0050 4b04          	push	#4
 326  0052 ae500f        	ldw	x,#20495
 327  0055 cd0000        	call	_GPIO_WriteHigh
 329  0058 84            	pop	a
 331  0059 2009          	jra	L171
 332  005b               L761:
 333                     ; 57         dp_off();
 335  005b 4b04          	push	#4
 336  005d ae500f        	ldw	x,#20495
 337  0060 cd0000        	call	_GPIO_WriteLow
 339  0063 84            	pop	a
 340  0064               L171:
 341                     ; 60     switch (display_num[dig_pos]) {
 343  0064 7b01          	ld	a,(OFST+1,sp)
 344  0066 5f            	clrw	x
 345  0067 97            	ld	xl,a
 346  0068 e600          	ld	a,(_display_num,x)
 348                     ; 120         break;
 349  006a a10a          	cp	a,#10
 350  006c 2407          	jruge	L41
 351  006e 5f            	clrw	x
 352  006f 97            	ld	xl,a
 353  0070 58            	sllw	x
 354  0071 de0000        	ldw	x,(L61,x)
 355  0074 fc            	jp	(x)
 356  0075               L41:
 357  0075 a041          	sub	a,#65
 358  0077 2603          	jrne	L02
 359  0079 cc035c        	jp	L521
 360  007c               L02:
 361  007c a002          	sub	a,#2
 362  007e 2603          	jrne	L22
 363  0080 cc03e2        	jp	L131
 364  0083               L22:
 365  0083 a002          	sub	a,#2
 366  0085 2603          	jrne	L42
 367  0087 cc0468        	jp	L531
 368  008a               L42:
 369  008a 4a            	dec	a
 370  008b 2603          	jrne	L62
 371  008d cc04ab        	jp	L731
 372  0090               L62:
 373  0090 a002          	sub	a,#2
 374  0092 2603          	jrne	L03
 375  0094 cc04ee        	jp	L141
 376  0097               L03:
 377  0097 a004          	sub	a,#4
 378  0099 2603          	jrne	L23
 379  009b cc0531        	jp	L341
 380  009e               L23:
 381  009e a004          	sub	a,#4
 382  00a0 2603          	jrne	L43
 383  00a2 cc0573        	jp	L541
 384  00a5               L43:
 385  00a5 a005          	sub	a,#5
 386  00a7 2603          	jrne	L63
 387  00a9 cc05b4        	jp	L741
 388  00ac               L63:
 389  00ac a00d          	sub	a,#13
 390  00ae 2603          	jrne	L04
 391  00b0 cc039f        	jp	L721
 392  00b3               L04:
 393  00b3 a002          	sub	a,#2
 394  00b5 2603          	jrne	L24
 395  00b7 cc0425        	jp	L331
 396  00ba               L24:
 397  00ba acf305f3      	jpf	L571
 398  00be               L101:
 399                     ; 61     case 0x00:
 399                     ; 62         display_zero();
 401  00be 4b20          	push	#32
 402  00c0 ae500f        	ldw	x,#20495
 403  00c3 cd0000        	call	_GPIO_WriteHigh
 405  00c6 84            	pop	a
 408  00c7 4b04          	push	#4
 409  00c9 ae5000        	ldw	x,#20480
 410  00cc cd0000        	call	_GPIO_WriteHigh
 412  00cf 84            	pop	a
 415  00d0 4b80          	push	#128
 416  00d2 ae500a        	ldw	x,#20490
 417  00d5 cd0000        	call	_GPIO_WriteHigh
 419  00d8 84            	pop	a
 422  00d9 4b08          	push	#8
 423  00db ae500f        	ldw	x,#20495
 424  00de cd0000        	call	_GPIO_WriteHigh
 426  00e1 84            	pop	a
 429  00e2 4b02          	push	#2
 430  00e4 ae500f        	ldw	x,#20495
 431  00e7 cd0000        	call	_GPIO_WriteHigh
 433  00ea 84            	pop	a
 436  00eb 4b02          	push	#2
 437  00ed ae5000        	ldw	x,#20480
 438  00f0 cd0000        	call	_GPIO_WriteHigh
 440  00f3 84            	pop	a
 443  00f4 4b40          	push	#64
 444  00f6 ae500a        	ldw	x,#20490
 445  00f9 cd0000        	call	_GPIO_WriteLow
 447  00fc 84            	pop	a
 448                     ; 63         break;
 450  00fd acf305f3      	jpf	L571
 451  0101               L301:
 452                     ; 64     case 0x01:
 452                     ; 65         display_one();
 454  0101 4b20          	push	#32
 455  0103 ae500f        	ldw	x,#20495
 456  0106 cd0000        	call	_GPIO_WriteLow
 458  0109 84            	pop	a
 461  010a 4b04          	push	#4
 462  010c ae5000        	ldw	x,#20480
 463  010f cd0000        	call	_GPIO_WriteHigh
 465  0112 84            	pop	a
 468  0113 4b80          	push	#128
 469  0115 ae500a        	ldw	x,#20490
 470  0118 cd0000        	call	_GPIO_WriteHigh
 472  011b 84            	pop	a
 475  011c 4b08          	push	#8
 476  011e ae500f        	ldw	x,#20495
 477  0121 cd0000        	call	_GPIO_WriteLow
 479  0124 84            	pop	a
 482  0125 4b02          	push	#2
 483  0127 ae500f        	ldw	x,#20495
 484  012a cd0000        	call	_GPIO_WriteLow
 486  012d 84            	pop	a
 489  012e 4b02          	push	#2
 490  0130 ae5000        	ldw	x,#20480
 491  0133 cd0000        	call	_GPIO_WriteLow
 493  0136 84            	pop	a
 496  0137 4b40          	push	#64
 497  0139 ae500a        	ldw	x,#20490
 498  013c cd0000        	call	_GPIO_WriteLow
 500  013f 84            	pop	a
 501                     ; 66         break;
 503  0140 acf305f3      	jpf	L571
 504  0144               L501:
 505                     ; 67     case 0x02:
 505                     ; 68         display_two();
 507  0144 4b20          	push	#32
 508  0146 ae500f        	ldw	x,#20495
 509  0149 cd0000        	call	_GPIO_WriteHigh
 511  014c 84            	pop	a
 514  014d 4b04          	push	#4
 515  014f ae5000        	ldw	x,#20480
 516  0152 cd0000        	call	_GPIO_WriteHigh
 518  0155 84            	pop	a
 521  0156 4b80          	push	#128
 522  0158 ae500a        	ldw	x,#20490
 523  015b cd0000        	call	_GPIO_WriteLow
 525  015e 84            	pop	a
 528  015f 4b08          	push	#8
 529  0161 ae500f        	ldw	x,#20495
 530  0164 cd0000        	call	_GPIO_WriteHigh
 532  0167 84            	pop	a
 535  0168 4b02          	push	#2
 536  016a ae500f        	ldw	x,#20495
 537  016d cd0000        	call	_GPIO_WriteHigh
 539  0170 84            	pop	a
 542  0171 4b02          	push	#2
 543  0173 ae5000        	ldw	x,#20480
 544  0176 cd0000        	call	_GPIO_WriteLow
 546  0179 84            	pop	a
 549  017a 4b40          	push	#64
 550  017c ae500a        	ldw	x,#20490
 551  017f cd0000        	call	_GPIO_WriteHigh
 553  0182 84            	pop	a
 554                     ; 69         break;
 556  0183 acf305f3      	jpf	L571
 557  0187               L701:
 558                     ; 70     case 0x03:
 558                     ; 71         display_three();
 560  0187 4b20          	push	#32
 561  0189 ae500f        	ldw	x,#20495
 562  018c cd0000        	call	_GPIO_WriteHigh
 564  018f 84            	pop	a
 567  0190 4b04          	push	#4
 568  0192 ae5000        	ldw	x,#20480
 569  0195 cd0000        	call	_GPIO_WriteHigh
 571  0198 84            	pop	a
 574  0199 4b80          	push	#128
 575  019b ae500a        	ldw	x,#20490
 576  019e cd0000        	call	_GPIO_WriteHigh
 578  01a1 84            	pop	a
 581  01a2 4b08          	push	#8
 582  01a4 ae500f        	ldw	x,#20495
 583  01a7 cd0000        	call	_GPIO_WriteHigh
 585  01aa 84            	pop	a
 588  01ab 4b02          	push	#2
 589  01ad ae500f        	ldw	x,#20495
 590  01b0 cd0000        	call	_GPIO_WriteLow
 592  01b3 84            	pop	a
 595  01b4 4b02          	push	#2
 596  01b6 ae5000        	ldw	x,#20480
 597  01b9 cd0000        	call	_GPIO_WriteLow
 599  01bc 84            	pop	a
 602  01bd 4b40          	push	#64
 603  01bf ae500a        	ldw	x,#20490
 604  01c2 cd0000        	call	_GPIO_WriteHigh
 606  01c5 84            	pop	a
 607                     ; 72         break;
 609  01c6 acf305f3      	jpf	L571
 610  01ca               L111:
 611                     ; 73     case 0x04:
 611                     ; 74         display_four();
 613  01ca 4b20          	push	#32
 614  01cc ae500f        	ldw	x,#20495
 615  01cf cd0000        	call	_GPIO_WriteLow
 617  01d2 84            	pop	a
 620  01d3 4b04          	push	#4
 621  01d5 ae5000        	ldw	x,#20480
 622  01d8 cd0000        	call	_GPIO_WriteHigh
 624  01db 84            	pop	a
 627  01dc 4b80          	push	#128
 628  01de ae500a        	ldw	x,#20490
 629  01e1 cd0000        	call	_GPIO_WriteHigh
 631  01e4 84            	pop	a
 634  01e5 4b08          	push	#8
 635  01e7 ae500f        	ldw	x,#20495
 636  01ea cd0000        	call	_GPIO_WriteLow
 638  01ed 84            	pop	a
 641  01ee 4b02          	push	#2
 642  01f0 ae500f        	ldw	x,#20495
 643  01f3 cd0000        	call	_GPIO_WriteLow
 645  01f6 84            	pop	a
 648  01f7 4b02          	push	#2
 649  01f9 ae5000        	ldw	x,#20480
 650  01fc cd0000        	call	_GPIO_WriteHigh
 652  01ff 84            	pop	a
 655  0200 4b40          	push	#64
 656  0202 ae500a        	ldw	x,#20490
 657  0205 cd0000        	call	_GPIO_WriteHigh
 659  0208 84            	pop	a
 660                     ; 75         break;
 662  0209 acf305f3      	jpf	L571
 663  020d               L311:
 664                     ; 76     case 0x05:
 664                     ; 77         display_five();
 666  020d 4b20          	push	#32
 667  020f ae500f        	ldw	x,#20495
 668  0212 cd0000        	call	_GPIO_WriteHigh
 670  0215 84            	pop	a
 673  0216 4b04          	push	#4
 674  0218 ae5000        	ldw	x,#20480
 675  021b cd0000        	call	_GPIO_WriteLow
 677  021e 84            	pop	a
 680  021f 4b80          	push	#128
 681  0221 ae500a        	ldw	x,#20490
 682  0224 cd0000        	call	_GPIO_WriteHigh
 684  0227 84            	pop	a
 687  0228 4b08          	push	#8
 688  022a ae500f        	ldw	x,#20495
 689  022d cd0000        	call	_GPIO_WriteHigh
 691  0230 84            	pop	a
 694  0231 4b02          	push	#2
 695  0233 ae500f        	ldw	x,#20495
 696  0236 cd0000        	call	_GPIO_WriteLow
 698  0239 84            	pop	a
 701  023a 4b02          	push	#2
 702  023c ae5000        	ldw	x,#20480
 703  023f cd0000        	call	_GPIO_WriteHigh
 705  0242 84            	pop	a
 708  0243 4b40          	push	#64
 709  0245 ae500a        	ldw	x,#20490
 710  0248 cd0000        	call	_GPIO_WriteHigh
 712  024b 84            	pop	a
 713                     ; 78         break;
 715  024c acf305f3      	jpf	L571
 716  0250               L511:
 717                     ; 79     case 0x06:
 717                     ; 80         display_six();
 719  0250 4b20          	push	#32
 720  0252 ae500f        	ldw	x,#20495
 721  0255 cd0000        	call	_GPIO_WriteHigh
 723  0258 84            	pop	a
 726  0259 4b04          	push	#4
 727  025b ae5000        	ldw	x,#20480
 728  025e cd0000        	call	_GPIO_WriteLow
 730  0261 84            	pop	a
 733  0262 4b80          	push	#128
 734  0264 ae500a        	ldw	x,#20490
 735  0267 cd0000        	call	_GPIO_WriteHigh
 737  026a 84            	pop	a
 740  026b 4b08          	push	#8
 741  026d ae500f        	ldw	x,#20495
 742  0270 cd0000        	call	_GPIO_WriteHigh
 744  0273 84            	pop	a
 747  0274 4b02          	push	#2
 748  0276 ae500f        	ldw	x,#20495
 749  0279 cd0000        	call	_GPIO_WriteHigh
 751  027c 84            	pop	a
 754  027d 4b02          	push	#2
 755  027f ae5000        	ldw	x,#20480
 756  0282 cd0000        	call	_GPIO_WriteHigh
 758  0285 84            	pop	a
 761  0286 4b40          	push	#64
 762  0288 ae500a        	ldw	x,#20490
 763  028b cd0000        	call	_GPIO_WriteHigh
 765  028e 84            	pop	a
 766                     ; 81         break;
 768  028f acf305f3      	jpf	L571
 769  0293               L711:
 770                     ; 82     case 0x07:
 770                     ; 83         display_seven();
 772  0293 4b20          	push	#32
 773  0295 ae500f        	ldw	x,#20495
 774  0298 cd0000        	call	_GPIO_WriteHigh
 776  029b 84            	pop	a
 779  029c 4b04          	push	#4
 780  029e ae5000        	ldw	x,#20480
 781  02a1 cd0000        	call	_GPIO_WriteHigh
 783  02a4 84            	pop	a
 786  02a5 4b80          	push	#128
 787  02a7 ae500a        	ldw	x,#20490
 788  02aa cd0000        	call	_GPIO_WriteHigh
 790  02ad 84            	pop	a
 793  02ae 4b08          	push	#8
 794  02b0 ae500f        	ldw	x,#20495
 795  02b3 cd0000        	call	_GPIO_WriteLow
 797  02b6 84            	pop	a
 800  02b7 4b02          	push	#2
 801  02b9 ae500f        	ldw	x,#20495
 802  02bc cd0000        	call	_GPIO_WriteLow
 804  02bf 84            	pop	a
 807  02c0 4b02          	push	#2
 808  02c2 ae5000        	ldw	x,#20480
 809  02c5 cd0000        	call	_GPIO_WriteLow
 811  02c8 84            	pop	a
 814  02c9 4b40          	push	#64
 815  02cb ae500a        	ldw	x,#20490
 816  02ce cd0000        	call	_GPIO_WriteLow
 818  02d1 84            	pop	a
 819                     ; 84         break;
 821  02d2 acf305f3      	jpf	L571
 822  02d6               L121:
 823                     ; 85     case 0x08:
 823                     ; 86         display_eight();
 825  02d6 4b20          	push	#32
 826  02d8 ae500f        	ldw	x,#20495
 827  02db cd0000        	call	_GPIO_WriteHigh
 829  02de 84            	pop	a
 832  02df 4b04          	push	#4
 833  02e1 ae5000        	ldw	x,#20480
 834  02e4 cd0000        	call	_GPIO_WriteHigh
 836  02e7 84            	pop	a
 839  02e8 4b80          	push	#128
 840  02ea ae500a        	ldw	x,#20490
 841  02ed cd0000        	call	_GPIO_WriteHigh
 843  02f0 84            	pop	a
 846  02f1 4b08          	push	#8
 847  02f3 ae500f        	ldw	x,#20495
 848  02f6 cd0000        	call	_GPIO_WriteHigh
 850  02f9 84            	pop	a
 853  02fa 4b02          	push	#2
 854  02fc ae500f        	ldw	x,#20495
 855  02ff cd0000        	call	_GPIO_WriteHigh
 857  0302 84            	pop	a
 860  0303 4b02          	push	#2
 861  0305 ae5000        	ldw	x,#20480
 862  0308 cd0000        	call	_GPIO_WriteHigh
 864  030b 84            	pop	a
 867  030c 4b40          	push	#64
 868  030e ae500a        	ldw	x,#20490
 869  0311 cd0000        	call	_GPIO_WriteHigh
 871  0314 84            	pop	a
 872                     ; 87         break;
 874  0315 acf305f3      	jpf	L571
 875  0319               L321:
 876                     ; 88     case 0x09:
 876                     ; 89         display_nine();
 878  0319 4b20          	push	#32
 879  031b ae500f        	ldw	x,#20495
 880  031e cd0000        	call	_GPIO_WriteHigh
 882  0321 84            	pop	a
 885  0322 4b04          	push	#4
 886  0324 ae5000        	ldw	x,#20480
 887  0327 cd0000        	call	_GPIO_WriteHigh
 889  032a 84            	pop	a
 892  032b 4b80          	push	#128
 893  032d ae500a        	ldw	x,#20490
 894  0330 cd0000        	call	_GPIO_WriteHigh
 896  0333 84            	pop	a
 899  0334 4b08          	push	#8
 900  0336 ae500f        	ldw	x,#20495
 901  0339 cd0000        	call	_GPIO_WriteHigh
 903  033c 84            	pop	a
 906  033d 4b02          	push	#2
 907  033f ae500f        	ldw	x,#20495
 908  0342 cd0000        	call	_GPIO_WriteLow
 910  0345 84            	pop	a
 913  0346 4b02          	push	#2
 914  0348 ae5000        	ldw	x,#20480
 915  034b cd0000        	call	_GPIO_WriteHigh
 917  034e 84            	pop	a
 920  034f 4b40          	push	#64
 921  0351 ae500a        	ldw	x,#20490
 922  0354 cd0000        	call	_GPIO_WriteHigh
 924  0357 84            	pop	a
 925                     ; 90         break;
 927  0358 acf305f3      	jpf	L571
 928  035c               L521:
 929                     ; 91     case 'A':
 929                     ; 92         display_a();
 931  035c 4b20          	push	#32
 932  035e ae500f        	ldw	x,#20495
 933  0361 cd0000        	call	_GPIO_WriteHigh
 935  0364 84            	pop	a
 938  0365 4b04          	push	#4
 939  0367 ae5000        	ldw	x,#20480
 940  036a cd0000        	call	_GPIO_WriteHigh
 942  036d 84            	pop	a
 945  036e 4b80          	push	#128
 946  0370 ae500a        	ldw	x,#20490
 947  0373 cd0000        	call	_GPIO_WriteHigh
 949  0376 84            	pop	a
 952  0377 4b08          	push	#8
 953  0379 ae500f        	ldw	x,#20495
 954  037c cd0000        	call	_GPIO_WriteLow
 956  037f 84            	pop	a
 959  0380 4b02          	push	#2
 960  0382 ae500f        	ldw	x,#20495
 961  0385 cd0000        	call	_GPIO_WriteHigh
 963  0388 84            	pop	a
 966  0389 4b02          	push	#2
 967  038b ae5000        	ldw	x,#20480
 968  038e cd0000        	call	_GPIO_WriteHigh
 970  0391 84            	pop	a
 973  0392 4b40          	push	#64
 974  0394 ae500a        	ldw	x,#20490
 975  0397 cd0000        	call	_GPIO_WriteHigh
 977  039a 84            	pop	a
 978                     ; 93         break;
 980  039b acf305f3      	jpf	L571
 981  039f               L721:
 982                     ; 94     case 'b':
 982                     ; 95         display_b();
 984  039f 4b20          	push	#32
 985  03a1 ae500f        	ldw	x,#20495
 986  03a4 cd0000        	call	_GPIO_WriteLow
 988  03a7 84            	pop	a
 991  03a8 4b04          	push	#4
 992  03aa ae5000        	ldw	x,#20480
 993  03ad cd0000        	call	_GPIO_WriteLow
 995  03b0 84            	pop	a
 998  03b1 4b80          	push	#128
 999  03b3 ae500a        	ldw	x,#20490
1000  03b6 cd0000        	call	_GPIO_WriteHigh
1002  03b9 84            	pop	a
1005  03ba 4b08          	push	#8
1006  03bc ae500f        	ldw	x,#20495
1007  03bf cd0000        	call	_GPIO_WriteHigh
1009  03c2 84            	pop	a
1012  03c3 4b02          	push	#2
1013  03c5 ae500f        	ldw	x,#20495
1014  03c8 cd0000        	call	_GPIO_WriteHigh
1016  03cb 84            	pop	a
1019  03cc 4b02          	push	#2
1020  03ce ae5000        	ldw	x,#20480
1021  03d1 cd0000        	call	_GPIO_WriteHigh
1023  03d4 84            	pop	a
1026  03d5 4b40          	push	#64
1027  03d7 ae500a        	ldw	x,#20490
1028  03da cd0000        	call	_GPIO_WriteHigh
1030  03dd 84            	pop	a
1031                     ; 96         break;
1033  03de acf305f3      	jpf	L571
1034  03e2               L131:
1035                     ; 97     case 'C':
1035                     ; 98         display_c();
1037  03e2 4b20          	push	#32
1038  03e4 ae500f        	ldw	x,#20495
1039  03e7 cd0000        	call	_GPIO_WriteHigh
1041  03ea 84            	pop	a
1044  03eb 4b04          	push	#4
1045  03ed ae5000        	ldw	x,#20480
1046  03f0 cd0000        	call	_GPIO_WriteLow
1048  03f3 84            	pop	a
1051  03f4 4b80          	push	#128
1052  03f6 ae500a        	ldw	x,#20490
1053  03f9 cd0000        	call	_GPIO_WriteLow
1055  03fc 84            	pop	a
1058  03fd 4b08          	push	#8
1059  03ff ae500f        	ldw	x,#20495
1060  0402 cd0000        	call	_GPIO_WriteHigh
1062  0405 84            	pop	a
1065  0406 4b02          	push	#2
1066  0408 ae500f        	ldw	x,#20495
1067  040b cd0000        	call	_GPIO_WriteHigh
1069  040e 84            	pop	a
1072  040f 4b02          	push	#2
1073  0411 ae5000        	ldw	x,#20480
1074  0414 cd0000        	call	_GPIO_WriteHigh
1076  0417 84            	pop	a
1079  0418 4b40          	push	#64
1080  041a ae500a        	ldw	x,#20490
1081  041d cd0000        	call	_GPIO_WriteLow
1083  0420 84            	pop	a
1084                     ; 99         break;
1086  0421 acf305f3      	jpf	L571
1087  0425               L331:
1088                     ; 100     case 'd':
1088                     ; 101         display_d();
1090  0425 4b20          	push	#32
1091  0427 ae500f        	ldw	x,#20495
1092  042a cd0000        	call	_GPIO_WriteLow
1094  042d 84            	pop	a
1097  042e 4b04          	push	#4
1098  0430 ae5000        	ldw	x,#20480
1099  0433 cd0000        	call	_GPIO_WriteHigh
1101  0436 84            	pop	a
1104  0437 4b80          	push	#128
1105  0439 ae500a        	ldw	x,#20490
1106  043c cd0000        	call	_GPIO_WriteHigh
1108  043f 84            	pop	a
1111  0440 4b08          	push	#8
1112  0442 ae500f        	ldw	x,#20495
1113  0445 cd0000        	call	_GPIO_WriteHigh
1115  0448 84            	pop	a
1118  0449 4b02          	push	#2
1119  044b ae500f        	ldw	x,#20495
1120  044e cd0000        	call	_GPIO_WriteHigh
1122  0451 84            	pop	a
1125  0452 4b02          	push	#2
1126  0454 ae5000        	ldw	x,#20480
1127  0457 cd0000        	call	_GPIO_WriteLow
1129  045a 84            	pop	a
1132  045b 4b40          	push	#64
1133  045d ae500a        	ldw	x,#20490
1134  0460 cd0000        	call	_GPIO_WriteHigh
1136  0463 84            	pop	a
1137                     ; 102         break;
1139  0464 acf305f3      	jpf	L571
1140  0468               L531:
1141                     ; 103     case 'E':
1141                     ; 104         display_e();
1143  0468 4b20          	push	#32
1144  046a ae500f        	ldw	x,#20495
1145  046d cd0000        	call	_GPIO_WriteHigh
1147  0470 84            	pop	a
1150  0471 4b04          	push	#4
1151  0473 ae5000        	ldw	x,#20480
1152  0476 cd0000        	call	_GPIO_WriteLow
1154  0479 84            	pop	a
1157  047a 4b80          	push	#128
1158  047c ae500a        	ldw	x,#20490
1159  047f cd0000        	call	_GPIO_WriteLow
1161  0482 84            	pop	a
1164  0483 4b08          	push	#8
1165  0485 ae500f        	ldw	x,#20495
1166  0488 cd0000        	call	_GPIO_WriteHigh
1168  048b 84            	pop	a
1171  048c 4b02          	push	#2
1172  048e ae500f        	ldw	x,#20495
1173  0491 cd0000        	call	_GPIO_WriteHigh
1175  0494 84            	pop	a
1178  0495 4b02          	push	#2
1179  0497 ae5000        	ldw	x,#20480
1180  049a cd0000        	call	_GPIO_WriteHigh
1182  049d 84            	pop	a
1185  049e 4b40          	push	#64
1186  04a0 ae500a        	ldw	x,#20490
1187  04a3 cd0000        	call	_GPIO_WriteHigh
1189  04a6 84            	pop	a
1190                     ; 105         break;
1192  04a7 acf305f3      	jpf	L571
1193  04ab               L731:
1194                     ; 106     case 'F':
1194                     ; 107         display_f();
1196  04ab 4b20          	push	#32
1197  04ad ae500f        	ldw	x,#20495
1198  04b0 cd0000        	call	_GPIO_WriteHigh
1200  04b3 84            	pop	a
1203  04b4 4b04          	push	#4
1204  04b6 ae5000        	ldw	x,#20480
1205  04b9 cd0000        	call	_GPIO_WriteLow
1207  04bc 84            	pop	a
1210  04bd 4b80          	push	#128
1211  04bf ae500a        	ldw	x,#20490
1212  04c2 cd0000        	call	_GPIO_WriteLow
1214  04c5 84            	pop	a
1217  04c6 4b08          	push	#8
1218  04c8 ae500f        	ldw	x,#20495
1219  04cb cd0000        	call	_GPIO_WriteLow
1221  04ce 84            	pop	a
1224  04cf 4b02          	push	#2
1225  04d1 ae500f        	ldw	x,#20495
1226  04d4 cd0000        	call	_GPIO_WriteHigh
1228  04d7 84            	pop	a
1231  04d8 4b02          	push	#2
1232  04da ae5000        	ldw	x,#20480
1233  04dd cd0000        	call	_GPIO_WriteHigh
1235  04e0 84            	pop	a
1238  04e1 4b40          	push	#64
1239  04e3 ae500a        	ldw	x,#20490
1240  04e6 cd0000        	call	_GPIO_WriteHigh
1242  04e9 84            	pop	a
1243                     ; 108         break;
1245  04ea acf305f3      	jpf	L571
1246  04ee               L141:
1247                     ; 109     case 'H':
1247                     ; 110         display_h();
1249  04ee 4b20          	push	#32
1250  04f0 ae500f        	ldw	x,#20495
1251  04f3 cd0000        	call	_GPIO_WriteLow
1253  04f6 84            	pop	a
1256  04f7 4b04          	push	#4
1257  04f9 ae5000        	ldw	x,#20480
1258  04fc cd0000        	call	_GPIO_WriteHigh
1260  04ff 84            	pop	a
1263  0500 4b80          	push	#128
1264  0502 ae500a        	ldw	x,#20490
1265  0505 cd0000        	call	_GPIO_WriteHigh
1267  0508 84            	pop	a
1270  0509 4b08          	push	#8
1271  050b ae500f        	ldw	x,#20495
1272  050e cd0000        	call	_GPIO_WriteLow
1274  0511 84            	pop	a
1277  0512 4b02          	push	#2
1278  0514 ae500f        	ldw	x,#20495
1279  0517 cd0000        	call	_GPIO_WriteHigh
1281  051a 84            	pop	a
1284  051b 4b02          	push	#2
1285  051d ae5000        	ldw	x,#20480
1286  0520 cd0000        	call	_GPIO_WriteHigh
1288  0523 84            	pop	a
1291  0524 4b40          	push	#64
1292  0526 ae500a        	ldw	x,#20490
1293  0529 cd0000        	call	_GPIO_WriteHigh
1295  052c 84            	pop	a
1296                     ; 111         break;
1298  052d acf305f3      	jpf	L571
1299  0531               L341:
1300                     ; 112     case 'L':
1300                     ; 113         display_l();
1302  0531 4b20          	push	#32
1303  0533 ae500f        	ldw	x,#20495
1304  0536 cd0000        	call	_GPIO_WriteLow
1306  0539 84            	pop	a
1309  053a 4b04          	push	#4
1310  053c ae5000        	ldw	x,#20480
1311  053f cd0000        	call	_GPIO_WriteLow
1313  0542 84            	pop	a
1316  0543 4b80          	push	#128
1317  0545 ae500a        	ldw	x,#20490
1318  0548 cd0000        	call	_GPIO_WriteLow
1320  054b 84            	pop	a
1323  054c 4b08          	push	#8
1324  054e ae500f        	ldw	x,#20495
1325  0551 cd0000        	call	_GPIO_WriteHigh
1327  0554 84            	pop	a
1330  0555 4b02          	push	#2
1331  0557 ae500f        	ldw	x,#20495
1332  055a cd0000        	call	_GPIO_WriteHigh
1334  055d 84            	pop	a
1337  055e 4b02          	push	#2
1338  0560 ae5000        	ldw	x,#20480
1339  0563 cd0000        	call	_GPIO_WriteHigh
1341  0566 84            	pop	a
1344  0567 4b40          	push	#64
1345  0569 ae500a        	ldw	x,#20490
1346  056c cd0000        	call	_GPIO_WriteLow
1348  056f 84            	pop	a
1349                     ; 114         break;
1351  0570 cc05f3        	jra	L571
1352  0573               L541:
1353                     ; 115     case 'P':
1353                     ; 116         display_p();
1355  0573 4b20          	push	#32
1356  0575 ae500f        	ldw	x,#20495
1357  0578 cd0000        	call	_GPIO_WriteHigh
1359  057b 84            	pop	a
1362  057c 4b04          	push	#4
1363  057e ae5000        	ldw	x,#20480
1364  0581 cd0000        	call	_GPIO_WriteHigh
1366  0584 84            	pop	a
1369  0585 4b80          	push	#128
1370  0587 ae500a        	ldw	x,#20490
1371  058a cd0000        	call	_GPIO_WriteLow
1373  058d 84            	pop	a
1376  058e 4b08          	push	#8
1377  0590 ae500f        	ldw	x,#20495
1378  0593 cd0000        	call	_GPIO_WriteLow
1380  0596 84            	pop	a
1383  0597 4b02          	push	#2
1384  0599 ae500f        	ldw	x,#20495
1385  059c cd0000        	call	_GPIO_WriteHigh
1387  059f 84            	pop	a
1390  05a0 4b02          	push	#2
1391  05a2 ae5000        	ldw	x,#20480
1392  05a5 cd0000        	call	_GPIO_WriteHigh
1394  05a8 84            	pop	a
1397  05a9 4b40          	push	#64
1398  05ab ae500a        	ldw	x,#20490
1399  05ae cd0000        	call	_GPIO_WriteHigh
1401  05b1 84            	pop	a
1402                     ; 117         break;
1404  05b2 203f          	jra	L571
1405  05b4               L741:
1406                     ; 118     case 'U':
1406                     ; 119         display_u();
1408  05b4 4b20          	push	#32
1409  05b6 ae500f        	ldw	x,#20495
1410  05b9 cd0000        	call	_GPIO_WriteLow
1412  05bc 84            	pop	a
1415  05bd 4b04          	push	#4
1416  05bf ae5000        	ldw	x,#20480
1417  05c2 cd0000        	call	_GPIO_WriteHigh
1419  05c5 84            	pop	a
1422  05c6 4b80          	push	#128
1423  05c8 ae500a        	ldw	x,#20490
1424  05cb cd0000        	call	_GPIO_WriteHigh
1426  05ce 84            	pop	a
1429  05cf 4b08          	push	#8
1430  05d1 ae500f        	ldw	x,#20495
1431  05d4 cd0000        	call	_GPIO_WriteHigh
1433  05d7 84            	pop	a
1436  05d8 4b02          	push	#2
1437  05da ae500f        	ldw	x,#20495
1438  05dd cd0000        	call	_GPIO_WriteHigh
1440  05e0 84            	pop	a
1443  05e1 4b02          	push	#2
1444  05e3 ae5000        	ldw	x,#20480
1445  05e6 cd0000        	call	_GPIO_WriteHigh
1447  05e9 84            	pop	a
1450  05ea 4b40          	push	#64
1451  05ec ae500a        	ldw	x,#20490
1452  05ef cd0000        	call	_GPIO_WriteLow
1454  05f2 84            	pop	a
1455                     ; 120         break;
1457  05f3               L571:
1458                     ; 123 }
1461  05f3 84            	pop	a
1462  05f4 81            	ret
1486                     ; 125 void task_display(void)
1486                     ; 126 {
1487                     	switch	.text
1488  05f5               _task_display:
1492                     ; 128     if (!tick)
1494  05f5 3d00          	tnz	_tick
1495  05f7 2601          	jrne	L702
1496                     ; 129         return;
1499  05f9 81            	ret
1500  05fa               L702:
1501                     ; 132 }
1504  05fa 81            	ret
1507                     	bsct
1508  0006               L112_dig_pos:
1509  0006 00            	dc.b	0
1544                     ; 134 void tmr_display(void)
1544                     ; 135 {
1545                     	switch	.text
1546  05fb               _tmr_display:
1550                     ; 144     if (dig_pos >= MAX_DIG_POS)
1552  05fb b606          	ld	a,L112_dig_pos
1553  05fd a103          	cp	a,#3
1554  05ff 2502          	jrult	L732
1555                     ; 145         dig_pos = DIG1_POS;
1557  0601 3f06          	clr	L112_dig_pos
1558  0603               L732:
1559                     ; 147     switch (dig_pos) {
1561  0603 b606          	ld	a,L112_dig_pos
1563                     ; 162         break;
1564  0605 4d            	tnz	a
1565  0606 2708          	jreq	L312
1566  0608 4a            	dec	a
1567  0609 2722          	jreq	L512
1568  060b 4a            	dec	a
1569  060c 273c          	jreq	L712
1570  060e 2055          	jra	L342
1571  0610               L312:
1572                     ; 148     case DIG1_POS:
1572                     ; 149         dig1_on();
1574  0610 4b10          	push	#16
1575  0612 ae500f        	ldw	x,#20495
1576  0615 cd0000        	call	_GPIO_WriteLow
1578  0618 84            	pop	a
1579                     ; 150         dig2_off();
1581  0619 4b20          	push	#32
1582  061b ae5005        	ldw	x,#20485
1583  061e cd0000        	call	_GPIO_WriteHigh
1585  0621 84            	pop	a
1586                     ; 151         dig3_off();
1588  0622 4b10          	push	#16
1589  0624 ae5005        	ldw	x,#20485
1590  0627 cd0000        	call	_GPIO_WriteHigh
1592  062a 84            	pop	a
1593                     ; 152         break;
1595  062b 2038          	jra	L342
1596  062d               L512:
1597                     ; 153     case DIG2_POS:
1597                     ; 154         dig1_off();
1599  062d 4b10          	push	#16
1600  062f ae500f        	ldw	x,#20495
1601  0632 cd0000        	call	_GPIO_WriteHigh
1603  0635 84            	pop	a
1604                     ; 155         dig2_on();
1606  0636 4b20          	push	#32
1607  0638 ae5005        	ldw	x,#20485
1608  063b cd0000        	call	_GPIO_WriteLow
1610  063e 84            	pop	a
1611                     ; 156         dig3_off();
1613  063f 4b10          	push	#16
1614  0641 ae5005        	ldw	x,#20485
1615  0644 cd0000        	call	_GPIO_WriteHigh
1617  0647 84            	pop	a
1618                     ; 157         break;
1620  0648 201b          	jra	L342
1621  064a               L712:
1622                     ; 158     case DIG3_POS:
1622                     ; 159         dig1_off();
1624  064a 4b10          	push	#16
1625  064c ae500f        	ldw	x,#20495
1626  064f cd0000        	call	_GPIO_WriteHigh
1628  0652 84            	pop	a
1629                     ; 160         dig2_off();
1631  0653 4b20          	push	#32
1632  0655 ae5005        	ldw	x,#20485
1633  0658 cd0000        	call	_GPIO_WriteHigh
1635  065b 84            	pop	a
1636                     ; 161         dig3_on();
1638  065c 4b10          	push	#16
1639  065e ae5005        	ldw	x,#20485
1640  0661 cd0000        	call	_GPIO_WriteLow
1642  0664 84            	pop	a
1643                     ; 162         break;
1645  0665               L342:
1646                     ; 165     wr_digit(dig_pos);
1648  0665 b606          	ld	a,L112_dig_pos
1649  0667 cd0049        	call	_wr_digit
1651                     ; 166     dig_pos++;
1653  066a 3c06          	inc	L112_dig_pos
1654                     ; 168 }
1657  066c 81            	ret
1682                     ; 201 void init_display(void)
1682                     ; 202 {
1683                     	switch	.text
1684  066d               _init_display:
1688                     ; 204     seg_a_dir();
1690  066d 4be0          	push	#224
1691  066f 4b20          	push	#32
1692  0671 ae500f        	ldw	x,#20495
1693  0674 cd0000        	call	_GPIO_Init
1695  0677 85            	popw	x
1696                     ; 205     seg_b_dir();
1699  0678 4be0          	push	#224
1700  067a 4b04          	push	#4
1701  067c ae5000        	ldw	x,#20480
1702  067f cd0000        	call	_GPIO_Init
1704  0682 85            	popw	x
1705                     ; 206     seg_c_dir();
1708  0683 4be0          	push	#224
1709  0685 4b80          	push	#128
1710  0687 ae500a        	ldw	x,#20490
1711  068a cd0000        	call	_GPIO_Init
1713  068d 85            	popw	x
1714                     ; 207     seg_d_dir();
1717  068e 4be0          	push	#224
1718  0690 4b08          	push	#8
1719  0692 ae500f        	ldw	x,#20495
1720  0695 cd0000        	call	_GPIO_Init
1722  0698 85            	popw	x
1723                     ; 208     seg_e_dir();
1726  0699 4be0          	push	#224
1727  069b 4b02          	push	#2
1728  069d ae500f        	ldw	x,#20495
1729  06a0 cd0000        	call	_GPIO_Init
1731  06a3 85            	popw	x
1732                     ; 209     seg_f_dir();
1735  06a4 4be0          	push	#224
1736  06a6 4b02          	push	#2
1737  06a8 ae5000        	ldw	x,#20480
1738  06ab cd0000        	call	_GPIO_Init
1740  06ae 85            	popw	x
1741                     ; 210     seg_g_dir();
1744  06af 4be0          	push	#224
1745  06b1 4b40          	push	#64
1746  06b3 ae500a        	ldw	x,#20490
1747  06b6 cd0000        	call	_GPIO_Init
1749  06b9 85            	popw	x
1750                     ; 211     dp_dir();
1753  06ba 4be0          	push	#224
1754  06bc 4b04          	push	#4
1755  06be ae500f        	ldw	x,#20495
1756  06c1 cd0000        	call	_GPIO_Init
1758  06c4 85            	popw	x
1759                     ; 212     dig1_dir();
1762  06c5 4be0          	push	#224
1763  06c7 4b10          	push	#16
1764  06c9 ae500f        	ldw	x,#20495
1765  06cc cd0000        	call	_GPIO_Init
1767  06cf 85            	popw	x
1768                     ; 213     dig2_dir();
1771  06d0 4be0          	push	#224
1772  06d2 4b20          	push	#32
1773  06d4 ae5005        	ldw	x,#20485
1774  06d7 cd0000        	call	_GPIO_Init
1776  06da 85            	popw	x
1777                     ; 214     dig3_dir();
1780  06db 4be0          	push	#224
1781  06dd 4b10          	push	#16
1782  06df ae5005        	ldw	x,#20485
1783  06e2 cd0000        	call	_GPIO_Init
1785  06e5 85            	popw	x
1786                     ; 236     dig1_off();
1789  06e6 4b10          	push	#16
1790  06e8 ae500f        	ldw	x,#20495
1791  06eb cd0000        	call	_GPIO_WriteHigh
1793  06ee 84            	pop	a
1794                     ; 237     dig2_off();
1796  06ef 4b20          	push	#32
1797  06f1 ae5005        	ldw	x,#20485
1798  06f4 cd0000        	call	_GPIO_WriteHigh
1800  06f7 84            	pop	a
1801                     ; 238     dig3_off();
1803  06f8 4b10          	push	#16
1804  06fa ae5005        	ldw	x,#20485
1805  06fd cd0000        	call	_GPIO_WriteHigh
1807  0700 84            	pop	a
1808                     ; 241 }
1811  0701 81            	ret
1846                     	xdef	_wr_digit
1847                     	xdef	_dec2bcd
1848                     	xdef	_dp
1849                     	xdef	_display_num
1850                     	xref.b	_tick
1851                     	xdef	_set_option_display
1852                     	xdef	_set_display
1853                     	xdef	_tmr_display
1854                     	xdef	_task_display
1855                     	xdef	_init_display
1856                     	xref	_GPIO_WriteLow
1857                     	xref	_GPIO_WriteHigh
1858                     	xref	_GPIO_Init
1877                     	end
