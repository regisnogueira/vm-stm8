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
  74                     ; 21 uint16_t dec2bcd(uint16_t val)
  74                     ; 22 {
  76                     	switch	.text
  77  0000               _dec2bcd:
  79  0000 89            	pushw	x
  80  0001 5205          	subw	sp,#5
  81       00000005      OFST:	set	5
  84                     ; 25     dig[0] = (uint8_t)(val/100);
  86  0003 a664          	ld	a,#100
  87  0005 62            	div	x,a
  88  0006 9f            	ld	a,xl
  89  0007 6b03          	ld	(OFST-2,sp),a
  91                     ; 26     dig[1] = (uint8_t)((val-(dig[0]*100))/10);
  93  0009 7b03          	ld	a,(OFST-2,sp)
  94  000b 97            	ld	xl,a
  95  000c a664          	ld	a,#100
  96  000e 42            	mul	x,a
  97  000f 1f01          	ldw	(OFST-4,sp),x
  99  0011 1e06          	ldw	x,(OFST+1,sp)
 100  0013 72f001        	subw	x,(OFST-4,sp)
 101  0016 a60a          	ld	a,#10
 102  0018 62            	div	x,a
 103  0019 9f            	ld	a,xl
 104  001a 6b04          	ld	(OFST-1,sp),a
 106                     ; 27     dig[2] = (uint8_t)(val%10);
 108  001c 1e06          	ldw	x,(OFST+1,sp)
 109  001e a60a          	ld	a,#10
 110  0020 62            	div	x,a
 111  0021 5f            	clrw	x
 112  0022 97            	ld	xl,a
 113  0023 9f            	ld	a,xl
 114  0024 6b05          	ld	(OFST+0,sp),a
 116                     ; 29     return (uint16_t)((dig[0]<<8) | (dig[1]<<4) | (dig[2]));
 118  0026 7b04          	ld	a,(OFST-1,sp)
 119  0028 97            	ld	xl,a
 120  0029 a610          	ld	a,#16
 121  002b 42            	mul	x,a
 122  002c 1f01          	ldw	(OFST-4,sp),x
 124  002e 7b03          	ld	a,(OFST-2,sp)
 125  0030 5f            	clrw	x
 126  0031 97            	ld	xl,a
 127  0032 4f            	clr	a
 128  0033 02            	rlwa	x,a
 129  0034 01            	rrwa	x,a
 130  0035 1a02          	or	a,(OFST-3,sp)
 131  0037 41            	exg	a,xl
 132  0038 1a01          	or	a,(OFST-4,sp)
 133  003a 41            	exg	a,xl
 134  003b 1a05          	or	a,(OFST+0,sp)
 135  003d 02            	rlwa	x,a
 138  003e 5b07          	addw	sp,#7
 139  0040 81            	ret
 194                     ; 32 void set_display_value(uint16_t value, uint8_t _dp)
 194                     ; 33 {
 195                     	switch	.text
 196  0041               _set_display_value:
 198  0041 89            	pushw	x
 199  0042 89            	pushw	x
 200       00000002      OFST:	set	2
 203                     ; 37     bcd = dec2bcd(value);
 205  0043 adbb          	call	_dec2bcd
 207  0045 1f01          	ldw	(OFST-1,sp),x
 209                     ; 39     display_num[DIG1_POS] = (uint8_t)((bcd >> 8) & 0x0F);
 211  0047 7b01          	ld	a,(OFST-1,sp)
 212  0049 a40f          	and	a,#15
 213  004b b701          	ld	_display_num,a
 214                     ; 40     display_num[DIG2_POS] = (uint8_t)((bcd >> 4) & 0x0F);
 216  004d 1e01          	ldw	x,(OFST-1,sp)
 217  004f 54            	srlw	x
 218  0050 54            	srlw	x
 219  0051 54            	srlw	x
 220  0052 54            	srlw	x
 221  0053 9f            	ld	a,xl
 222  0054 a40f          	and	a,#15
 223  0056 b702          	ld	_display_num+1,a
 224                     ; 41     display_num[DIG3_POS] = (uint8_t)(bcd & 0x0F);
 226  0058 7b02          	ld	a,(OFST+0,sp)
 227  005a a40f          	and	a,#15
 228  005c b703          	ld	_display_num+2,a
 229                     ; 43     dp[DIG2_POS] = _dp;
 231  005e 7b07          	ld	a,(OFST+5,sp)
 232  0060 b705          	ld	_dp+1,a
 233                     ; 45 }
 236  0062 5b04          	addw	sp,#4
 237  0064 81            	ret
 282                     ; 47 void set_display_option(uint8_t option, uint8_t _dp)
 282                     ; 48 {
 283                     	switch	.text
 284  0065               _set_display_option:
 288                     ; 50     display_num[DIG1_POS] = option;
 290  0065 9e            	ld	a,xh
 291  0066 b701          	ld	_display_num,a
 292                     ; 51     dp[DIG1_POS] = _dp;
 294  0068 9f            	ld	a,xl
 295  0069 b704          	ld	_dp,a
 296                     ; 53 }
 299  006b 81            	ret
 337                     .const:	section	.text
 338  0000               L61:
 339  0000 00e1          	dc.w	L301
 340  0002 0124          	dc.w	L501
 341  0004 0167          	dc.w	L701
 342  0006 01aa          	dc.w	L111
 343  0008 01ed          	dc.w	L311
 344  000a 0230          	dc.w	L511
 345  000c 0273          	dc.w	L711
 346  000e 02b6          	dc.w	L121
 347  0010 02f9          	dc.w	L321
 348  0012 033c          	dc.w	L521
 349                     ; 55 void wr_digit(uint8_t dig_pos)
 349                     ; 56 {
 350                     	switch	.text
 351  006c               _wr_digit:
 353  006c 88            	push	a
 354       00000000      OFST:	set	0
 357                     ; 59     if (dp[dig_pos]) {
 359  006d 5f            	clrw	x
 360  006e 97            	ld	xl,a
 361  006f 6d04          	tnz	(_dp,x)
 362  0071 270b          	jreq	L171
 363                     ; 60         dp_on();
 365  0073 4b04          	push	#4
 366  0075 ae500f        	ldw	x,#20495
 367  0078 cd0000        	call	_GPIO_WriteHigh
 369  007b 84            	pop	a
 371  007c 2009          	jra	L371
 372  007e               L171:
 373                     ; 62         dp_off();
 375  007e 4b04          	push	#4
 376  0080 ae500f        	ldw	x,#20495
 377  0083 cd0000        	call	_GPIO_WriteLow
 379  0086 84            	pop	a
 380  0087               L371:
 381                     ; 65     switch (display_num[dig_pos]) {
 383  0087 7b01          	ld	a,(OFST+1,sp)
 384  0089 5f            	clrw	x
 385  008a 97            	ld	xl,a
 386  008b e601          	ld	a,(_display_num,x)
 388                     ; 125         break;
 389  008d a10a          	cp	a,#10
 390  008f 2407          	jruge	L41
 391  0091 5f            	clrw	x
 392  0092 97            	ld	xl,a
 393  0093 58            	sllw	x
 394  0094 de0000        	ldw	x,(L61,x)
 395  0097 fc            	jp	(x)
 396  0098               L41:
 397  0098 a041          	sub	a,#65
 398  009a 2603          	jrne	L02
 399  009c cc037f        	jp	L721
 400  009f               L02:
 401  009f a002          	sub	a,#2
 402  00a1 2603          	jrne	L22
 403  00a3 cc0405        	jp	L331
 404  00a6               L22:
 405  00a6 a002          	sub	a,#2
 406  00a8 2603          	jrne	L42
 407  00aa cc048b        	jp	L731
 408  00ad               L42:
 409  00ad 4a            	dec	a
 410  00ae 2603          	jrne	L62
 411  00b0 cc04ce        	jp	L141
 412  00b3               L62:
 413  00b3 a002          	sub	a,#2
 414  00b5 2603          	jrne	L03
 415  00b7 cc0511        	jp	L341
 416  00ba               L03:
 417  00ba a004          	sub	a,#4
 418  00bc 2603          	jrne	L23
 419  00be cc0554        	jp	L541
 420  00c1               L23:
 421  00c1 a004          	sub	a,#4
 422  00c3 2603          	jrne	L43
 423  00c5 cc0596        	jp	L741
 424  00c8               L43:
 425  00c8 a005          	sub	a,#5
 426  00ca 2603          	jrne	L63
 427  00cc cc05d7        	jp	L151
 428  00cf               L63:
 429  00cf a00d          	sub	a,#13
 430  00d1 2603          	jrne	L04
 431  00d3 cc03c2        	jp	L131
 432  00d6               L04:
 433  00d6 a002          	sub	a,#2
 434  00d8 2603          	jrne	L24
 435  00da cc0448        	jp	L531
 436  00dd               L24:
 437  00dd ac160616      	jpf	L771
 438  00e1               L301:
 439                     ; 66     case 0x00:
 439                     ; 67         display_zero();
 441  00e1 4b20          	push	#32
 442  00e3 ae500f        	ldw	x,#20495
 443  00e6 cd0000        	call	_GPIO_WriteHigh
 445  00e9 84            	pop	a
 448  00ea 4b04          	push	#4
 449  00ec ae5000        	ldw	x,#20480
 450  00ef cd0000        	call	_GPIO_WriteHigh
 452  00f2 84            	pop	a
 455  00f3 4b80          	push	#128
 456  00f5 ae500a        	ldw	x,#20490
 457  00f8 cd0000        	call	_GPIO_WriteHigh
 459  00fb 84            	pop	a
 462  00fc 4b08          	push	#8
 463  00fe ae500f        	ldw	x,#20495
 464  0101 cd0000        	call	_GPIO_WriteHigh
 466  0104 84            	pop	a
 469  0105 4b02          	push	#2
 470  0107 ae500f        	ldw	x,#20495
 471  010a cd0000        	call	_GPIO_WriteHigh
 473  010d 84            	pop	a
 476  010e 4b02          	push	#2
 477  0110 ae5000        	ldw	x,#20480
 478  0113 cd0000        	call	_GPIO_WriteHigh
 480  0116 84            	pop	a
 483  0117 4b40          	push	#64
 484  0119 ae500a        	ldw	x,#20490
 485  011c cd0000        	call	_GPIO_WriteLow
 487  011f 84            	pop	a
 488                     ; 68         break;
 490  0120 ac160616      	jpf	L771
 491  0124               L501:
 492                     ; 69     case 0x01:
 492                     ; 70         display_one();
 494  0124 4b20          	push	#32
 495  0126 ae500f        	ldw	x,#20495
 496  0129 cd0000        	call	_GPIO_WriteLow
 498  012c 84            	pop	a
 501  012d 4b04          	push	#4
 502  012f ae5000        	ldw	x,#20480
 503  0132 cd0000        	call	_GPIO_WriteHigh
 505  0135 84            	pop	a
 508  0136 4b80          	push	#128
 509  0138 ae500a        	ldw	x,#20490
 510  013b cd0000        	call	_GPIO_WriteHigh
 512  013e 84            	pop	a
 515  013f 4b08          	push	#8
 516  0141 ae500f        	ldw	x,#20495
 517  0144 cd0000        	call	_GPIO_WriteLow
 519  0147 84            	pop	a
 522  0148 4b02          	push	#2
 523  014a ae500f        	ldw	x,#20495
 524  014d cd0000        	call	_GPIO_WriteLow
 526  0150 84            	pop	a
 529  0151 4b02          	push	#2
 530  0153 ae5000        	ldw	x,#20480
 531  0156 cd0000        	call	_GPIO_WriteLow
 533  0159 84            	pop	a
 536  015a 4b40          	push	#64
 537  015c ae500a        	ldw	x,#20490
 538  015f cd0000        	call	_GPIO_WriteLow
 540  0162 84            	pop	a
 541                     ; 71         break;
 543  0163 ac160616      	jpf	L771
 544  0167               L701:
 545                     ; 72     case 0x02:
 545                     ; 73         display_two();
 547  0167 4b20          	push	#32
 548  0169 ae500f        	ldw	x,#20495
 549  016c cd0000        	call	_GPIO_WriteHigh
 551  016f 84            	pop	a
 554  0170 4b04          	push	#4
 555  0172 ae5000        	ldw	x,#20480
 556  0175 cd0000        	call	_GPIO_WriteHigh
 558  0178 84            	pop	a
 561  0179 4b80          	push	#128
 562  017b ae500a        	ldw	x,#20490
 563  017e cd0000        	call	_GPIO_WriteLow
 565  0181 84            	pop	a
 568  0182 4b08          	push	#8
 569  0184 ae500f        	ldw	x,#20495
 570  0187 cd0000        	call	_GPIO_WriteHigh
 572  018a 84            	pop	a
 575  018b 4b02          	push	#2
 576  018d ae500f        	ldw	x,#20495
 577  0190 cd0000        	call	_GPIO_WriteHigh
 579  0193 84            	pop	a
 582  0194 4b02          	push	#2
 583  0196 ae5000        	ldw	x,#20480
 584  0199 cd0000        	call	_GPIO_WriteLow
 586  019c 84            	pop	a
 589  019d 4b40          	push	#64
 590  019f ae500a        	ldw	x,#20490
 591  01a2 cd0000        	call	_GPIO_WriteHigh
 593  01a5 84            	pop	a
 594                     ; 74         break;
 596  01a6 ac160616      	jpf	L771
 597  01aa               L111:
 598                     ; 75     case 0x03:
 598                     ; 76         display_three();
 600  01aa 4b20          	push	#32
 601  01ac ae500f        	ldw	x,#20495
 602  01af cd0000        	call	_GPIO_WriteHigh
 604  01b2 84            	pop	a
 607  01b3 4b04          	push	#4
 608  01b5 ae5000        	ldw	x,#20480
 609  01b8 cd0000        	call	_GPIO_WriteHigh
 611  01bb 84            	pop	a
 614  01bc 4b80          	push	#128
 615  01be ae500a        	ldw	x,#20490
 616  01c1 cd0000        	call	_GPIO_WriteHigh
 618  01c4 84            	pop	a
 621  01c5 4b08          	push	#8
 622  01c7 ae500f        	ldw	x,#20495
 623  01ca cd0000        	call	_GPIO_WriteHigh
 625  01cd 84            	pop	a
 628  01ce 4b02          	push	#2
 629  01d0 ae500f        	ldw	x,#20495
 630  01d3 cd0000        	call	_GPIO_WriteLow
 632  01d6 84            	pop	a
 635  01d7 4b02          	push	#2
 636  01d9 ae5000        	ldw	x,#20480
 637  01dc cd0000        	call	_GPIO_WriteLow
 639  01df 84            	pop	a
 642  01e0 4b40          	push	#64
 643  01e2 ae500a        	ldw	x,#20490
 644  01e5 cd0000        	call	_GPIO_WriteHigh
 646  01e8 84            	pop	a
 647                     ; 77         break;
 649  01e9 ac160616      	jpf	L771
 650  01ed               L311:
 651                     ; 78     case 0x04:
 651                     ; 79         display_four();
 653  01ed 4b20          	push	#32
 654  01ef ae500f        	ldw	x,#20495
 655  01f2 cd0000        	call	_GPIO_WriteLow
 657  01f5 84            	pop	a
 660  01f6 4b04          	push	#4
 661  01f8 ae5000        	ldw	x,#20480
 662  01fb cd0000        	call	_GPIO_WriteHigh
 664  01fe 84            	pop	a
 667  01ff 4b80          	push	#128
 668  0201 ae500a        	ldw	x,#20490
 669  0204 cd0000        	call	_GPIO_WriteHigh
 671  0207 84            	pop	a
 674  0208 4b08          	push	#8
 675  020a ae500f        	ldw	x,#20495
 676  020d cd0000        	call	_GPIO_WriteLow
 678  0210 84            	pop	a
 681  0211 4b02          	push	#2
 682  0213 ae500f        	ldw	x,#20495
 683  0216 cd0000        	call	_GPIO_WriteLow
 685  0219 84            	pop	a
 688  021a 4b02          	push	#2
 689  021c ae5000        	ldw	x,#20480
 690  021f cd0000        	call	_GPIO_WriteHigh
 692  0222 84            	pop	a
 695  0223 4b40          	push	#64
 696  0225 ae500a        	ldw	x,#20490
 697  0228 cd0000        	call	_GPIO_WriteHigh
 699  022b 84            	pop	a
 700                     ; 80         break;
 702  022c ac160616      	jpf	L771
 703  0230               L511:
 704                     ; 81     case 0x05:
 704                     ; 82         display_five();
 706  0230 4b20          	push	#32
 707  0232 ae500f        	ldw	x,#20495
 708  0235 cd0000        	call	_GPIO_WriteHigh
 710  0238 84            	pop	a
 713  0239 4b04          	push	#4
 714  023b ae5000        	ldw	x,#20480
 715  023e cd0000        	call	_GPIO_WriteLow
 717  0241 84            	pop	a
 720  0242 4b80          	push	#128
 721  0244 ae500a        	ldw	x,#20490
 722  0247 cd0000        	call	_GPIO_WriteHigh
 724  024a 84            	pop	a
 727  024b 4b08          	push	#8
 728  024d ae500f        	ldw	x,#20495
 729  0250 cd0000        	call	_GPIO_WriteHigh
 731  0253 84            	pop	a
 734  0254 4b02          	push	#2
 735  0256 ae500f        	ldw	x,#20495
 736  0259 cd0000        	call	_GPIO_WriteLow
 738  025c 84            	pop	a
 741  025d 4b02          	push	#2
 742  025f ae5000        	ldw	x,#20480
 743  0262 cd0000        	call	_GPIO_WriteHigh
 745  0265 84            	pop	a
 748  0266 4b40          	push	#64
 749  0268 ae500a        	ldw	x,#20490
 750  026b cd0000        	call	_GPIO_WriteHigh
 752  026e 84            	pop	a
 753                     ; 83         break;
 755  026f ac160616      	jpf	L771
 756  0273               L711:
 757                     ; 84     case 0x06:
 757                     ; 85         display_six();
 759  0273 4b20          	push	#32
 760  0275 ae500f        	ldw	x,#20495
 761  0278 cd0000        	call	_GPIO_WriteHigh
 763  027b 84            	pop	a
 766  027c 4b04          	push	#4
 767  027e ae5000        	ldw	x,#20480
 768  0281 cd0000        	call	_GPIO_WriteLow
 770  0284 84            	pop	a
 773  0285 4b80          	push	#128
 774  0287 ae500a        	ldw	x,#20490
 775  028a cd0000        	call	_GPIO_WriteHigh
 777  028d 84            	pop	a
 780  028e 4b08          	push	#8
 781  0290 ae500f        	ldw	x,#20495
 782  0293 cd0000        	call	_GPIO_WriteHigh
 784  0296 84            	pop	a
 787  0297 4b02          	push	#2
 788  0299 ae500f        	ldw	x,#20495
 789  029c cd0000        	call	_GPIO_WriteHigh
 791  029f 84            	pop	a
 794  02a0 4b02          	push	#2
 795  02a2 ae5000        	ldw	x,#20480
 796  02a5 cd0000        	call	_GPIO_WriteHigh
 798  02a8 84            	pop	a
 801  02a9 4b40          	push	#64
 802  02ab ae500a        	ldw	x,#20490
 803  02ae cd0000        	call	_GPIO_WriteHigh
 805  02b1 84            	pop	a
 806                     ; 86         break;
 808  02b2 ac160616      	jpf	L771
 809  02b6               L121:
 810                     ; 87     case 0x07:
 810                     ; 88         display_seven();
 812  02b6 4b20          	push	#32
 813  02b8 ae500f        	ldw	x,#20495
 814  02bb cd0000        	call	_GPIO_WriteHigh
 816  02be 84            	pop	a
 819  02bf 4b04          	push	#4
 820  02c1 ae5000        	ldw	x,#20480
 821  02c4 cd0000        	call	_GPIO_WriteHigh
 823  02c7 84            	pop	a
 826  02c8 4b80          	push	#128
 827  02ca ae500a        	ldw	x,#20490
 828  02cd cd0000        	call	_GPIO_WriteHigh
 830  02d0 84            	pop	a
 833  02d1 4b08          	push	#8
 834  02d3 ae500f        	ldw	x,#20495
 835  02d6 cd0000        	call	_GPIO_WriteLow
 837  02d9 84            	pop	a
 840  02da 4b02          	push	#2
 841  02dc ae500f        	ldw	x,#20495
 842  02df cd0000        	call	_GPIO_WriteLow
 844  02e2 84            	pop	a
 847  02e3 4b02          	push	#2
 848  02e5 ae5000        	ldw	x,#20480
 849  02e8 cd0000        	call	_GPIO_WriteLow
 851  02eb 84            	pop	a
 854  02ec 4b40          	push	#64
 855  02ee ae500a        	ldw	x,#20490
 856  02f1 cd0000        	call	_GPIO_WriteLow
 858  02f4 84            	pop	a
 859                     ; 89         break;
 861  02f5 ac160616      	jpf	L771
 862  02f9               L321:
 863                     ; 90     case 0x08:
 863                     ; 91         display_eight();
 865  02f9 4b20          	push	#32
 866  02fb ae500f        	ldw	x,#20495
 867  02fe cd0000        	call	_GPIO_WriteHigh
 869  0301 84            	pop	a
 872  0302 4b04          	push	#4
 873  0304 ae5000        	ldw	x,#20480
 874  0307 cd0000        	call	_GPIO_WriteHigh
 876  030a 84            	pop	a
 879  030b 4b80          	push	#128
 880  030d ae500a        	ldw	x,#20490
 881  0310 cd0000        	call	_GPIO_WriteHigh
 883  0313 84            	pop	a
 886  0314 4b08          	push	#8
 887  0316 ae500f        	ldw	x,#20495
 888  0319 cd0000        	call	_GPIO_WriteHigh
 890  031c 84            	pop	a
 893  031d 4b02          	push	#2
 894  031f ae500f        	ldw	x,#20495
 895  0322 cd0000        	call	_GPIO_WriteHigh
 897  0325 84            	pop	a
 900  0326 4b02          	push	#2
 901  0328 ae5000        	ldw	x,#20480
 902  032b cd0000        	call	_GPIO_WriteHigh
 904  032e 84            	pop	a
 907  032f 4b40          	push	#64
 908  0331 ae500a        	ldw	x,#20490
 909  0334 cd0000        	call	_GPIO_WriteHigh
 911  0337 84            	pop	a
 912                     ; 92         break;
 914  0338 ac160616      	jpf	L771
 915  033c               L521:
 916                     ; 93     case 0x09:
 916                     ; 94         display_nine();
 918  033c 4b20          	push	#32
 919  033e ae500f        	ldw	x,#20495
 920  0341 cd0000        	call	_GPIO_WriteHigh
 922  0344 84            	pop	a
 925  0345 4b04          	push	#4
 926  0347 ae5000        	ldw	x,#20480
 927  034a cd0000        	call	_GPIO_WriteHigh
 929  034d 84            	pop	a
 932  034e 4b80          	push	#128
 933  0350 ae500a        	ldw	x,#20490
 934  0353 cd0000        	call	_GPIO_WriteHigh
 936  0356 84            	pop	a
 939  0357 4b08          	push	#8
 940  0359 ae500f        	ldw	x,#20495
 941  035c cd0000        	call	_GPIO_WriteHigh
 943  035f 84            	pop	a
 946  0360 4b02          	push	#2
 947  0362 ae500f        	ldw	x,#20495
 948  0365 cd0000        	call	_GPIO_WriteLow
 950  0368 84            	pop	a
 953  0369 4b02          	push	#2
 954  036b ae5000        	ldw	x,#20480
 955  036e cd0000        	call	_GPIO_WriteHigh
 957  0371 84            	pop	a
 960  0372 4b40          	push	#64
 961  0374 ae500a        	ldw	x,#20490
 962  0377 cd0000        	call	_GPIO_WriteHigh
 964  037a 84            	pop	a
 965                     ; 95         break;
 967  037b ac160616      	jpf	L771
 968  037f               L721:
 969                     ; 96     case 'A':
 969                     ; 97         display_a();
 971  037f 4b20          	push	#32
 972  0381 ae500f        	ldw	x,#20495
 973  0384 cd0000        	call	_GPIO_WriteHigh
 975  0387 84            	pop	a
 978  0388 4b04          	push	#4
 979  038a ae5000        	ldw	x,#20480
 980  038d cd0000        	call	_GPIO_WriteHigh
 982  0390 84            	pop	a
 985  0391 4b80          	push	#128
 986  0393 ae500a        	ldw	x,#20490
 987  0396 cd0000        	call	_GPIO_WriteHigh
 989  0399 84            	pop	a
 992  039a 4b08          	push	#8
 993  039c ae500f        	ldw	x,#20495
 994  039f cd0000        	call	_GPIO_WriteLow
 996  03a2 84            	pop	a
 999  03a3 4b02          	push	#2
1000  03a5 ae500f        	ldw	x,#20495
1001  03a8 cd0000        	call	_GPIO_WriteHigh
1003  03ab 84            	pop	a
1006  03ac 4b02          	push	#2
1007  03ae ae5000        	ldw	x,#20480
1008  03b1 cd0000        	call	_GPIO_WriteHigh
1010  03b4 84            	pop	a
1013  03b5 4b40          	push	#64
1014  03b7 ae500a        	ldw	x,#20490
1015  03ba cd0000        	call	_GPIO_WriteHigh
1017  03bd 84            	pop	a
1018                     ; 98         break;
1020  03be ac160616      	jpf	L771
1021  03c2               L131:
1022                     ; 99     case 'b':
1022                     ; 100         display_b();
1024  03c2 4b20          	push	#32
1025  03c4 ae500f        	ldw	x,#20495
1026  03c7 cd0000        	call	_GPIO_WriteLow
1028  03ca 84            	pop	a
1031  03cb 4b04          	push	#4
1032  03cd ae5000        	ldw	x,#20480
1033  03d0 cd0000        	call	_GPIO_WriteLow
1035  03d3 84            	pop	a
1038  03d4 4b80          	push	#128
1039  03d6 ae500a        	ldw	x,#20490
1040  03d9 cd0000        	call	_GPIO_WriteHigh
1042  03dc 84            	pop	a
1045  03dd 4b08          	push	#8
1046  03df ae500f        	ldw	x,#20495
1047  03e2 cd0000        	call	_GPIO_WriteHigh
1049  03e5 84            	pop	a
1052  03e6 4b02          	push	#2
1053  03e8 ae500f        	ldw	x,#20495
1054  03eb cd0000        	call	_GPIO_WriteHigh
1056  03ee 84            	pop	a
1059  03ef 4b02          	push	#2
1060  03f1 ae5000        	ldw	x,#20480
1061  03f4 cd0000        	call	_GPIO_WriteHigh
1063  03f7 84            	pop	a
1066  03f8 4b40          	push	#64
1067  03fa ae500a        	ldw	x,#20490
1068  03fd cd0000        	call	_GPIO_WriteHigh
1070  0400 84            	pop	a
1071                     ; 101         break;
1073  0401 ac160616      	jpf	L771
1074  0405               L331:
1075                     ; 102     case 'C':
1075                     ; 103         display_c();
1077  0405 4b20          	push	#32
1078  0407 ae500f        	ldw	x,#20495
1079  040a cd0000        	call	_GPIO_WriteHigh
1081  040d 84            	pop	a
1084  040e 4b04          	push	#4
1085  0410 ae5000        	ldw	x,#20480
1086  0413 cd0000        	call	_GPIO_WriteLow
1088  0416 84            	pop	a
1091  0417 4b80          	push	#128
1092  0419 ae500a        	ldw	x,#20490
1093  041c cd0000        	call	_GPIO_WriteLow
1095  041f 84            	pop	a
1098  0420 4b08          	push	#8
1099  0422 ae500f        	ldw	x,#20495
1100  0425 cd0000        	call	_GPIO_WriteHigh
1102  0428 84            	pop	a
1105  0429 4b02          	push	#2
1106  042b ae500f        	ldw	x,#20495
1107  042e cd0000        	call	_GPIO_WriteHigh
1109  0431 84            	pop	a
1112  0432 4b02          	push	#2
1113  0434 ae5000        	ldw	x,#20480
1114  0437 cd0000        	call	_GPIO_WriteHigh
1116  043a 84            	pop	a
1119  043b 4b40          	push	#64
1120  043d ae500a        	ldw	x,#20490
1121  0440 cd0000        	call	_GPIO_WriteLow
1123  0443 84            	pop	a
1124                     ; 104         break;
1126  0444 ac160616      	jpf	L771
1127  0448               L531:
1128                     ; 105     case 'd':
1128                     ; 106         display_d();
1130  0448 4b20          	push	#32
1131  044a ae500f        	ldw	x,#20495
1132  044d cd0000        	call	_GPIO_WriteLow
1134  0450 84            	pop	a
1137  0451 4b04          	push	#4
1138  0453 ae5000        	ldw	x,#20480
1139  0456 cd0000        	call	_GPIO_WriteHigh
1141  0459 84            	pop	a
1144  045a 4b80          	push	#128
1145  045c ae500a        	ldw	x,#20490
1146  045f cd0000        	call	_GPIO_WriteHigh
1148  0462 84            	pop	a
1151  0463 4b08          	push	#8
1152  0465 ae500f        	ldw	x,#20495
1153  0468 cd0000        	call	_GPIO_WriteHigh
1155  046b 84            	pop	a
1158  046c 4b02          	push	#2
1159  046e ae500f        	ldw	x,#20495
1160  0471 cd0000        	call	_GPIO_WriteHigh
1162  0474 84            	pop	a
1165  0475 4b02          	push	#2
1166  0477 ae5000        	ldw	x,#20480
1167  047a cd0000        	call	_GPIO_WriteLow
1169  047d 84            	pop	a
1172  047e 4b40          	push	#64
1173  0480 ae500a        	ldw	x,#20490
1174  0483 cd0000        	call	_GPIO_WriteHigh
1176  0486 84            	pop	a
1177                     ; 107         break;
1179  0487 ac160616      	jpf	L771
1180  048b               L731:
1181                     ; 108     case 'E':
1181                     ; 109         display_e();
1183  048b 4b20          	push	#32
1184  048d ae500f        	ldw	x,#20495
1185  0490 cd0000        	call	_GPIO_WriteHigh
1187  0493 84            	pop	a
1190  0494 4b04          	push	#4
1191  0496 ae5000        	ldw	x,#20480
1192  0499 cd0000        	call	_GPIO_WriteLow
1194  049c 84            	pop	a
1197  049d 4b80          	push	#128
1198  049f ae500a        	ldw	x,#20490
1199  04a2 cd0000        	call	_GPIO_WriteLow
1201  04a5 84            	pop	a
1204  04a6 4b08          	push	#8
1205  04a8 ae500f        	ldw	x,#20495
1206  04ab cd0000        	call	_GPIO_WriteHigh
1208  04ae 84            	pop	a
1211  04af 4b02          	push	#2
1212  04b1 ae500f        	ldw	x,#20495
1213  04b4 cd0000        	call	_GPIO_WriteHigh
1215  04b7 84            	pop	a
1218  04b8 4b02          	push	#2
1219  04ba ae5000        	ldw	x,#20480
1220  04bd cd0000        	call	_GPIO_WriteHigh
1222  04c0 84            	pop	a
1225  04c1 4b40          	push	#64
1226  04c3 ae500a        	ldw	x,#20490
1227  04c6 cd0000        	call	_GPIO_WriteHigh
1229  04c9 84            	pop	a
1230                     ; 110         break;
1232  04ca ac160616      	jpf	L771
1233  04ce               L141:
1234                     ; 111     case 'F':
1234                     ; 112         display_f();
1236  04ce 4b20          	push	#32
1237  04d0 ae500f        	ldw	x,#20495
1238  04d3 cd0000        	call	_GPIO_WriteHigh
1240  04d6 84            	pop	a
1243  04d7 4b04          	push	#4
1244  04d9 ae5000        	ldw	x,#20480
1245  04dc cd0000        	call	_GPIO_WriteLow
1247  04df 84            	pop	a
1250  04e0 4b80          	push	#128
1251  04e2 ae500a        	ldw	x,#20490
1252  04e5 cd0000        	call	_GPIO_WriteLow
1254  04e8 84            	pop	a
1257  04e9 4b08          	push	#8
1258  04eb ae500f        	ldw	x,#20495
1259  04ee cd0000        	call	_GPIO_WriteLow
1261  04f1 84            	pop	a
1264  04f2 4b02          	push	#2
1265  04f4 ae500f        	ldw	x,#20495
1266  04f7 cd0000        	call	_GPIO_WriteHigh
1268  04fa 84            	pop	a
1271  04fb 4b02          	push	#2
1272  04fd ae5000        	ldw	x,#20480
1273  0500 cd0000        	call	_GPIO_WriteHigh
1275  0503 84            	pop	a
1278  0504 4b40          	push	#64
1279  0506 ae500a        	ldw	x,#20490
1280  0509 cd0000        	call	_GPIO_WriteHigh
1282  050c 84            	pop	a
1283                     ; 113         break;
1285  050d ac160616      	jpf	L771
1286  0511               L341:
1287                     ; 114     case 'H':
1287                     ; 115         display_h();
1289  0511 4b20          	push	#32
1290  0513 ae500f        	ldw	x,#20495
1291  0516 cd0000        	call	_GPIO_WriteLow
1293  0519 84            	pop	a
1296  051a 4b04          	push	#4
1297  051c ae5000        	ldw	x,#20480
1298  051f cd0000        	call	_GPIO_WriteHigh
1300  0522 84            	pop	a
1303  0523 4b80          	push	#128
1304  0525 ae500a        	ldw	x,#20490
1305  0528 cd0000        	call	_GPIO_WriteHigh
1307  052b 84            	pop	a
1310  052c 4b08          	push	#8
1311  052e ae500f        	ldw	x,#20495
1312  0531 cd0000        	call	_GPIO_WriteLow
1314  0534 84            	pop	a
1317  0535 4b02          	push	#2
1318  0537 ae500f        	ldw	x,#20495
1319  053a cd0000        	call	_GPIO_WriteHigh
1321  053d 84            	pop	a
1324  053e 4b02          	push	#2
1325  0540 ae5000        	ldw	x,#20480
1326  0543 cd0000        	call	_GPIO_WriteHigh
1328  0546 84            	pop	a
1331  0547 4b40          	push	#64
1332  0549 ae500a        	ldw	x,#20490
1333  054c cd0000        	call	_GPIO_WriteHigh
1335  054f 84            	pop	a
1336                     ; 116         break;
1338  0550 ac160616      	jpf	L771
1339  0554               L541:
1340                     ; 117     case 'L':
1340                     ; 118         display_l();
1342  0554 4b20          	push	#32
1343  0556 ae500f        	ldw	x,#20495
1344  0559 cd0000        	call	_GPIO_WriteLow
1346  055c 84            	pop	a
1349  055d 4b04          	push	#4
1350  055f ae5000        	ldw	x,#20480
1351  0562 cd0000        	call	_GPIO_WriteLow
1353  0565 84            	pop	a
1356  0566 4b80          	push	#128
1357  0568 ae500a        	ldw	x,#20490
1358  056b cd0000        	call	_GPIO_WriteLow
1360  056e 84            	pop	a
1363  056f 4b08          	push	#8
1364  0571 ae500f        	ldw	x,#20495
1365  0574 cd0000        	call	_GPIO_WriteHigh
1367  0577 84            	pop	a
1370  0578 4b02          	push	#2
1371  057a ae500f        	ldw	x,#20495
1372  057d cd0000        	call	_GPIO_WriteHigh
1374  0580 84            	pop	a
1377  0581 4b02          	push	#2
1378  0583 ae5000        	ldw	x,#20480
1379  0586 cd0000        	call	_GPIO_WriteHigh
1381  0589 84            	pop	a
1384  058a 4b40          	push	#64
1385  058c ae500a        	ldw	x,#20490
1386  058f cd0000        	call	_GPIO_WriteLow
1388  0592 84            	pop	a
1389                     ; 119         break;
1391  0593 cc0616        	jra	L771
1392  0596               L741:
1393                     ; 120     case 'P':
1393                     ; 121         display_p();
1395  0596 4b20          	push	#32
1396  0598 ae500f        	ldw	x,#20495
1397  059b cd0000        	call	_GPIO_WriteHigh
1399  059e 84            	pop	a
1402  059f 4b04          	push	#4
1403  05a1 ae5000        	ldw	x,#20480
1404  05a4 cd0000        	call	_GPIO_WriteHigh
1406  05a7 84            	pop	a
1409  05a8 4b80          	push	#128
1410  05aa ae500a        	ldw	x,#20490
1411  05ad cd0000        	call	_GPIO_WriteLow
1413  05b0 84            	pop	a
1416  05b1 4b08          	push	#8
1417  05b3 ae500f        	ldw	x,#20495
1418  05b6 cd0000        	call	_GPIO_WriteLow
1420  05b9 84            	pop	a
1423  05ba 4b02          	push	#2
1424  05bc ae500f        	ldw	x,#20495
1425  05bf cd0000        	call	_GPIO_WriteHigh
1427  05c2 84            	pop	a
1430  05c3 4b02          	push	#2
1431  05c5 ae5000        	ldw	x,#20480
1432  05c8 cd0000        	call	_GPIO_WriteHigh
1434  05cb 84            	pop	a
1437  05cc 4b40          	push	#64
1438  05ce ae500a        	ldw	x,#20490
1439  05d1 cd0000        	call	_GPIO_WriteHigh
1441  05d4 84            	pop	a
1442                     ; 122         break;
1444  05d5 203f          	jra	L771
1445  05d7               L151:
1446                     ; 123     case 'U':
1446                     ; 124         display_u();
1448  05d7 4b20          	push	#32
1449  05d9 ae500f        	ldw	x,#20495
1450  05dc cd0000        	call	_GPIO_WriteLow
1452  05df 84            	pop	a
1455  05e0 4b04          	push	#4
1456  05e2 ae5000        	ldw	x,#20480
1457  05e5 cd0000        	call	_GPIO_WriteHigh
1459  05e8 84            	pop	a
1462  05e9 4b80          	push	#128
1463  05eb ae500a        	ldw	x,#20490
1464  05ee cd0000        	call	_GPIO_WriteHigh
1466  05f1 84            	pop	a
1469  05f2 4b08          	push	#8
1470  05f4 ae500f        	ldw	x,#20495
1471  05f7 cd0000        	call	_GPIO_WriteHigh
1473  05fa 84            	pop	a
1476  05fb 4b02          	push	#2
1477  05fd ae500f        	ldw	x,#20495
1478  0600 cd0000        	call	_GPIO_WriteHigh
1480  0603 84            	pop	a
1483  0604 4b02          	push	#2
1484  0606 ae5000        	ldw	x,#20480
1485  0609 cd0000        	call	_GPIO_WriteHigh
1487  060c 84            	pop	a
1490  060d 4b40          	push	#64
1491  060f ae500a        	ldw	x,#20490
1492  0612 cd0000        	call	_GPIO_WriteLow
1494  0615 84            	pop	a
1495                     ; 125         break;
1497  0616               L771:
1498                     ; 128 }
1501  0616 84            	pop	a
1502  0617 81            	ret
1505                     	bsct
1506  0007               L102_dig_pos:
1507  0007 00            	dc.b	0
1543                     ; 130 void tmr_display(void)
1543                     ; 131 {
1544                     	switch	.text
1545  0618               _tmr_display:
1549                     ; 136     if (display_test)
1551  0618 3d00          	tnz	_display_test
1552  061a 2701          	jreq	L722
1553                     ; 137         return;
1556  061c 81            	ret
1557  061d               L722:
1558                     ; 140     if (dig_pos >= MAX_DIG_POS)
1560  061d b607          	ld	a,L102_dig_pos
1561  061f a103          	cp	a,#3
1562  0621 2502          	jrult	L132
1563                     ; 141         dig_pos = DIG1_POS;
1565  0623 3f07          	clr	L102_dig_pos
1566  0625               L132:
1567                     ; 143     switch (dig_pos) {
1569  0625 b607          	ld	a,L102_dig_pos
1571                     ; 158         break;
1572  0627 4d            	tnz	a
1573  0628 2708          	jreq	L302
1574  062a 4a            	dec	a
1575  062b 2722          	jreq	L502
1576  062d 4a            	dec	a
1577  062e 273c          	jreq	L702
1578  0630 2055          	jra	L532
1579  0632               L302:
1580                     ; 144     case DIG1_POS:
1580                     ; 145         dig1_on();
1582  0632 4b10          	push	#16
1583  0634 ae500f        	ldw	x,#20495
1584  0637 cd0000        	call	_GPIO_WriteLow
1586  063a 84            	pop	a
1587                     ; 146         dig2_off();
1589  063b 4b20          	push	#32
1590  063d ae5005        	ldw	x,#20485
1591  0640 cd0000        	call	_GPIO_WriteHigh
1593  0643 84            	pop	a
1594                     ; 147         dig3_off();
1596  0644 4b10          	push	#16
1597  0646 ae5005        	ldw	x,#20485
1598  0649 cd0000        	call	_GPIO_WriteHigh
1600  064c 84            	pop	a
1601                     ; 148         break;
1603  064d 2038          	jra	L532
1604  064f               L502:
1605                     ; 149     case DIG2_POS:
1605                     ; 150         dig1_off();
1607  064f 4b10          	push	#16
1608  0651 ae500f        	ldw	x,#20495
1609  0654 cd0000        	call	_GPIO_WriteHigh
1611  0657 84            	pop	a
1612                     ; 151         dig2_on();
1614  0658 4b20          	push	#32
1615  065a ae5005        	ldw	x,#20485
1616  065d cd0000        	call	_GPIO_WriteLow
1618  0660 84            	pop	a
1619                     ; 152         dig3_off();
1621  0661 4b10          	push	#16
1622  0663 ae5005        	ldw	x,#20485
1623  0666 cd0000        	call	_GPIO_WriteHigh
1625  0669 84            	pop	a
1626                     ; 153         break;
1628  066a 201b          	jra	L532
1629  066c               L702:
1630                     ; 154     case DIG3_POS:
1630                     ; 155         dig1_off();
1632  066c 4b10          	push	#16
1633  066e ae500f        	ldw	x,#20495
1634  0671 cd0000        	call	_GPIO_WriteHigh
1636  0674 84            	pop	a
1637                     ; 156         dig2_off();
1639  0675 4b20          	push	#32
1640  0677 ae5005        	ldw	x,#20485
1641  067a cd0000        	call	_GPIO_WriteHigh
1643  067d 84            	pop	a
1644                     ; 157         dig3_on();
1646  067e 4b10          	push	#16
1647  0680 ae5005        	ldw	x,#20485
1648  0683 cd0000        	call	_GPIO_WriteLow
1650  0686 84            	pop	a
1651                     ; 158         break;
1653  0687               L532:
1654                     ; 161     wr_digit(dig_pos);
1656  0687 b607          	ld	a,L102_dig_pos
1657  0689 cd006c        	call	_wr_digit
1659                     ; 162     dig_pos++;
1661  068c 3c07          	inc	L102_dig_pos
1662                     ; 164 }
1665  068e 81            	ret
1691                     ; 167 void test_display(void)
1691                     ; 168 {
1692                     	switch	.text
1693  068f               _test_display:
1697                     ; 169     delay(DELAY_DISPLAY_TEST);
1699  068f ae00fa        	ldw	x,#250
1700  0692 89            	pushw	x
1701  0693 ae0000        	ldw	x,#0
1702  0696 89            	pushw	x
1703  0697 cd0000        	call	_delay
1705  069a 5b04          	addw	sp,#4
1706                     ; 170     display_zero();
1708  069c 4b20          	push	#32
1709  069e ae500f        	ldw	x,#20495
1710  06a1 cd0000        	call	_GPIO_WriteHigh
1712  06a4 84            	pop	a
1715  06a5 4b04          	push	#4
1716  06a7 ae5000        	ldw	x,#20480
1717  06aa cd0000        	call	_GPIO_WriteHigh
1719  06ad 84            	pop	a
1722  06ae 4b80          	push	#128
1723  06b0 ae500a        	ldw	x,#20490
1724  06b3 cd0000        	call	_GPIO_WriteHigh
1726  06b6 84            	pop	a
1729  06b7 4b08          	push	#8
1730  06b9 ae500f        	ldw	x,#20495
1731  06bc cd0000        	call	_GPIO_WriteHigh
1733  06bf 84            	pop	a
1736  06c0 4b02          	push	#2
1737  06c2 ae500f        	ldw	x,#20495
1738  06c5 cd0000        	call	_GPIO_WriteHigh
1740  06c8 84            	pop	a
1743  06c9 4b02          	push	#2
1744  06cb ae5000        	ldw	x,#20480
1745  06ce cd0000        	call	_GPIO_WriteHigh
1747  06d1 84            	pop	a
1750  06d2 4b40          	push	#64
1751  06d4 ae500a        	ldw	x,#20490
1752  06d7 cd0000        	call	_GPIO_WriteLow
1754  06da 84            	pop	a
1755                     ; 171     delay(DELAY_DISPLAY_TEST);
1757  06db ae00fa        	ldw	x,#250
1758  06de 89            	pushw	x
1759  06df ae0000        	ldw	x,#0
1760  06e2 89            	pushw	x
1761  06e3 cd0000        	call	_delay
1763  06e6 5b04          	addw	sp,#4
1764                     ; 172     display_one();
1766  06e8 4b20          	push	#32
1767  06ea ae500f        	ldw	x,#20495
1768  06ed cd0000        	call	_GPIO_WriteLow
1770  06f0 84            	pop	a
1773  06f1 4b04          	push	#4
1774  06f3 ae5000        	ldw	x,#20480
1775  06f6 cd0000        	call	_GPIO_WriteHigh
1777  06f9 84            	pop	a
1780  06fa 4b80          	push	#128
1781  06fc ae500a        	ldw	x,#20490
1782  06ff cd0000        	call	_GPIO_WriteHigh
1784  0702 84            	pop	a
1787  0703 4b08          	push	#8
1788  0705 ae500f        	ldw	x,#20495
1789  0708 cd0000        	call	_GPIO_WriteLow
1791  070b 84            	pop	a
1794  070c 4b02          	push	#2
1795  070e ae500f        	ldw	x,#20495
1796  0711 cd0000        	call	_GPIO_WriteLow
1798  0714 84            	pop	a
1801  0715 4b02          	push	#2
1802  0717 ae5000        	ldw	x,#20480
1803  071a cd0000        	call	_GPIO_WriteLow
1805  071d 84            	pop	a
1808  071e 4b40          	push	#64
1809  0720 ae500a        	ldw	x,#20490
1810  0723 cd0000        	call	_GPIO_WriteLow
1812  0726 84            	pop	a
1813                     ; 173     delay(DELAY_DISPLAY_TEST);
1815  0727 ae00fa        	ldw	x,#250
1816  072a 89            	pushw	x
1817  072b ae0000        	ldw	x,#0
1818  072e 89            	pushw	x
1819  072f cd0000        	call	_delay
1821  0732 5b04          	addw	sp,#4
1822                     ; 174     display_two();
1824  0734 4b20          	push	#32
1825  0736 ae500f        	ldw	x,#20495
1826  0739 cd0000        	call	_GPIO_WriteHigh
1828  073c 84            	pop	a
1831  073d 4b04          	push	#4
1832  073f ae5000        	ldw	x,#20480
1833  0742 cd0000        	call	_GPIO_WriteHigh
1835  0745 84            	pop	a
1838  0746 4b80          	push	#128
1839  0748 ae500a        	ldw	x,#20490
1840  074b cd0000        	call	_GPIO_WriteLow
1842  074e 84            	pop	a
1845  074f 4b08          	push	#8
1846  0751 ae500f        	ldw	x,#20495
1847  0754 cd0000        	call	_GPIO_WriteHigh
1849  0757 84            	pop	a
1852  0758 4b02          	push	#2
1853  075a ae500f        	ldw	x,#20495
1854  075d cd0000        	call	_GPIO_WriteHigh
1856  0760 84            	pop	a
1859  0761 4b02          	push	#2
1860  0763 ae5000        	ldw	x,#20480
1861  0766 cd0000        	call	_GPIO_WriteLow
1863  0769 84            	pop	a
1866  076a 4b40          	push	#64
1867  076c ae500a        	ldw	x,#20490
1868  076f cd0000        	call	_GPIO_WriteHigh
1870  0772 84            	pop	a
1871                     ; 175     delay(DELAY_DISPLAY_TEST);
1873  0773 ae00fa        	ldw	x,#250
1874  0776 89            	pushw	x
1875  0777 ae0000        	ldw	x,#0
1876  077a 89            	pushw	x
1877  077b cd0000        	call	_delay
1879  077e 5b04          	addw	sp,#4
1880                     ; 176     display_three();
1882  0780 4b20          	push	#32
1883  0782 ae500f        	ldw	x,#20495
1884  0785 cd0000        	call	_GPIO_WriteHigh
1886  0788 84            	pop	a
1889  0789 4b04          	push	#4
1890  078b ae5000        	ldw	x,#20480
1891  078e cd0000        	call	_GPIO_WriteHigh
1893  0791 84            	pop	a
1896  0792 4b80          	push	#128
1897  0794 ae500a        	ldw	x,#20490
1898  0797 cd0000        	call	_GPIO_WriteHigh
1900  079a 84            	pop	a
1903  079b 4b08          	push	#8
1904  079d ae500f        	ldw	x,#20495
1905  07a0 cd0000        	call	_GPIO_WriteHigh
1907  07a3 84            	pop	a
1910  07a4 4b02          	push	#2
1911  07a6 ae500f        	ldw	x,#20495
1912  07a9 cd0000        	call	_GPIO_WriteLow
1914  07ac 84            	pop	a
1917  07ad 4b02          	push	#2
1918  07af ae5000        	ldw	x,#20480
1919  07b2 cd0000        	call	_GPIO_WriteLow
1921  07b5 84            	pop	a
1924  07b6 4b40          	push	#64
1925  07b8 ae500a        	ldw	x,#20490
1926  07bb cd0000        	call	_GPIO_WriteHigh
1928  07be 84            	pop	a
1929                     ; 177     delay(DELAY_DISPLAY_TEST);
1931  07bf ae00fa        	ldw	x,#250
1932  07c2 89            	pushw	x
1933  07c3 ae0000        	ldw	x,#0
1934  07c6 89            	pushw	x
1935  07c7 cd0000        	call	_delay
1937  07ca 5b04          	addw	sp,#4
1938                     ; 178     display_four();
1940  07cc 4b20          	push	#32
1941  07ce ae500f        	ldw	x,#20495
1942  07d1 cd0000        	call	_GPIO_WriteLow
1944  07d4 84            	pop	a
1947  07d5 4b04          	push	#4
1948  07d7 ae5000        	ldw	x,#20480
1949  07da cd0000        	call	_GPIO_WriteHigh
1951  07dd 84            	pop	a
1954  07de 4b80          	push	#128
1955  07e0 ae500a        	ldw	x,#20490
1956  07e3 cd0000        	call	_GPIO_WriteHigh
1958  07e6 84            	pop	a
1961  07e7 4b08          	push	#8
1962  07e9 ae500f        	ldw	x,#20495
1963  07ec cd0000        	call	_GPIO_WriteLow
1965  07ef 84            	pop	a
1968  07f0 4b02          	push	#2
1969  07f2 ae500f        	ldw	x,#20495
1970  07f5 cd0000        	call	_GPIO_WriteLow
1972  07f8 84            	pop	a
1975  07f9 4b02          	push	#2
1976  07fb ae5000        	ldw	x,#20480
1977  07fe cd0000        	call	_GPIO_WriteHigh
1979  0801 84            	pop	a
1982  0802 4b40          	push	#64
1983  0804 ae500a        	ldw	x,#20490
1984  0807 cd0000        	call	_GPIO_WriteHigh
1986  080a 84            	pop	a
1987                     ; 179     delay(DELAY_DISPLAY_TEST);
1989  080b ae00fa        	ldw	x,#250
1990  080e 89            	pushw	x
1991  080f ae0000        	ldw	x,#0
1992  0812 89            	pushw	x
1993  0813 cd0000        	call	_delay
1995  0816 5b04          	addw	sp,#4
1996                     ; 180     display_five();
1998  0818 4b20          	push	#32
1999  081a ae500f        	ldw	x,#20495
2000  081d cd0000        	call	_GPIO_WriteHigh
2002  0820 84            	pop	a
2005  0821 4b04          	push	#4
2006  0823 ae5000        	ldw	x,#20480
2007  0826 cd0000        	call	_GPIO_WriteLow
2009  0829 84            	pop	a
2012  082a 4b80          	push	#128
2013  082c ae500a        	ldw	x,#20490
2014  082f cd0000        	call	_GPIO_WriteHigh
2016  0832 84            	pop	a
2019  0833 4b08          	push	#8
2020  0835 ae500f        	ldw	x,#20495
2021  0838 cd0000        	call	_GPIO_WriteHigh
2023  083b 84            	pop	a
2026  083c 4b02          	push	#2
2027  083e ae500f        	ldw	x,#20495
2028  0841 cd0000        	call	_GPIO_WriteLow
2030  0844 84            	pop	a
2033  0845 4b02          	push	#2
2034  0847 ae5000        	ldw	x,#20480
2035  084a cd0000        	call	_GPIO_WriteHigh
2037  084d 84            	pop	a
2040  084e 4b40          	push	#64
2041  0850 ae500a        	ldw	x,#20490
2042  0853 cd0000        	call	_GPIO_WriteHigh
2044  0856 84            	pop	a
2045                     ; 181     delay(DELAY_DISPLAY_TEST);
2047  0857 ae00fa        	ldw	x,#250
2048  085a 89            	pushw	x
2049  085b ae0000        	ldw	x,#0
2050  085e 89            	pushw	x
2051  085f cd0000        	call	_delay
2053  0862 5b04          	addw	sp,#4
2054                     ; 182     display_six();
2056  0864 4b20          	push	#32
2057  0866 ae500f        	ldw	x,#20495
2058  0869 cd0000        	call	_GPIO_WriteHigh
2060  086c 84            	pop	a
2063  086d 4b04          	push	#4
2064  086f ae5000        	ldw	x,#20480
2065  0872 cd0000        	call	_GPIO_WriteLow
2067  0875 84            	pop	a
2070  0876 4b80          	push	#128
2071  0878 ae500a        	ldw	x,#20490
2072  087b cd0000        	call	_GPIO_WriteHigh
2074  087e 84            	pop	a
2077  087f 4b08          	push	#8
2078  0881 ae500f        	ldw	x,#20495
2079  0884 cd0000        	call	_GPIO_WriteHigh
2081  0887 84            	pop	a
2084  0888 4b02          	push	#2
2085  088a ae500f        	ldw	x,#20495
2086  088d cd0000        	call	_GPIO_WriteHigh
2088  0890 84            	pop	a
2091  0891 4b02          	push	#2
2092  0893 ae5000        	ldw	x,#20480
2093  0896 cd0000        	call	_GPIO_WriteHigh
2095  0899 84            	pop	a
2098  089a 4b40          	push	#64
2099  089c ae500a        	ldw	x,#20490
2100  089f cd0000        	call	_GPIO_WriteHigh
2102  08a2 84            	pop	a
2103                     ; 183     delay(DELAY_DISPLAY_TEST);
2105  08a3 ae00fa        	ldw	x,#250
2106  08a6 89            	pushw	x
2107  08a7 ae0000        	ldw	x,#0
2108  08aa 89            	pushw	x
2109  08ab cd0000        	call	_delay
2111  08ae 5b04          	addw	sp,#4
2112                     ; 184     display_seven();
2114  08b0 4b20          	push	#32
2115  08b2 ae500f        	ldw	x,#20495
2116  08b5 cd0000        	call	_GPIO_WriteHigh
2118  08b8 84            	pop	a
2121  08b9 4b04          	push	#4
2122  08bb ae5000        	ldw	x,#20480
2123  08be cd0000        	call	_GPIO_WriteHigh
2125  08c1 84            	pop	a
2128  08c2 4b80          	push	#128
2129  08c4 ae500a        	ldw	x,#20490
2130  08c7 cd0000        	call	_GPIO_WriteHigh
2132  08ca 84            	pop	a
2135  08cb 4b08          	push	#8
2136  08cd ae500f        	ldw	x,#20495
2137  08d0 cd0000        	call	_GPIO_WriteLow
2139  08d3 84            	pop	a
2142  08d4 4b02          	push	#2
2143  08d6 ae500f        	ldw	x,#20495
2144  08d9 cd0000        	call	_GPIO_WriteLow
2146  08dc 84            	pop	a
2149  08dd 4b02          	push	#2
2150  08df ae5000        	ldw	x,#20480
2151  08e2 cd0000        	call	_GPIO_WriteLow
2153  08e5 84            	pop	a
2156  08e6 4b40          	push	#64
2157  08e8 ae500a        	ldw	x,#20490
2158  08eb cd0000        	call	_GPIO_WriteLow
2160  08ee 84            	pop	a
2161                     ; 185     delay(DELAY_DISPLAY_TEST);
2163  08ef ae00fa        	ldw	x,#250
2164  08f2 89            	pushw	x
2165  08f3 ae0000        	ldw	x,#0
2166  08f6 89            	pushw	x
2167  08f7 cd0000        	call	_delay
2169  08fa 5b04          	addw	sp,#4
2170                     ; 186     display_eight();
2172  08fc 4b20          	push	#32
2173  08fe ae500f        	ldw	x,#20495
2174  0901 cd0000        	call	_GPIO_WriteHigh
2176  0904 84            	pop	a
2179  0905 4b04          	push	#4
2180  0907 ae5000        	ldw	x,#20480
2181  090a cd0000        	call	_GPIO_WriteHigh
2183  090d 84            	pop	a
2186  090e 4b80          	push	#128
2187  0910 ae500a        	ldw	x,#20490
2188  0913 cd0000        	call	_GPIO_WriteHigh
2190  0916 84            	pop	a
2193  0917 4b08          	push	#8
2194  0919 ae500f        	ldw	x,#20495
2195  091c cd0000        	call	_GPIO_WriteHigh
2197  091f 84            	pop	a
2200  0920 4b02          	push	#2
2201  0922 ae500f        	ldw	x,#20495
2202  0925 cd0000        	call	_GPIO_WriteHigh
2204  0928 84            	pop	a
2207  0929 4b02          	push	#2
2208  092b ae5000        	ldw	x,#20480
2209  092e cd0000        	call	_GPIO_WriteHigh
2211  0931 84            	pop	a
2214  0932 4b40          	push	#64
2215  0934 ae500a        	ldw	x,#20490
2216  0937 cd0000        	call	_GPIO_WriteHigh
2218  093a 84            	pop	a
2219                     ; 187     delay(DELAY_DISPLAY_TEST);
2221  093b ae00fa        	ldw	x,#250
2222  093e 89            	pushw	x
2223  093f ae0000        	ldw	x,#0
2224  0942 89            	pushw	x
2225  0943 cd0000        	call	_delay
2227  0946 5b04          	addw	sp,#4
2228                     ; 188     display_nine();    
2230  0948 4b20          	push	#32
2231  094a ae500f        	ldw	x,#20495
2232  094d cd0000        	call	_GPIO_WriteHigh
2234  0950 84            	pop	a
2237  0951 4b04          	push	#4
2238  0953 ae5000        	ldw	x,#20480
2239  0956 cd0000        	call	_GPIO_WriteHigh
2241  0959 84            	pop	a
2244  095a 4b80          	push	#128
2245  095c ae500a        	ldw	x,#20490
2246  095f cd0000        	call	_GPIO_WriteHigh
2248  0962 84            	pop	a
2251  0963 4b08          	push	#8
2252  0965 ae500f        	ldw	x,#20495
2253  0968 cd0000        	call	_GPIO_WriteHigh
2255  096b 84            	pop	a
2258  096c 4b02          	push	#2
2259  096e ae500f        	ldw	x,#20495
2260  0971 cd0000        	call	_GPIO_WriteLow
2262  0974 84            	pop	a
2265  0975 4b02          	push	#2
2266  0977 ae5000        	ldw	x,#20480
2267  097a cd0000        	call	_GPIO_WriteHigh
2269  097d 84            	pop	a
2272  097e 4b40          	push	#64
2273  0980 ae500a        	ldw	x,#20490
2274  0983 cd0000        	call	_GPIO_WriteHigh
2276  0986 84            	pop	a
2277                     ; 189     delay(DELAY_DISPLAY_TEST);
2279  0987 ae00fa        	ldw	x,#250
2280  098a 89            	pushw	x
2281  098b ae0000        	ldw	x,#0
2282  098e 89            	pushw	x
2283  098f cd0000        	call	_delay
2285  0992 5b04          	addw	sp,#4
2286                     ; 190     display_off();
2288  0994 4b20          	push	#32
2289  0996 ae500f        	ldw	x,#20495
2290  0999 cd0000        	call	_GPIO_WriteLow
2292  099c 84            	pop	a
2295  099d 4b04          	push	#4
2296  099f ae5000        	ldw	x,#20480
2297  09a2 cd0000        	call	_GPIO_WriteLow
2299  09a5 84            	pop	a
2302  09a6 4b80          	push	#128
2303  09a8 ae500a        	ldw	x,#20490
2304  09ab cd0000        	call	_GPIO_WriteLow
2306  09ae 84            	pop	a
2309  09af 4b08          	push	#8
2310  09b1 ae500f        	ldw	x,#20495
2311  09b4 cd0000        	call	_GPIO_WriteLow
2313  09b7 84            	pop	a
2316  09b8 4b02          	push	#2
2317  09ba ae500f        	ldw	x,#20495
2318  09bd cd0000        	call	_GPIO_WriteLow
2320  09c0 84            	pop	a
2323  09c1 4b02          	push	#2
2324  09c3 ae5000        	ldw	x,#20480
2325  09c6 cd0000        	call	_GPIO_WriteLow
2327  09c9 84            	pop	a
2330  09ca 4b40          	push	#64
2331  09cc ae500a        	ldw	x,#20490
2332  09cf cd0000        	call	_GPIO_WriteLow
2334  09d2 84            	pop	a
2337  09d3 4b04          	push	#4
2338  09d5 ae500f        	ldw	x,#20495
2339  09d8 cd0000        	call	_GPIO_WriteLow
2341  09db 84            	pop	a
2342                     ; 191     dp_on();
2345  09dc 4b04          	push	#4
2346  09de ae500f        	ldw	x,#20495
2347  09e1 cd0000        	call	_GPIO_WriteHigh
2349  09e4 84            	pop	a
2350                     ; 192     delay(DELAY_DISPLAY_TEST);
2352  09e5 ae00fa        	ldw	x,#250
2353  09e8 89            	pushw	x
2354  09e9 ae0000        	ldw	x,#0
2355  09ec 89            	pushw	x
2356  09ed cd0000        	call	_delay
2358  09f0 5b04          	addw	sp,#4
2359                     ; 193     dp_off();
2361  09f2 4b04          	push	#4
2362  09f4 ae500f        	ldw	x,#20495
2363  09f7 cd0000        	call	_GPIO_WriteLow
2365  09fa 84            	pop	a
2366                     ; 194 }
2369  09fb 81            	ret
2397                     ; 197 void init_display(void)
2397                     ; 198 {
2398                     	switch	.text
2399  09fc               _init_display:
2403                     ; 200     seg_a_dir();
2405  09fc 4be0          	push	#224
2406  09fe 4b20          	push	#32
2407  0a00 ae500f        	ldw	x,#20495
2408  0a03 cd0000        	call	_GPIO_Init
2410  0a06 85            	popw	x
2411                     ; 201     seg_b_dir();
2414  0a07 4be0          	push	#224
2415  0a09 4b04          	push	#4
2416  0a0b ae5000        	ldw	x,#20480
2417  0a0e cd0000        	call	_GPIO_Init
2419  0a11 85            	popw	x
2420                     ; 202     seg_c_dir();
2423  0a12 4be0          	push	#224
2424  0a14 4b80          	push	#128
2425  0a16 ae500a        	ldw	x,#20490
2426  0a19 cd0000        	call	_GPIO_Init
2428  0a1c 85            	popw	x
2429                     ; 203     seg_d_dir();
2432  0a1d 4be0          	push	#224
2433  0a1f 4b08          	push	#8
2434  0a21 ae500f        	ldw	x,#20495
2435  0a24 cd0000        	call	_GPIO_Init
2437  0a27 85            	popw	x
2438                     ; 204     seg_e_dir();
2441  0a28 4be0          	push	#224
2442  0a2a 4b02          	push	#2
2443  0a2c ae500f        	ldw	x,#20495
2444  0a2f cd0000        	call	_GPIO_Init
2446  0a32 85            	popw	x
2447                     ; 205     seg_f_dir();
2450  0a33 4be0          	push	#224
2451  0a35 4b02          	push	#2
2452  0a37 ae5000        	ldw	x,#20480
2453  0a3a cd0000        	call	_GPIO_Init
2455  0a3d 85            	popw	x
2456                     ; 206     seg_g_dir();
2459  0a3e 4be0          	push	#224
2460  0a40 4b40          	push	#64
2461  0a42 ae500a        	ldw	x,#20490
2462  0a45 cd0000        	call	_GPIO_Init
2464  0a48 85            	popw	x
2465                     ; 207     dp_dir();
2468  0a49 4be0          	push	#224
2469  0a4b 4b04          	push	#4
2470  0a4d ae500f        	ldw	x,#20495
2471  0a50 cd0000        	call	_GPIO_Init
2473  0a53 85            	popw	x
2474                     ; 208     dig1_dir();
2477  0a54 4be0          	push	#224
2478  0a56 4b10          	push	#16
2479  0a58 ae500f        	ldw	x,#20495
2480  0a5b cd0000        	call	_GPIO_Init
2482  0a5e 85            	popw	x
2483                     ; 209     dig2_dir();
2486  0a5f 4be0          	push	#224
2487  0a61 4b20          	push	#32
2488  0a63 ae5005        	ldw	x,#20485
2489  0a66 cd0000        	call	_GPIO_Init
2491  0a69 85            	popw	x
2492                     ; 210     dig3_dir();
2495  0a6a 4be0          	push	#224
2496  0a6c 4b10          	push	#16
2497  0a6e ae5005        	ldw	x,#20485
2498  0a71 cd0000        	call	_GPIO_Init
2500  0a74 85            	popw	x
2501                     ; 213     dig1_on();
2504  0a75 4b10          	push	#16
2505  0a77 ae500f        	ldw	x,#20495
2506  0a7a cd0000        	call	_GPIO_WriteLow
2508  0a7d 84            	pop	a
2509                     ; 214     dig2_on();
2511  0a7e 4b20          	push	#32
2512  0a80 ae5005        	ldw	x,#20485
2513  0a83 cd0000        	call	_GPIO_WriteLow
2515  0a86 84            	pop	a
2516                     ; 215     dig3_on();
2518  0a87 4b10          	push	#16
2519  0a89 ae5005        	ldw	x,#20485
2520  0a8c cd0000        	call	_GPIO_WriteLow
2522  0a8f 84            	pop	a
2523                     ; 217     display_all();
2525  0a90 4b20          	push	#32
2526  0a92 ae500f        	ldw	x,#20495
2527  0a95 cd0000        	call	_GPIO_WriteHigh
2529  0a98 84            	pop	a
2532  0a99 4b04          	push	#4
2533  0a9b ae5000        	ldw	x,#20480
2534  0a9e cd0000        	call	_GPIO_WriteHigh
2536  0aa1 84            	pop	a
2539  0aa2 4b80          	push	#128
2540  0aa4 ae500a        	ldw	x,#20490
2541  0aa7 cd0000        	call	_GPIO_WriteHigh
2543  0aaa 84            	pop	a
2546  0aab 4b08          	push	#8
2547  0aad ae500f        	ldw	x,#20495
2548  0ab0 cd0000        	call	_GPIO_WriteHigh
2550  0ab3 84            	pop	a
2553  0ab4 4b02          	push	#2
2554  0ab6 ae500f        	ldw	x,#20495
2555  0ab9 cd0000        	call	_GPIO_WriteHigh
2557  0abc 84            	pop	a
2560  0abd 4b02          	push	#2
2561  0abf ae5000        	ldw	x,#20480
2562  0ac2 cd0000        	call	_GPIO_WriteHigh
2564  0ac5 84            	pop	a
2567  0ac6 4b40          	push	#64
2568  0ac8 ae500a        	ldw	x,#20490
2569  0acb cd0000        	call	_GPIO_WriteHigh
2571  0ace 84            	pop	a
2574  0acf 4b04          	push	#4
2575  0ad1 ae500f        	ldw	x,#20495
2576  0ad4 cd0000        	call	_GPIO_WriteHigh
2578  0ad7 84            	pop	a
2579                     ; 218     delay(2*DELAY_DISPLAY_TEST);
2582  0ad8 ae01f4        	ldw	x,#500
2583  0adb 89            	pushw	x
2584  0adc ae0000        	ldw	x,#0
2585  0adf 89            	pushw	x
2586  0ae0 cd0000        	call	_delay
2588  0ae3 5b04          	addw	sp,#4
2589                     ; 219     display_off();
2591  0ae5 4b20          	push	#32
2592  0ae7 ae500f        	ldw	x,#20495
2593  0aea cd0000        	call	_GPIO_WriteLow
2595  0aed 84            	pop	a
2598  0aee 4b04          	push	#4
2599  0af0 ae5000        	ldw	x,#20480
2600  0af3 cd0000        	call	_GPIO_WriteLow
2602  0af6 84            	pop	a
2605  0af7 4b80          	push	#128
2606  0af9 ae500a        	ldw	x,#20490
2607  0afc cd0000        	call	_GPIO_WriteLow
2609  0aff 84            	pop	a
2612  0b00 4b08          	push	#8
2613  0b02 ae500f        	ldw	x,#20495
2614  0b05 cd0000        	call	_GPIO_WriteLow
2616  0b08 84            	pop	a
2619  0b09 4b02          	push	#2
2620  0b0b ae500f        	ldw	x,#20495
2621  0b0e cd0000        	call	_GPIO_WriteLow
2623  0b11 84            	pop	a
2626  0b12 4b02          	push	#2
2627  0b14 ae5000        	ldw	x,#20480
2628  0b17 cd0000        	call	_GPIO_WriteLow
2630  0b1a 84            	pop	a
2633  0b1b 4b40          	push	#64
2634  0b1d ae500a        	ldw	x,#20490
2635  0b20 cd0000        	call	_GPIO_WriteLow
2637  0b23 84            	pop	a
2640  0b24 4b04          	push	#4
2641  0b26 ae500f        	ldw	x,#20495
2642  0b29 cd0000        	call	_GPIO_WriteLow
2644  0b2c 84            	pop	a
2645                     ; 220     delay(DELAY_DISPLAY_TEST);
2648  0b2d ae00fa        	ldw	x,#250
2649  0b30 89            	pushw	x
2650  0b31 ae0000        	ldw	x,#0
2651  0b34 89            	pushw	x
2652  0b35 cd0000        	call	_delay
2654  0b38 5b04          	addw	sp,#4
2655                     ; 221     display_all();
2657  0b3a 4b20          	push	#32
2658  0b3c ae500f        	ldw	x,#20495
2659  0b3f cd0000        	call	_GPIO_WriteHigh
2661  0b42 84            	pop	a
2664  0b43 4b04          	push	#4
2665  0b45 ae5000        	ldw	x,#20480
2666  0b48 cd0000        	call	_GPIO_WriteHigh
2668  0b4b 84            	pop	a
2671  0b4c 4b80          	push	#128
2672  0b4e ae500a        	ldw	x,#20490
2673  0b51 cd0000        	call	_GPIO_WriteHigh
2675  0b54 84            	pop	a
2678  0b55 4b08          	push	#8
2679  0b57 ae500f        	ldw	x,#20495
2680  0b5a cd0000        	call	_GPIO_WriteHigh
2682  0b5d 84            	pop	a
2685  0b5e 4b02          	push	#2
2686  0b60 ae500f        	ldw	x,#20495
2687  0b63 cd0000        	call	_GPIO_WriteHigh
2689  0b66 84            	pop	a
2692  0b67 4b02          	push	#2
2693  0b69 ae5000        	ldw	x,#20480
2694  0b6c cd0000        	call	_GPIO_WriteHigh
2696  0b6f 84            	pop	a
2699  0b70 4b40          	push	#64
2700  0b72 ae500a        	ldw	x,#20490
2701  0b75 cd0000        	call	_GPIO_WriteHigh
2703  0b78 84            	pop	a
2706  0b79 4b04          	push	#4
2707  0b7b ae500f        	ldw	x,#20495
2708  0b7e cd0000        	call	_GPIO_WriteHigh
2710  0b81 84            	pop	a
2711                     ; 222     delay(2*DELAY_DISPLAY_TEST);
2714  0b82 ae01f4        	ldw	x,#500
2715  0b85 89            	pushw	x
2716  0b86 ae0000        	ldw	x,#0
2717  0b89 89            	pushw	x
2718  0b8a cd0000        	call	_delay
2720  0b8d 5b04          	addw	sp,#4
2721                     ; 223     display_off();
2723  0b8f 4b20          	push	#32
2724  0b91 ae500f        	ldw	x,#20495
2725  0b94 cd0000        	call	_GPIO_WriteLow
2727  0b97 84            	pop	a
2730  0b98 4b04          	push	#4
2731  0b9a ae5000        	ldw	x,#20480
2732  0b9d cd0000        	call	_GPIO_WriteLow
2734  0ba0 84            	pop	a
2737  0ba1 4b80          	push	#128
2738  0ba3 ae500a        	ldw	x,#20490
2739  0ba6 cd0000        	call	_GPIO_WriteLow
2741  0ba9 84            	pop	a
2744  0baa 4b08          	push	#8
2745  0bac ae500f        	ldw	x,#20495
2746  0baf cd0000        	call	_GPIO_WriteLow
2748  0bb2 84            	pop	a
2751  0bb3 4b02          	push	#2
2752  0bb5 ae500f        	ldw	x,#20495
2753  0bb8 cd0000        	call	_GPIO_WriteLow
2755  0bbb 84            	pop	a
2758  0bbc 4b02          	push	#2
2759  0bbe ae5000        	ldw	x,#20480
2760  0bc1 cd0000        	call	_GPIO_WriteLow
2762  0bc4 84            	pop	a
2765  0bc5 4b40          	push	#64
2766  0bc7 ae500a        	ldw	x,#20490
2767  0bca cd0000        	call	_GPIO_WriteLow
2769  0bcd 84            	pop	a
2772  0bce 4b04          	push	#4
2773  0bd0 ae500f        	ldw	x,#20495
2774  0bd3 cd0000        	call	_GPIO_WriteLow
2776  0bd6 84            	pop	a
2777                     ; 224     delay(DELAY_DISPLAY_TEST);
2780  0bd7 ae00fa        	ldw	x,#250
2781  0bda 89            	pushw	x
2782  0bdb ae0000        	ldw	x,#0
2783  0bde 89            	pushw	x
2784  0bdf cd0000        	call	_delay
2786  0be2 5b04          	addw	sp,#4
2787                     ; 225     display_all();
2789  0be4 4b20          	push	#32
2790  0be6 ae500f        	ldw	x,#20495
2791  0be9 cd0000        	call	_GPIO_WriteHigh
2793  0bec 84            	pop	a
2796  0bed 4b04          	push	#4
2797  0bef ae5000        	ldw	x,#20480
2798  0bf2 cd0000        	call	_GPIO_WriteHigh
2800  0bf5 84            	pop	a
2803  0bf6 4b80          	push	#128
2804  0bf8 ae500a        	ldw	x,#20490
2805  0bfb cd0000        	call	_GPIO_WriteHigh
2807  0bfe 84            	pop	a
2810  0bff 4b08          	push	#8
2811  0c01 ae500f        	ldw	x,#20495
2812  0c04 cd0000        	call	_GPIO_WriteHigh
2814  0c07 84            	pop	a
2817  0c08 4b02          	push	#2
2818  0c0a ae500f        	ldw	x,#20495
2819  0c0d cd0000        	call	_GPIO_WriteHigh
2821  0c10 84            	pop	a
2824  0c11 4b02          	push	#2
2825  0c13 ae5000        	ldw	x,#20480
2826  0c16 cd0000        	call	_GPIO_WriteHigh
2828  0c19 84            	pop	a
2831  0c1a 4b40          	push	#64
2832  0c1c ae500a        	ldw	x,#20490
2833  0c1f cd0000        	call	_GPIO_WriteHigh
2835  0c22 84            	pop	a
2838  0c23 4b04          	push	#4
2839  0c25 ae500f        	ldw	x,#20495
2840  0c28 cd0000        	call	_GPIO_WriteHigh
2842  0c2b 84            	pop	a
2843                     ; 226     delay(2*DELAY_DISPLAY_TEST);
2846  0c2c ae01f4        	ldw	x,#500
2847  0c2f 89            	pushw	x
2848  0c30 ae0000        	ldw	x,#0
2849  0c33 89            	pushw	x
2850  0c34 cd0000        	call	_delay
2852  0c37 5b04          	addw	sp,#4
2853                     ; 227     display_off();
2855  0c39 4b20          	push	#32
2856  0c3b ae500f        	ldw	x,#20495
2857  0c3e cd0000        	call	_GPIO_WriteLow
2859  0c41 84            	pop	a
2862  0c42 4b04          	push	#4
2863  0c44 ae5000        	ldw	x,#20480
2864  0c47 cd0000        	call	_GPIO_WriteLow
2866  0c4a 84            	pop	a
2869  0c4b 4b80          	push	#128
2870  0c4d ae500a        	ldw	x,#20490
2871  0c50 cd0000        	call	_GPIO_WriteLow
2873  0c53 84            	pop	a
2876  0c54 4b08          	push	#8
2877  0c56 ae500f        	ldw	x,#20495
2878  0c59 cd0000        	call	_GPIO_WriteLow
2880  0c5c 84            	pop	a
2883  0c5d 4b02          	push	#2
2884  0c5f ae500f        	ldw	x,#20495
2885  0c62 cd0000        	call	_GPIO_WriteLow
2887  0c65 84            	pop	a
2890  0c66 4b02          	push	#2
2891  0c68 ae5000        	ldw	x,#20480
2892  0c6b cd0000        	call	_GPIO_WriteLow
2894  0c6e 84            	pop	a
2897  0c6f 4b40          	push	#64
2898  0c71 ae500a        	ldw	x,#20490
2899  0c74 cd0000        	call	_GPIO_WriteLow
2901  0c77 84            	pop	a
2904  0c78 4b04          	push	#4
2905  0c7a ae500f        	ldw	x,#20495
2906  0c7d cd0000        	call	_GPIO_WriteLow
2908  0c80 84            	pop	a
2909                     ; 229     display_test = 0;
2912  0c81 3f00          	clr	_display_test
2913                     ; 232     dig1_off();
2915  0c83 4b10          	push	#16
2916  0c85 ae500f        	ldw	x,#20495
2917  0c88 cd0000        	call	_GPIO_WriteHigh
2919  0c8b 84            	pop	a
2920                     ; 233     dig2_off();
2922  0c8c 4b20          	push	#32
2923  0c8e ae5005        	ldw	x,#20485
2924  0c91 cd0000        	call	_GPIO_WriteHigh
2926  0c94 84            	pop	a
2927                     ; 234     dig3_off();
2929  0c95 4b10          	push	#16
2930  0c97 ae5005        	ldw	x,#20485
2931  0c9a cd0000        	call	_GPIO_WriteHigh
2933  0c9d 84            	pop	a
2934                     ; 237 }
2937  0c9e 81            	ret
2981                     	xdef	_test_display
2982                     	xdef	_wr_digit
2983                     	xdef	_dec2bcd
2984                     	xdef	_dp
2985                     	xdef	_display_num
2986                     	xdef	_display_test
2987                     	xref	_delay
2988                     	xdef	_set_display_option
2989                     	xdef	_set_display_value
2990                     	xdef	_tmr_display
2991                     	xdef	_init_display
2992                     	xref	_GPIO_WriteLow
2993                     	xref	_GPIO_WriteHigh
2994                     	xref	_GPIO_Init
3013                     	end
