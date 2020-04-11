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
 234                     ; 40 void set_display_option(uint8_t option, uint8_t _dp)
 234                     ; 41 {
 235                     	switch	.text
 236  0038               _set_display_option:
 240                     ; 43     display_num[DIG1_POS] = option;
 242  0038 9e            	ld	a,xh
 243  0039 b701          	ld	_display_num,a
 244                     ; 44     dp[DIG1_POS] = _dp;
 246  003b 9f            	ld	a,xl
 247  003c b704          	ld	_dp,a
 248                     ; 46 }
 251  003e 81            	ret
 289                     .const:	section	.text
 290  0000               L61:
 291  0000 00b4          	dc.w	L77
 292  0002 00f7          	dc.w	L101
 293  0004 013a          	dc.w	L301
 294  0006 017d          	dc.w	L501
 295  0008 01c0          	dc.w	L701
 296  000a 0203          	dc.w	L111
 297  000c 0246          	dc.w	L311
 298  000e 0289          	dc.w	L511
 299  0010 02cc          	dc.w	L711
 300  0012 030f          	dc.w	L121
 301                     ; 48 void wr_digit(uint8_t dig_pos)
 301                     ; 49 {
 302                     	switch	.text
 303  003f               _wr_digit:
 305  003f 88            	push	a
 306       00000000      OFST:	set	0
 309                     ; 52     if (dp[dig_pos]) {
 311  0040 5f            	clrw	x
 312  0041 97            	ld	xl,a
 313  0042 6d04          	tnz	(_dp,x)
 314  0044 270b          	jreq	L561
 315                     ; 53         dp_on();
 317  0046 4b04          	push	#4
 318  0048 ae500f        	ldw	x,#20495
 319  004b cd0000        	call	_GPIO_WriteHigh
 321  004e 84            	pop	a
 323  004f 2009          	jra	L761
 324  0051               L561:
 325                     ; 55         dp_off();
 327  0051 4b04          	push	#4
 328  0053 ae500f        	ldw	x,#20495
 329  0056 cd0000        	call	_GPIO_WriteLow
 331  0059 84            	pop	a
 332  005a               L761:
 333                     ; 58     switch (display_num[dig_pos]) {
 335  005a 7b01          	ld	a,(OFST+1,sp)
 336  005c 5f            	clrw	x
 337  005d 97            	ld	xl,a
 338  005e e601          	ld	a,(_display_num,x)
 340                     ; 118         break;
 341  0060 a10a          	cp	a,#10
 342  0062 2407          	jruge	L41
 343  0064 5f            	clrw	x
 344  0065 97            	ld	xl,a
 345  0066 58            	sllw	x
 346  0067 de0000        	ldw	x,(L61,x)
 347  006a fc            	jp	(x)
 348  006b               L41:
 349  006b a041          	sub	a,#65
 350  006d 2603          	jrne	L02
 351  006f cc0352        	jp	L321
 352  0072               L02:
 353  0072 a002          	sub	a,#2
 354  0074 2603          	jrne	L22
 355  0076 cc03d8        	jp	L721
 356  0079               L22:
 357  0079 a002          	sub	a,#2
 358  007b 2603          	jrne	L42
 359  007d cc045e        	jp	L331
 360  0080               L42:
 361  0080 4a            	dec	a
 362  0081 2603          	jrne	L62
 363  0083 cc04a1        	jp	L531
 364  0086               L62:
 365  0086 a002          	sub	a,#2
 366  0088 2603          	jrne	L03
 367  008a cc04e4        	jp	L731
 368  008d               L03:
 369  008d a004          	sub	a,#4
 370  008f 2603          	jrne	L23
 371  0091 cc0527        	jp	L141
 372  0094               L23:
 373  0094 a004          	sub	a,#4
 374  0096 2603          	jrne	L43
 375  0098 cc0569        	jp	L341
 376  009b               L43:
 377  009b a005          	sub	a,#5
 378  009d 2603          	jrne	L63
 379  009f cc05aa        	jp	L541
 380  00a2               L63:
 381  00a2 a00d          	sub	a,#13
 382  00a4 2603          	jrne	L04
 383  00a6 cc0395        	jp	L521
 384  00a9               L04:
 385  00a9 a002          	sub	a,#2
 386  00ab 2603          	jrne	L24
 387  00ad cc041b        	jp	L131
 388  00b0               L24:
 389  00b0 ace905e9      	jpf	L371
 390  00b4               L77:
 391                     ; 59     case 0x00:
 391                     ; 60         display_zero();
 393  00b4 4b20          	push	#32
 394  00b6 ae500f        	ldw	x,#20495
 395  00b9 cd0000        	call	_GPIO_WriteHigh
 397  00bc 84            	pop	a
 400  00bd 4b04          	push	#4
 401  00bf ae5000        	ldw	x,#20480
 402  00c2 cd0000        	call	_GPIO_WriteHigh
 404  00c5 84            	pop	a
 407  00c6 4b80          	push	#128
 408  00c8 ae500a        	ldw	x,#20490
 409  00cb cd0000        	call	_GPIO_WriteHigh
 411  00ce 84            	pop	a
 414  00cf 4b08          	push	#8
 415  00d1 ae500f        	ldw	x,#20495
 416  00d4 cd0000        	call	_GPIO_WriteHigh
 418  00d7 84            	pop	a
 421  00d8 4b02          	push	#2
 422  00da ae500f        	ldw	x,#20495
 423  00dd cd0000        	call	_GPIO_WriteHigh
 425  00e0 84            	pop	a
 428  00e1 4b02          	push	#2
 429  00e3 ae5000        	ldw	x,#20480
 430  00e6 cd0000        	call	_GPIO_WriteHigh
 432  00e9 84            	pop	a
 435  00ea 4b40          	push	#64
 436  00ec ae500a        	ldw	x,#20490
 437  00ef cd0000        	call	_GPIO_WriteLow
 439  00f2 84            	pop	a
 440                     ; 61         break;
 442  00f3 ace905e9      	jpf	L371
 443  00f7               L101:
 444                     ; 62     case 0x01:
 444                     ; 63         display_one();
 446  00f7 4b20          	push	#32
 447  00f9 ae500f        	ldw	x,#20495
 448  00fc cd0000        	call	_GPIO_WriteLow
 450  00ff 84            	pop	a
 453  0100 4b04          	push	#4
 454  0102 ae5000        	ldw	x,#20480
 455  0105 cd0000        	call	_GPIO_WriteHigh
 457  0108 84            	pop	a
 460  0109 4b80          	push	#128
 461  010b ae500a        	ldw	x,#20490
 462  010e cd0000        	call	_GPIO_WriteHigh
 464  0111 84            	pop	a
 467  0112 4b08          	push	#8
 468  0114 ae500f        	ldw	x,#20495
 469  0117 cd0000        	call	_GPIO_WriteLow
 471  011a 84            	pop	a
 474  011b 4b02          	push	#2
 475  011d ae500f        	ldw	x,#20495
 476  0120 cd0000        	call	_GPIO_WriteLow
 478  0123 84            	pop	a
 481  0124 4b02          	push	#2
 482  0126 ae5000        	ldw	x,#20480
 483  0129 cd0000        	call	_GPIO_WriteLow
 485  012c 84            	pop	a
 488  012d 4b40          	push	#64
 489  012f ae500a        	ldw	x,#20490
 490  0132 cd0000        	call	_GPIO_WriteLow
 492  0135 84            	pop	a
 493                     ; 64         break;
 495  0136 ace905e9      	jpf	L371
 496  013a               L301:
 497                     ; 65     case 0x02:
 497                     ; 66         display_two();
 499  013a 4b20          	push	#32
 500  013c ae500f        	ldw	x,#20495
 501  013f cd0000        	call	_GPIO_WriteHigh
 503  0142 84            	pop	a
 506  0143 4b04          	push	#4
 507  0145 ae5000        	ldw	x,#20480
 508  0148 cd0000        	call	_GPIO_WriteHigh
 510  014b 84            	pop	a
 513  014c 4b80          	push	#128
 514  014e ae500a        	ldw	x,#20490
 515  0151 cd0000        	call	_GPIO_WriteLow
 517  0154 84            	pop	a
 520  0155 4b08          	push	#8
 521  0157 ae500f        	ldw	x,#20495
 522  015a cd0000        	call	_GPIO_WriteHigh
 524  015d 84            	pop	a
 527  015e 4b02          	push	#2
 528  0160 ae500f        	ldw	x,#20495
 529  0163 cd0000        	call	_GPIO_WriteHigh
 531  0166 84            	pop	a
 534  0167 4b02          	push	#2
 535  0169 ae5000        	ldw	x,#20480
 536  016c cd0000        	call	_GPIO_WriteLow
 538  016f 84            	pop	a
 541  0170 4b40          	push	#64
 542  0172 ae500a        	ldw	x,#20490
 543  0175 cd0000        	call	_GPIO_WriteHigh
 545  0178 84            	pop	a
 546                     ; 67         break;
 548  0179 ace905e9      	jpf	L371
 549  017d               L501:
 550                     ; 68     case 0x03:
 550                     ; 69         display_three();
 552  017d 4b20          	push	#32
 553  017f ae500f        	ldw	x,#20495
 554  0182 cd0000        	call	_GPIO_WriteHigh
 556  0185 84            	pop	a
 559  0186 4b04          	push	#4
 560  0188 ae5000        	ldw	x,#20480
 561  018b cd0000        	call	_GPIO_WriteHigh
 563  018e 84            	pop	a
 566  018f 4b80          	push	#128
 567  0191 ae500a        	ldw	x,#20490
 568  0194 cd0000        	call	_GPIO_WriteHigh
 570  0197 84            	pop	a
 573  0198 4b08          	push	#8
 574  019a ae500f        	ldw	x,#20495
 575  019d cd0000        	call	_GPIO_WriteHigh
 577  01a0 84            	pop	a
 580  01a1 4b02          	push	#2
 581  01a3 ae500f        	ldw	x,#20495
 582  01a6 cd0000        	call	_GPIO_WriteLow
 584  01a9 84            	pop	a
 587  01aa 4b02          	push	#2
 588  01ac ae5000        	ldw	x,#20480
 589  01af cd0000        	call	_GPIO_WriteLow
 591  01b2 84            	pop	a
 594  01b3 4b40          	push	#64
 595  01b5 ae500a        	ldw	x,#20490
 596  01b8 cd0000        	call	_GPIO_WriteHigh
 598  01bb 84            	pop	a
 599                     ; 70         break;
 601  01bc ace905e9      	jpf	L371
 602  01c0               L701:
 603                     ; 71     case 0x04:
 603                     ; 72         display_four();
 605  01c0 4b20          	push	#32
 606  01c2 ae500f        	ldw	x,#20495
 607  01c5 cd0000        	call	_GPIO_WriteLow
 609  01c8 84            	pop	a
 612  01c9 4b04          	push	#4
 613  01cb ae5000        	ldw	x,#20480
 614  01ce cd0000        	call	_GPIO_WriteHigh
 616  01d1 84            	pop	a
 619  01d2 4b80          	push	#128
 620  01d4 ae500a        	ldw	x,#20490
 621  01d7 cd0000        	call	_GPIO_WriteHigh
 623  01da 84            	pop	a
 626  01db 4b08          	push	#8
 627  01dd ae500f        	ldw	x,#20495
 628  01e0 cd0000        	call	_GPIO_WriteLow
 630  01e3 84            	pop	a
 633  01e4 4b02          	push	#2
 634  01e6 ae500f        	ldw	x,#20495
 635  01e9 cd0000        	call	_GPIO_WriteLow
 637  01ec 84            	pop	a
 640  01ed 4b02          	push	#2
 641  01ef ae5000        	ldw	x,#20480
 642  01f2 cd0000        	call	_GPIO_WriteHigh
 644  01f5 84            	pop	a
 647  01f6 4b40          	push	#64
 648  01f8 ae500a        	ldw	x,#20490
 649  01fb cd0000        	call	_GPIO_WriteHigh
 651  01fe 84            	pop	a
 652                     ; 73         break;
 654  01ff ace905e9      	jpf	L371
 655  0203               L111:
 656                     ; 74     case 0x05:
 656                     ; 75         display_five();
 658  0203 4b20          	push	#32
 659  0205 ae500f        	ldw	x,#20495
 660  0208 cd0000        	call	_GPIO_WriteHigh
 662  020b 84            	pop	a
 665  020c 4b04          	push	#4
 666  020e ae5000        	ldw	x,#20480
 667  0211 cd0000        	call	_GPIO_WriteLow
 669  0214 84            	pop	a
 672  0215 4b80          	push	#128
 673  0217 ae500a        	ldw	x,#20490
 674  021a cd0000        	call	_GPIO_WriteHigh
 676  021d 84            	pop	a
 679  021e 4b08          	push	#8
 680  0220 ae500f        	ldw	x,#20495
 681  0223 cd0000        	call	_GPIO_WriteHigh
 683  0226 84            	pop	a
 686  0227 4b02          	push	#2
 687  0229 ae500f        	ldw	x,#20495
 688  022c cd0000        	call	_GPIO_WriteLow
 690  022f 84            	pop	a
 693  0230 4b02          	push	#2
 694  0232 ae5000        	ldw	x,#20480
 695  0235 cd0000        	call	_GPIO_WriteHigh
 697  0238 84            	pop	a
 700  0239 4b40          	push	#64
 701  023b ae500a        	ldw	x,#20490
 702  023e cd0000        	call	_GPIO_WriteHigh
 704  0241 84            	pop	a
 705                     ; 76         break;
 707  0242 ace905e9      	jpf	L371
 708  0246               L311:
 709                     ; 77     case 0x06:
 709                     ; 78         display_six();
 711  0246 4b20          	push	#32
 712  0248 ae500f        	ldw	x,#20495
 713  024b cd0000        	call	_GPIO_WriteHigh
 715  024e 84            	pop	a
 718  024f 4b04          	push	#4
 719  0251 ae5000        	ldw	x,#20480
 720  0254 cd0000        	call	_GPIO_WriteLow
 722  0257 84            	pop	a
 725  0258 4b80          	push	#128
 726  025a ae500a        	ldw	x,#20490
 727  025d cd0000        	call	_GPIO_WriteHigh
 729  0260 84            	pop	a
 732  0261 4b08          	push	#8
 733  0263 ae500f        	ldw	x,#20495
 734  0266 cd0000        	call	_GPIO_WriteHigh
 736  0269 84            	pop	a
 739  026a 4b02          	push	#2
 740  026c ae500f        	ldw	x,#20495
 741  026f cd0000        	call	_GPIO_WriteHigh
 743  0272 84            	pop	a
 746  0273 4b02          	push	#2
 747  0275 ae5000        	ldw	x,#20480
 748  0278 cd0000        	call	_GPIO_WriteHigh
 750  027b 84            	pop	a
 753  027c 4b40          	push	#64
 754  027e ae500a        	ldw	x,#20490
 755  0281 cd0000        	call	_GPIO_WriteHigh
 757  0284 84            	pop	a
 758                     ; 79         break;
 760  0285 ace905e9      	jpf	L371
 761  0289               L511:
 762                     ; 80     case 0x07:
 762                     ; 81         display_seven();
 764  0289 4b20          	push	#32
 765  028b ae500f        	ldw	x,#20495
 766  028e cd0000        	call	_GPIO_WriteHigh
 768  0291 84            	pop	a
 771  0292 4b04          	push	#4
 772  0294 ae5000        	ldw	x,#20480
 773  0297 cd0000        	call	_GPIO_WriteHigh
 775  029a 84            	pop	a
 778  029b 4b80          	push	#128
 779  029d ae500a        	ldw	x,#20490
 780  02a0 cd0000        	call	_GPIO_WriteHigh
 782  02a3 84            	pop	a
 785  02a4 4b08          	push	#8
 786  02a6 ae500f        	ldw	x,#20495
 787  02a9 cd0000        	call	_GPIO_WriteLow
 789  02ac 84            	pop	a
 792  02ad 4b02          	push	#2
 793  02af ae500f        	ldw	x,#20495
 794  02b2 cd0000        	call	_GPIO_WriteLow
 796  02b5 84            	pop	a
 799  02b6 4b02          	push	#2
 800  02b8 ae5000        	ldw	x,#20480
 801  02bb cd0000        	call	_GPIO_WriteLow
 803  02be 84            	pop	a
 806  02bf 4b40          	push	#64
 807  02c1 ae500a        	ldw	x,#20490
 808  02c4 cd0000        	call	_GPIO_WriteLow
 810  02c7 84            	pop	a
 811                     ; 82         break;
 813  02c8 ace905e9      	jpf	L371
 814  02cc               L711:
 815                     ; 83     case 0x08:
 815                     ; 84         display_eight();
 817  02cc 4b20          	push	#32
 818  02ce ae500f        	ldw	x,#20495
 819  02d1 cd0000        	call	_GPIO_WriteHigh
 821  02d4 84            	pop	a
 824  02d5 4b04          	push	#4
 825  02d7 ae5000        	ldw	x,#20480
 826  02da cd0000        	call	_GPIO_WriteHigh
 828  02dd 84            	pop	a
 831  02de 4b80          	push	#128
 832  02e0 ae500a        	ldw	x,#20490
 833  02e3 cd0000        	call	_GPIO_WriteHigh
 835  02e6 84            	pop	a
 838  02e7 4b08          	push	#8
 839  02e9 ae500f        	ldw	x,#20495
 840  02ec cd0000        	call	_GPIO_WriteHigh
 842  02ef 84            	pop	a
 845  02f0 4b02          	push	#2
 846  02f2 ae500f        	ldw	x,#20495
 847  02f5 cd0000        	call	_GPIO_WriteHigh
 849  02f8 84            	pop	a
 852  02f9 4b02          	push	#2
 853  02fb ae5000        	ldw	x,#20480
 854  02fe cd0000        	call	_GPIO_WriteHigh
 856  0301 84            	pop	a
 859  0302 4b40          	push	#64
 860  0304 ae500a        	ldw	x,#20490
 861  0307 cd0000        	call	_GPIO_WriteHigh
 863  030a 84            	pop	a
 864                     ; 85         break;
 866  030b ace905e9      	jpf	L371
 867  030f               L121:
 868                     ; 86     case 0x09:
 868                     ; 87         display_nine();
 870  030f 4b20          	push	#32
 871  0311 ae500f        	ldw	x,#20495
 872  0314 cd0000        	call	_GPIO_WriteHigh
 874  0317 84            	pop	a
 877  0318 4b04          	push	#4
 878  031a ae5000        	ldw	x,#20480
 879  031d cd0000        	call	_GPIO_WriteHigh
 881  0320 84            	pop	a
 884  0321 4b80          	push	#128
 885  0323 ae500a        	ldw	x,#20490
 886  0326 cd0000        	call	_GPIO_WriteHigh
 888  0329 84            	pop	a
 891  032a 4b08          	push	#8
 892  032c ae500f        	ldw	x,#20495
 893  032f cd0000        	call	_GPIO_WriteHigh
 895  0332 84            	pop	a
 898  0333 4b02          	push	#2
 899  0335 ae500f        	ldw	x,#20495
 900  0338 cd0000        	call	_GPIO_WriteLow
 902  033b 84            	pop	a
 905  033c 4b02          	push	#2
 906  033e ae5000        	ldw	x,#20480
 907  0341 cd0000        	call	_GPIO_WriteHigh
 909  0344 84            	pop	a
 912  0345 4b40          	push	#64
 913  0347 ae500a        	ldw	x,#20490
 914  034a cd0000        	call	_GPIO_WriteHigh
 916  034d 84            	pop	a
 917                     ; 88         break;
 919  034e ace905e9      	jpf	L371
 920  0352               L321:
 921                     ; 89     case 'A':
 921                     ; 90         display_a();
 923  0352 4b20          	push	#32
 924  0354 ae500f        	ldw	x,#20495
 925  0357 cd0000        	call	_GPIO_WriteHigh
 927  035a 84            	pop	a
 930  035b 4b04          	push	#4
 931  035d ae5000        	ldw	x,#20480
 932  0360 cd0000        	call	_GPIO_WriteHigh
 934  0363 84            	pop	a
 937  0364 4b80          	push	#128
 938  0366 ae500a        	ldw	x,#20490
 939  0369 cd0000        	call	_GPIO_WriteHigh
 941  036c 84            	pop	a
 944  036d 4b08          	push	#8
 945  036f ae500f        	ldw	x,#20495
 946  0372 cd0000        	call	_GPIO_WriteLow
 948  0375 84            	pop	a
 951  0376 4b02          	push	#2
 952  0378 ae500f        	ldw	x,#20495
 953  037b cd0000        	call	_GPIO_WriteHigh
 955  037e 84            	pop	a
 958  037f 4b02          	push	#2
 959  0381 ae5000        	ldw	x,#20480
 960  0384 cd0000        	call	_GPIO_WriteHigh
 962  0387 84            	pop	a
 965  0388 4b40          	push	#64
 966  038a ae500a        	ldw	x,#20490
 967  038d cd0000        	call	_GPIO_WriteHigh
 969  0390 84            	pop	a
 970                     ; 91         break;
 972  0391 ace905e9      	jpf	L371
 973  0395               L521:
 974                     ; 92     case 'b':
 974                     ; 93         display_b();
 976  0395 4b20          	push	#32
 977  0397 ae500f        	ldw	x,#20495
 978  039a cd0000        	call	_GPIO_WriteLow
 980  039d 84            	pop	a
 983  039e 4b04          	push	#4
 984  03a0 ae5000        	ldw	x,#20480
 985  03a3 cd0000        	call	_GPIO_WriteLow
 987  03a6 84            	pop	a
 990  03a7 4b80          	push	#128
 991  03a9 ae500a        	ldw	x,#20490
 992  03ac cd0000        	call	_GPIO_WriteHigh
 994  03af 84            	pop	a
 997  03b0 4b08          	push	#8
 998  03b2 ae500f        	ldw	x,#20495
 999  03b5 cd0000        	call	_GPIO_WriteHigh
1001  03b8 84            	pop	a
1004  03b9 4b02          	push	#2
1005  03bb ae500f        	ldw	x,#20495
1006  03be cd0000        	call	_GPIO_WriteHigh
1008  03c1 84            	pop	a
1011  03c2 4b02          	push	#2
1012  03c4 ae5000        	ldw	x,#20480
1013  03c7 cd0000        	call	_GPIO_WriteHigh
1015  03ca 84            	pop	a
1018  03cb 4b40          	push	#64
1019  03cd ae500a        	ldw	x,#20490
1020  03d0 cd0000        	call	_GPIO_WriteHigh
1022  03d3 84            	pop	a
1023                     ; 94         break;
1025  03d4 ace905e9      	jpf	L371
1026  03d8               L721:
1027                     ; 95     case 'C':
1027                     ; 96         display_c();
1029  03d8 4b20          	push	#32
1030  03da ae500f        	ldw	x,#20495
1031  03dd cd0000        	call	_GPIO_WriteHigh
1033  03e0 84            	pop	a
1036  03e1 4b04          	push	#4
1037  03e3 ae5000        	ldw	x,#20480
1038  03e6 cd0000        	call	_GPIO_WriteLow
1040  03e9 84            	pop	a
1043  03ea 4b80          	push	#128
1044  03ec ae500a        	ldw	x,#20490
1045  03ef cd0000        	call	_GPIO_WriteLow
1047  03f2 84            	pop	a
1050  03f3 4b08          	push	#8
1051  03f5 ae500f        	ldw	x,#20495
1052  03f8 cd0000        	call	_GPIO_WriteHigh
1054  03fb 84            	pop	a
1057  03fc 4b02          	push	#2
1058  03fe ae500f        	ldw	x,#20495
1059  0401 cd0000        	call	_GPIO_WriteHigh
1061  0404 84            	pop	a
1064  0405 4b02          	push	#2
1065  0407 ae5000        	ldw	x,#20480
1066  040a cd0000        	call	_GPIO_WriteHigh
1068  040d 84            	pop	a
1071  040e 4b40          	push	#64
1072  0410 ae500a        	ldw	x,#20490
1073  0413 cd0000        	call	_GPIO_WriteLow
1075  0416 84            	pop	a
1076                     ; 97         break;
1078  0417 ace905e9      	jpf	L371
1079  041b               L131:
1080                     ; 98     case 'd':
1080                     ; 99         display_d();
1082  041b 4b20          	push	#32
1083  041d ae500f        	ldw	x,#20495
1084  0420 cd0000        	call	_GPIO_WriteLow
1086  0423 84            	pop	a
1089  0424 4b04          	push	#4
1090  0426 ae5000        	ldw	x,#20480
1091  0429 cd0000        	call	_GPIO_WriteHigh
1093  042c 84            	pop	a
1096  042d 4b80          	push	#128
1097  042f ae500a        	ldw	x,#20490
1098  0432 cd0000        	call	_GPIO_WriteHigh
1100  0435 84            	pop	a
1103  0436 4b08          	push	#8
1104  0438 ae500f        	ldw	x,#20495
1105  043b cd0000        	call	_GPIO_WriteHigh
1107  043e 84            	pop	a
1110  043f 4b02          	push	#2
1111  0441 ae500f        	ldw	x,#20495
1112  0444 cd0000        	call	_GPIO_WriteHigh
1114  0447 84            	pop	a
1117  0448 4b02          	push	#2
1118  044a ae5000        	ldw	x,#20480
1119  044d cd0000        	call	_GPIO_WriteLow
1121  0450 84            	pop	a
1124  0451 4b40          	push	#64
1125  0453 ae500a        	ldw	x,#20490
1126  0456 cd0000        	call	_GPIO_WriteHigh
1128  0459 84            	pop	a
1129                     ; 100         break;
1131  045a ace905e9      	jpf	L371
1132  045e               L331:
1133                     ; 101     case 'E':
1133                     ; 102         display_e();
1135  045e 4b20          	push	#32
1136  0460 ae500f        	ldw	x,#20495
1137  0463 cd0000        	call	_GPIO_WriteHigh
1139  0466 84            	pop	a
1142  0467 4b04          	push	#4
1143  0469 ae5000        	ldw	x,#20480
1144  046c cd0000        	call	_GPIO_WriteLow
1146  046f 84            	pop	a
1149  0470 4b80          	push	#128
1150  0472 ae500a        	ldw	x,#20490
1151  0475 cd0000        	call	_GPIO_WriteLow
1153  0478 84            	pop	a
1156  0479 4b08          	push	#8
1157  047b ae500f        	ldw	x,#20495
1158  047e cd0000        	call	_GPIO_WriteHigh
1160  0481 84            	pop	a
1163  0482 4b02          	push	#2
1164  0484 ae500f        	ldw	x,#20495
1165  0487 cd0000        	call	_GPIO_WriteHigh
1167  048a 84            	pop	a
1170  048b 4b02          	push	#2
1171  048d ae5000        	ldw	x,#20480
1172  0490 cd0000        	call	_GPIO_WriteHigh
1174  0493 84            	pop	a
1177  0494 4b40          	push	#64
1178  0496 ae500a        	ldw	x,#20490
1179  0499 cd0000        	call	_GPIO_WriteHigh
1181  049c 84            	pop	a
1182                     ; 103         break;
1184  049d ace905e9      	jpf	L371
1185  04a1               L531:
1186                     ; 104     case 'F':
1186                     ; 105         display_f();
1188  04a1 4b20          	push	#32
1189  04a3 ae500f        	ldw	x,#20495
1190  04a6 cd0000        	call	_GPIO_WriteHigh
1192  04a9 84            	pop	a
1195  04aa 4b04          	push	#4
1196  04ac ae5000        	ldw	x,#20480
1197  04af cd0000        	call	_GPIO_WriteLow
1199  04b2 84            	pop	a
1202  04b3 4b80          	push	#128
1203  04b5 ae500a        	ldw	x,#20490
1204  04b8 cd0000        	call	_GPIO_WriteLow
1206  04bb 84            	pop	a
1209  04bc 4b08          	push	#8
1210  04be ae500f        	ldw	x,#20495
1211  04c1 cd0000        	call	_GPIO_WriteLow
1213  04c4 84            	pop	a
1216  04c5 4b02          	push	#2
1217  04c7 ae500f        	ldw	x,#20495
1218  04ca cd0000        	call	_GPIO_WriteHigh
1220  04cd 84            	pop	a
1223  04ce 4b02          	push	#2
1224  04d0 ae5000        	ldw	x,#20480
1225  04d3 cd0000        	call	_GPIO_WriteHigh
1227  04d6 84            	pop	a
1230  04d7 4b40          	push	#64
1231  04d9 ae500a        	ldw	x,#20490
1232  04dc cd0000        	call	_GPIO_WriteHigh
1234  04df 84            	pop	a
1235                     ; 106         break;
1237  04e0 ace905e9      	jpf	L371
1238  04e4               L731:
1239                     ; 107     case 'H':
1239                     ; 108         display_h();
1241  04e4 4b20          	push	#32
1242  04e6 ae500f        	ldw	x,#20495
1243  04e9 cd0000        	call	_GPIO_WriteLow
1245  04ec 84            	pop	a
1248  04ed 4b04          	push	#4
1249  04ef ae5000        	ldw	x,#20480
1250  04f2 cd0000        	call	_GPIO_WriteHigh
1252  04f5 84            	pop	a
1255  04f6 4b80          	push	#128
1256  04f8 ae500a        	ldw	x,#20490
1257  04fb cd0000        	call	_GPIO_WriteHigh
1259  04fe 84            	pop	a
1262  04ff 4b08          	push	#8
1263  0501 ae500f        	ldw	x,#20495
1264  0504 cd0000        	call	_GPIO_WriteLow
1266  0507 84            	pop	a
1269  0508 4b02          	push	#2
1270  050a ae500f        	ldw	x,#20495
1271  050d cd0000        	call	_GPIO_WriteHigh
1273  0510 84            	pop	a
1276  0511 4b02          	push	#2
1277  0513 ae5000        	ldw	x,#20480
1278  0516 cd0000        	call	_GPIO_WriteHigh
1280  0519 84            	pop	a
1283  051a 4b40          	push	#64
1284  051c ae500a        	ldw	x,#20490
1285  051f cd0000        	call	_GPIO_WriteHigh
1287  0522 84            	pop	a
1288                     ; 109         break;
1290  0523 ace905e9      	jpf	L371
1291  0527               L141:
1292                     ; 110     case 'L':
1292                     ; 111         display_l();
1294  0527 4b20          	push	#32
1295  0529 ae500f        	ldw	x,#20495
1296  052c cd0000        	call	_GPIO_WriteLow
1298  052f 84            	pop	a
1301  0530 4b04          	push	#4
1302  0532 ae5000        	ldw	x,#20480
1303  0535 cd0000        	call	_GPIO_WriteLow
1305  0538 84            	pop	a
1308  0539 4b80          	push	#128
1309  053b ae500a        	ldw	x,#20490
1310  053e cd0000        	call	_GPIO_WriteLow
1312  0541 84            	pop	a
1315  0542 4b08          	push	#8
1316  0544 ae500f        	ldw	x,#20495
1317  0547 cd0000        	call	_GPIO_WriteHigh
1319  054a 84            	pop	a
1322  054b 4b02          	push	#2
1323  054d ae500f        	ldw	x,#20495
1324  0550 cd0000        	call	_GPIO_WriteHigh
1326  0553 84            	pop	a
1329  0554 4b02          	push	#2
1330  0556 ae5000        	ldw	x,#20480
1331  0559 cd0000        	call	_GPIO_WriteHigh
1333  055c 84            	pop	a
1336  055d 4b40          	push	#64
1337  055f ae500a        	ldw	x,#20490
1338  0562 cd0000        	call	_GPIO_WriteLow
1340  0565 84            	pop	a
1341                     ; 112         break;
1343  0566 cc05e9        	jra	L371
1344  0569               L341:
1345                     ; 113     case 'P':
1345                     ; 114         display_p();
1347  0569 4b20          	push	#32
1348  056b ae500f        	ldw	x,#20495
1349  056e cd0000        	call	_GPIO_WriteHigh
1351  0571 84            	pop	a
1354  0572 4b04          	push	#4
1355  0574 ae5000        	ldw	x,#20480
1356  0577 cd0000        	call	_GPIO_WriteHigh
1358  057a 84            	pop	a
1361  057b 4b80          	push	#128
1362  057d ae500a        	ldw	x,#20490
1363  0580 cd0000        	call	_GPIO_WriteLow
1365  0583 84            	pop	a
1368  0584 4b08          	push	#8
1369  0586 ae500f        	ldw	x,#20495
1370  0589 cd0000        	call	_GPIO_WriteLow
1372  058c 84            	pop	a
1375  058d 4b02          	push	#2
1376  058f ae500f        	ldw	x,#20495
1377  0592 cd0000        	call	_GPIO_WriteHigh
1379  0595 84            	pop	a
1382  0596 4b02          	push	#2
1383  0598 ae5000        	ldw	x,#20480
1384  059b cd0000        	call	_GPIO_WriteHigh
1386  059e 84            	pop	a
1389  059f 4b40          	push	#64
1390  05a1 ae500a        	ldw	x,#20490
1391  05a4 cd0000        	call	_GPIO_WriteHigh
1393  05a7 84            	pop	a
1394                     ; 115         break;
1396  05a8 203f          	jra	L371
1397  05aa               L541:
1398                     ; 116     case 'U':
1398                     ; 117         display_u();
1400  05aa 4b20          	push	#32
1401  05ac ae500f        	ldw	x,#20495
1402  05af cd0000        	call	_GPIO_WriteLow
1404  05b2 84            	pop	a
1407  05b3 4b04          	push	#4
1408  05b5 ae5000        	ldw	x,#20480
1409  05b8 cd0000        	call	_GPIO_WriteHigh
1411  05bb 84            	pop	a
1414  05bc 4b80          	push	#128
1415  05be ae500a        	ldw	x,#20490
1416  05c1 cd0000        	call	_GPIO_WriteHigh
1418  05c4 84            	pop	a
1421  05c5 4b08          	push	#8
1422  05c7 ae500f        	ldw	x,#20495
1423  05ca cd0000        	call	_GPIO_WriteHigh
1425  05cd 84            	pop	a
1428  05ce 4b02          	push	#2
1429  05d0 ae500f        	ldw	x,#20495
1430  05d3 cd0000        	call	_GPIO_WriteHigh
1432  05d6 84            	pop	a
1435  05d7 4b02          	push	#2
1436  05d9 ae5000        	ldw	x,#20480
1437  05dc cd0000        	call	_GPIO_WriteHigh
1439  05df 84            	pop	a
1442  05e0 4b40          	push	#64
1443  05e2 ae500a        	ldw	x,#20490
1444  05e5 cd0000        	call	_GPIO_WriteLow
1446  05e8 84            	pop	a
1447                     ; 118         break;
1449  05e9               L371:
1450                     ; 121 }
1453  05e9 84            	pop	a
1454  05ea 81            	ret
1478                     ; 123 void task_display(void)
1478                     ; 124 {
1479                     	switch	.text
1480  05eb               _task_display:
1484                     ; 126     if (!tick)
1486  05eb 3d00          	tnz	_tick
1487  05ed 2601          	jrne	L502
1488                     ; 127         return;
1491  05ef 81            	ret
1492  05f0               L502:
1493                     ; 130 }
1496  05f0 81            	ret
1499                     	bsct
1500  0007               L702_dig_pos:
1501  0007 00            	dc.b	0
1537                     ; 132 void tmr_display(void)
1537                     ; 133 {
1538                     	switch	.text
1539  05f1               _tmr_display:
1543                     ; 138     if (display_test)
1545  05f1 3d00          	tnz	_display_test
1546  05f3 2701          	jreq	L532
1547                     ; 139         return;
1550  05f5 81            	ret
1551  05f6               L532:
1552                     ; 142     if (dig_pos >= MAX_DIG_POS)
1554  05f6 b607          	ld	a,L702_dig_pos
1555  05f8 a103          	cp	a,#3
1556  05fa 2502          	jrult	L732
1557                     ; 143         dig_pos = DIG1_POS;
1559  05fc 3f07          	clr	L702_dig_pos
1560  05fe               L732:
1561                     ; 145     switch (dig_pos) {
1563  05fe b607          	ld	a,L702_dig_pos
1565                     ; 160         break;
1566  0600 4d            	tnz	a
1567  0601 2708          	jreq	L112
1568  0603 4a            	dec	a
1569  0604 2722          	jreq	L312
1570  0606 4a            	dec	a
1571  0607 273c          	jreq	L512
1572  0609 2055          	jra	L342
1573  060b               L112:
1574                     ; 146     case DIG1_POS:
1574                     ; 147         dig1_on();
1576  060b 4b10          	push	#16
1577  060d ae500f        	ldw	x,#20495
1578  0610 cd0000        	call	_GPIO_WriteLow
1580  0613 84            	pop	a
1581                     ; 148         dig2_off();
1583  0614 4b20          	push	#32
1584  0616 ae5005        	ldw	x,#20485
1585  0619 cd0000        	call	_GPIO_WriteHigh
1587  061c 84            	pop	a
1588                     ; 149         dig3_off();
1590  061d 4b10          	push	#16
1591  061f ae5005        	ldw	x,#20485
1592  0622 cd0000        	call	_GPIO_WriteHigh
1594  0625 84            	pop	a
1595                     ; 150         break;
1597  0626 2038          	jra	L342
1598  0628               L312:
1599                     ; 151     case DIG2_POS:
1599                     ; 152         dig1_off();
1601  0628 4b10          	push	#16
1602  062a ae500f        	ldw	x,#20495
1603  062d cd0000        	call	_GPIO_WriteHigh
1605  0630 84            	pop	a
1606                     ; 153         dig2_on();
1608  0631 4b20          	push	#32
1609  0633 ae5005        	ldw	x,#20485
1610  0636 cd0000        	call	_GPIO_WriteLow
1612  0639 84            	pop	a
1613                     ; 154         dig3_off();
1615  063a 4b10          	push	#16
1616  063c ae5005        	ldw	x,#20485
1617  063f cd0000        	call	_GPIO_WriteHigh
1619  0642 84            	pop	a
1620                     ; 155         break;
1622  0643 201b          	jra	L342
1623  0645               L512:
1624                     ; 156     case DIG3_POS:
1624                     ; 157         dig1_off();
1626  0645 4b10          	push	#16
1627  0647 ae500f        	ldw	x,#20495
1628  064a cd0000        	call	_GPIO_WriteHigh
1630  064d 84            	pop	a
1631                     ; 158         dig2_off();
1633  064e 4b20          	push	#32
1634  0650 ae5005        	ldw	x,#20485
1635  0653 cd0000        	call	_GPIO_WriteHigh
1637  0656 84            	pop	a
1638                     ; 159         dig3_on();
1640  0657 4b10          	push	#16
1641  0659 ae5005        	ldw	x,#20485
1642  065c cd0000        	call	_GPIO_WriteLow
1644  065f 84            	pop	a
1645                     ; 160         break;
1647  0660               L342:
1648                     ; 163     wr_digit(dig_pos);
1650  0660 b607          	ld	a,L702_dig_pos
1651  0662 cd003f        	call	_wr_digit
1653                     ; 164     dig_pos++;
1655  0665 3c07          	inc	L702_dig_pos
1656                     ; 166 }
1659  0667 81            	ret
1685                     ; 169 void test_display(void)
1685                     ; 170 {
1686                     	switch	.text
1687  0668               _test_display:
1691                     ; 171     delay(DELAY_DISPLAY_TEST);
1693  0668 ae00fa        	ldw	x,#250
1694  066b 89            	pushw	x
1695  066c ae0000        	ldw	x,#0
1696  066f 89            	pushw	x
1697  0670 cd0000        	call	_delay
1699  0673 5b04          	addw	sp,#4
1700                     ; 172     display_zero();
1702  0675 4b20          	push	#32
1703  0677 ae500f        	ldw	x,#20495
1704  067a cd0000        	call	_GPIO_WriteHigh
1706  067d 84            	pop	a
1709  067e 4b04          	push	#4
1710  0680 ae5000        	ldw	x,#20480
1711  0683 cd0000        	call	_GPIO_WriteHigh
1713  0686 84            	pop	a
1716  0687 4b80          	push	#128
1717  0689 ae500a        	ldw	x,#20490
1718  068c cd0000        	call	_GPIO_WriteHigh
1720  068f 84            	pop	a
1723  0690 4b08          	push	#8
1724  0692 ae500f        	ldw	x,#20495
1725  0695 cd0000        	call	_GPIO_WriteHigh
1727  0698 84            	pop	a
1730  0699 4b02          	push	#2
1731  069b ae500f        	ldw	x,#20495
1732  069e cd0000        	call	_GPIO_WriteHigh
1734  06a1 84            	pop	a
1737  06a2 4b02          	push	#2
1738  06a4 ae5000        	ldw	x,#20480
1739  06a7 cd0000        	call	_GPIO_WriteHigh
1741  06aa 84            	pop	a
1744  06ab 4b40          	push	#64
1745  06ad ae500a        	ldw	x,#20490
1746  06b0 cd0000        	call	_GPIO_WriteLow
1748  06b3 84            	pop	a
1749                     ; 173     delay(DELAY_DISPLAY_TEST);
1751  06b4 ae00fa        	ldw	x,#250
1752  06b7 89            	pushw	x
1753  06b8 ae0000        	ldw	x,#0
1754  06bb 89            	pushw	x
1755  06bc cd0000        	call	_delay
1757  06bf 5b04          	addw	sp,#4
1758                     ; 174     display_one();
1760  06c1 4b20          	push	#32
1761  06c3 ae500f        	ldw	x,#20495
1762  06c6 cd0000        	call	_GPIO_WriteLow
1764  06c9 84            	pop	a
1767  06ca 4b04          	push	#4
1768  06cc ae5000        	ldw	x,#20480
1769  06cf cd0000        	call	_GPIO_WriteHigh
1771  06d2 84            	pop	a
1774  06d3 4b80          	push	#128
1775  06d5 ae500a        	ldw	x,#20490
1776  06d8 cd0000        	call	_GPIO_WriteHigh
1778  06db 84            	pop	a
1781  06dc 4b08          	push	#8
1782  06de ae500f        	ldw	x,#20495
1783  06e1 cd0000        	call	_GPIO_WriteLow
1785  06e4 84            	pop	a
1788  06e5 4b02          	push	#2
1789  06e7 ae500f        	ldw	x,#20495
1790  06ea cd0000        	call	_GPIO_WriteLow
1792  06ed 84            	pop	a
1795  06ee 4b02          	push	#2
1796  06f0 ae5000        	ldw	x,#20480
1797  06f3 cd0000        	call	_GPIO_WriteLow
1799  06f6 84            	pop	a
1802  06f7 4b40          	push	#64
1803  06f9 ae500a        	ldw	x,#20490
1804  06fc cd0000        	call	_GPIO_WriteLow
1806  06ff 84            	pop	a
1807                     ; 175     delay(DELAY_DISPLAY_TEST);
1809  0700 ae00fa        	ldw	x,#250
1810  0703 89            	pushw	x
1811  0704 ae0000        	ldw	x,#0
1812  0707 89            	pushw	x
1813  0708 cd0000        	call	_delay
1815  070b 5b04          	addw	sp,#4
1816                     ; 176     display_two();
1818  070d 4b20          	push	#32
1819  070f ae500f        	ldw	x,#20495
1820  0712 cd0000        	call	_GPIO_WriteHigh
1822  0715 84            	pop	a
1825  0716 4b04          	push	#4
1826  0718 ae5000        	ldw	x,#20480
1827  071b cd0000        	call	_GPIO_WriteHigh
1829  071e 84            	pop	a
1832  071f 4b80          	push	#128
1833  0721 ae500a        	ldw	x,#20490
1834  0724 cd0000        	call	_GPIO_WriteLow
1836  0727 84            	pop	a
1839  0728 4b08          	push	#8
1840  072a ae500f        	ldw	x,#20495
1841  072d cd0000        	call	_GPIO_WriteHigh
1843  0730 84            	pop	a
1846  0731 4b02          	push	#2
1847  0733 ae500f        	ldw	x,#20495
1848  0736 cd0000        	call	_GPIO_WriteHigh
1850  0739 84            	pop	a
1853  073a 4b02          	push	#2
1854  073c ae5000        	ldw	x,#20480
1855  073f cd0000        	call	_GPIO_WriteLow
1857  0742 84            	pop	a
1860  0743 4b40          	push	#64
1861  0745 ae500a        	ldw	x,#20490
1862  0748 cd0000        	call	_GPIO_WriteHigh
1864  074b 84            	pop	a
1865                     ; 177     delay(DELAY_DISPLAY_TEST);
1867  074c ae00fa        	ldw	x,#250
1868  074f 89            	pushw	x
1869  0750 ae0000        	ldw	x,#0
1870  0753 89            	pushw	x
1871  0754 cd0000        	call	_delay
1873  0757 5b04          	addw	sp,#4
1874                     ; 178     display_three();
1876  0759 4b20          	push	#32
1877  075b ae500f        	ldw	x,#20495
1878  075e cd0000        	call	_GPIO_WriteHigh
1880  0761 84            	pop	a
1883  0762 4b04          	push	#4
1884  0764 ae5000        	ldw	x,#20480
1885  0767 cd0000        	call	_GPIO_WriteHigh
1887  076a 84            	pop	a
1890  076b 4b80          	push	#128
1891  076d ae500a        	ldw	x,#20490
1892  0770 cd0000        	call	_GPIO_WriteHigh
1894  0773 84            	pop	a
1897  0774 4b08          	push	#8
1898  0776 ae500f        	ldw	x,#20495
1899  0779 cd0000        	call	_GPIO_WriteHigh
1901  077c 84            	pop	a
1904  077d 4b02          	push	#2
1905  077f ae500f        	ldw	x,#20495
1906  0782 cd0000        	call	_GPIO_WriteLow
1908  0785 84            	pop	a
1911  0786 4b02          	push	#2
1912  0788 ae5000        	ldw	x,#20480
1913  078b cd0000        	call	_GPIO_WriteLow
1915  078e 84            	pop	a
1918  078f 4b40          	push	#64
1919  0791 ae500a        	ldw	x,#20490
1920  0794 cd0000        	call	_GPIO_WriteHigh
1922  0797 84            	pop	a
1923                     ; 179     delay(DELAY_DISPLAY_TEST);
1925  0798 ae00fa        	ldw	x,#250
1926  079b 89            	pushw	x
1927  079c ae0000        	ldw	x,#0
1928  079f 89            	pushw	x
1929  07a0 cd0000        	call	_delay
1931  07a3 5b04          	addw	sp,#4
1932                     ; 180     display_four();
1934  07a5 4b20          	push	#32
1935  07a7 ae500f        	ldw	x,#20495
1936  07aa cd0000        	call	_GPIO_WriteLow
1938  07ad 84            	pop	a
1941  07ae 4b04          	push	#4
1942  07b0 ae5000        	ldw	x,#20480
1943  07b3 cd0000        	call	_GPIO_WriteHigh
1945  07b6 84            	pop	a
1948  07b7 4b80          	push	#128
1949  07b9 ae500a        	ldw	x,#20490
1950  07bc cd0000        	call	_GPIO_WriteHigh
1952  07bf 84            	pop	a
1955  07c0 4b08          	push	#8
1956  07c2 ae500f        	ldw	x,#20495
1957  07c5 cd0000        	call	_GPIO_WriteLow
1959  07c8 84            	pop	a
1962  07c9 4b02          	push	#2
1963  07cb ae500f        	ldw	x,#20495
1964  07ce cd0000        	call	_GPIO_WriteLow
1966  07d1 84            	pop	a
1969  07d2 4b02          	push	#2
1970  07d4 ae5000        	ldw	x,#20480
1971  07d7 cd0000        	call	_GPIO_WriteHigh
1973  07da 84            	pop	a
1976  07db 4b40          	push	#64
1977  07dd ae500a        	ldw	x,#20490
1978  07e0 cd0000        	call	_GPIO_WriteHigh
1980  07e3 84            	pop	a
1981                     ; 181     delay(DELAY_DISPLAY_TEST);
1983  07e4 ae00fa        	ldw	x,#250
1984  07e7 89            	pushw	x
1985  07e8 ae0000        	ldw	x,#0
1986  07eb 89            	pushw	x
1987  07ec cd0000        	call	_delay
1989  07ef 5b04          	addw	sp,#4
1990                     ; 182     display_five();
1992  07f1 4b20          	push	#32
1993  07f3 ae500f        	ldw	x,#20495
1994  07f6 cd0000        	call	_GPIO_WriteHigh
1996  07f9 84            	pop	a
1999  07fa 4b04          	push	#4
2000  07fc ae5000        	ldw	x,#20480
2001  07ff cd0000        	call	_GPIO_WriteLow
2003  0802 84            	pop	a
2006  0803 4b80          	push	#128
2007  0805 ae500a        	ldw	x,#20490
2008  0808 cd0000        	call	_GPIO_WriteHigh
2010  080b 84            	pop	a
2013  080c 4b08          	push	#8
2014  080e ae500f        	ldw	x,#20495
2015  0811 cd0000        	call	_GPIO_WriteHigh
2017  0814 84            	pop	a
2020  0815 4b02          	push	#2
2021  0817 ae500f        	ldw	x,#20495
2022  081a cd0000        	call	_GPIO_WriteLow
2024  081d 84            	pop	a
2027  081e 4b02          	push	#2
2028  0820 ae5000        	ldw	x,#20480
2029  0823 cd0000        	call	_GPIO_WriteHigh
2031  0826 84            	pop	a
2034  0827 4b40          	push	#64
2035  0829 ae500a        	ldw	x,#20490
2036  082c cd0000        	call	_GPIO_WriteHigh
2038  082f 84            	pop	a
2039                     ; 183     delay(DELAY_DISPLAY_TEST);
2041  0830 ae00fa        	ldw	x,#250
2042  0833 89            	pushw	x
2043  0834 ae0000        	ldw	x,#0
2044  0837 89            	pushw	x
2045  0838 cd0000        	call	_delay
2047  083b 5b04          	addw	sp,#4
2048                     ; 184     display_six();
2050  083d 4b20          	push	#32
2051  083f ae500f        	ldw	x,#20495
2052  0842 cd0000        	call	_GPIO_WriteHigh
2054  0845 84            	pop	a
2057  0846 4b04          	push	#4
2058  0848 ae5000        	ldw	x,#20480
2059  084b cd0000        	call	_GPIO_WriteLow
2061  084e 84            	pop	a
2064  084f 4b80          	push	#128
2065  0851 ae500a        	ldw	x,#20490
2066  0854 cd0000        	call	_GPIO_WriteHigh
2068  0857 84            	pop	a
2071  0858 4b08          	push	#8
2072  085a ae500f        	ldw	x,#20495
2073  085d cd0000        	call	_GPIO_WriteHigh
2075  0860 84            	pop	a
2078  0861 4b02          	push	#2
2079  0863 ae500f        	ldw	x,#20495
2080  0866 cd0000        	call	_GPIO_WriteHigh
2082  0869 84            	pop	a
2085  086a 4b02          	push	#2
2086  086c ae5000        	ldw	x,#20480
2087  086f cd0000        	call	_GPIO_WriteHigh
2089  0872 84            	pop	a
2092  0873 4b40          	push	#64
2093  0875 ae500a        	ldw	x,#20490
2094  0878 cd0000        	call	_GPIO_WriteHigh
2096  087b 84            	pop	a
2097                     ; 185     delay(DELAY_DISPLAY_TEST);
2099  087c ae00fa        	ldw	x,#250
2100  087f 89            	pushw	x
2101  0880 ae0000        	ldw	x,#0
2102  0883 89            	pushw	x
2103  0884 cd0000        	call	_delay
2105  0887 5b04          	addw	sp,#4
2106                     ; 186     display_seven();
2108  0889 4b20          	push	#32
2109  088b ae500f        	ldw	x,#20495
2110  088e cd0000        	call	_GPIO_WriteHigh
2112  0891 84            	pop	a
2115  0892 4b04          	push	#4
2116  0894 ae5000        	ldw	x,#20480
2117  0897 cd0000        	call	_GPIO_WriteHigh
2119  089a 84            	pop	a
2122  089b 4b80          	push	#128
2123  089d ae500a        	ldw	x,#20490
2124  08a0 cd0000        	call	_GPIO_WriteHigh
2126  08a3 84            	pop	a
2129  08a4 4b08          	push	#8
2130  08a6 ae500f        	ldw	x,#20495
2131  08a9 cd0000        	call	_GPIO_WriteLow
2133  08ac 84            	pop	a
2136  08ad 4b02          	push	#2
2137  08af ae500f        	ldw	x,#20495
2138  08b2 cd0000        	call	_GPIO_WriteLow
2140  08b5 84            	pop	a
2143  08b6 4b02          	push	#2
2144  08b8 ae5000        	ldw	x,#20480
2145  08bb cd0000        	call	_GPIO_WriteLow
2147  08be 84            	pop	a
2150  08bf 4b40          	push	#64
2151  08c1 ae500a        	ldw	x,#20490
2152  08c4 cd0000        	call	_GPIO_WriteLow
2154  08c7 84            	pop	a
2155                     ; 187     delay(DELAY_DISPLAY_TEST);
2157  08c8 ae00fa        	ldw	x,#250
2158  08cb 89            	pushw	x
2159  08cc ae0000        	ldw	x,#0
2160  08cf 89            	pushw	x
2161  08d0 cd0000        	call	_delay
2163  08d3 5b04          	addw	sp,#4
2164                     ; 188     display_eight();
2166  08d5 4b20          	push	#32
2167  08d7 ae500f        	ldw	x,#20495
2168  08da cd0000        	call	_GPIO_WriteHigh
2170  08dd 84            	pop	a
2173  08de 4b04          	push	#4
2174  08e0 ae5000        	ldw	x,#20480
2175  08e3 cd0000        	call	_GPIO_WriteHigh
2177  08e6 84            	pop	a
2180  08e7 4b80          	push	#128
2181  08e9 ae500a        	ldw	x,#20490
2182  08ec cd0000        	call	_GPIO_WriteHigh
2184  08ef 84            	pop	a
2187  08f0 4b08          	push	#8
2188  08f2 ae500f        	ldw	x,#20495
2189  08f5 cd0000        	call	_GPIO_WriteHigh
2191  08f8 84            	pop	a
2194  08f9 4b02          	push	#2
2195  08fb ae500f        	ldw	x,#20495
2196  08fe cd0000        	call	_GPIO_WriteHigh
2198  0901 84            	pop	a
2201  0902 4b02          	push	#2
2202  0904 ae5000        	ldw	x,#20480
2203  0907 cd0000        	call	_GPIO_WriteHigh
2205  090a 84            	pop	a
2208  090b 4b40          	push	#64
2209  090d ae500a        	ldw	x,#20490
2210  0910 cd0000        	call	_GPIO_WriteHigh
2212  0913 84            	pop	a
2213                     ; 189     delay(DELAY_DISPLAY_TEST);
2215  0914 ae00fa        	ldw	x,#250
2216  0917 89            	pushw	x
2217  0918 ae0000        	ldw	x,#0
2218  091b 89            	pushw	x
2219  091c cd0000        	call	_delay
2221  091f 5b04          	addw	sp,#4
2222                     ; 190     display_nine();    
2224  0921 4b20          	push	#32
2225  0923 ae500f        	ldw	x,#20495
2226  0926 cd0000        	call	_GPIO_WriteHigh
2228  0929 84            	pop	a
2231  092a 4b04          	push	#4
2232  092c ae5000        	ldw	x,#20480
2233  092f cd0000        	call	_GPIO_WriteHigh
2235  0932 84            	pop	a
2238  0933 4b80          	push	#128
2239  0935 ae500a        	ldw	x,#20490
2240  0938 cd0000        	call	_GPIO_WriteHigh
2242  093b 84            	pop	a
2245  093c 4b08          	push	#8
2246  093e ae500f        	ldw	x,#20495
2247  0941 cd0000        	call	_GPIO_WriteHigh
2249  0944 84            	pop	a
2252  0945 4b02          	push	#2
2253  0947 ae500f        	ldw	x,#20495
2254  094a cd0000        	call	_GPIO_WriteLow
2256  094d 84            	pop	a
2259  094e 4b02          	push	#2
2260  0950 ae5000        	ldw	x,#20480
2261  0953 cd0000        	call	_GPIO_WriteHigh
2263  0956 84            	pop	a
2266  0957 4b40          	push	#64
2267  0959 ae500a        	ldw	x,#20490
2268  095c cd0000        	call	_GPIO_WriteHigh
2270  095f 84            	pop	a
2271                     ; 191     delay(DELAY_DISPLAY_TEST);
2273  0960 ae00fa        	ldw	x,#250
2274  0963 89            	pushw	x
2275  0964 ae0000        	ldw	x,#0
2276  0967 89            	pushw	x
2277  0968 cd0000        	call	_delay
2279  096b 5b04          	addw	sp,#4
2280                     ; 192     display_off();
2282  096d 4b20          	push	#32
2283  096f ae500f        	ldw	x,#20495
2284  0972 cd0000        	call	_GPIO_WriteLow
2286  0975 84            	pop	a
2289  0976 4b04          	push	#4
2290  0978 ae5000        	ldw	x,#20480
2291  097b cd0000        	call	_GPIO_WriteLow
2293  097e 84            	pop	a
2296  097f 4b80          	push	#128
2297  0981 ae500a        	ldw	x,#20490
2298  0984 cd0000        	call	_GPIO_WriteLow
2300  0987 84            	pop	a
2303  0988 4b08          	push	#8
2304  098a ae500f        	ldw	x,#20495
2305  098d cd0000        	call	_GPIO_WriteLow
2307  0990 84            	pop	a
2310  0991 4b02          	push	#2
2311  0993 ae500f        	ldw	x,#20495
2312  0996 cd0000        	call	_GPIO_WriteLow
2314  0999 84            	pop	a
2317  099a 4b02          	push	#2
2318  099c ae5000        	ldw	x,#20480
2319  099f cd0000        	call	_GPIO_WriteLow
2321  09a2 84            	pop	a
2324  09a3 4b40          	push	#64
2325  09a5 ae500a        	ldw	x,#20490
2326  09a8 cd0000        	call	_GPIO_WriteLow
2328  09ab 84            	pop	a
2331  09ac 4b04          	push	#4
2332  09ae ae500f        	ldw	x,#20495
2333  09b1 cd0000        	call	_GPIO_WriteLow
2335  09b4 84            	pop	a
2336                     ; 193     dp_on();
2339  09b5 4b04          	push	#4
2340  09b7 ae500f        	ldw	x,#20495
2341  09ba cd0000        	call	_GPIO_WriteHigh
2343  09bd 84            	pop	a
2344                     ; 194     delay(DELAY_DISPLAY_TEST);
2346  09be ae00fa        	ldw	x,#250
2347  09c1 89            	pushw	x
2348  09c2 ae0000        	ldw	x,#0
2349  09c5 89            	pushw	x
2350  09c6 cd0000        	call	_delay
2352  09c9 5b04          	addw	sp,#4
2353                     ; 195     dp_off();
2355  09cb 4b04          	push	#4
2356  09cd ae500f        	ldw	x,#20495
2357  09d0 cd0000        	call	_GPIO_WriteLow
2359  09d3 84            	pop	a
2360                     ; 196 }
2363  09d4 81            	ret
2391                     ; 199 void init_display(void)
2391                     ; 200 {
2392                     	switch	.text
2393  09d5               _init_display:
2397                     ; 202     seg_a_dir();
2399  09d5 4be0          	push	#224
2400  09d7 4b20          	push	#32
2401  09d9 ae500f        	ldw	x,#20495
2402  09dc cd0000        	call	_GPIO_Init
2404  09df 85            	popw	x
2405                     ; 203     seg_b_dir();
2408  09e0 4be0          	push	#224
2409  09e2 4b04          	push	#4
2410  09e4 ae5000        	ldw	x,#20480
2411  09e7 cd0000        	call	_GPIO_Init
2413  09ea 85            	popw	x
2414                     ; 204     seg_c_dir();
2417  09eb 4be0          	push	#224
2418  09ed 4b80          	push	#128
2419  09ef ae500a        	ldw	x,#20490
2420  09f2 cd0000        	call	_GPIO_Init
2422  09f5 85            	popw	x
2423                     ; 205     seg_d_dir();
2426  09f6 4be0          	push	#224
2427  09f8 4b08          	push	#8
2428  09fa ae500f        	ldw	x,#20495
2429  09fd cd0000        	call	_GPIO_Init
2431  0a00 85            	popw	x
2432                     ; 206     seg_e_dir();
2435  0a01 4be0          	push	#224
2436  0a03 4b02          	push	#2
2437  0a05 ae500f        	ldw	x,#20495
2438  0a08 cd0000        	call	_GPIO_Init
2440  0a0b 85            	popw	x
2441                     ; 207     seg_f_dir();
2444  0a0c 4be0          	push	#224
2445  0a0e 4b02          	push	#2
2446  0a10 ae5000        	ldw	x,#20480
2447  0a13 cd0000        	call	_GPIO_Init
2449  0a16 85            	popw	x
2450                     ; 208     seg_g_dir();
2453  0a17 4be0          	push	#224
2454  0a19 4b40          	push	#64
2455  0a1b ae500a        	ldw	x,#20490
2456  0a1e cd0000        	call	_GPIO_Init
2458  0a21 85            	popw	x
2459                     ; 209     dp_dir();
2462  0a22 4be0          	push	#224
2463  0a24 4b04          	push	#4
2464  0a26 ae500f        	ldw	x,#20495
2465  0a29 cd0000        	call	_GPIO_Init
2467  0a2c 85            	popw	x
2468                     ; 210     dig1_dir();
2471  0a2d 4be0          	push	#224
2472  0a2f 4b10          	push	#16
2473  0a31 ae500f        	ldw	x,#20495
2474  0a34 cd0000        	call	_GPIO_Init
2476  0a37 85            	popw	x
2477                     ; 211     dig2_dir();
2480  0a38 4be0          	push	#224
2481  0a3a 4b20          	push	#32
2482  0a3c ae5005        	ldw	x,#20485
2483  0a3f cd0000        	call	_GPIO_Init
2485  0a42 85            	popw	x
2486                     ; 212     dig3_dir();
2489  0a43 4be0          	push	#224
2490  0a45 4b10          	push	#16
2491  0a47 ae5005        	ldw	x,#20485
2492  0a4a cd0000        	call	_GPIO_Init
2494  0a4d 85            	popw	x
2495                     ; 215     dig1_on();
2498  0a4e 4b10          	push	#16
2499  0a50 ae500f        	ldw	x,#20495
2500  0a53 cd0000        	call	_GPIO_WriteLow
2502  0a56 84            	pop	a
2503                     ; 216     dig2_on();
2505  0a57 4b20          	push	#32
2506  0a59 ae5005        	ldw	x,#20485
2507  0a5c cd0000        	call	_GPIO_WriteLow
2509  0a5f 84            	pop	a
2510                     ; 217     dig3_on();
2512  0a60 4b10          	push	#16
2513  0a62 ae5005        	ldw	x,#20485
2514  0a65 cd0000        	call	_GPIO_WriteLow
2516  0a68 84            	pop	a
2517                     ; 219     display_all();
2519  0a69 4b20          	push	#32
2520  0a6b ae500f        	ldw	x,#20495
2521  0a6e cd0000        	call	_GPIO_WriteHigh
2523  0a71 84            	pop	a
2526  0a72 4b04          	push	#4
2527  0a74 ae5000        	ldw	x,#20480
2528  0a77 cd0000        	call	_GPIO_WriteHigh
2530  0a7a 84            	pop	a
2533  0a7b 4b80          	push	#128
2534  0a7d ae500a        	ldw	x,#20490
2535  0a80 cd0000        	call	_GPIO_WriteHigh
2537  0a83 84            	pop	a
2540  0a84 4b08          	push	#8
2541  0a86 ae500f        	ldw	x,#20495
2542  0a89 cd0000        	call	_GPIO_WriteHigh
2544  0a8c 84            	pop	a
2547  0a8d 4b02          	push	#2
2548  0a8f ae500f        	ldw	x,#20495
2549  0a92 cd0000        	call	_GPIO_WriteHigh
2551  0a95 84            	pop	a
2554  0a96 4b02          	push	#2
2555  0a98 ae5000        	ldw	x,#20480
2556  0a9b cd0000        	call	_GPIO_WriteHigh
2558  0a9e 84            	pop	a
2561  0a9f 4b40          	push	#64
2562  0aa1 ae500a        	ldw	x,#20490
2563  0aa4 cd0000        	call	_GPIO_WriteHigh
2565  0aa7 84            	pop	a
2568  0aa8 4b04          	push	#4
2569  0aaa ae500f        	ldw	x,#20495
2570  0aad cd0000        	call	_GPIO_WriteHigh
2572  0ab0 84            	pop	a
2573                     ; 220     delay(2*DELAY_DISPLAY_TEST);
2576  0ab1 ae01f4        	ldw	x,#500
2577  0ab4 89            	pushw	x
2578  0ab5 ae0000        	ldw	x,#0
2579  0ab8 89            	pushw	x
2580  0ab9 cd0000        	call	_delay
2582  0abc 5b04          	addw	sp,#4
2583                     ; 221     display_off();
2585  0abe 4b20          	push	#32
2586  0ac0 ae500f        	ldw	x,#20495
2587  0ac3 cd0000        	call	_GPIO_WriteLow
2589  0ac6 84            	pop	a
2592  0ac7 4b04          	push	#4
2593  0ac9 ae5000        	ldw	x,#20480
2594  0acc cd0000        	call	_GPIO_WriteLow
2596  0acf 84            	pop	a
2599  0ad0 4b80          	push	#128
2600  0ad2 ae500a        	ldw	x,#20490
2601  0ad5 cd0000        	call	_GPIO_WriteLow
2603  0ad8 84            	pop	a
2606  0ad9 4b08          	push	#8
2607  0adb ae500f        	ldw	x,#20495
2608  0ade cd0000        	call	_GPIO_WriteLow
2610  0ae1 84            	pop	a
2613  0ae2 4b02          	push	#2
2614  0ae4 ae500f        	ldw	x,#20495
2615  0ae7 cd0000        	call	_GPIO_WriteLow
2617  0aea 84            	pop	a
2620  0aeb 4b02          	push	#2
2621  0aed ae5000        	ldw	x,#20480
2622  0af0 cd0000        	call	_GPIO_WriteLow
2624  0af3 84            	pop	a
2627  0af4 4b40          	push	#64
2628  0af6 ae500a        	ldw	x,#20490
2629  0af9 cd0000        	call	_GPIO_WriteLow
2631  0afc 84            	pop	a
2634  0afd 4b04          	push	#4
2635  0aff ae500f        	ldw	x,#20495
2636  0b02 cd0000        	call	_GPIO_WriteLow
2638  0b05 84            	pop	a
2639                     ; 222     delay(DELAY_DISPLAY_TEST);
2642  0b06 ae00fa        	ldw	x,#250
2643  0b09 89            	pushw	x
2644  0b0a ae0000        	ldw	x,#0
2645  0b0d 89            	pushw	x
2646  0b0e cd0000        	call	_delay
2648  0b11 5b04          	addw	sp,#4
2649                     ; 223     display_all();
2651  0b13 4b20          	push	#32
2652  0b15 ae500f        	ldw	x,#20495
2653  0b18 cd0000        	call	_GPIO_WriteHigh
2655  0b1b 84            	pop	a
2658  0b1c 4b04          	push	#4
2659  0b1e ae5000        	ldw	x,#20480
2660  0b21 cd0000        	call	_GPIO_WriteHigh
2662  0b24 84            	pop	a
2665  0b25 4b80          	push	#128
2666  0b27 ae500a        	ldw	x,#20490
2667  0b2a cd0000        	call	_GPIO_WriteHigh
2669  0b2d 84            	pop	a
2672  0b2e 4b08          	push	#8
2673  0b30 ae500f        	ldw	x,#20495
2674  0b33 cd0000        	call	_GPIO_WriteHigh
2676  0b36 84            	pop	a
2679  0b37 4b02          	push	#2
2680  0b39 ae500f        	ldw	x,#20495
2681  0b3c cd0000        	call	_GPIO_WriteHigh
2683  0b3f 84            	pop	a
2686  0b40 4b02          	push	#2
2687  0b42 ae5000        	ldw	x,#20480
2688  0b45 cd0000        	call	_GPIO_WriteHigh
2690  0b48 84            	pop	a
2693  0b49 4b40          	push	#64
2694  0b4b ae500a        	ldw	x,#20490
2695  0b4e cd0000        	call	_GPIO_WriteHigh
2697  0b51 84            	pop	a
2700  0b52 4b04          	push	#4
2701  0b54 ae500f        	ldw	x,#20495
2702  0b57 cd0000        	call	_GPIO_WriteHigh
2704  0b5a 84            	pop	a
2705                     ; 224     delay(2*DELAY_DISPLAY_TEST);
2708  0b5b ae01f4        	ldw	x,#500
2709  0b5e 89            	pushw	x
2710  0b5f ae0000        	ldw	x,#0
2711  0b62 89            	pushw	x
2712  0b63 cd0000        	call	_delay
2714  0b66 5b04          	addw	sp,#4
2715                     ; 225     display_off();
2717  0b68 4b20          	push	#32
2718  0b6a ae500f        	ldw	x,#20495
2719  0b6d cd0000        	call	_GPIO_WriteLow
2721  0b70 84            	pop	a
2724  0b71 4b04          	push	#4
2725  0b73 ae5000        	ldw	x,#20480
2726  0b76 cd0000        	call	_GPIO_WriteLow
2728  0b79 84            	pop	a
2731  0b7a 4b80          	push	#128
2732  0b7c ae500a        	ldw	x,#20490
2733  0b7f cd0000        	call	_GPIO_WriteLow
2735  0b82 84            	pop	a
2738  0b83 4b08          	push	#8
2739  0b85 ae500f        	ldw	x,#20495
2740  0b88 cd0000        	call	_GPIO_WriteLow
2742  0b8b 84            	pop	a
2745  0b8c 4b02          	push	#2
2746  0b8e ae500f        	ldw	x,#20495
2747  0b91 cd0000        	call	_GPIO_WriteLow
2749  0b94 84            	pop	a
2752  0b95 4b02          	push	#2
2753  0b97 ae5000        	ldw	x,#20480
2754  0b9a cd0000        	call	_GPIO_WriteLow
2756  0b9d 84            	pop	a
2759  0b9e 4b40          	push	#64
2760  0ba0 ae500a        	ldw	x,#20490
2761  0ba3 cd0000        	call	_GPIO_WriteLow
2763  0ba6 84            	pop	a
2766  0ba7 4b04          	push	#4
2767  0ba9 ae500f        	ldw	x,#20495
2768  0bac cd0000        	call	_GPIO_WriteLow
2770  0baf 84            	pop	a
2771                     ; 226     delay(DELAY_DISPLAY_TEST);
2774  0bb0 ae00fa        	ldw	x,#250
2775  0bb3 89            	pushw	x
2776  0bb4 ae0000        	ldw	x,#0
2777  0bb7 89            	pushw	x
2778  0bb8 cd0000        	call	_delay
2780  0bbb 5b04          	addw	sp,#4
2781                     ; 227     display_all();
2783  0bbd 4b20          	push	#32
2784  0bbf ae500f        	ldw	x,#20495
2785  0bc2 cd0000        	call	_GPIO_WriteHigh
2787  0bc5 84            	pop	a
2790  0bc6 4b04          	push	#4
2791  0bc8 ae5000        	ldw	x,#20480
2792  0bcb cd0000        	call	_GPIO_WriteHigh
2794  0bce 84            	pop	a
2797  0bcf 4b80          	push	#128
2798  0bd1 ae500a        	ldw	x,#20490
2799  0bd4 cd0000        	call	_GPIO_WriteHigh
2801  0bd7 84            	pop	a
2804  0bd8 4b08          	push	#8
2805  0bda ae500f        	ldw	x,#20495
2806  0bdd cd0000        	call	_GPIO_WriteHigh
2808  0be0 84            	pop	a
2811  0be1 4b02          	push	#2
2812  0be3 ae500f        	ldw	x,#20495
2813  0be6 cd0000        	call	_GPIO_WriteHigh
2815  0be9 84            	pop	a
2818  0bea 4b02          	push	#2
2819  0bec ae5000        	ldw	x,#20480
2820  0bef cd0000        	call	_GPIO_WriteHigh
2822  0bf2 84            	pop	a
2825  0bf3 4b40          	push	#64
2826  0bf5 ae500a        	ldw	x,#20490
2827  0bf8 cd0000        	call	_GPIO_WriteHigh
2829  0bfb 84            	pop	a
2832  0bfc 4b04          	push	#4
2833  0bfe ae500f        	ldw	x,#20495
2834  0c01 cd0000        	call	_GPIO_WriteHigh
2836  0c04 84            	pop	a
2837                     ; 228     delay(2*DELAY_DISPLAY_TEST);
2840  0c05 ae01f4        	ldw	x,#500
2841  0c08 89            	pushw	x
2842  0c09 ae0000        	ldw	x,#0
2843  0c0c 89            	pushw	x
2844  0c0d cd0000        	call	_delay
2846  0c10 5b04          	addw	sp,#4
2847                     ; 229     display_off();
2849  0c12 4b20          	push	#32
2850  0c14 ae500f        	ldw	x,#20495
2851  0c17 cd0000        	call	_GPIO_WriteLow
2853  0c1a 84            	pop	a
2856  0c1b 4b04          	push	#4
2857  0c1d ae5000        	ldw	x,#20480
2858  0c20 cd0000        	call	_GPIO_WriteLow
2860  0c23 84            	pop	a
2863  0c24 4b80          	push	#128
2864  0c26 ae500a        	ldw	x,#20490
2865  0c29 cd0000        	call	_GPIO_WriteLow
2867  0c2c 84            	pop	a
2870  0c2d 4b08          	push	#8
2871  0c2f ae500f        	ldw	x,#20495
2872  0c32 cd0000        	call	_GPIO_WriteLow
2874  0c35 84            	pop	a
2877  0c36 4b02          	push	#2
2878  0c38 ae500f        	ldw	x,#20495
2879  0c3b cd0000        	call	_GPIO_WriteLow
2881  0c3e 84            	pop	a
2884  0c3f 4b02          	push	#2
2885  0c41 ae5000        	ldw	x,#20480
2886  0c44 cd0000        	call	_GPIO_WriteLow
2888  0c47 84            	pop	a
2891  0c48 4b40          	push	#64
2892  0c4a ae500a        	ldw	x,#20490
2893  0c4d cd0000        	call	_GPIO_WriteLow
2895  0c50 84            	pop	a
2898  0c51 4b04          	push	#4
2899  0c53 ae500f        	ldw	x,#20495
2900  0c56 cd0000        	call	_GPIO_WriteLow
2902  0c59 84            	pop	a
2903                     ; 231     display_test = 0;
2906  0c5a 3f00          	clr	_display_test
2907                     ; 234     dig1_off();
2909  0c5c 4b10          	push	#16
2910  0c5e ae500f        	ldw	x,#20495
2911  0c61 cd0000        	call	_GPIO_WriteHigh
2913  0c64 84            	pop	a
2914                     ; 235     dig2_off();
2916  0c65 4b20          	push	#32
2917  0c67 ae5005        	ldw	x,#20485
2918  0c6a cd0000        	call	_GPIO_WriteHigh
2920  0c6d 84            	pop	a
2921                     ; 236     dig3_off();
2923  0c6e 4b10          	push	#16
2924  0c70 ae5005        	ldw	x,#20485
2925  0c73 cd0000        	call	_GPIO_WriteHigh
2927  0c76 84            	pop	a
2928                     ; 239 }
2931  0c77 81            	ret
2975                     	xdef	_test_display
2976                     	xdef	_wr_digit
2977                     	xdef	_dec2bcd
2978                     	xdef	_dp
2979                     	xdef	_display_num
2980                     	xdef	_display_test
2981                     	xref.b	_tick
2982                     	xref	_delay
2983                     	xdef	_set_display_option
2984                     	xdef	_set_display_value
2985                     	xdef	_tmr_display
2986                     	xdef	_task_display
2987                     	xdef	_init_display
2988                     	xref	_GPIO_WriteLow
2989                     	xref	_GPIO_WriteHigh
2990                     	xref	_GPIO_Init
3009                     	end
