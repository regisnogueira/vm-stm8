   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  15                     	bsct
  16  0000               _display_test:
  17  0000 01            	dc.b	1
  18  0001               _display_num:
  19  0001 00            	dc.b	0
  20  0002 00            	dc.b	0
  21  0003 00            	dc.b	0
  61                     ; 13 uint8_t dec2bcd(uint8_t val)
  61                     ; 14 {
  63                     	switch	.text
  64  0000               _dec2bcd:
  66  0000 88            	push	a
  67  0001 88            	push	a
  68       00000001      OFST:	set	1
  71                     ; 15   return (uint8_t)((val/10*16) + (val%10));
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
 150                     ; 18 void set_display(uint8_t option, uint8_t value, uint8_t decimal)
 150                     ; 19 {
 151                     	switch	.text
 152  001d               _set_display:
 154  001d 89            	pushw	x
 155  001e 88            	push	a
 156       00000001      OFST:	set	1
 159                     ; 22     bcd = (uint8_t)dec2bcd(value);
 161  001f 9f            	ld	a,xl
 162  0020 adde          	call	_dec2bcd
 164  0022 6b01          	ld	(OFST+0,sp),a
 166                     ; 24     if (option > MAX_DISPLAY_OPTION)
 168  0024 7b02          	ld	a,(OFST+1,sp)
 169  0026 a10a          	cp	a,#10
 170  0028 2504          	jrult	L55
 171                     ; 25         option = MAX_DISPLAY_OPTION;
 173  002a a609          	ld	a,#9
 174  002c 6b02          	ld	(OFST+1,sp),a
 175  002e               L55:
 176                     ; 26     if (value > MAX_DISPLAY_VALUE)
 178  002e 7b03          	ld	a,(OFST+2,sp)
 179  0030 a164          	cp	a,#100
 180  0032 2504          	jrult	L75
 181                     ; 27         value = MAX_DISPLAY_VALUE;
 183  0034 a663          	ld	a,#99
 184  0036 6b03          	ld	(OFST+2,sp),a
 185  0038               L75:
 186                     ; 29     display_num[DIG1_POS] = option;
 188  0038 7b02          	ld	a,(OFST+1,sp)
 189  003a b701          	ld	_display_num,a
 190                     ; 30     display_num[DIG2_POS] = (uint8_t)(bcd >> 4);
 192  003c 7b01          	ld	a,(OFST+0,sp)
 193  003e 4e            	swap	a
 194  003f a40f          	and	a,#15
 195  0041 b702          	ld	_display_num+1,a
 196                     ; 31     display_num[DIG3_POS] = (uint8_t)(bcd & 0x0F);
 198  0043 7b01          	ld	a,(OFST+0,sp)
 199  0045 a40f          	and	a,#15
 200  0047 b703          	ld	_display_num+2,a
 201                     ; 32 }
 204  0049 5b03          	addw	sp,#3
 205  004b 81            	ret
 242                     ; 34 void wr_digit(uint8_t dig_pos)
 242                     ; 35 {
 243                     	switch	.text
 244  004c               _wr_digit:
 248                     ; 36     switch (display_num[dig_pos]) {
 250  004c 5f            	clrw	x
 251  004d 97            	ld	xl,a
 252  004e e601          	ld	a,(_display_num,x)
 254                     ; 66         break;
 255  0050 4d            	tnz	a
 256  0051 2737          	jreq	L16
 257  0053 4a            	dec	a
 258  0054 2777          	jreq	L36
 259  0056 4a            	dec	a
 260  0057 2603          	jrne	L21
 261  0059 cc0110        	jp	L56
 262  005c               L21:
 263  005c 4a            	dec	a
 264  005d 2603          	jrne	L41
 265  005f cc0153        	jp	L76
 266  0062               L41:
 267  0062 4a            	dec	a
 268  0063 2603          	jrne	L61
 269  0065 cc0196        	jp	L17
 270  0068               L61:
 271  0068 4a            	dec	a
 272  0069 2603          	jrne	L02
 273  006b cc01d9        	jp	L37
 274  006e               L02:
 275  006e 4a            	dec	a
 276  006f 2603          	jrne	L22
 277  0071 cc021c        	jp	L57
 278  0074               L22:
 279  0074 4a            	dec	a
 280  0075 2603          	jrne	L42
 281  0077 cc025f        	jp	L77
 282  007a               L42:
 283  007a 4a            	dec	a
 284  007b 2603          	jrne	L62
 285  007d cc02a1        	jp	L101
 286  0080               L62:
 287  0080 4a            	dec	a
 288  0081 2603          	jrne	L03
 289  0083 cc02e2        	jp	L301
 290  0086               L03:
 291  0086 ac210321      	jpf	L521
 292  008a               L16:
 293                     ; 37     case 0x00:
 293                     ; 38         display_zero();
 295  008a 4b20          	push	#32
 296  008c ae500f        	ldw	x,#20495
 297  008f cd0000        	call	_GPIO_WriteHigh
 299  0092 84            	pop	a
 302  0093 4b04          	push	#4
 303  0095 ae5000        	ldw	x,#20480
 304  0098 cd0000        	call	_GPIO_WriteHigh
 306  009b 84            	pop	a
 309  009c 4b80          	push	#128
 310  009e ae500a        	ldw	x,#20490
 311  00a1 cd0000        	call	_GPIO_WriteHigh
 313  00a4 84            	pop	a
 316  00a5 4b08          	push	#8
 317  00a7 ae500f        	ldw	x,#20495
 318  00aa cd0000        	call	_GPIO_WriteHigh
 320  00ad 84            	pop	a
 323  00ae 4b02          	push	#2
 324  00b0 ae500f        	ldw	x,#20495
 325  00b3 cd0000        	call	_GPIO_WriteHigh
 327  00b6 84            	pop	a
 330  00b7 4b02          	push	#2
 331  00b9 ae5000        	ldw	x,#20480
 332  00bc cd0000        	call	_GPIO_WriteHigh
 334  00bf 84            	pop	a
 337  00c0 4b40          	push	#64
 338  00c2 ae500a        	ldw	x,#20490
 339  00c5 cd0000        	call	_GPIO_WriteLow
 341  00c8 84            	pop	a
 342                     ; 39         break;
 344  00c9 ac210321      	jpf	L521
 345  00cd               L36:
 346                     ; 40     case 0x01:
 346                     ; 41         display_one();
 348  00cd 4b20          	push	#32
 349  00cf ae500f        	ldw	x,#20495
 350  00d2 cd0000        	call	_GPIO_WriteLow
 352  00d5 84            	pop	a
 355  00d6 4b04          	push	#4
 356  00d8 ae5000        	ldw	x,#20480
 357  00db cd0000        	call	_GPIO_WriteHigh
 359  00de 84            	pop	a
 362  00df 4b80          	push	#128
 363  00e1 ae500a        	ldw	x,#20490
 364  00e4 cd0000        	call	_GPIO_WriteHigh
 366  00e7 84            	pop	a
 369  00e8 4b08          	push	#8
 370  00ea ae500f        	ldw	x,#20495
 371  00ed cd0000        	call	_GPIO_WriteLow
 373  00f0 84            	pop	a
 376  00f1 4b02          	push	#2
 377  00f3 ae500f        	ldw	x,#20495
 378  00f6 cd0000        	call	_GPIO_WriteLow
 380  00f9 84            	pop	a
 383  00fa 4b02          	push	#2
 384  00fc ae5000        	ldw	x,#20480
 385  00ff cd0000        	call	_GPIO_WriteLow
 387  0102 84            	pop	a
 390  0103 4b40          	push	#64
 391  0105 ae500a        	ldw	x,#20490
 392  0108 cd0000        	call	_GPIO_WriteLow
 394  010b 84            	pop	a
 395                     ; 42         break;
 397  010c ac210321      	jpf	L521
 398  0110               L56:
 399                     ; 43     case 0x02:
 399                     ; 44         display_two();
 401  0110 4b20          	push	#32
 402  0112 ae500f        	ldw	x,#20495
 403  0115 cd0000        	call	_GPIO_WriteHigh
 405  0118 84            	pop	a
 408  0119 4b04          	push	#4
 409  011b ae5000        	ldw	x,#20480
 410  011e cd0000        	call	_GPIO_WriteHigh
 412  0121 84            	pop	a
 415  0122 4b80          	push	#128
 416  0124 ae500a        	ldw	x,#20490
 417  0127 cd0000        	call	_GPIO_WriteLow
 419  012a 84            	pop	a
 422  012b 4b08          	push	#8
 423  012d ae500f        	ldw	x,#20495
 424  0130 cd0000        	call	_GPIO_WriteHigh
 426  0133 84            	pop	a
 429  0134 4b02          	push	#2
 430  0136 ae500f        	ldw	x,#20495
 431  0139 cd0000        	call	_GPIO_WriteHigh
 433  013c 84            	pop	a
 436  013d 4b02          	push	#2
 437  013f ae5000        	ldw	x,#20480
 438  0142 cd0000        	call	_GPIO_WriteLow
 440  0145 84            	pop	a
 443  0146 4b40          	push	#64
 444  0148 ae500a        	ldw	x,#20490
 445  014b cd0000        	call	_GPIO_WriteHigh
 447  014e 84            	pop	a
 448                     ; 45         break;
 450  014f ac210321      	jpf	L521
 451  0153               L76:
 452                     ; 46     case 0x03:
 452                     ; 47         display_three();
 454  0153 4b20          	push	#32
 455  0155 ae500f        	ldw	x,#20495
 456  0158 cd0000        	call	_GPIO_WriteHigh
 458  015b 84            	pop	a
 461  015c 4b04          	push	#4
 462  015e ae5000        	ldw	x,#20480
 463  0161 cd0000        	call	_GPIO_WriteHigh
 465  0164 84            	pop	a
 468  0165 4b80          	push	#128
 469  0167 ae500a        	ldw	x,#20490
 470  016a cd0000        	call	_GPIO_WriteHigh
 472  016d 84            	pop	a
 475  016e 4b08          	push	#8
 476  0170 ae500f        	ldw	x,#20495
 477  0173 cd0000        	call	_GPIO_WriteHigh
 479  0176 84            	pop	a
 482  0177 4b02          	push	#2
 483  0179 ae500f        	ldw	x,#20495
 484  017c cd0000        	call	_GPIO_WriteLow
 486  017f 84            	pop	a
 489  0180 4b02          	push	#2
 490  0182 ae5000        	ldw	x,#20480
 491  0185 cd0000        	call	_GPIO_WriteLow
 493  0188 84            	pop	a
 496  0189 4b40          	push	#64
 497  018b ae500a        	ldw	x,#20490
 498  018e cd0000        	call	_GPIO_WriteHigh
 500  0191 84            	pop	a
 501                     ; 48         break;
 503  0192 ac210321      	jpf	L521
 504  0196               L17:
 505                     ; 49     case 0x04:
 505                     ; 50         display_four();
 507  0196 4b20          	push	#32
 508  0198 ae500f        	ldw	x,#20495
 509  019b cd0000        	call	_GPIO_WriteLow
 511  019e 84            	pop	a
 514  019f 4b04          	push	#4
 515  01a1 ae5000        	ldw	x,#20480
 516  01a4 cd0000        	call	_GPIO_WriteHigh
 518  01a7 84            	pop	a
 521  01a8 4b80          	push	#128
 522  01aa ae500a        	ldw	x,#20490
 523  01ad cd0000        	call	_GPIO_WriteHigh
 525  01b0 84            	pop	a
 528  01b1 4b08          	push	#8
 529  01b3 ae500f        	ldw	x,#20495
 530  01b6 cd0000        	call	_GPIO_WriteLow
 532  01b9 84            	pop	a
 535  01ba 4b02          	push	#2
 536  01bc ae500f        	ldw	x,#20495
 537  01bf cd0000        	call	_GPIO_WriteLow
 539  01c2 84            	pop	a
 542  01c3 4b02          	push	#2
 543  01c5 ae5000        	ldw	x,#20480
 544  01c8 cd0000        	call	_GPIO_WriteHigh
 546  01cb 84            	pop	a
 549  01cc 4b40          	push	#64
 550  01ce ae500a        	ldw	x,#20490
 551  01d1 cd0000        	call	_GPIO_WriteHigh
 553  01d4 84            	pop	a
 554                     ; 51         break;
 556  01d5 ac210321      	jpf	L521
 557  01d9               L37:
 558                     ; 52     case 0x05:
 558                     ; 53         display_five();
 560  01d9 4b20          	push	#32
 561  01db ae500f        	ldw	x,#20495
 562  01de cd0000        	call	_GPIO_WriteHigh
 564  01e1 84            	pop	a
 567  01e2 4b04          	push	#4
 568  01e4 ae5000        	ldw	x,#20480
 569  01e7 cd0000        	call	_GPIO_WriteLow
 571  01ea 84            	pop	a
 574  01eb 4b80          	push	#128
 575  01ed ae500a        	ldw	x,#20490
 576  01f0 cd0000        	call	_GPIO_WriteHigh
 578  01f3 84            	pop	a
 581  01f4 4b08          	push	#8
 582  01f6 ae500f        	ldw	x,#20495
 583  01f9 cd0000        	call	_GPIO_WriteHigh
 585  01fc 84            	pop	a
 588  01fd 4b02          	push	#2
 589  01ff ae500f        	ldw	x,#20495
 590  0202 cd0000        	call	_GPIO_WriteLow
 592  0205 84            	pop	a
 595  0206 4b02          	push	#2
 596  0208 ae5000        	ldw	x,#20480
 597  020b cd0000        	call	_GPIO_WriteHigh
 599  020e 84            	pop	a
 602  020f 4b40          	push	#64
 603  0211 ae500a        	ldw	x,#20490
 604  0214 cd0000        	call	_GPIO_WriteHigh
 606  0217 84            	pop	a
 607                     ; 54         break;
 609  0218 ac210321      	jpf	L521
 610  021c               L57:
 611                     ; 55     case 0x06:
 611                     ; 56         display_six();
 613  021c 4b20          	push	#32
 614  021e ae500f        	ldw	x,#20495
 615  0221 cd0000        	call	_GPIO_WriteHigh
 617  0224 84            	pop	a
 620  0225 4b04          	push	#4
 621  0227 ae5000        	ldw	x,#20480
 622  022a cd0000        	call	_GPIO_WriteLow
 624  022d 84            	pop	a
 627  022e 4b80          	push	#128
 628  0230 ae500a        	ldw	x,#20490
 629  0233 cd0000        	call	_GPIO_WriteHigh
 631  0236 84            	pop	a
 634  0237 4b08          	push	#8
 635  0239 ae500f        	ldw	x,#20495
 636  023c cd0000        	call	_GPIO_WriteHigh
 638  023f 84            	pop	a
 641  0240 4b02          	push	#2
 642  0242 ae500f        	ldw	x,#20495
 643  0245 cd0000        	call	_GPIO_WriteHigh
 645  0248 84            	pop	a
 648  0249 4b02          	push	#2
 649  024b ae5000        	ldw	x,#20480
 650  024e cd0000        	call	_GPIO_WriteHigh
 652  0251 84            	pop	a
 655  0252 4b40          	push	#64
 656  0254 ae500a        	ldw	x,#20490
 657  0257 cd0000        	call	_GPIO_WriteHigh
 659  025a 84            	pop	a
 660                     ; 57         break;
 662  025b ac210321      	jpf	L521
 663  025f               L77:
 664                     ; 58     case 0x07:
 664                     ; 59         display_seven();
 666  025f 4b20          	push	#32
 667  0261 ae500f        	ldw	x,#20495
 668  0264 cd0000        	call	_GPIO_WriteHigh
 670  0267 84            	pop	a
 673  0268 4b04          	push	#4
 674  026a ae5000        	ldw	x,#20480
 675  026d cd0000        	call	_GPIO_WriteHigh
 677  0270 84            	pop	a
 680  0271 4b80          	push	#128
 681  0273 ae500a        	ldw	x,#20490
 682  0276 cd0000        	call	_GPIO_WriteHigh
 684  0279 84            	pop	a
 687  027a 4b08          	push	#8
 688  027c ae500f        	ldw	x,#20495
 689  027f cd0000        	call	_GPIO_WriteLow
 691  0282 84            	pop	a
 694  0283 4b02          	push	#2
 695  0285 ae500f        	ldw	x,#20495
 696  0288 cd0000        	call	_GPIO_WriteLow
 698  028b 84            	pop	a
 701  028c 4b02          	push	#2
 702  028e ae5000        	ldw	x,#20480
 703  0291 cd0000        	call	_GPIO_WriteLow
 705  0294 84            	pop	a
 708  0295 4b40          	push	#64
 709  0297 ae500a        	ldw	x,#20490
 710  029a cd0000        	call	_GPIO_WriteLow
 712  029d 84            	pop	a
 713                     ; 60         break;
 715  029e cc0321        	jra	L521
 716  02a1               L101:
 717                     ; 61     case 0x08:
 717                     ; 62         display_eight();
 719  02a1 4b20          	push	#32
 720  02a3 ae500f        	ldw	x,#20495
 721  02a6 cd0000        	call	_GPIO_WriteHigh
 723  02a9 84            	pop	a
 726  02aa 4b04          	push	#4
 727  02ac ae5000        	ldw	x,#20480
 728  02af cd0000        	call	_GPIO_WriteHigh
 730  02b2 84            	pop	a
 733  02b3 4b80          	push	#128
 734  02b5 ae500a        	ldw	x,#20490
 735  02b8 cd0000        	call	_GPIO_WriteHigh
 737  02bb 84            	pop	a
 740  02bc 4b08          	push	#8
 741  02be ae500f        	ldw	x,#20495
 742  02c1 cd0000        	call	_GPIO_WriteHigh
 744  02c4 84            	pop	a
 747  02c5 4b02          	push	#2
 748  02c7 ae500f        	ldw	x,#20495
 749  02ca cd0000        	call	_GPIO_WriteHigh
 751  02cd 84            	pop	a
 754  02ce 4b02          	push	#2
 755  02d0 ae5000        	ldw	x,#20480
 756  02d3 cd0000        	call	_GPIO_WriteHigh
 758  02d6 84            	pop	a
 761  02d7 4b40          	push	#64
 762  02d9 ae500a        	ldw	x,#20490
 763  02dc cd0000        	call	_GPIO_WriteHigh
 765  02df 84            	pop	a
 766                     ; 63         break;
 768  02e0 203f          	jra	L521
 769  02e2               L301:
 770                     ; 64     case 0x09:
 770                     ; 65         display_nine();
 772  02e2 4b20          	push	#32
 773  02e4 ae500f        	ldw	x,#20495
 774  02e7 cd0000        	call	_GPIO_WriteHigh
 776  02ea 84            	pop	a
 779  02eb 4b04          	push	#4
 780  02ed ae5000        	ldw	x,#20480
 781  02f0 cd0000        	call	_GPIO_WriteHigh
 783  02f3 84            	pop	a
 786  02f4 4b80          	push	#128
 787  02f6 ae500a        	ldw	x,#20490
 788  02f9 cd0000        	call	_GPIO_WriteHigh
 790  02fc 84            	pop	a
 793  02fd 4b08          	push	#8
 794  02ff ae500f        	ldw	x,#20495
 795  0302 cd0000        	call	_GPIO_WriteHigh
 797  0305 84            	pop	a
 800  0306 4b02          	push	#2
 801  0308 ae500f        	ldw	x,#20495
 802  030b cd0000        	call	_GPIO_WriteLow
 804  030e 84            	pop	a
 807  030f 4b02          	push	#2
 808  0311 ae5000        	ldw	x,#20480
 809  0314 cd0000        	call	_GPIO_WriteHigh
 811  0317 84            	pop	a
 814  0318 4b40          	push	#64
 815  031a ae500a        	ldw	x,#20490
 816  031d cd0000        	call	_GPIO_WriteHigh
 818  0320 84            	pop	a
 819                     ; 66         break;
 821  0321               L521:
 822                     ; 68 }
 825  0321 81            	ret
 828                     	bsct
 829  0004               L721_dig_pos:
 830  0004 00            	dc.b	0
 866                     ; 70 void tmr_display(void)
 866                     ; 71 {
 867                     	switch	.text
 868  0322               _tmr_display:
 872                     ; 75     if (display_test)
 874  0322 3d00          	tnz	_display_test
 875  0324 2701          	jreq	L551
 876                     ; 76         return;
 879  0326 81            	ret
 880  0327               L551:
 881                     ; 79     if (dig_pos > MAX_DIG_POS)
 883  0327 b604          	ld	a,L721_dig_pos
 884  0329 a104          	cp	a,#4
 885  032b 2502          	jrult	L751
 886                     ; 80         dig_pos = DIG1_POS;
 888  032d 3f04          	clr	L721_dig_pos
 889  032f               L751:
 890                     ; 82     dig1_off();
 892  032f 4b10          	push	#16
 893  0331 ae500f        	ldw	x,#20495
 894  0334 cd0000        	call	_GPIO_WriteHigh
 896  0337 84            	pop	a
 897                     ; 83     dig2_off();
 899  0338 4b20          	push	#32
 900  033a ae5005        	ldw	x,#20485
 901  033d cd0000        	call	_GPIO_WriteHigh
 903  0340 84            	pop	a
 904                     ; 84     dig3_off();
 906  0341 4b10          	push	#16
 907  0343 ae5005        	ldw	x,#20485
 908  0346 cd0000        	call	_GPIO_WriteHigh
 910  0349 84            	pop	a
 911                     ; 86     switch (dig_pos) {
 913  034a b604          	ld	a,L721_dig_pos
 915                     ; 95         break;
 916  034c 4d            	tnz	a
 917  034d 2708          	jreq	L131
 918  034f 4a            	dec	a
 919  0350 2710          	jreq	L331
 920  0352 4a            	dec	a
 921  0353 2718          	jreq	L531
 922  0355 201f          	jra	L361
 923  0357               L131:
 924                     ; 87     case DIG1_POS:
 924                     ; 88         dig1_on();
 926  0357 4b10          	push	#16
 927  0359 ae500f        	ldw	x,#20495
 928  035c cd0000        	call	_GPIO_WriteLow
 930  035f 84            	pop	a
 931                     ; 89         break;
 933  0360 2014          	jra	L361
 934  0362               L331:
 935                     ; 90     case DIG2_POS:
 935                     ; 91         dig2_on();
 937  0362 4b20          	push	#32
 938  0364 ae5005        	ldw	x,#20485
 939  0367 cd0000        	call	_GPIO_WriteLow
 941  036a 84            	pop	a
 942                     ; 92         break;
 944  036b 2009          	jra	L361
 945  036d               L531:
 946                     ; 93     case DIG3_POS:
 946                     ; 94         dig3_on();
 948  036d 4b10          	push	#16
 949  036f ae5005        	ldw	x,#20485
 950  0372 cd0000        	call	_GPIO_WriteLow
 952  0375 84            	pop	a
 953                     ; 95         break;
 955  0376               L361:
 956                     ; 98     wr_digit(dig_pos);
 958  0376 b604          	ld	a,L721_dig_pos
 959  0378 cd004c        	call	_wr_digit
 961                     ; 99     dig_pos++;
 963  037b 3c04          	inc	L721_dig_pos
 964                     ; 100 }
 967  037d 81            	ret
 993                     ; 103 void test_display(void)
 993                     ; 104 {
 994                     	switch	.text
 995  037e               _test_display:
 999                     ; 105     delay(DELAY_DISPLAY_TEST);
1001  037e ae01f4        	ldw	x,#500
1002  0381 89            	pushw	x
1003  0382 ae0000        	ldw	x,#0
1004  0385 89            	pushw	x
1005  0386 cd0000        	call	_delay
1007  0389 5b04          	addw	sp,#4
1008                     ; 106     display_zero();
1010  038b 4b20          	push	#32
1011  038d ae500f        	ldw	x,#20495
1012  0390 cd0000        	call	_GPIO_WriteHigh
1014  0393 84            	pop	a
1017  0394 4b04          	push	#4
1018  0396 ae5000        	ldw	x,#20480
1019  0399 cd0000        	call	_GPIO_WriteHigh
1021  039c 84            	pop	a
1024  039d 4b80          	push	#128
1025  039f ae500a        	ldw	x,#20490
1026  03a2 cd0000        	call	_GPIO_WriteHigh
1028  03a5 84            	pop	a
1031  03a6 4b08          	push	#8
1032  03a8 ae500f        	ldw	x,#20495
1033  03ab cd0000        	call	_GPIO_WriteHigh
1035  03ae 84            	pop	a
1038  03af 4b02          	push	#2
1039  03b1 ae500f        	ldw	x,#20495
1040  03b4 cd0000        	call	_GPIO_WriteHigh
1042  03b7 84            	pop	a
1045  03b8 4b02          	push	#2
1046  03ba ae5000        	ldw	x,#20480
1047  03bd cd0000        	call	_GPIO_WriteHigh
1049  03c0 84            	pop	a
1052  03c1 4b40          	push	#64
1053  03c3 ae500a        	ldw	x,#20490
1054  03c6 cd0000        	call	_GPIO_WriteLow
1056  03c9 84            	pop	a
1057                     ; 107     delay(DELAY_DISPLAY_TEST);
1059  03ca ae01f4        	ldw	x,#500
1060  03cd 89            	pushw	x
1061  03ce ae0000        	ldw	x,#0
1062  03d1 89            	pushw	x
1063  03d2 cd0000        	call	_delay
1065  03d5 5b04          	addw	sp,#4
1066                     ; 108     display_one();
1068  03d7 4b20          	push	#32
1069  03d9 ae500f        	ldw	x,#20495
1070  03dc cd0000        	call	_GPIO_WriteLow
1072  03df 84            	pop	a
1075  03e0 4b04          	push	#4
1076  03e2 ae5000        	ldw	x,#20480
1077  03e5 cd0000        	call	_GPIO_WriteHigh
1079  03e8 84            	pop	a
1082  03e9 4b80          	push	#128
1083  03eb ae500a        	ldw	x,#20490
1084  03ee cd0000        	call	_GPIO_WriteHigh
1086  03f1 84            	pop	a
1089  03f2 4b08          	push	#8
1090  03f4 ae500f        	ldw	x,#20495
1091  03f7 cd0000        	call	_GPIO_WriteLow
1093  03fa 84            	pop	a
1096  03fb 4b02          	push	#2
1097  03fd ae500f        	ldw	x,#20495
1098  0400 cd0000        	call	_GPIO_WriteLow
1100  0403 84            	pop	a
1103  0404 4b02          	push	#2
1104  0406 ae5000        	ldw	x,#20480
1105  0409 cd0000        	call	_GPIO_WriteLow
1107  040c 84            	pop	a
1110  040d 4b40          	push	#64
1111  040f ae500a        	ldw	x,#20490
1112  0412 cd0000        	call	_GPIO_WriteLow
1114  0415 84            	pop	a
1115                     ; 109     delay(DELAY_DISPLAY_TEST);
1117  0416 ae01f4        	ldw	x,#500
1118  0419 89            	pushw	x
1119  041a ae0000        	ldw	x,#0
1120  041d 89            	pushw	x
1121  041e cd0000        	call	_delay
1123  0421 5b04          	addw	sp,#4
1124                     ; 110     display_two();
1126  0423 4b20          	push	#32
1127  0425 ae500f        	ldw	x,#20495
1128  0428 cd0000        	call	_GPIO_WriteHigh
1130  042b 84            	pop	a
1133  042c 4b04          	push	#4
1134  042e ae5000        	ldw	x,#20480
1135  0431 cd0000        	call	_GPIO_WriteHigh
1137  0434 84            	pop	a
1140  0435 4b80          	push	#128
1141  0437 ae500a        	ldw	x,#20490
1142  043a cd0000        	call	_GPIO_WriteLow
1144  043d 84            	pop	a
1147  043e 4b08          	push	#8
1148  0440 ae500f        	ldw	x,#20495
1149  0443 cd0000        	call	_GPIO_WriteHigh
1151  0446 84            	pop	a
1154  0447 4b02          	push	#2
1155  0449 ae500f        	ldw	x,#20495
1156  044c cd0000        	call	_GPIO_WriteHigh
1158  044f 84            	pop	a
1161  0450 4b02          	push	#2
1162  0452 ae5000        	ldw	x,#20480
1163  0455 cd0000        	call	_GPIO_WriteLow
1165  0458 84            	pop	a
1168  0459 4b40          	push	#64
1169  045b ae500a        	ldw	x,#20490
1170  045e cd0000        	call	_GPIO_WriteHigh
1172  0461 84            	pop	a
1173                     ; 111     delay(DELAY_DISPLAY_TEST);
1175  0462 ae01f4        	ldw	x,#500
1176  0465 89            	pushw	x
1177  0466 ae0000        	ldw	x,#0
1178  0469 89            	pushw	x
1179  046a cd0000        	call	_delay
1181  046d 5b04          	addw	sp,#4
1182                     ; 112     display_three();
1184  046f 4b20          	push	#32
1185  0471 ae500f        	ldw	x,#20495
1186  0474 cd0000        	call	_GPIO_WriteHigh
1188  0477 84            	pop	a
1191  0478 4b04          	push	#4
1192  047a ae5000        	ldw	x,#20480
1193  047d cd0000        	call	_GPIO_WriteHigh
1195  0480 84            	pop	a
1198  0481 4b80          	push	#128
1199  0483 ae500a        	ldw	x,#20490
1200  0486 cd0000        	call	_GPIO_WriteHigh
1202  0489 84            	pop	a
1205  048a 4b08          	push	#8
1206  048c ae500f        	ldw	x,#20495
1207  048f cd0000        	call	_GPIO_WriteHigh
1209  0492 84            	pop	a
1212  0493 4b02          	push	#2
1213  0495 ae500f        	ldw	x,#20495
1214  0498 cd0000        	call	_GPIO_WriteLow
1216  049b 84            	pop	a
1219  049c 4b02          	push	#2
1220  049e ae5000        	ldw	x,#20480
1221  04a1 cd0000        	call	_GPIO_WriteLow
1223  04a4 84            	pop	a
1226  04a5 4b40          	push	#64
1227  04a7 ae500a        	ldw	x,#20490
1228  04aa cd0000        	call	_GPIO_WriteHigh
1230  04ad 84            	pop	a
1231                     ; 113     delay(DELAY_DISPLAY_TEST);
1233  04ae ae01f4        	ldw	x,#500
1234  04b1 89            	pushw	x
1235  04b2 ae0000        	ldw	x,#0
1236  04b5 89            	pushw	x
1237  04b6 cd0000        	call	_delay
1239  04b9 5b04          	addw	sp,#4
1240                     ; 114     display_four();
1242  04bb 4b20          	push	#32
1243  04bd ae500f        	ldw	x,#20495
1244  04c0 cd0000        	call	_GPIO_WriteLow
1246  04c3 84            	pop	a
1249  04c4 4b04          	push	#4
1250  04c6 ae5000        	ldw	x,#20480
1251  04c9 cd0000        	call	_GPIO_WriteHigh
1253  04cc 84            	pop	a
1256  04cd 4b80          	push	#128
1257  04cf ae500a        	ldw	x,#20490
1258  04d2 cd0000        	call	_GPIO_WriteHigh
1260  04d5 84            	pop	a
1263  04d6 4b08          	push	#8
1264  04d8 ae500f        	ldw	x,#20495
1265  04db cd0000        	call	_GPIO_WriteLow
1267  04de 84            	pop	a
1270  04df 4b02          	push	#2
1271  04e1 ae500f        	ldw	x,#20495
1272  04e4 cd0000        	call	_GPIO_WriteLow
1274  04e7 84            	pop	a
1277  04e8 4b02          	push	#2
1278  04ea ae5000        	ldw	x,#20480
1279  04ed cd0000        	call	_GPIO_WriteHigh
1281  04f0 84            	pop	a
1284  04f1 4b40          	push	#64
1285  04f3 ae500a        	ldw	x,#20490
1286  04f6 cd0000        	call	_GPIO_WriteHigh
1288  04f9 84            	pop	a
1289                     ; 115     delay(DELAY_DISPLAY_TEST);
1291  04fa ae01f4        	ldw	x,#500
1292  04fd 89            	pushw	x
1293  04fe ae0000        	ldw	x,#0
1294  0501 89            	pushw	x
1295  0502 cd0000        	call	_delay
1297  0505 5b04          	addw	sp,#4
1298                     ; 116     display_five();
1300  0507 4b20          	push	#32
1301  0509 ae500f        	ldw	x,#20495
1302  050c cd0000        	call	_GPIO_WriteHigh
1304  050f 84            	pop	a
1307  0510 4b04          	push	#4
1308  0512 ae5000        	ldw	x,#20480
1309  0515 cd0000        	call	_GPIO_WriteLow
1311  0518 84            	pop	a
1314  0519 4b80          	push	#128
1315  051b ae500a        	ldw	x,#20490
1316  051e cd0000        	call	_GPIO_WriteHigh
1318  0521 84            	pop	a
1321  0522 4b08          	push	#8
1322  0524 ae500f        	ldw	x,#20495
1323  0527 cd0000        	call	_GPIO_WriteHigh
1325  052a 84            	pop	a
1328  052b 4b02          	push	#2
1329  052d ae500f        	ldw	x,#20495
1330  0530 cd0000        	call	_GPIO_WriteLow
1332  0533 84            	pop	a
1335  0534 4b02          	push	#2
1336  0536 ae5000        	ldw	x,#20480
1337  0539 cd0000        	call	_GPIO_WriteHigh
1339  053c 84            	pop	a
1342  053d 4b40          	push	#64
1343  053f ae500a        	ldw	x,#20490
1344  0542 cd0000        	call	_GPIO_WriteHigh
1346  0545 84            	pop	a
1347                     ; 117     delay(DELAY_DISPLAY_TEST);
1349  0546 ae01f4        	ldw	x,#500
1350  0549 89            	pushw	x
1351  054a ae0000        	ldw	x,#0
1352  054d 89            	pushw	x
1353  054e cd0000        	call	_delay
1355  0551 5b04          	addw	sp,#4
1356                     ; 118     display_six();
1358  0553 4b20          	push	#32
1359  0555 ae500f        	ldw	x,#20495
1360  0558 cd0000        	call	_GPIO_WriteHigh
1362  055b 84            	pop	a
1365  055c 4b04          	push	#4
1366  055e ae5000        	ldw	x,#20480
1367  0561 cd0000        	call	_GPIO_WriteLow
1369  0564 84            	pop	a
1372  0565 4b80          	push	#128
1373  0567 ae500a        	ldw	x,#20490
1374  056a cd0000        	call	_GPIO_WriteHigh
1376  056d 84            	pop	a
1379  056e 4b08          	push	#8
1380  0570 ae500f        	ldw	x,#20495
1381  0573 cd0000        	call	_GPIO_WriteHigh
1383  0576 84            	pop	a
1386  0577 4b02          	push	#2
1387  0579 ae500f        	ldw	x,#20495
1388  057c cd0000        	call	_GPIO_WriteHigh
1390  057f 84            	pop	a
1393  0580 4b02          	push	#2
1394  0582 ae5000        	ldw	x,#20480
1395  0585 cd0000        	call	_GPIO_WriteHigh
1397  0588 84            	pop	a
1400  0589 4b40          	push	#64
1401  058b ae500a        	ldw	x,#20490
1402  058e cd0000        	call	_GPIO_WriteHigh
1404  0591 84            	pop	a
1405                     ; 119     delay(DELAY_DISPLAY_TEST);
1407  0592 ae01f4        	ldw	x,#500
1408  0595 89            	pushw	x
1409  0596 ae0000        	ldw	x,#0
1410  0599 89            	pushw	x
1411  059a cd0000        	call	_delay
1413  059d 5b04          	addw	sp,#4
1414                     ; 120     display_seven();
1416  059f 4b20          	push	#32
1417  05a1 ae500f        	ldw	x,#20495
1418  05a4 cd0000        	call	_GPIO_WriteHigh
1420  05a7 84            	pop	a
1423  05a8 4b04          	push	#4
1424  05aa ae5000        	ldw	x,#20480
1425  05ad cd0000        	call	_GPIO_WriteHigh
1427  05b0 84            	pop	a
1430  05b1 4b80          	push	#128
1431  05b3 ae500a        	ldw	x,#20490
1432  05b6 cd0000        	call	_GPIO_WriteHigh
1434  05b9 84            	pop	a
1437  05ba 4b08          	push	#8
1438  05bc ae500f        	ldw	x,#20495
1439  05bf cd0000        	call	_GPIO_WriteLow
1441  05c2 84            	pop	a
1444  05c3 4b02          	push	#2
1445  05c5 ae500f        	ldw	x,#20495
1446  05c8 cd0000        	call	_GPIO_WriteLow
1448  05cb 84            	pop	a
1451  05cc 4b02          	push	#2
1452  05ce ae5000        	ldw	x,#20480
1453  05d1 cd0000        	call	_GPIO_WriteLow
1455  05d4 84            	pop	a
1458  05d5 4b40          	push	#64
1459  05d7 ae500a        	ldw	x,#20490
1460  05da cd0000        	call	_GPIO_WriteLow
1462  05dd 84            	pop	a
1463                     ; 121     delay(DELAY_DISPLAY_TEST);
1465  05de ae01f4        	ldw	x,#500
1466  05e1 89            	pushw	x
1467  05e2 ae0000        	ldw	x,#0
1468  05e5 89            	pushw	x
1469  05e6 cd0000        	call	_delay
1471  05e9 5b04          	addw	sp,#4
1472                     ; 122     display_eight();
1474  05eb 4b20          	push	#32
1475  05ed ae500f        	ldw	x,#20495
1476  05f0 cd0000        	call	_GPIO_WriteHigh
1478  05f3 84            	pop	a
1481  05f4 4b04          	push	#4
1482  05f6 ae5000        	ldw	x,#20480
1483  05f9 cd0000        	call	_GPIO_WriteHigh
1485  05fc 84            	pop	a
1488  05fd 4b80          	push	#128
1489  05ff ae500a        	ldw	x,#20490
1490  0602 cd0000        	call	_GPIO_WriteHigh
1492  0605 84            	pop	a
1495  0606 4b08          	push	#8
1496  0608 ae500f        	ldw	x,#20495
1497  060b cd0000        	call	_GPIO_WriteHigh
1499  060e 84            	pop	a
1502  060f 4b02          	push	#2
1503  0611 ae500f        	ldw	x,#20495
1504  0614 cd0000        	call	_GPIO_WriteHigh
1506  0617 84            	pop	a
1509  0618 4b02          	push	#2
1510  061a ae5000        	ldw	x,#20480
1511  061d cd0000        	call	_GPIO_WriteHigh
1513  0620 84            	pop	a
1516  0621 4b40          	push	#64
1517  0623 ae500a        	ldw	x,#20490
1518  0626 cd0000        	call	_GPIO_WriteHigh
1520  0629 84            	pop	a
1521                     ; 123     delay(DELAY_DISPLAY_TEST);
1523  062a ae01f4        	ldw	x,#500
1524  062d 89            	pushw	x
1525  062e ae0000        	ldw	x,#0
1526  0631 89            	pushw	x
1527  0632 cd0000        	call	_delay
1529  0635 5b04          	addw	sp,#4
1530                     ; 124     display_nine();    
1532  0637 4b20          	push	#32
1533  0639 ae500f        	ldw	x,#20495
1534  063c cd0000        	call	_GPIO_WriteHigh
1536  063f 84            	pop	a
1539  0640 4b04          	push	#4
1540  0642 ae5000        	ldw	x,#20480
1541  0645 cd0000        	call	_GPIO_WriteHigh
1543  0648 84            	pop	a
1546  0649 4b80          	push	#128
1547  064b ae500a        	ldw	x,#20490
1548  064e cd0000        	call	_GPIO_WriteHigh
1550  0651 84            	pop	a
1553  0652 4b08          	push	#8
1554  0654 ae500f        	ldw	x,#20495
1555  0657 cd0000        	call	_GPIO_WriteHigh
1557  065a 84            	pop	a
1560  065b 4b02          	push	#2
1561  065d ae500f        	ldw	x,#20495
1562  0660 cd0000        	call	_GPIO_WriteLow
1564  0663 84            	pop	a
1567  0664 4b02          	push	#2
1568  0666 ae5000        	ldw	x,#20480
1569  0669 cd0000        	call	_GPIO_WriteHigh
1571  066c 84            	pop	a
1574  066d 4b40          	push	#64
1575  066f ae500a        	ldw	x,#20490
1576  0672 cd0000        	call	_GPIO_WriteHigh
1578  0675 84            	pop	a
1579                     ; 125     delay(DELAY_DISPLAY_TEST);
1581  0676 ae01f4        	ldw	x,#500
1582  0679 89            	pushw	x
1583  067a ae0000        	ldw	x,#0
1584  067d 89            	pushw	x
1585  067e cd0000        	call	_delay
1587  0681 5b04          	addw	sp,#4
1588                     ; 126     display_off();
1590  0683 4b20          	push	#32
1591  0685 ae500f        	ldw	x,#20495
1592  0688 cd0000        	call	_GPIO_WriteLow
1594  068b 84            	pop	a
1597  068c 4b04          	push	#4
1598  068e ae5000        	ldw	x,#20480
1599  0691 cd0000        	call	_GPIO_WriteLow
1601  0694 84            	pop	a
1604  0695 4b80          	push	#128
1605  0697 ae500a        	ldw	x,#20490
1606  069a cd0000        	call	_GPIO_WriteLow
1608  069d 84            	pop	a
1611  069e 4b08          	push	#8
1612  06a0 ae500f        	ldw	x,#20495
1613  06a3 cd0000        	call	_GPIO_WriteLow
1615  06a6 84            	pop	a
1618  06a7 4b02          	push	#2
1619  06a9 ae500f        	ldw	x,#20495
1620  06ac cd0000        	call	_GPIO_WriteLow
1622  06af 84            	pop	a
1625  06b0 4b02          	push	#2
1626  06b2 ae5000        	ldw	x,#20480
1627  06b5 cd0000        	call	_GPIO_WriteLow
1629  06b8 84            	pop	a
1632  06b9 4b40          	push	#64
1633  06bb ae500a        	ldw	x,#20490
1634  06be cd0000        	call	_GPIO_WriteLow
1636  06c1 84            	pop	a
1639  06c2 4b04          	push	#4
1640  06c4 ae500f        	ldw	x,#20495
1641  06c7 cd0000        	call	_GPIO_WriteLow
1643  06ca 84            	pop	a
1644                     ; 127     dp_on();
1647  06cb 4b04          	push	#4
1648  06cd ae500f        	ldw	x,#20495
1649  06d0 cd0000        	call	_GPIO_WriteHigh
1651  06d3 84            	pop	a
1652                     ; 128     delay(DELAY_DISPLAY_TEST);
1654  06d4 ae01f4        	ldw	x,#500
1655  06d7 89            	pushw	x
1656  06d8 ae0000        	ldw	x,#0
1657  06db 89            	pushw	x
1658  06dc cd0000        	call	_delay
1660  06df 5b04          	addw	sp,#4
1661                     ; 129     dp_off();
1663  06e1 4b04          	push	#4
1664  06e3 ae500f        	ldw	x,#20495
1665  06e6 cd0000        	call	_GPIO_WriteLow
1667  06e9 84            	pop	a
1668                     ; 130 }
1671  06ea 81            	ret
1699                     ; 133 void init_display(void)
1699                     ; 134 {
1700                     	switch	.text
1701  06eb               _init_display:
1705                     ; 138     seg_a_dir();
1707  06eb 4be0          	push	#224
1708  06ed 4b20          	push	#32
1709  06ef ae500f        	ldw	x,#20495
1710  06f2 cd0000        	call	_GPIO_Init
1712  06f5 85            	popw	x
1713                     ; 139     seg_b_dir();
1716  06f6 4be0          	push	#224
1717  06f8 4b04          	push	#4
1718  06fa ae5000        	ldw	x,#20480
1719  06fd cd0000        	call	_GPIO_Init
1721  0700 85            	popw	x
1722                     ; 140     seg_c_dir();
1725  0701 4be0          	push	#224
1726  0703 4b80          	push	#128
1727  0705 ae500a        	ldw	x,#20490
1728  0708 cd0000        	call	_GPIO_Init
1730  070b 85            	popw	x
1731                     ; 141     seg_d_dir();
1734  070c 4be0          	push	#224
1735  070e 4b08          	push	#8
1736  0710 ae500f        	ldw	x,#20495
1737  0713 cd0000        	call	_GPIO_Init
1739  0716 85            	popw	x
1740                     ; 142     seg_e_dir();
1743  0717 4be0          	push	#224
1744  0719 4b02          	push	#2
1745  071b ae500f        	ldw	x,#20495
1746  071e cd0000        	call	_GPIO_Init
1748  0721 85            	popw	x
1749                     ; 143     seg_f_dir();
1752  0722 4be0          	push	#224
1753  0724 4b02          	push	#2
1754  0726 ae5000        	ldw	x,#20480
1755  0729 cd0000        	call	_GPIO_Init
1757  072c 85            	popw	x
1758                     ; 144     seg_g_dir();
1761  072d 4be0          	push	#224
1762  072f 4b40          	push	#64
1763  0731 ae500a        	ldw	x,#20490
1764  0734 cd0000        	call	_GPIO_Init
1766  0737 85            	popw	x
1767                     ; 145     dp_dir();
1770  0738 4be0          	push	#224
1771  073a 4b04          	push	#4
1772  073c ae500f        	ldw	x,#20495
1773  073f cd0000        	call	_GPIO_Init
1775  0742 85            	popw	x
1776                     ; 146     dig1_dir();
1779  0743 4be0          	push	#224
1780  0745 4b10          	push	#16
1781  0747 ae500f        	ldw	x,#20495
1782  074a cd0000        	call	_GPIO_Init
1784  074d 85            	popw	x
1785                     ; 147     dig2_dir();
1788  074e 4be0          	push	#224
1789  0750 4b20          	push	#32
1790  0752 ae5005        	ldw	x,#20485
1791  0755 cd0000        	call	_GPIO_Init
1793  0758 85            	popw	x
1794                     ; 148     dig3_dir();
1797  0759 4be0          	push	#224
1798  075b 4b10          	push	#16
1799  075d ae5005        	ldw	x,#20485
1800  0760 cd0000        	call	_GPIO_Init
1802  0763 85            	popw	x
1803                     ; 151     dig1_on();
1806  0764 4b10          	push	#16
1807  0766 ae500f        	ldw	x,#20495
1808  0769 cd0000        	call	_GPIO_WriteLow
1810  076c 84            	pop	a
1811                     ; 152     dig2_on();
1813  076d 4b20          	push	#32
1814  076f ae5005        	ldw	x,#20485
1815  0772 cd0000        	call	_GPIO_WriteLow
1817  0775 84            	pop	a
1818                     ; 153     dig3_on();
1820  0776 4b10          	push	#16
1821  0778 ae5005        	ldw	x,#20485
1822  077b cd0000        	call	_GPIO_WriteLow
1824  077e 84            	pop	a
1825                     ; 155     display_all();
1827  077f 4b20          	push	#32
1828  0781 ae500f        	ldw	x,#20495
1829  0784 cd0000        	call	_GPIO_WriteHigh
1831  0787 84            	pop	a
1834  0788 4b04          	push	#4
1835  078a ae5000        	ldw	x,#20480
1836  078d cd0000        	call	_GPIO_WriteHigh
1838  0790 84            	pop	a
1841  0791 4b80          	push	#128
1842  0793 ae500a        	ldw	x,#20490
1843  0796 cd0000        	call	_GPIO_WriteHigh
1845  0799 84            	pop	a
1848  079a 4b08          	push	#8
1849  079c ae500f        	ldw	x,#20495
1850  079f cd0000        	call	_GPIO_WriteHigh
1852  07a2 84            	pop	a
1855  07a3 4b02          	push	#2
1856  07a5 ae500f        	ldw	x,#20495
1857  07a8 cd0000        	call	_GPIO_WriteHigh
1859  07ab 84            	pop	a
1862  07ac 4b02          	push	#2
1863  07ae ae5000        	ldw	x,#20480
1864  07b1 cd0000        	call	_GPIO_WriteHigh
1866  07b4 84            	pop	a
1869  07b5 4b40          	push	#64
1870  07b7 ae500a        	ldw	x,#20490
1871  07ba cd0000        	call	_GPIO_WriteHigh
1873  07bd 84            	pop	a
1876  07be 4b04          	push	#4
1877  07c0 ae500f        	ldw	x,#20495
1878  07c3 cd0000        	call	_GPIO_WriteHigh
1880  07c6 84            	pop	a
1881                     ; 156     delay(2*DELAY_DISPLAY_TEST);
1884  07c7 ae03e8        	ldw	x,#1000
1885  07ca 89            	pushw	x
1886  07cb ae0000        	ldw	x,#0
1887  07ce 89            	pushw	x
1888  07cf cd0000        	call	_delay
1890  07d2 5b04          	addw	sp,#4
1891                     ; 157     display_off();
1893  07d4 4b20          	push	#32
1894  07d6 ae500f        	ldw	x,#20495
1895  07d9 cd0000        	call	_GPIO_WriteLow
1897  07dc 84            	pop	a
1900  07dd 4b04          	push	#4
1901  07df ae5000        	ldw	x,#20480
1902  07e2 cd0000        	call	_GPIO_WriteLow
1904  07e5 84            	pop	a
1907  07e6 4b80          	push	#128
1908  07e8 ae500a        	ldw	x,#20490
1909  07eb cd0000        	call	_GPIO_WriteLow
1911  07ee 84            	pop	a
1914  07ef 4b08          	push	#8
1915  07f1 ae500f        	ldw	x,#20495
1916  07f4 cd0000        	call	_GPIO_WriteLow
1918  07f7 84            	pop	a
1921  07f8 4b02          	push	#2
1922  07fa ae500f        	ldw	x,#20495
1923  07fd cd0000        	call	_GPIO_WriteLow
1925  0800 84            	pop	a
1928  0801 4b02          	push	#2
1929  0803 ae5000        	ldw	x,#20480
1930  0806 cd0000        	call	_GPIO_WriteLow
1932  0809 84            	pop	a
1935  080a 4b40          	push	#64
1936  080c ae500a        	ldw	x,#20490
1937  080f cd0000        	call	_GPIO_WriteLow
1939  0812 84            	pop	a
1942  0813 4b04          	push	#4
1943  0815 ae500f        	ldw	x,#20495
1944  0818 cd0000        	call	_GPIO_WriteLow
1946  081b 84            	pop	a
1947                     ; 158     delay(DELAY_DISPLAY_TEST);
1950  081c ae01f4        	ldw	x,#500
1951  081f 89            	pushw	x
1952  0820 ae0000        	ldw	x,#0
1953  0823 89            	pushw	x
1954  0824 cd0000        	call	_delay
1956  0827 5b04          	addw	sp,#4
1957                     ; 159     display_all();
1959  0829 4b20          	push	#32
1960  082b ae500f        	ldw	x,#20495
1961  082e cd0000        	call	_GPIO_WriteHigh
1963  0831 84            	pop	a
1966  0832 4b04          	push	#4
1967  0834 ae5000        	ldw	x,#20480
1968  0837 cd0000        	call	_GPIO_WriteHigh
1970  083a 84            	pop	a
1973  083b 4b80          	push	#128
1974  083d ae500a        	ldw	x,#20490
1975  0840 cd0000        	call	_GPIO_WriteHigh
1977  0843 84            	pop	a
1980  0844 4b08          	push	#8
1981  0846 ae500f        	ldw	x,#20495
1982  0849 cd0000        	call	_GPIO_WriteHigh
1984  084c 84            	pop	a
1987  084d 4b02          	push	#2
1988  084f ae500f        	ldw	x,#20495
1989  0852 cd0000        	call	_GPIO_WriteHigh
1991  0855 84            	pop	a
1994  0856 4b02          	push	#2
1995  0858 ae5000        	ldw	x,#20480
1996  085b cd0000        	call	_GPIO_WriteHigh
1998  085e 84            	pop	a
2001  085f 4b40          	push	#64
2002  0861 ae500a        	ldw	x,#20490
2003  0864 cd0000        	call	_GPIO_WriteHigh
2005  0867 84            	pop	a
2008  0868 4b04          	push	#4
2009  086a ae500f        	ldw	x,#20495
2010  086d cd0000        	call	_GPIO_WriteHigh
2012  0870 84            	pop	a
2013                     ; 160     delay(2*DELAY_DISPLAY_TEST);
2016  0871 ae03e8        	ldw	x,#1000
2017  0874 89            	pushw	x
2018  0875 ae0000        	ldw	x,#0
2019  0878 89            	pushw	x
2020  0879 cd0000        	call	_delay
2022  087c 5b04          	addw	sp,#4
2023                     ; 161     display_off();
2025  087e 4b20          	push	#32
2026  0880 ae500f        	ldw	x,#20495
2027  0883 cd0000        	call	_GPIO_WriteLow
2029  0886 84            	pop	a
2032  0887 4b04          	push	#4
2033  0889 ae5000        	ldw	x,#20480
2034  088c cd0000        	call	_GPIO_WriteLow
2036  088f 84            	pop	a
2039  0890 4b80          	push	#128
2040  0892 ae500a        	ldw	x,#20490
2041  0895 cd0000        	call	_GPIO_WriteLow
2043  0898 84            	pop	a
2046  0899 4b08          	push	#8
2047  089b ae500f        	ldw	x,#20495
2048  089e cd0000        	call	_GPIO_WriteLow
2050  08a1 84            	pop	a
2053  08a2 4b02          	push	#2
2054  08a4 ae500f        	ldw	x,#20495
2055  08a7 cd0000        	call	_GPIO_WriteLow
2057  08aa 84            	pop	a
2060  08ab 4b02          	push	#2
2061  08ad ae5000        	ldw	x,#20480
2062  08b0 cd0000        	call	_GPIO_WriteLow
2064  08b3 84            	pop	a
2067  08b4 4b40          	push	#64
2068  08b6 ae500a        	ldw	x,#20490
2069  08b9 cd0000        	call	_GPIO_WriteLow
2071  08bc 84            	pop	a
2074  08bd 4b04          	push	#4
2075  08bf ae500f        	ldw	x,#20495
2076  08c2 cd0000        	call	_GPIO_WriteLow
2078  08c5 84            	pop	a
2079                     ; 162     delay(DELAY_DISPLAY_TEST);
2082  08c6 ae01f4        	ldw	x,#500
2083  08c9 89            	pushw	x
2084  08ca ae0000        	ldw	x,#0
2085  08cd 89            	pushw	x
2086  08ce cd0000        	call	_delay
2088  08d1 5b04          	addw	sp,#4
2089                     ; 163     display_all();
2091  08d3 4b20          	push	#32
2092  08d5 ae500f        	ldw	x,#20495
2093  08d8 cd0000        	call	_GPIO_WriteHigh
2095  08db 84            	pop	a
2098  08dc 4b04          	push	#4
2099  08de ae5000        	ldw	x,#20480
2100  08e1 cd0000        	call	_GPIO_WriteHigh
2102  08e4 84            	pop	a
2105  08e5 4b80          	push	#128
2106  08e7 ae500a        	ldw	x,#20490
2107  08ea cd0000        	call	_GPIO_WriteHigh
2109  08ed 84            	pop	a
2112  08ee 4b08          	push	#8
2113  08f0 ae500f        	ldw	x,#20495
2114  08f3 cd0000        	call	_GPIO_WriteHigh
2116  08f6 84            	pop	a
2119  08f7 4b02          	push	#2
2120  08f9 ae500f        	ldw	x,#20495
2121  08fc cd0000        	call	_GPIO_WriteHigh
2123  08ff 84            	pop	a
2126  0900 4b02          	push	#2
2127  0902 ae5000        	ldw	x,#20480
2128  0905 cd0000        	call	_GPIO_WriteHigh
2130  0908 84            	pop	a
2133  0909 4b40          	push	#64
2134  090b ae500a        	ldw	x,#20490
2135  090e cd0000        	call	_GPIO_WriteHigh
2137  0911 84            	pop	a
2140  0912 4b04          	push	#4
2141  0914 ae500f        	ldw	x,#20495
2142  0917 cd0000        	call	_GPIO_WriteHigh
2144  091a 84            	pop	a
2145                     ; 164     delay(2*DELAY_DISPLAY_TEST);
2148  091b ae03e8        	ldw	x,#1000
2149  091e 89            	pushw	x
2150  091f ae0000        	ldw	x,#0
2151  0922 89            	pushw	x
2152  0923 cd0000        	call	_delay
2154  0926 5b04          	addw	sp,#4
2155                     ; 165     display_off();
2157  0928 4b20          	push	#32
2158  092a ae500f        	ldw	x,#20495
2159  092d cd0000        	call	_GPIO_WriteLow
2161  0930 84            	pop	a
2164  0931 4b04          	push	#4
2165  0933 ae5000        	ldw	x,#20480
2166  0936 cd0000        	call	_GPIO_WriteLow
2168  0939 84            	pop	a
2171  093a 4b80          	push	#128
2172  093c ae500a        	ldw	x,#20490
2173  093f cd0000        	call	_GPIO_WriteLow
2175  0942 84            	pop	a
2178  0943 4b08          	push	#8
2179  0945 ae500f        	ldw	x,#20495
2180  0948 cd0000        	call	_GPIO_WriteLow
2182  094b 84            	pop	a
2185  094c 4b02          	push	#2
2186  094e ae500f        	ldw	x,#20495
2187  0951 cd0000        	call	_GPIO_WriteLow
2189  0954 84            	pop	a
2192  0955 4b02          	push	#2
2193  0957 ae5000        	ldw	x,#20480
2194  095a cd0000        	call	_GPIO_WriteLow
2196  095d 84            	pop	a
2199  095e 4b40          	push	#64
2200  0960 ae500a        	ldw	x,#20490
2201  0963 cd0000        	call	_GPIO_WriteLow
2203  0966 84            	pop	a
2206  0967 4b04          	push	#4
2207  0969 ae500f        	ldw	x,#20495
2208  096c cd0000        	call	_GPIO_WriteLow
2210  096f 84            	pop	a
2211                     ; 167     display_test = 0;
2214  0970 3f00          	clr	_display_test
2215                     ; 170     dig1_off();
2217  0972 4b10          	push	#16
2218  0974 ae500f        	ldw	x,#20495
2219  0977 cd0000        	call	_GPIO_WriteHigh
2221  097a 84            	pop	a
2222                     ; 171     dig2_off();
2224  097b 4b20          	push	#32
2225  097d ae5005        	ldw	x,#20485
2226  0980 cd0000        	call	_GPIO_WriteHigh
2228  0983 84            	pop	a
2229                     ; 172     dig3_off();
2231  0984 4b10          	push	#16
2232  0986 ae5005        	ldw	x,#20485
2233  0989 cd0000        	call	_GPIO_WriteHigh
2235  098c 84            	pop	a
2236                     ; 175 }
2239  098d 81            	ret
2273                     	xdef	_test_display
2274                     	xdef	_wr_digit
2275                     	xdef	_dec2bcd
2276                     	xdef	_display_num
2277                     	xdef	_display_test
2278                     	xref	_delay
2279                     	xdef	_set_display
2280                     	xdef	_tmr_display
2281                     	xdef	_init_display
2282                     	xref	_GPIO_WriteLow
2283                     	xref	_GPIO_WriteHigh
2284                     	xref	_GPIO_Init
2303                     	end
