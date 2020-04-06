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
  61                     ; 19 uint8_t dec2bcd(uint8_t val)
  61                     ; 20 {
  63                     	switch	.text
  64  0000               _dec2bcd:
  66  0000 88            	push	a
  67  0001 88            	push	a
  68       00000001      OFST:	set	1
  71                     ; 21   return (uint8_t)((val/10*16) + (val%10));
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
 150                     ; 24 void set_display(uint8_t option, uint8_t value, uint8_t decimal)
 150                     ; 25 {
 151                     	switch	.text
 152  001d               _set_display:
 154  001d 89            	pushw	x
 155  001e 88            	push	a
 156       00000001      OFST:	set	1
 159                     ; 28     bcd = (uint8_t)dec2bcd(value);
 161  001f 9f            	ld	a,xl
 162  0020 adde          	call	_dec2bcd
 164  0022 6b01          	ld	(OFST+0,sp),a
 166                     ; 30     if (option > MAX_DISPLAY_OPTION)
 168  0024 7b02          	ld	a,(OFST+1,sp)
 169  0026 a10a          	cp	a,#10
 170  0028 2504          	jrult	L55
 171                     ; 31         option = MAX_DISPLAY_OPTION;
 173  002a a609          	ld	a,#9
 174  002c 6b02          	ld	(OFST+1,sp),a
 175  002e               L55:
 176                     ; 32     if (value > MAX_DISPLAY_VALUE)
 178  002e 7b03          	ld	a,(OFST+2,sp)
 179  0030 a164          	cp	a,#100
 180  0032 2504          	jrult	L75
 181                     ; 33         value = MAX_DISPLAY_VALUE;
 183  0034 a663          	ld	a,#99
 184  0036 6b03          	ld	(OFST+2,sp),a
 185  0038               L75:
 186                     ; 35     display_num[DIG1_POS] = option;
 188  0038 7b02          	ld	a,(OFST+1,sp)
 189  003a b701          	ld	_display_num,a
 190                     ; 36     display_num[DIG2_POS] = (uint8_t)(bcd >> 4);
 192  003c 7b01          	ld	a,(OFST+0,sp)
 193  003e 4e            	swap	a
 194  003f a40f          	and	a,#15
 195  0041 b702          	ld	_display_num+1,a
 196                     ; 37     display_num[DIG3_POS] = (uint8_t)(bcd & 0x0F);
 198  0043 7b01          	ld	a,(OFST+0,sp)
 199  0045 a40f          	and	a,#15
 200  0047 b703          	ld	_display_num+2,a
 201                     ; 38 }
 204  0049 5b03          	addw	sp,#3
 205  004b 81            	ret
 242                     ; 40 void wr_digit(uint8_t dig_pos)
 242                     ; 41 {
 243                     	switch	.text
 244  004c               _wr_digit:
 248                     ; 42     switch (display_num[dig_pos]) {
 250  004c 5f            	clrw	x
 251  004d 97            	ld	xl,a
 252  004e e601          	ld	a,(_display_num,x)
 254                     ; 72         break;
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
 293                     ; 43     case 0x00:
 293                     ; 44         display_zero();
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
 342                     ; 45         break;
 344  00c9 ac210321      	jpf	L521
 345  00cd               L36:
 346                     ; 46     case 0x01:
 346                     ; 47         display_one();
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
 395                     ; 48         break;
 397  010c ac210321      	jpf	L521
 398  0110               L56:
 399                     ; 49     case 0x02:
 399                     ; 50         display_two();
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
 448                     ; 51         break;
 450  014f ac210321      	jpf	L521
 451  0153               L76:
 452                     ; 52     case 0x03:
 452                     ; 53         display_three();
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
 501                     ; 54         break;
 503  0192 ac210321      	jpf	L521
 504  0196               L17:
 505                     ; 55     case 0x04:
 505                     ; 56         display_four();
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
 554                     ; 57         break;
 556  01d5 ac210321      	jpf	L521
 557  01d9               L37:
 558                     ; 58     case 0x05:
 558                     ; 59         display_five();
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
 607                     ; 60         break;
 609  0218 ac210321      	jpf	L521
 610  021c               L57:
 611                     ; 61     case 0x06:
 611                     ; 62         display_six();
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
 660                     ; 63         break;
 662  025b ac210321      	jpf	L521
 663  025f               L77:
 664                     ; 64     case 0x07:
 664                     ; 65         display_seven();
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
 713                     ; 66         break;
 715  029e cc0321        	jra	L521
 716  02a1               L101:
 717                     ; 67     case 0x08:
 717                     ; 68         display_eight();
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
 766                     ; 69         break;
 768  02e0 203f          	jra	L521
 769  02e2               L301:
 770                     ; 70     case 0x09:
 770                     ; 71         display_nine();
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
 819                     ; 72         break;
 821  0321               L521:
 822                     ; 74 }
 825  0321 81            	ret
 851                     ; 76 void task_display(void)
 851                     ; 77 {
 852                     	switch	.text
 853  0322               _task_display:
 857                     ; 78     if (!tick)
 859  0322 3d00          	tnz	_tick
 860  0324 2601          	jrne	L731
 861                     ; 79         return;
 864  0326 81            	ret
 865  0327               L731:
 866                     ; 80     set_display(0, (uint8_t)((float)adc_val*3/100), 0);
 868  0327 4b00          	push	#0
 869  0329 be00          	ldw	x,_adc_val
 870  032b cd0000        	call	c_uitof
 872  032e ae0004        	ldw	x,#L541
 873  0331 cd0000        	call	c_fmul
 875  0334 ae0000        	ldw	x,#L551
 876  0337 cd0000        	call	c_fdiv
 878  033a cd0000        	call	c_ftol
 880  033d b603          	ld	a,c_lreg+3
 881  033f 5f            	clrw	x
 882  0340 97            	ld	xl,a
 883  0341 cd001d        	call	_set_display
 885  0344 84            	pop	a
 886                     ; 81 }
 889  0345 81            	ret
 892                     	bsct
 893  0004               L161_dig_pos:
 894  0004 00            	dc.b	0
 930                     ; 83 void tmr_display(void)
 930                     ; 84 {
 931                     	switch	.text
 932  0346               _tmr_display:
 936                     ; 88     if (display_test)
 938  0346 3d00          	tnz	_display_test
 939  0348 2701          	jreq	L702
 940                     ; 89         return;
 943  034a 81            	ret
 944  034b               L702:
 945                     ; 92     if (dig_pos > MAX_DIG_POS)
 947  034b b604          	ld	a,L161_dig_pos
 948  034d a104          	cp	a,#4
 949  034f 2502          	jrult	L112
 950                     ; 93         dig_pos = DIG1_POS;
 952  0351 3f04          	clr	L161_dig_pos
 953  0353               L112:
 954                     ; 95     dig1_off();
 956  0353 4b10          	push	#16
 957  0355 ae500f        	ldw	x,#20495
 958  0358 cd0000        	call	_GPIO_WriteHigh
 960  035b 84            	pop	a
 961                     ; 96     dig2_off();
 963  035c 4b20          	push	#32
 964  035e ae5005        	ldw	x,#20485
 965  0361 cd0000        	call	_GPIO_WriteHigh
 967  0364 84            	pop	a
 968                     ; 97     dig3_off();
 970  0365 4b10          	push	#16
 971  0367 ae5005        	ldw	x,#20485
 972  036a cd0000        	call	_GPIO_WriteHigh
 974  036d 84            	pop	a
 975                     ; 99     switch (dig_pos) {
 977  036e b604          	ld	a,L161_dig_pos
 979                     ; 108         break;
 980  0370 4d            	tnz	a
 981  0371 2708          	jreq	L361
 982  0373 4a            	dec	a
 983  0374 2710          	jreq	L561
 984  0376 4a            	dec	a
 985  0377 2718          	jreq	L761
 986  0379 201f          	jra	L512
 987  037b               L361:
 988                     ; 100     case DIG1_POS:
 988                     ; 101         dig1_on();
 990  037b 4b10          	push	#16
 991  037d ae500f        	ldw	x,#20495
 992  0380 cd0000        	call	_GPIO_WriteLow
 994  0383 84            	pop	a
 995                     ; 102         break;
 997  0384 2014          	jra	L512
 998  0386               L561:
 999                     ; 103     case DIG2_POS:
 999                     ; 104         dig2_on();
1001  0386 4b20          	push	#32
1002  0388 ae5005        	ldw	x,#20485
1003  038b cd0000        	call	_GPIO_WriteLow
1005  038e 84            	pop	a
1006                     ; 105         break;
1008  038f 2009          	jra	L512
1009  0391               L761:
1010                     ; 106     case DIG3_POS:
1010                     ; 107         dig3_on();
1012  0391 4b10          	push	#16
1013  0393 ae5005        	ldw	x,#20485
1014  0396 cd0000        	call	_GPIO_WriteLow
1016  0399 84            	pop	a
1017                     ; 108         break;
1019  039a               L512:
1020                     ; 111     wr_digit(dig_pos);
1022  039a b604          	ld	a,L161_dig_pos
1023  039c cd004c        	call	_wr_digit
1025                     ; 112     dig_pos++;
1027  039f 3c04          	inc	L161_dig_pos
1028                     ; 113 }
1031  03a1 81            	ret
1057                     ; 116 void test_display(void)
1057                     ; 117 {
1058                     	switch	.text
1059  03a2               _test_display:
1063                     ; 118     delay(DELAY_DISPLAY_TEST);
1065  03a2 ae01f4        	ldw	x,#500
1066  03a5 89            	pushw	x
1067  03a6 ae0000        	ldw	x,#0
1068  03a9 89            	pushw	x
1069  03aa cd0000        	call	_delay
1071  03ad 5b04          	addw	sp,#4
1072                     ; 119     display_zero();
1074  03af 4b20          	push	#32
1075  03b1 ae500f        	ldw	x,#20495
1076  03b4 cd0000        	call	_GPIO_WriteHigh
1078  03b7 84            	pop	a
1081  03b8 4b04          	push	#4
1082  03ba ae5000        	ldw	x,#20480
1083  03bd cd0000        	call	_GPIO_WriteHigh
1085  03c0 84            	pop	a
1088  03c1 4b80          	push	#128
1089  03c3 ae500a        	ldw	x,#20490
1090  03c6 cd0000        	call	_GPIO_WriteHigh
1092  03c9 84            	pop	a
1095  03ca 4b08          	push	#8
1096  03cc ae500f        	ldw	x,#20495
1097  03cf cd0000        	call	_GPIO_WriteHigh
1099  03d2 84            	pop	a
1102  03d3 4b02          	push	#2
1103  03d5 ae500f        	ldw	x,#20495
1104  03d8 cd0000        	call	_GPIO_WriteHigh
1106  03db 84            	pop	a
1109  03dc 4b02          	push	#2
1110  03de ae5000        	ldw	x,#20480
1111  03e1 cd0000        	call	_GPIO_WriteHigh
1113  03e4 84            	pop	a
1116  03e5 4b40          	push	#64
1117  03e7 ae500a        	ldw	x,#20490
1118  03ea cd0000        	call	_GPIO_WriteLow
1120  03ed 84            	pop	a
1121                     ; 120     delay(DELAY_DISPLAY_TEST);
1123  03ee ae01f4        	ldw	x,#500
1124  03f1 89            	pushw	x
1125  03f2 ae0000        	ldw	x,#0
1126  03f5 89            	pushw	x
1127  03f6 cd0000        	call	_delay
1129  03f9 5b04          	addw	sp,#4
1130                     ; 121     display_one();
1132  03fb 4b20          	push	#32
1133  03fd ae500f        	ldw	x,#20495
1134  0400 cd0000        	call	_GPIO_WriteLow
1136  0403 84            	pop	a
1139  0404 4b04          	push	#4
1140  0406 ae5000        	ldw	x,#20480
1141  0409 cd0000        	call	_GPIO_WriteHigh
1143  040c 84            	pop	a
1146  040d 4b80          	push	#128
1147  040f ae500a        	ldw	x,#20490
1148  0412 cd0000        	call	_GPIO_WriteHigh
1150  0415 84            	pop	a
1153  0416 4b08          	push	#8
1154  0418 ae500f        	ldw	x,#20495
1155  041b cd0000        	call	_GPIO_WriteLow
1157  041e 84            	pop	a
1160  041f 4b02          	push	#2
1161  0421 ae500f        	ldw	x,#20495
1162  0424 cd0000        	call	_GPIO_WriteLow
1164  0427 84            	pop	a
1167  0428 4b02          	push	#2
1168  042a ae5000        	ldw	x,#20480
1169  042d cd0000        	call	_GPIO_WriteLow
1171  0430 84            	pop	a
1174  0431 4b40          	push	#64
1175  0433 ae500a        	ldw	x,#20490
1176  0436 cd0000        	call	_GPIO_WriteLow
1178  0439 84            	pop	a
1179                     ; 122     delay(DELAY_DISPLAY_TEST);
1181  043a ae01f4        	ldw	x,#500
1182  043d 89            	pushw	x
1183  043e ae0000        	ldw	x,#0
1184  0441 89            	pushw	x
1185  0442 cd0000        	call	_delay
1187  0445 5b04          	addw	sp,#4
1188                     ; 123     display_two();
1190  0447 4b20          	push	#32
1191  0449 ae500f        	ldw	x,#20495
1192  044c cd0000        	call	_GPIO_WriteHigh
1194  044f 84            	pop	a
1197  0450 4b04          	push	#4
1198  0452 ae5000        	ldw	x,#20480
1199  0455 cd0000        	call	_GPIO_WriteHigh
1201  0458 84            	pop	a
1204  0459 4b80          	push	#128
1205  045b ae500a        	ldw	x,#20490
1206  045e cd0000        	call	_GPIO_WriteLow
1208  0461 84            	pop	a
1211  0462 4b08          	push	#8
1212  0464 ae500f        	ldw	x,#20495
1213  0467 cd0000        	call	_GPIO_WriteHigh
1215  046a 84            	pop	a
1218  046b 4b02          	push	#2
1219  046d ae500f        	ldw	x,#20495
1220  0470 cd0000        	call	_GPIO_WriteHigh
1222  0473 84            	pop	a
1225  0474 4b02          	push	#2
1226  0476 ae5000        	ldw	x,#20480
1227  0479 cd0000        	call	_GPIO_WriteLow
1229  047c 84            	pop	a
1232  047d 4b40          	push	#64
1233  047f ae500a        	ldw	x,#20490
1234  0482 cd0000        	call	_GPIO_WriteHigh
1236  0485 84            	pop	a
1237                     ; 124     delay(DELAY_DISPLAY_TEST);
1239  0486 ae01f4        	ldw	x,#500
1240  0489 89            	pushw	x
1241  048a ae0000        	ldw	x,#0
1242  048d 89            	pushw	x
1243  048e cd0000        	call	_delay
1245  0491 5b04          	addw	sp,#4
1246                     ; 125     display_three();
1248  0493 4b20          	push	#32
1249  0495 ae500f        	ldw	x,#20495
1250  0498 cd0000        	call	_GPIO_WriteHigh
1252  049b 84            	pop	a
1255  049c 4b04          	push	#4
1256  049e ae5000        	ldw	x,#20480
1257  04a1 cd0000        	call	_GPIO_WriteHigh
1259  04a4 84            	pop	a
1262  04a5 4b80          	push	#128
1263  04a7 ae500a        	ldw	x,#20490
1264  04aa cd0000        	call	_GPIO_WriteHigh
1266  04ad 84            	pop	a
1269  04ae 4b08          	push	#8
1270  04b0 ae500f        	ldw	x,#20495
1271  04b3 cd0000        	call	_GPIO_WriteHigh
1273  04b6 84            	pop	a
1276  04b7 4b02          	push	#2
1277  04b9 ae500f        	ldw	x,#20495
1278  04bc cd0000        	call	_GPIO_WriteLow
1280  04bf 84            	pop	a
1283  04c0 4b02          	push	#2
1284  04c2 ae5000        	ldw	x,#20480
1285  04c5 cd0000        	call	_GPIO_WriteLow
1287  04c8 84            	pop	a
1290  04c9 4b40          	push	#64
1291  04cb ae500a        	ldw	x,#20490
1292  04ce cd0000        	call	_GPIO_WriteHigh
1294  04d1 84            	pop	a
1295                     ; 126     delay(DELAY_DISPLAY_TEST);
1297  04d2 ae01f4        	ldw	x,#500
1298  04d5 89            	pushw	x
1299  04d6 ae0000        	ldw	x,#0
1300  04d9 89            	pushw	x
1301  04da cd0000        	call	_delay
1303  04dd 5b04          	addw	sp,#4
1304                     ; 127     display_four();
1306  04df 4b20          	push	#32
1307  04e1 ae500f        	ldw	x,#20495
1308  04e4 cd0000        	call	_GPIO_WriteLow
1310  04e7 84            	pop	a
1313  04e8 4b04          	push	#4
1314  04ea ae5000        	ldw	x,#20480
1315  04ed cd0000        	call	_GPIO_WriteHigh
1317  04f0 84            	pop	a
1320  04f1 4b80          	push	#128
1321  04f3 ae500a        	ldw	x,#20490
1322  04f6 cd0000        	call	_GPIO_WriteHigh
1324  04f9 84            	pop	a
1327  04fa 4b08          	push	#8
1328  04fc ae500f        	ldw	x,#20495
1329  04ff cd0000        	call	_GPIO_WriteLow
1331  0502 84            	pop	a
1334  0503 4b02          	push	#2
1335  0505 ae500f        	ldw	x,#20495
1336  0508 cd0000        	call	_GPIO_WriteLow
1338  050b 84            	pop	a
1341  050c 4b02          	push	#2
1342  050e ae5000        	ldw	x,#20480
1343  0511 cd0000        	call	_GPIO_WriteHigh
1345  0514 84            	pop	a
1348  0515 4b40          	push	#64
1349  0517 ae500a        	ldw	x,#20490
1350  051a cd0000        	call	_GPIO_WriteHigh
1352  051d 84            	pop	a
1353                     ; 128     delay(DELAY_DISPLAY_TEST);
1355  051e ae01f4        	ldw	x,#500
1356  0521 89            	pushw	x
1357  0522 ae0000        	ldw	x,#0
1358  0525 89            	pushw	x
1359  0526 cd0000        	call	_delay
1361  0529 5b04          	addw	sp,#4
1362                     ; 129     display_five();
1364  052b 4b20          	push	#32
1365  052d ae500f        	ldw	x,#20495
1366  0530 cd0000        	call	_GPIO_WriteHigh
1368  0533 84            	pop	a
1371  0534 4b04          	push	#4
1372  0536 ae5000        	ldw	x,#20480
1373  0539 cd0000        	call	_GPIO_WriteLow
1375  053c 84            	pop	a
1378  053d 4b80          	push	#128
1379  053f ae500a        	ldw	x,#20490
1380  0542 cd0000        	call	_GPIO_WriteHigh
1382  0545 84            	pop	a
1385  0546 4b08          	push	#8
1386  0548 ae500f        	ldw	x,#20495
1387  054b cd0000        	call	_GPIO_WriteHigh
1389  054e 84            	pop	a
1392  054f 4b02          	push	#2
1393  0551 ae500f        	ldw	x,#20495
1394  0554 cd0000        	call	_GPIO_WriteLow
1396  0557 84            	pop	a
1399  0558 4b02          	push	#2
1400  055a ae5000        	ldw	x,#20480
1401  055d cd0000        	call	_GPIO_WriteHigh
1403  0560 84            	pop	a
1406  0561 4b40          	push	#64
1407  0563 ae500a        	ldw	x,#20490
1408  0566 cd0000        	call	_GPIO_WriteHigh
1410  0569 84            	pop	a
1411                     ; 130     delay(DELAY_DISPLAY_TEST);
1413  056a ae01f4        	ldw	x,#500
1414  056d 89            	pushw	x
1415  056e ae0000        	ldw	x,#0
1416  0571 89            	pushw	x
1417  0572 cd0000        	call	_delay
1419  0575 5b04          	addw	sp,#4
1420                     ; 131     display_six();
1422  0577 4b20          	push	#32
1423  0579 ae500f        	ldw	x,#20495
1424  057c cd0000        	call	_GPIO_WriteHigh
1426  057f 84            	pop	a
1429  0580 4b04          	push	#4
1430  0582 ae5000        	ldw	x,#20480
1431  0585 cd0000        	call	_GPIO_WriteLow
1433  0588 84            	pop	a
1436  0589 4b80          	push	#128
1437  058b ae500a        	ldw	x,#20490
1438  058e cd0000        	call	_GPIO_WriteHigh
1440  0591 84            	pop	a
1443  0592 4b08          	push	#8
1444  0594 ae500f        	ldw	x,#20495
1445  0597 cd0000        	call	_GPIO_WriteHigh
1447  059a 84            	pop	a
1450  059b 4b02          	push	#2
1451  059d ae500f        	ldw	x,#20495
1452  05a0 cd0000        	call	_GPIO_WriteHigh
1454  05a3 84            	pop	a
1457  05a4 4b02          	push	#2
1458  05a6 ae5000        	ldw	x,#20480
1459  05a9 cd0000        	call	_GPIO_WriteHigh
1461  05ac 84            	pop	a
1464  05ad 4b40          	push	#64
1465  05af ae500a        	ldw	x,#20490
1466  05b2 cd0000        	call	_GPIO_WriteHigh
1468  05b5 84            	pop	a
1469                     ; 132     delay(DELAY_DISPLAY_TEST);
1471  05b6 ae01f4        	ldw	x,#500
1472  05b9 89            	pushw	x
1473  05ba ae0000        	ldw	x,#0
1474  05bd 89            	pushw	x
1475  05be cd0000        	call	_delay
1477  05c1 5b04          	addw	sp,#4
1478                     ; 133     display_seven();
1480  05c3 4b20          	push	#32
1481  05c5 ae500f        	ldw	x,#20495
1482  05c8 cd0000        	call	_GPIO_WriteHigh
1484  05cb 84            	pop	a
1487  05cc 4b04          	push	#4
1488  05ce ae5000        	ldw	x,#20480
1489  05d1 cd0000        	call	_GPIO_WriteHigh
1491  05d4 84            	pop	a
1494  05d5 4b80          	push	#128
1495  05d7 ae500a        	ldw	x,#20490
1496  05da cd0000        	call	_GPIO_WriteHigh
1498  05dd 84            	pop	a
1501  05de 4b08          	push	#8
1502  05e0 ae500f        	ldw	x,#20495
1503  05e3 cd0000        	call	_GPIO_WriteLow
1505  05e6 84            	pop	a
1508  05e7 4b02          	push	#2
1509  05e9 ae500f        	ldw	x,#20495
1510  05ec cd0000        	call	_GPIO_WriteLow
1512  05ef 84            	pop	a
1515  05f0 4b02          	push	#2
1516  05f2 ae5000        	ldw	x,#20480
1517  05f5 cd0000        	call	_GPIO_WriteLow
1519  05f8 84            	pop	a
1522  05f9 4b40          	push	#64
1523  05fb ae500a        	ldw	x,#20490
1524  05fe cd0000        	call	_GPIO_WriteLow
1526  0601 84            	pop	a
1527                     ; 134     delay(DELAY_DISPLAY_TEST);
1529  0602 ae01f4        	ldw	x,#500
1530  0605 89            	pushw	x
1531  0606 ae0000        	ldw	x,#0
1532  0609 89            	pushw	x
1533  060a cd0000        	call	_delay
1535  060d 5b04          	addw	sp,#4
1536                     ; 135     display_eight();
1538  060f 4b20          	push	#32
1539  0611 ae500f        	ldw	x,#20495
1540  0614 cd0000        	call	_GPIO_WriteHigh
1542  0617 84            	pop	a
1545  0618 4b04          	push	#4
1546  061a ae5000        	ldw	x,#20480
1547  061d cd0000        	call	_GPIO_WriteHigh
1549  0620 84            	pop	a
1552  0621 4b80          	push	#128
1553  0623 ae500a        	ldw	x,#20490
1554  0626 cd0000        	call	_GPIO_WriteHigh
1556  0629 84            	pop	a
1559  062a 4b08          	push	#8
1560  062c ae500f        	ldw	x,#20495
1561  062f cd0000        	call	_GPIO_WriteHigh
1563  0632 84            	pop	a
1566  0633 4b02          	push	#2
1567  0635 ae500f        	ldw	x,#20495
1568  0638 cd0000        	call	_GPIO_WriteHigh
1570  063b 84            	pop	a
1573  063c 4b02          	push	#2
1574  063e ae5000        	ldw	x,#20480
1575  0641 cd0000        	call	_GPIO_WriteHigh
1577  0644 84            	pop	a
1580  0645 4b40          	push	#64
1581  0647 ae500a        	ldw	x,#20490
1582  064a cd0000        	call	_GPIO_WriteHigh
1584  064d 84            	pop	a
1585                     ; 136     delay(DELAY_DISPLAY_TEST);
1587  064e ae01f4        	ldw	x,#500
1588  0651 89            	pushw	x
1589  0652 ae0000        	ldw	x,#0
1590  0655 89            	pushw	x
1591  0656 cd0000        	call	_delay
1593  0659 5b04          	addw	sp,#4
1594                     ; 137     display_nine();    
1596  065b 4b20          	push	#32
1597  065d ae500f        	ldw	x,#20495
1598  0660 cd0000        	call	_GPIO_WriteHigh
1600  0663 84            	pop	a
1603  0664 4b04          	push	#4
1604  0666 ae5000        	ldw	x,#20480
1605  0669 cd0000        	call	_GPIO_WriteHigh
1607  066c 84            	pop	a
1610  066d 4b80          	push	#128
1611  066f ae500a        	ldw	x,#20490
1612  0672 cd0000        	call	_GPIO_WriteHigh
1614  0675 84            	pop	a
1617  0676 4b08          	push	#8
1618  0678 ae500f        	ldw	x,#20495
1619  067b cd0000        	call	_GPIO_WriteHigh
1621  067e 84            	pop	a
1624  067f 4b02          	push	#2
1625  0681 ae500f        	ldw	x,#20495
1626  0684 cd0000        	call	_GPIO_WriteLow
1628  0687 84            	pop	a
1631  0688 4b02          	push	#2
1632  068a ae5000        	ldw	x,#20480
1633  068d cd0000        	call	_GPIO_WriteHigh
1635  0690 84            	pop	a
1638  0691 4b40          	push	#64
1639  0693 ae500a        	ldw	x,#20490
1640  0696 cd0000        	call	_GPIO_WriteHigh
1642  0699 84            	pop	a
1643                     ; 138     delay(DELAY_DISPLAY_TEST);
1645  069a ae01f4        	ldw	x,#500
1646  069d 89            	pushw	x
1647  069e ae0000        	ldw	x,#0
1648  06a1 89            	pushw	x
1649  06a2 cd0000        	call	_delay
1651  06a5 5b04          	addw	sp,#4
1652                     ; 139     display_off();
1654  06a7 4b20          	push	#32
1655  06a9 ae500f        	ldw	x,#20495
1656  06ac cd0000        	call	_GPIO_WriteLow
1658  06af 84            	pop	a
1661  06b0 4b04          	push	#4
1662  06b2 ae5000        	ldw	x,#20480
1663  06b5 cd0000        	call	_GPIO_WriteLow
1665  06b8 84            	pop	a
1668  06b9 4b80          	push	#128
1669  06bb ae500a        	ldw	x,#20490
1670  06be cd0000        	call	_GPIO_WriteLow
1672  06c1 84            	pop	a
1675  06c2 4b08          	push	#8
1676  06c4 ae500f        	ldw	x,#20495
1677  06c7 cd0000        	call	_GPIO_WriteLow
1679  06ca 84            	pop	a
1682  06cb 4b02          	push	#2
1683  06cd ae500f        	ldw	x,#20495
1684  06d0 cd0000        	call	_GPIO_WriteLow
1686  06d3 84            	pop	a
1689  06d4 4b02          	push	#2
1690  06d6 ae5000        	ldw	x,#20480
1691  06d9 cd0000        	call	_GPIO_WriteLow
1693  06dc 84            	pop	a
1696  06dd 4b40          	push	#64
1697  06df ae500a        	ldw	x,#20490
1698  06e2 cd0000        	call	_GPIO_WriteLow
1700  06e5 84            	pop	a
1703  06e6 4b04          	push	#4
1704  06e8 ae500f        	ldw	x,#20495
1705  06eb cd0000        	call	_GPIO_WriteLow
1707  06ee 84            	pop	a
1708                     ; 140     dp_on();
1711  06ef 4b04          	push	#4
1712  06f1 ae500f        	ldw	x,#20495
1713  06f4 cd0000        	call	_GPIO_WriteHigh
1715  06f7 84            	pop	a
1716                     ; 141     delay(DELAY_DISPLAY_TEST);
1718  06f8 ae01f4        	ldw	x,#500
1719  06fb 89            	pushw	x
1720  06fc ae0000        	ldw	x,#0
1721  06ff 89            	pushw	x
1722  0700 cd0000        	call	_delay
1724  0703 5b04          	addw	sp,#4
1725                     ; 142     dp_off();
1727  0705 4b04          	push	#4
1728  0707 ae500f        	ldw	x,#20495
1729  070a cd0000        	call	_GPIO_WriteLow
1731  070d 84            	pop	a
1732                     ; 143 }
1735  070e 81            	ret
1763                     ; 146 void init_display(void)
1763                     ; 147 {
1764                     	switch	.text
1765  070f               _init_display:
1769                     ; 151     seg_a_dir();
1771  070f 4be0          	push	#224
1772  0711 4b20          	push	#32
1773  0713 ae500f        	ldw	x,#20495
1774  0716 cd0000        	call	_GPIO_Init
1776  0719 85            	popw	x
1777                     ; 152     seg_b_dir();
1780  071a 4be0          	push	#224
1781  071c 4b04          	push	#4
1782  071e ae5000        	ldw	x,#20480
1783  0721 cd0000        	call	_GPIO_Init
1785  0724 85            	popw	x
1786                     ; 153     seg_c_dir();
1789  0725 4be0          	push	#224
1790  0727 4b80          	push	#128
1791  0729 ae500a        	ldw	x,#20490
1792  072c cd0000        	call	_GPIO_Init
1794  072f 85            	popw	x
1795                     ; 154     seg_d_dir();
1798  0730 4be0          	push	#224
1799  0732 4b08          	push	#8
1800  0734 ae500f        	ldw	x,#20495
1801  0737 cd0000        	call	_GPIO_Init
1803  073a 85            	popw	x
1804                     ; 155     seg_e_dir();
1807  073b 4be0          	push	#224
1808  073d 4b02          	push	#2
1809  073f ae500f        	ldw	x,#20495
1810  0742 cd0000        	call	_GPIO_Init
1812  0745 85            	popw	x
1813                     ; 156     seg_f_dir();
1816  0746 4be0          	push	#224
1817  0748 4b02          	push	#2
1818  074a ae5000        	ldw	x,#20480
1819  074d cd0000        	call	_GPIO_Init
1821  0750 85            	popw	x
1822                     ; 157     seg_g_dir();
1825  0751 4be0          	push	#224
1826  0753 4b40          	push	#64
1827  0755 ae500a        	ldw	x,#20490
1828  0758 cd0000        	call	_GPIO_Init
1830  075b 85            	popw	x
1831                     ; 158     dp_dir();
1834  075c 4be0          	push	#224
1835  075e 4b04          	push	#4
1836  0760 ae500f        	ldw	x,#20495
1837  0763 cd0000        	call	_GPIO_Init
1839  0766 85            	popw	x
1840                     ; 159     dig1_dir();
1843  0767 4be0          	push	#224
1844  0769 4b10          	push	#16
1845  076b ae500f        	ldw	x,#20495
1846  076e cd0000        	call	_GPIO_Init
1848  0771 85            	popw	x
1849                     ; 160     dig2_dir();
1852  0772 4be0          	push	#224
1853  0774 4b20          	push	#32
1854  0776 ae5005        	ldw	x,#20485
1855  0779 cd0000        	call	_GPIO_Init
1857  077c 85            	popw	x
1858                     ; 161     dig3_dir();
1861  077d 4be0          	push	#224
1862  077f 4b10          	push	#16
1863  0781 ae5005        	ldw	x,#20485
1864  0784 cd0000        	call	_GPIO_Init
1866  0787 85            	popw	x
1867                     ; 164     dig1_on();
1870  0788 4b10          	push	#16
1871  078a ae500f        	ldw	x,#20495
1872  078d cd0000        	call	_GPIO_WriteLow
1874  0790 84            	pop	a
1875                     ; 165     dig2_on();
1877  0791 4b20          	push	#32
1878  0793 ae5005        	ldw	x,#20485
1879  0796 cd0000        	call	_GPIO_WriteLow
1881  0799 84            	pop	a
1882                     ; 166     dig3_on();
1884  079a 4b10          	push	#16
1885  079c ae5005        	ldw	x,#20485
1886  079f cd0000        	call	_GPIO_WriteLow
1888  07a2 84            	pop	a
1889                     ; 168     display_all();
1891  07a3 4b20          	push	#32
1892  07a5 ae500f        	ldw	x,#20495
1893  07a8 cd0000        	call	_GPIO_WriteHigh
1895  07ab 84            	pop	a
1898  07ac 4b04          	push	#4
1899  07ae ae5000        	ldw	x,#20480
1900  07b1 cd0000        	call	_GPIO_WriteHigh
1902  07b4 84            	pop	a
1905  07b5 4b80          	push	#128
1906  07b7 ae500a        	ldw	x,#20490
1907  07ba cd0000        	call	_GPIO_WriteHigh
1909  07bd 84            	pop	a
1912  07be 4b08          	push	#8
1913  07c0 ae500f        	ldw	x,#20495
1914  07c3 cd0000        	call	_GPIO_WriteHigh
1916  07c6 84            	pop	a
1919  07c7 4b02          	push	#2
1920  07c9 ae500f        	ldw	x,#20495
1921  07cc cd0000        	call	_GPIO_WriteHigh
1923  07cf 84            	pop	a
1926  07d0 4b02          	push	#2
1927  07d2 ae5000        	ldw	x,#20480
1928  07d5 cd0000        	call	_GPIO_WriteHigh
1930  07d8 84            	pop	a
1933  07d9 4b40          	push	#64
1934  07db ae500a        	ldw	x,#20490
1935  07de cd0000        	call	_GPIO_WriteHigh
1937  07e1 84            	pop	a
1940  07e2 4b04          	push	#4
1941  07e4 ae500f        	ldw	x,#20495
1942  07e7 cd0000        	call	_GPIO_WriteHigh
1944  07ea 84            	pop	a
1945                     ; 169     delay(2*DELAY_DISPLAY_TEST);
1948  07eb ae03e8        	ldw	x,#1000
1949  07ee 89            	pushw	x
1950  07ef ae0000        	ldw	x,#0
1951  07f2 89            	pushw	x
1952  07f3 cd0000        	call	_delay
1954  07f6 5b04          	addw	sp,#4
1955                     ; 170     display_off();
1957  07f8 4b20          	push	#32
1958  07fa ae500f        	ldw	x,#20495
1959  07fd cd0000        	call	_GPIO_WriteLow
1961  0800 84            	pop	a
1964  0801 4b04          	push	#4
1965  0803 ae5000        	ldw	x,#20480
1966  0806 cd0000        	call	_GPIO_WriteLow
1968  0809 84            	pop	a
1971  080a 4b80          	push	#128
1972  080c ae500a        	ldw	x,#20490
1973  080f cd0000        	call	_GPIO_WriteLow
1975  0812 84            	pop	a
1978  0813 4b08          	push	#8
1979  0815 ae500f        	ldw	x,#20495
1980  0818 cd0000        	call	_GPIO_WriteLow
1982  081b 84            	pop	a
1985  081c 4b02          	push	#2
1986  081e ae500f        	ldw	x,#20495
1987  0821 cd0000        	call	_GPIO_WriteLow
1989  0824 84            	pop	a
1992  0825 4b02          	push	#2
1993  0827 ae5000        	ldw	x,#20480
1994  082a cd0000        	call	_GPIO_WriteLow
1996  082d 84            	pop	a
1999  082e 4b40          	push	#64
2000  0830 ae500a        	ldw	x,#20490
2001  0833 cd0000        	call	_GPIO_WriteLow
2003  0836 84            	pop	a
2006  0837 4b04          	push	#4
2007  0839 ae500f        	ldw	x,#20495
2008  083c cd0000        	call	_GPIO_WriteLow
2010  083f 84            	pop	a
2011                     ; 171     delay(DELAY_DISPLAY_TEST);
2014  0840 ae01f4        	ldw	x,#500
2015  0843 89            	pushw	x
2016  0844 ae0000        	ldw	x,#0
2017  0847 89            	pushw	x
2018  0848 cd0000        	call	_delay
2020  084b 5b04          	addw	sp,#4
2021                     ; 172     display_all();
2023  084d 4b20          	push	#32
2024  084f ae500f        	ldw	x,#20495
2025  0852 cd0000        	call	_GPIO_WriteHigh
2027  0855 84            	pop	a
2030  0856 4b04          	push	#4
2031  0858 ae5000        	ldw	x,#20480
2032  085b cd0000        	call	_GPIO_WriteHigh
2034  085e 84            	pop	a
2037  085f 4b80          	push	#128
2038  0861 ae500a        	ldw	x,#20490
2039  0864 cd0000        	call	_GPIO_WriteHigh
2041  0867 84            	pop	a
2044  0868 4b08          	push	#8
2045  086a ae500f        	ldw	x,#20495
2046  086d cd0000        	call	_GPIO_WriteHigh
2048  0870 84            	pop	a
2051  0871 4b02          	push	#2
2052  0873 ae500f        	ldw	x,#20495
2053  0876 cd0000        	call	_GPIO_WriteHigh
2055  0879 84            	pop	a
2058  087a 4b02          	push	#2
2059  087c ae5000        	ldw	x,#20480
2060  087f cd0000        	call	_GPIO_WriteHigh
2062  0882 84            	pop	a
2065  0883 4b40          	push	#64
2066  0885 ae500a        	ldw	x,#20490
2067  0888 cd0000        	call	_GPIO_WriteHigh
2069  088b 84            	pop	a
2072  088c 4b04          	push	#4
2073  088e ae500f        	ldw	x,#20495
2074  0891 cd0000        	call	_GPIO_WriteHigh
2076  0894 84            	pop	a
2077                     ; 173     delay(2*DELAY_DISPLAY_TEST);
2080  0895 ae03e8        	ldw	x,#1000
2081  0898 89            	pushw	x
2082  0899 ae0000        	ldw	x,#0
2083  089c 89            	pushw	x
2084  089d cd0000        	call	_delay
2086  08a0 5b04          	addw	sp,#4
2087                     ; 174     display_off();
2089  08a2 4b20          	push	#32
2090  08a4 ae500f        	ldw	x,#20495
2091  08a7 cd0000        	call	_GPIO_WriteLow
2093  08aa 84            	pop	a
2096  08ab 4b04          	push	#4
2097  08ad ae5000        	ldw	x,#20480
2098  08b0 cd0000        	call	_GPIO_WriteLow
2100  08b3 84            	pop	a
2103  08b4 4b80          	push	#128
2104  08b6 ae500a        	ldw	x,#20490
2105  08b9 cd0000        	call	_GPIO_WriteLow
2107  08bc 84            	pop	a
2110  08bd 4b08          	push	#8
2111  08bf ae500f        	ldw	x,#20495
2112  08c2 cd0000        	call	_GPIO_WriteLow
2114  08c5 84            	pop	a
2117  08c6 4b02          	push	#2
2118  08c8 ae500f        	ldw	x,#20495
2119  08cb cd0000        	call	_GPIO_WriteLow
2121  08ce 84            	pop	a
2124  08cf 4b02          	push	#2
2125  08d1 ae5000        	ldw	x,#20480
2126  08d4 cd0000        	call	_GPIO_WriteLow
2128  08d7 84            	pop	a
2131  08d8 4b40          	push	#64
2132  08da ae500a        	ldw	x,#20490
2133  08dd cd0000        	call	_GPIO_WriteLow
2135  08e0 84            	pop	a
2138  08e1 4b04          	push	#4
2139  08e3 ae500f        	ldw	x,#20495
2140  08e6 cd0000        	call	_GPIO_WriteLow
2142  08e9 84            	pop	a
2143                     ; 175     delay(DELAY_DISPLAY_TEST);
2146  08ea ae01f4        	ldw	x,#500
2147  08ed 89            	pushw	x
2148  08ee ae0000        	ldw	x,#0
2149  08f1 89            	pushw	x
2150  08f2 cd0000        	call	_delay
2152  08f5 5b04          	addw	sp,#4
2153                     ; 176     display_all();
2155  08f7 4b20          	push	#32
2156  08f9 ae500f        	ldw	x,#20495
2157  08fc cd0000        	call	_GPIO_WriteHigh
2159  08ff 84            	pop	a
2162  0900 4b04          	push	#4
2163  0902 ae5000        	ldw	x,#20480
2164  0905 cd0000        	call	_GPIO_WriteHigh
2166  0908 84            	pop	a
2169  0909 4b80          	push	#128
2170  090b ae500a        	ldw	x,#20490
2171  090e cd0000        	call	_GPIO_WriteHigh
2173  0911 84            	pop	a
2176  0912 4b08          	push	#8
2177  0914 ae500f        	ldw	x,#20495
2178  0917 cd0000        	call	_GPIO_WriteHigh
2180  091a 84            	pop	a
2183  091b 4b02          	push	#2
2184  091d ae500f        	ldw	x,#20495
2185  0920 cd0000        	call	_GPIO_WriteHigh
2187  0923 84            	pop	a
2190  0924 4b02          	push	#2
2191  0926 ae5000        	ldw	x,#20480
2192  0929 cd0000        	call	_GPIO_WriteHigh
2194  092c 84            	pop	a
2197  092d 4b40          	push	#64
2198  092f ae500a        	ldw	x,#20490
2199  0932 cd0000        	call	_GPIO_WriteHigh
2201  0935 84            	pop	a
2204  0936 4b04          	push	#4
2205  0938 ae500f        	ldw	x,#20495
2206  093b cd0000        	call	_GPIO_WriteHigh
2208  093e 84            	pop	a
2209                     ; 177     delay(2*DELAY_DISPLAY_TEST);
2212  093f ae03e8        	ldw	x,#1000
2213  0942 89            	pushw	x
2214  0943 ae0000        	ldw	x,#0
2215  0946 89            	pushw	x
2216  0947 cd0000        	call	_delay
2218  094a 5b04          	addw	sp,#4
2219                     ; 178     display_off();
2221  094c 4b20          	push	#32
2222  094e ae500f        	ldw	x,#20495
2223  0951 cd0000        	call	_GPIO_WriteLow
2225  0954 84            	pop	a
2228  0955 4b04          	push	#4
2229  0957 ae5000        	ldw	x,#20480
2230  095a cd0000        	call	_GPIO_WriteLow
2232  095d 84            	pop	a
2235  095e 4b80          	push	#128
2236  0960 ae500a        	ldw	x,#20490
2237  0963 cd0000        	call	_GPIO_WriteLow
2239  0966 84            	pop	a
2242  0967 4b08          	push	#8
2243  0969 ae500f        	ldw	x,#20495
2244  096c cd0000        	call	_GPIO_WriteLow
2246  096f 84            	pop	a
2249  0970 4b02          	push	#2
2250  0972 ae500f        	ldw	x,#20495
2251  0975 cd0000        	call	_GPIO_WriteLow
2253  0978 84            	pop	a
2256  0979 4b02          	push	#2
2257  097b ae5000        	ldw	x,#20480
2258  097e cd0000        	call	_GPIO_WriteLow
2260  0981 84            	pop	a
2263  0982 4b40          	push	#64
2264  0984 ae500a        	ldw	x,#20490
2265  0987 cd0000        	call	_GPIO_WriteLow
2267  098a 84            	pop	a
2270  098b 4b04          	push	#4
2271  098d ae500f        	ldw	x,#20495
2272  0990 cd0000        	call	_GPIO_WriteLow
2274  0993 84            	pop	a
2275                     ; 180     display_test = 0;
2278  0994 3f00          	clr	_display_test
2279                     ; 183     dig1_off();
2281  0996 4b10          	push	#16
2282  0998 ae500f        	ldw	x,#20495
2283  099b cd0000        	call	_GPIO_WriteHigh
2285  099e 84            	pop	a
2286                     ; 184     dig2_off();
2288  099f 4b20          	push	#32
2289  09a1 ae5005        	ldw	x,#20485
2290  09a4 cd0000        	call	_GPIO_WriteHigh
2292  09a7 84            	pop	a
2293                     ; 185     dig3_off();
2295  09a8 4b10          	push	#16
2296  09aa ae5005        	ldw	x,#20485
2297  09ad cd0000        	call	_GPIO_WriteHigh
2299  09b0 84            	pop	a
2300                     ; 188 }
2303  09b1 81            	ret
2337                     	xdef	_test_display
2338                     	xdef	_wr_digit
2339                     	xdef	_dec2bcd
2340                     	xdef	_display_num
2341                     	xdef	_display_test
2342                     	xref.b	_adc_val
2343                     	xref.b	_tick
2344                     	xref	_delay
2345                     	xdef	_set_display
2346                     	xdef	_tmr_display
2347                     	xdef	_task_display
2348                     	xdef	_init_display
2349                     	xref	_GPIO_WriteLow
2350                     	xref	_GPIO_WriteHigh
2351                     	xref	_GPIO_Init
2352                     .const:	section	.text
2353  0000               L551:
2354  0000 42c80000      	dc.w	17096,0
2355  0004               L541:
2356  0004 40400000      	dc.w	16448,0
2357                     	xref.b	c_lreg
2358                     	xref.b	c_x
2378                     	xref	c_ftol
2379                     	xref	c_fdiv
2380                     	xref	c_fmul
2381                     	xref	c_uitof
2382                     	end
