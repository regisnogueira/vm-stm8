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
 130                     ; 24 void set_display(uint8_t option, uint8_t value, uint8_t decimal)
 130                     ; 25 {
 131                     	switch	.text
 132  001d               _set_display:
 136                     ; 40 }
 139  001d 81            	ret
 173                     ; 42 void wr_digit(uint8_t dig_pos)
 173                     ; 43 {
 174                     	switch	.text
 175  001e               _wr_digit:
 179                     ; 78 }
 182  001e 81            	ret
 205                     ; 80 void task_display(void)
 205                     ; 81 {
 206                     	switch	.text
 207  001f               _task_display:
 211                     ; 87 }
 214  001f 81            	ret
 237                     ; 89 void tmr_display(void)
 237                     ; 90 {
 238                     	switch	.text
 239  0020               _tmr_display:
 243                     ; 121 }
 246  0020 81            	ret
 272                     ; 124 void test_display(void)
 272                     ; 125 {
 273                     	switch	.text
 274  0021               _test_display:
 278                     ; 126     delay(DELAY_DISPLAY_TEST);
 280  0021 ae01f4        	ldw	x,#500
 281  0024 89            	pushw	x
 282  0025 ae0000        	ldw	x,#0
 283  0028 89            	pushw	x
 284  0029 cd0000        	call	_delay
 286  002c 5b04          	addw	sp,#4
 287                     ; 127     display_zero();
 289  002e 4b20          	push	#32
 290  0030 ae500f        	ldw	x,#20495
 291  0033 cd0000        	call	_GPIO_WriteHigh
 293  0036 84            	pop	a
 296  0037 4b04          	push	#4
 297  0039 ae5000        	ldw	x,#20480
 298  003c cd0000        	call	_GPIO_WriteHigh
 300  003f 84            	pop	a
 303  0040 4b80          	push	#128
 304  0042 ae500a        	ldw	x,#20490
 305  0045 cd0000        	call	_GPIO_WriteHigh
 307  0048 84            	pop	a
 310  0049 4b08          	push	#8
 311  004b ae500f        	ldw	x,#20495
 312  004e cd0000        	call	_GPIO_WriteHigh
 314  0051 84            	pop	a
 317  0052 4b02          	push	#2
 318  0054 ae500f        	ldw	x,#20495
 319  0057 cd0000        	call	_GPIO_WriteHigh
 321  005a 84            	pop	a
 324  005b 4b02          	push	#2
 325  005d ae5000        	ldw	x,#20480
 326  0060 cd0000        	call	_GPIO_WriteHigh
 328  0063 84            	pop	a
 331  0064 4b40          	push	#64
 332  0066 ae500a        	ldw	x,#20490
 333  0069 cd0000        	call	_GPIO_WriteLow
 335  006c 84            	pop	a
 336                     ; 128     delay(DELAY_DISPLAY_TEST);
 338  006d ae01f4        	ldw	x,#500
 339  0070 89            	pushw	x
 340  0071 ae0000        	ldw	x,#0
 341  0074 89            	pushw	x
 342  0075 cd0000        	call	_delay
 344  0078 5b04          	addw	sp,#4
 345                     ; 129     display_one();
 347  007a 4b20          	push	#32
 348  007c ae500f        	ldw	x,#20495
 349  007f cd0000        	call	_GPIO_WriteLow
 351  0082 84            	pop	a
 354  0083 4b04          	push	#4
 355  0085 ae5000        	ldw	x,#20480
 356  0088 cd0000        	call	_GPIO_WriteHigh
 358  008b 84            	pop	a
 361  008c 4b80          	push	#128
 362  008e ae500a        	ldw	x,#20490
 363  0091 cd0000        	call	_GPIO_WriteHigh
 365  0094 84            	pop	a
 368  0095 4b08          	push	#8
 369  0097 ae500f        	ldw	x,#20495
 370  009a cd0000        	call	_GPIO_WriteLow
 372  009d 84            	pop	a
 375  009e 4b02          	push	#2
 376  00a0 ae500f        	ldw	x,#20495
 377  00a3 cd0000        	call	_GPIO_WriteLow
 379  00a6 84            	pop	a
 382  00a7 4b02          	push	#2
 383  00a9 ae5000        	ldw	x,#20480
 384  00ac cd0000        	call	_GPIO_WriteLow
 386  00af 84            	pop	a
 389  00b0 4b40          	push	#64
 390  00b2 ae500a        	ldw	x,#20490
 391  00b5 cd0000        	call	_GPIO_WriteLow
 393  00b8 84            	pop	a
 394                     ; 130     delay(DELAY_DISPLAY_TEST);
 396  00b9 ae01f4        	ldw	x,#500
 397  00bc 89            	pushw	x
 398  00bd ae0000        	ldw	x,#0
 399  00c0 89            	pushw	x
 400  00c1 cd0000        	call	_delay
 402  00c4 5b04          	addw	sp,#4
 403                     ; 131     display_two();
 405  00c6 4b20          	push	#32
 406  00c8 ae500f        	ldw	x,#20495
 407  00cb cd0000        	call	_GPIO_WriteHigh
 409  00ce 84            	pop	a
 412  00cf 4b04          	push	#4
 413  00d1 ae5000        	ldw	x,#20480
 414  00d4 cd0000        	call	_GPIO_WriteHigh
 416  00d7 84            	pop	a
 419  00d8 4b80          	push	#128
 420  00da ae500a        	ldw	x,#20490
 421  00dd cd0000        	call	_GPIO_WriteLow
 423  00e0 84            	pop	a
 426  00e1 4b08          	push	#8
 427  00e3 ae500f        	ldw	x,#20495
 428  00e6 cd0000        	call	_GPIO_WriteHigh
 430  00e9 84            	pop	a
 433  00ea 4b02          	push	#2
 434  00ec ae500f        	ldw	x,#20495
 435  00ef cd0000        	call	_GPIO_WriteHigh
 437  00f2 84            	pop	a
 440  00f3 4b02          	push	#2
 441  00f5 ae5000        	ldw	x,#20480
 442  00f8 cd0000        	call	_GPIO_WriteLow
 444  00fb 84            	pop	a
 447  00fc 4b40          	push	#64
 448  00fe ae500a        	ldw	x,#20490
 449  0101 cd0000        	call	_GPIO_WriteHigh
 451  0104 84            	pop	a
 452                     ; 132     delay(DELAY_DISPLAY_TEST);
 454  0105 ae01f4        	ldw	x,#500
 455  0108 89            	pushw	x
 456  0109 ae0000        	ldw	x,#0
 457  010c 89            	pushw	x
 458  010d cd0000        	call	_delay
 460  0110 5b04          	addw	sp,#4
 461                     ; 133     display_three();
 463  0112 4b20          	push	#32
 464  0114 ae500f        	ldw	x,#20495
 465  0117 cd0000        	call	_GPIO_WriteHigh
 467  011a 84            	pop	a
 470  011b 4b04          	push	#4
 471  011d ae5000        	ldw	x,#20480
 472  0120 cd0000        	call	_GPIO_WriteHigh
 474  0123 84            	pop	a
 477  0124 4b80          	push	#128
 478  0126 ae500a        	ldw	x,#20490
 479  0129 cd0000        	call	_GPIO_WriteHigh
 481  012c 84            	pop	a
 484  012d 4b08          	push	#8
 485  012f ae500f        	ldw	x,#20495
 486  0132 cd0000        	call	_GPIO_WriteHigh
 488  0135 84            	pop	a
 491  0136 4b02          	push	#2
 492  0138 ae500f        	ldw	x,#20495
 493  013b cd0000        	call	_GPIO_WriteLow
 495  013e 84            	pop	a
 498  013f 4b02          	push	#2
 499  0141 ae5000        	ldw	x,#20480
 500  0144 cd0000        	call	_GPIO_WriteLow
 502  0147 84            	pop	a
 505  0148 4b40          	push	#64
 506  014a ae500a        	ldw	x,#20490
 507  014d cd0000        	call	_GPIO_WriteHigh
 509  0150 84            	pop	a
 510                     ; 134     delay(DELAY_DISPLAY_TEST);
 512  0151 ae01f4        	ldw	x,#500
 513  0154 89            	pushw	x
 514  0155 ae0000        	ldw	x,#0
 515  0158 89            	pushw	x
 516  0159 cd0000        	call	_delay
 518  015c 5b04          	addw	sp,#4
 519                     ; 135     display_four();
 521  015e 4b20          	push	#32
 522  0160 ae500f        	ldw	x,#20495
 523  0163 cd0000        	call	_GPIO_WriteLow
 525  0166 84            	pop	a
 528  0167 4b04          	push	#4
 529  0169 ae5000        	ldw	x,#20480
 530  016c cd0000        	call	_GPIO_WriteHigh
 532  016f 84            	pop	a
 535  0170 4b80          	push	#128
 536  0172 ae500a        	ldw	x,#20490
 537  0175 cd0000        	call	_GPIO_WriteHigh
 539  0178 84            	pop	a
 542  0179 4b08          	push	#8
 543  017b ae500f        	ldw	x,#20495
 544  017e cd0000        	call	_GPIO_WriteLow
 546  0181 84            	pop	a
 549  0182 4b02          	push	#2
 550  0184 ae500f        	ldw	x,#20495
 551  0187 cd0000        	call	_GPIO_WriteLow
 553  018a 84            	pop	a
 556  018b 4b02          	push	#2
 557  018d ae5000        	ldw	x,#20480
 558  0190 cd0000        	call	_GPIO_WriteHigh
 560  0193 84            	pop	a
 563  0194 4b40          	push	#64
 564  0196 ae500a        	ldw	x,#20490
 565  0199 cd0000        	call	_GPIO_WriteHigh
 567  019c 84            	pop	a
 568                     ; 136     delay(DELAY_DISPLAY_TEST);
 570  019d ae01f4        	ldw	x,#500
 571  01a0 89            	pushw	x
 572  01a1 ae0000        	ldw	x,#0
 573  01a4 89            	pushw	x
 574  01a5 cd0000        	call	_delay
 576  01a8 5b04          	addw	sp,#4
 577                     ; 137     display_five();
 579  01aa 4b20          	push	#32
 580  01ac ae500f        	ldw	x,#20495
 581  01af cd0000        	call	_GPIO_WriteHigh
 583  01b2 84            	pop	a
 586  01b3 4b04          	push	#4
 587  01b5 ae5000        	ldw	x,#20480
 588  01b8 cd0000        	call	_GPIO_WriteLow
 590  01bb 84            	pop	a
 593  01bc 4b80          	push	#128
 594  01be ae500a        	ldw	x,#20490
 595  01c1 cd0000        	call	_GPIO_WriteHigh
 597  01c4 84            	pop	a
 600  01c5 4b08          	push	#8
 601  01c7 ae500f        	ldw	x,#20495
 602  01ca cd0000        	call	_GPIO_WriteHigh
 604  01cd 84            	pop	a
 607  01ce 4b02          	push	#2
 608  01d0 ae500f        	ldw	x,#20495
 609  01d3 cd0000        	call	_GPIO_WriteLow
 611  01d6 84            	pop	a
 614  01d7 4b02          	push	#2
 615  01d9 ae5000        	ldw	x,#20480
 616  01dc cd0000        	call	_GPIO_WriteHigh
 618  01df 84            	pop	a
 621  01e0 4b40          	push	#64
 622  01e2 ae500a        	ldw	x,#20490
 623  01e5 cd0000        	call	_GPIO_WriteHigh
 625  01e8 84            	pop	a
 626                     ; 138     delay(DELAY_DISPLAY_TEST);
 628  01e9 ae01f4        	ldw	x,#500
 629  01ec 89            	pushw	x
 630  01ed ae0000        	ldw	x,#0
 631  01f0 89            	pushw	x
 632  01f1 cd0000        	call	_delay
 634  01f4 5b04          	addw	sp,#4
 635                     ; 139     display_six();
 637  01f6 4b20          	push	#32
 638  01f8 ae500f        	ldw	x,#20495
 639  01fb cd0000        	call	_GPIO_WriteHigh
 641  01fe 84            	pop	a
 644  01ff 4b04          	push	#4
 645  0201 ae5000        	ldw	x,#20480
 646  0204 cd0000        	call	_GPIO_WriteLow
 648  0207 84            	pop	a
 651  0208 4b80          	push	#128
 652  020a ae500a        	ldw	x,#20490
 653  020d cd0000        	call	_GPIO_WriteHigh
 655  0210 84            	pop	a
 658  0211 4b08          	push	#8
 659  0213 ae500f        	ldw	x,#20495
 660  0216 cd0000        	call	_GPIO_WriteHigh
 662  0219 84            	pop	a
 665  021a 4b02          	push	#2
 666  021c ae500f        	ldw	x,#20495
 667  021f cd0000        	call	_GPIO_WriteHigh
 669  0222 84            	pop	a
 672  0223 4b02          	push	#2
 673  0225 ae5000        	ldw	x,#20480
 674  0228 cd0000        	call	_GPIO_WriteHigh
 676  022b 84            	pop	a
 679  022c 4b40          	push	#64
 680  022e ae500a        	ldw	x,#20490
 681  0231 cd0000        	call	_GPIO_WriteHigh
 683  0234 84            	pop	a
 684                     ; 140     delay(DELAY_DISPLAY_TEST);
 686  0235 ae01f4        	ldw	x,#500
 687  0238 89            	pushw	x
 688  0239 ae0000        	ldw	x,#0
 689  023c 89            	pushw	x
 690  023d cd0000        	call	_delay
 692  0240 5b04          	addw	sp,#4
 693                     ; 141     display_seven();
 695  0242 4b20          	push	#32
 696  0244 ae500f        	ldw	x,#20495
 697  0247 cd0000        	call	_GPIO_WriteHigh
 699  024a 84            	pop	a
 702  024b 4b04          	push	#4
 703  024d ae5000        	ldw	x,#20480
 704  0250 cd0000        	call	_GPIO_WriteHigh
 706  0253 84            	pop	a
 709  0254 4b80          	push	#128
 710  0256 ae500a        	ldw	x,#20490
 711  0259 cd0000        	call	_GPIO_WriteHigh
 713  025c 84            	pop	a
 716  025d 4b08          	push	#8
 717  025f ae500f        	ldw	x,#20495
 718  0262 cd0000        	call	_GPIO_WriteLow
 720  0265 84            	pop	a
 723  0266 4b02          	push	#2
 724  0268 ae500f        	ldw	x,#20495
 725  026b cd0000        	call	_GPIO_WriteLow
 727  026e 84            	pop	a
 730  026f 4b02          	push	#2
 731  0271 ae5000        	ldw	x,#20480
 732  0274 cd0000        	call	_GPIO_WriteLow
 734  0277 84            	pop	a
 737  0278 4b40          	push	#64
 738  027a ae500a        	ldw	x,#20490
 739  027d cd0000        	call	_GPIO_WriteLow
 741  0280 84            	pop	a
 742                     ; 142     delay(DELAY_DISPLAY_TEST);
 744  0281 ae01f4        	ldw	x,#500
 745  0284 89            	pushw	x
 746  0285 ae0000        	ldw	x,#0
 747  0288 89            	pushw	x
 748  0289 cd0000        	call	_delay
 750  028c 5b04          	addw	sp,#4
 751                     ; 143     display_eight();
 753  028e 4b20          	push	#32
 754  0290 ae500f        	ldw	x,#20495
 755  0293 cd0000        	call	_GPIO_WriteHigh
 757  0296 84            	pop	a
 760  0297 4b04          	push	#4
 761  0299 ae5000        	ldw	x,#20480
 762  029c cd0000        	call	_GPIO_WriteHigh
 764  029f 84            	pop	a
 767  02a0 4b80          	push	#128
 768  02a2 ae500a        	ldw	x,#20490
 769  02a5 cd0000        	call	_GPIO_WriteHigh
 771  02a8 84            	pop	a
 774  02a9 4b08          	push	#8
 775  02ab ae500f        	ldw	x,#20495
 776  02ae cd0000        	call	_GPIO_WriteHigh
 778  02b1 84            	pop	a
 781  02b2 4b02          	push	#2
 782  02b4 ae500f        	ldw	x,#20495
 783  02b7 cd0000        	call	_GPIO_WriteHigh
 785  02ba 84            	pop	a
 788  02bb 4b02          	push	#2
 789  02bd ae5000        	ldw	x,#20480
 790  02c0 cd0000        	call	_GPIO_WriteHigh
 792  02c3 84            	pop	a
 795  02c4 4b40          	push	#64
 796  02c6 ae500a        	ldw	x,#20490
 797  02c9 cd0000        	call	_GPIO_WriteHigh
 799  02cc 84            	pop	a
 800                     ; 144     delay(DELAY_DISPLAY_TEST);
 802  02cd ae01f4        	ldw	x,#500
 803  02d0 89            	pushw	x
 804  02d1 ae0000        	ldw	x,#0
 805  02d4 89            	pushw	x
 806  02d5 cd0000        	call	_delay
 808  02d8 5b04          	addw	sp,#4
 809                     ; 145     display_nine();    
 811  02da 4b20          	push	#32
 812  02dc ae500f        	ldw	x,#20495
 813  02df cd0000        	call	_GPIO_WriteHigh
 815  02e2 84            	pop	a
 818  02e3 4b04          	push	#4
 819  02e5 ae5000        	ldw	x,#20480
 820  02e8 cd0000        	call	_GPIO_WriteHigh
 822  02eb 84            	pop	a
 825  02ec 4b80          	push	#128
 826  02ee ae500a        	ldw	x,#20490
 827  02f1 cd0000        	call	_GPIO_WriteHigh
 829  02f4 84            	pop	a
 832  02f5 4b08          	push	#8
 833  02f7 ae500f        	ldw	x,#20495
 834  02fa cd0000        	call	_GPIO_WriteHigh
 836  02fd 84            	pop	a
 839  02fe 4b02          	push	#2
 840  0300 ae500f        	ldw	x,#20495
 841  0303 cd0000        	call	_GPIO_WriteLow
 843  0306 84            	pop	a
 846  0307 4b02          	push	#2
 847  0309 ae5000        	ldw	x,#20480
 848  030c cd0000        	call	_GPIO_WriteHigh
 850  030f 84            	pop	a
 853  0310 4b40          	push	#64
 854  0312 ae500a        	ldw	x,#20490
 855  0315 cd0000        	call	_GPIO_WriteHigh
 857  0318 84            	pop	a
 858                     ; 146     delay(DELAY_DISPLAY_TEST);
 860  0319 ae01f4        	ldw	x,#500
 861  031c 89            	pushw	x
 862  031d ae0000        	ldw	x,#0
 863  0320 89            	pushw	x
 864  0321 cd0000        	call	_delay
 866  0324 5b04          	addw	sp,#4
 867                     ; 147     display_off();
 869  0326 4b20          	push	#32
 870  0328 ae500f        	ldw	x,#20495
 871  032b cd0000        	call	_GPIO_WriteLow
 873  032e 84            	pop	a
 876  032f 4b04          	push	#4
 877  0331 ae5000        	ldw	x,#20480
 878  0334 cd0000        	call	_GPIO_WriteLow
 880  0337 84            	pop	a
 883  0338 4b80          	push	#128
 884  033a ae500a        	ldw	x,#20490
 885  033d cd0000        	call	_GPIO_WriteLow
 887  0340 84            	pop	a
 890  0341 4b08          	push	#8
 891  0343 ae500f        	ldw	x,#20495
 892  0346 cd0000        	call	_GPIO_WriteLow
 894  0349 84            	pop	a
 897  034a 4b02          	push	#2
 898  034c ae500f        	ldw	x,#20495
 899  034f cd0000        	call	_GPIO_WriteLow
 901  0352 84            	pop	a
 904  0353 4b02          	push	#2
 905  0355 ae5000        	ldw	x,#20480
 906  0358 cd0000        	call	_GPIO_WriteLow
 908  035b 84            	pop	a
 911  035c 4b40          	push	#64
 912  035e ae500a        	ldw	x,#20490
 913  0361 cd0000        	call	_GPIO_WriteLow
 915  0364 84            	pop	a
 918  0365 4b04          	push	#4
 919  0367 ae500f        	ldw	x,#20495
 920  036a cd0000        	call	_GPIO_WriteLow
 922  036d 84            	pop	a
 923                     ; 148     dp_on();
 926  036e 4b04          	push	#4
 927  0370 ae500f        	ldw	x,#20495
 928  0373 cd0000        	call	_GPIO_WriteHigh
 930  0376 84            	pop	a
 931                     ; 149     delay(DELAY_DISPLAY_TEST);
 933  0377 ae01f4        	ldw	x,#500
 934  037a 89            	pushw	x
 935  037b ae0000        	ldw	x,#0
 936  037e 89            	pushw	x
 937  037f cd0000        	call	_delay
 939  0382 5b04          	addw	sp,#4
 940                     ; 150     dp_off();
 942  0384 4b04          	push	#4
 943  0386 ae500f        	ldw	x,#20495
 944  0389 cd0000        	call	_GPIO_WriteLow
 946  038c 84            	pop	a
 947                     ; 151 }
 950  038d 81            	ret
 973                     ; 154 void init_display(void)
 973                     ; 155 {
 974                     	switch	.text
 975  038e               _init_display:
 979                     ; 196 }
 982  038e 81            	ret
1016                     	xdef	_test_display
1017                     	xdef	_wr_digit
1018                     	xdef	_dec2bcd
1019                     	xdef	_display_num
1020                     	xdef	_display_test
1021                     	xref	_delay
1022                     	xdef	_set_display
1023                     	xdef	_tmr_display
1024                     	xdef	_task_display
1025                     	xdef	_init_display
1026                     	xref	_GPIO_WriteLow
1027                     	xref	_GPIO_WriteHigh
1046                     	end
