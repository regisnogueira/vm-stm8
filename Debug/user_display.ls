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
 133                     ; 26 void set_display_value(uint8_t value, uint8_t _dp)
 133                     ; 27 {
 134                     	switch	.text
 135  001d               _set_display_value:
 139                     ; 38 }
 142  001d 81            	ret
 176                     ; 40 void set_display_option(uint8_t option, uint8_t _dp)
 176                     ; 41 {
 177                     	switch	.text
 178  001e               _set_display_option:
 182                     ; 46 }
 185  001e 81            	ret
 219                     ; 48 void wr_digit(uint8_t dig_pos)
 219                     ; 49 {
 220                     	switch	.text
 221  001f               _wr_digit:
 225                     ; 121 }
 228  001f 81            	ret
 251                     ; 123 void tmr_display(void)
 251                     ; 124 {
 252                     	switch	.text
 253  0020               _tmr_display:
 257                     ; 157 }
 260  0020 81            	ret
 286                     ; 160 void test_display(void)
 286                     ; 161 {
 287                     	switch	.text
 288  0021               _test_display:
 292                     ; 162     delay(DELAY_DISPLAY_TEST);
 294  0021 ae00fa        	ldw	x,#250
 295  0024 89            	pushw	x
 296  0025 ae0000        	ldw	x,#0
 297  0028 89            	pushw	x
 298  0029 cd0000        	call	_delay
 300  002c 5b04          	addw	sp,#4
 301                     ; 163     display_zero();
 303  002e 4b20          	push	#32
 304  0030 ae500f        	ldw	x,#20495
 305  0033 cd0000        	call	_GPIO_WriteHigh
 307  0036 84            	pop	a
 310  0037 4b04          	push	#4
 311  0039 ae5000        	ldw	x,#20480
 312  003c cd0000        	call	_GPIO_WriteHigh
 314  003f 84            	pop	a
 317  0040 4b80          	push	#128
 318  0042 ae500a        	ldw	x,#20490
 319  0045 cd0000        	call	_GPIO_WriteHigh
 321  0048 84            	pop	a
 324  0049 4b08          	push	#8
 325  004b ae500f        	ldw	x,#20495
 326  004e cd0000        	call	_GPIO_WriteHigh
 328  0051 84            	pop	a
 331  0052 4b02          	push	#2
 332  0054 ae500f        	ldw	x,#20495
 333  0057 cd0000        	call	_GPIO_WriteHigh
 335  005a 84            	pop	a
 338  005b 4b02          	push	#2
 339  005d ae5000        	ldw	x,#20480
 340  0060 cd0000        	call	_GPIO_WriteHigh
 342  0063 84            	pop	a
 345  0064 4b40          	push	#64
 346  0066 ae500a        	ldw	x,#20490
 347  0069 cd0000        	call	_GPIO_WriteLow
 349  006c 84            	pop	a
 350                     ; 164     delay(DELAY_DISPLAY_TEST);
 352  006d ae00fa        	ldw	x,#250
 353  0070 89            	pushw	x
 354  0071 ae0000        	ldw	x,#0
 355  0074 89            	pushw	x
 356  0075 cd0000        	call	_delay
 358  0078 5b04          	addw	sp,#4
 359                     ; 165     display_one();
 361  007a 4b20          	push	#32
 362  007c ae500f        	ldw	x,#20495
 363  007f cd0000        	call	_GPIO_WriteLow
 365  0082 84            	pop	a
 368  0083 4b04          	push	#4
 369  0085 ae5000        	ldw	x,#20480
 370  0088 cd0000        	call	_GPIO_WriteHigh
 372  008b 84            	pop	a
 375  008c 4b80          	push	#128
 376  008e ae500a        	ldw	x,#20490
 377  0091 cd0000        	call	_GPIO_WriteHigh
 379  0094 84            	pop	a
 382  0095 4b08          	push	#8
 383  0097 ae500f        	ldw	x,#20495
 384  009a cd0000        	call	_GPIO_WriteLow
 386  009d 84            	pop	a
 389  009e 4b02          	push	#2
 390  00a0 ae500f        	ldw	x,#20495
 391  00a3 cd0000        	call	_GPIO_WriteLow
 393  00a6 84            	pop	a
 396  00a7 4b02          	push	#2
 397  00a9 ae5000        	ldw	x,#20480
 398  00ac cd0000        	call	_GPIO_WriteLow
 400  00af 84            	pop	a
 403  00b0 4b40          	push	#64
 404  00b2 ae500a        	ldw	x,#20490
 405  00b5 cd0000        	call	_GPIO_WriteLow
 407  00b8 84            	pop	a
 408                     ; 166     delay(DELAY_DISPLAY_TEST);
 410  00b9 ae00fa        	ldw	x,#250
 411  00bc 89            	pushw	x
 412  00bd ae0000        	ldw	x,#0
 413  00c0 89            	pushw	x
 414  00c1 cd0000        	call	_delay
 416  00c4 5b04          	addw	sp,#4
 417                     ; 167     display_two();
 419  00c6 4b20          	push	#32
 420  00c8 ae500f        	ldw	x,#20495
 421  00cb cd0000        	call	_GPIO_WriteHigh
 423  00ce 84            	pop	a
 426  00cf 4b04          	push	#4
 427  00d1 ae5000        	ldw	x,#20480
 428  00d4 cd0000        	call	_GPIO_WriteHigh
 430  00d7 84            	pop	a
 433  00d8 4b80          	push	#128
 434  00da ae500a        	ldw	x,#20490
 435  00dd cd0000        	call	_GPIO_WriteLow
 437  00e0 84            	pop	a
 440  00e1 4b08          	push	#8
 441  00e3 ae500f        	ldw	x,#20495
 442  00e6 cd0000        	call	_GPIO_WriteHigh
 444  00e9 84            	pop	a
 447  00ea 4b02          	push	#2
 448  00ec ae500f        	ldw	x,#20495
 449  00ef cd0000        	call	_GPIO_WriteHigh
 451  00f2 84            	pop	a
 454  00f3 4b02          	push	#2
 455  00f5 ae5000        	ldw	x,#20480
 456  00f8 cd0000        	call	_GPIO_WriteLow
 458  00fb 84            	pop	a
 461  00fc 4b40          	push	#64
 462  00fe ae500a        	ldw	x,#20490
 463  0101 cd0000        	call	_GPIO_WriteHigh
 465  0104 84            	pop	a
 466                     ; 168     delay(DELAY_DISPLAY_TEST);
 468  0105 ae00fa        	ldw	x,#250
 469  0108 89            	pushw	x
 470  0109 ae0000        	ldw	x,#0
 471  010c 89            	pushw	x
 472  010d cd0000        	call	_delay
 474  0110 5b04          	addw	sp,#4
 475                     ; 169     display_three();
 477  0112 4b20          	push	#32
 478  0114 ae500f        	ldw	x,#20495
 479  0117 cd0000        	call	_GPIO_WriteHigh
 481  011a 84            	pop	a
 484  011b 4b04          	push	#4
 485  011d ae5000        	ldw	x,#20480
 486  0120 cd0000        	call	_GPIO_WriteHigh
 488  0123 84            	pop	a
 491  0124 4b80          	push	#128
 492  0126 ae500a        	ldw	x,#20490
 493  0129 cd0000        	call	_GPIO_WriteHigh
 495  012c 84            	pop	a
 498  012d 4b08          	push	#8
 499  012f ae500f        	ldw	x,#20495
 500  0132 cd0000        	call	_GPIO_WriteHigh
 502  0135 84            	pop	a
 505  0136 4b02          	push	#2
 506  0138 ae500f        	ldw	x,#20495
 507  013b cd0000        	call	_GPIO_WriteLow
 509  013e 84            	pop	a
 512  013f 4b02          	push	#2
 513  0141 ae5000        	ldw	x,#20480
 514  0144 cd0000        	call	_GPIO_WriteLow
 516  0147 84            	pop	a
 519  0148 4b40          	push	#64
 520  014a ae500a        	ldw	x,#20490
 521  014d cd0000        	call	_GPIO_WriteHigh
 523  0150 84            	pop	a
 524                     ; 170     delay(DELAY_DISPLAY_TEST);
 526  0151 ae00fa        	ldw	x,#250
 527  0154 89            	pushw	x
 528  0155 ae0000        	ldw	x,#0
 529  0158 89            	pushw	x
 530  0159 cd0000        	call	_delay
 532  015c 5b04          	addw	sp,#4
 533                     ; 171     display_four();
 535  015e 4b20          	push	#32
 536  0160 ae500f        	ldw	x,#20495
 537  0163 cd0000        	call	_GPIO_WriteLow
 539  0166 84            	pop	a
 542  0167 4b04          	push	#4
 543  0169 ae5000        	ldw	x,#20480
 544  016c cd0000        	call	_GPIO_WriteHigh
 546  016f 84            	pop	a
 549  0170 4b80          	push	#128
 550  0172 ae500a        	ldw	x,#20490
 551  0175 cd0000        	call	_GPIO_WriteHigh
 553  0178 84            	pop	a
 556  0179 4b08          	push	#8
 557  017b ae500f        	ldw	x,#20495
 558  017e cd0000        	call	_GPIO_WriteLow
 560  0181 84            	pop	a
 563  0182 4b02          	push	#2
 564  0184 ae500f        	ldw	x,#20495
 565  0187 cd0000        	call	_GPIO_WriteLow
 567  018a 84            	pop	a
 570  018b 4b02          	push	#2
 571  018d ae5000        	ldw	x,#20480
 572  0190 cd0000        	call	_GPIO_WriteHigh
 574  0193 84            	pop	a
 577  0194 4b40          	push	#64
 578  0196 ae500a        	ldw	x,#20490
 579  0199 cd0000        	call	_GPIO_WriteHigh
 581  019c 84            	pop	a
 582                     ; 172     delay(DELAY_DISPLAY_TEST);
 584  019d ae00fa        	ldw	x,#250
 585  01a0 89            	pushw	x
 586  01a1 ae0000        	ldw	x,#0
 587  01a4 89            	pushw	x
 588  01a5 cd0000        	call	_delay
 590  01a8 5b04          	addw	sp,#4
 591                     ; 173     display_five();
 593  01aa 4b20          	push	#32
 594  01ac ae500f        	ldw	x,#20495
 595  01af cd0000        	call	_GPIO_WriteHigh
 597  01b2 84            	pop	a
 600  01b3 4b04          	push	#4
 601  01b5 ae5000        	ldw	x,#20480
 602  01b8 cd0000        	call	_GPIO_WriteLow
 604  01bb 84            	pop	a
 607  01bc 4b80          	push	#128
 608  01be ae500a        	ldw	x,#20490
 609  01c1 cd0000        	call	_GPIO_WriteHigh
 611  01c4 84            	pop	a
 614  01c5 4b08          	push	#8
 615  01c7 ae500f        	ldw	x,#20495
 616  01ca cd0000        	call	_GPIO_WriteHigh
 618  01cd 84            	pop	a
 621  01ce 4b02          	push	#2
 622  01d0 ae500f        	ldw	x,#20495
 623  01d3 cd0000        	call	_GPIO_WriteLow
 625  01d6 84            	pop	a
 628  01d7 4b02          	push	#2
 629  01d9 ae5000        	ldw	x,#20480
 630  01dc cd0000        	call	_GPIO_WriteHigh
 632  01df 84            	pop	a
 635  01e0 4b40          	push	#64
 636  01e2 ae500a        	ldw	x,#20490
 637  01e5 cd0000        	call	_GPIO_WriteHigh
 639  01e8 84            	pop	a
 640                     ; 174     delay(DELAY_DISPLAY_TEST);
 642  01e9 ae00fa        	ldw	x,#250
 643  01ec 89            	pushw	x
 644  01ed ae0000        	ldw	x,#0
 645  01f0 89            	pushw	x
 646  01f1 cd0000        	call	_delay
 648  01f4 5b04          	addw	sp,#4
 649                     ; 175     display_six();
 651  01f6 4b20          	push	#32
 652  01f8 ae500f        	ldw	x,#20495
 653  01fb cd0000        	call	_GPIO_WriteHigh
 655  01fe 84            	pop	a
 658  01ff 4b04          	push	#4
 659  0201 ae5000        	ldw	x,#20480
 660  0204 cd0000        	call	_GPIO_WriteLow
 662  0207 84            	pop	a
 665  0208 4b80          	push	#128
 666  020a ae500a        	ldw	x,#20490
 667  020d cd0000        	call	_GPIO_WriteHigh
 669  0210 84            	pop	a
 672  0211 4b08          	push	#8
 673  0213 ae500f        	ldw	x,#20495
 674  0216 cd0000        	call	_GPIO_WriteHigh
 676  0219 84            	pop	a
 679  021a 4b02          	push	#2
 680  021c ae500f        	ldw	x,#20495
 681  021f cd0000        	call	_GPIO_WriteHigh
 683  0222 84            	pop	a
 686  0223 4b02          	push	#2
 687  0225 ae5000        	ldw	x,#20480
 688  0228 cd0000        	call	_GPIO_WriteHigh
 690  022b 84            	pop	a
 693  022c 4b40          	push	#64
 694  022e ae500a        	ldw	x,#20490
 695  0231 cd0000        	call	_GPIO_WriteHigh
 697  0234 84            	pop	a
 698                     ; 176     delay(DELAY_DISPLAY_TEST);
 700  0235 ae00fa        	ldw	x,#250
 701  0238 89            	pushw	x
 702  0239 ae0000        	ldw	x,#0
 703  023c 89            	pushw	x
 704  023d cd0000        	call	_delay
 706  0240 5b04          	addw	sp,#4
 707                     ; 177     display_seven();
 709  0242 4b20          	push	#32
 710  0244 ae500f        	ldw	x,#20495
 711  0247 cd0000        	call	_GPIO_WriteHigh
 713  024a 84            	pop	a
 716  024b 4b04          	push	#4
 717  024d ae5000        	ldw	x,#20480
 718  0250 cd0000        	call	_GPIO_WriteHigh
 720  0253 84            	pop	a
 723  0254 4b80          	push	#128
 724  0256 ae500a        	ldw	x,#20490
 725  0259 cd0000        	call	_GPIO_WriteHigh
 727  025c 84            	pop	a
 730  025d 4b08          	push	#8
 731  025f ae500f        	ldw	x,#20495
 732  0262 cd0000        	call	_GPIO_WriteLow
 734  0265 84            	pop	a
 737  0266 4b02          	push	#2
 738  0268 ae500f        	ldw	x,#20495
 739  026b cd0000        	call	_GPIO_WriteLow
 741  026e 84            	pop	a
 744  026f 4b02          	push	#2
 745  0271 ae5000        	ldw	x,#20480
 746  0274 cd0000        	call	_GPIO_WriteLow
 748  0277 84            	pop	a
 751  0278 4b40          	push	#64
 752  027a ae500a        	ldw	x,#20490
 753  027d cd0000        	call	_GPIO_WriteLow
 755  0280 84            	pop	a
 756                     ; 178     delay(DELAY_DISPLAY_TEST);
 758  0281 ae00fa        	ldw	x,#250
 759  0284 89            	pushw	x
 760  0285 ae0000        	ldw	x,#0
 761  0288 89            	pushw	x
 762  0289 cd0000        	call	_delay
 764  028c 5b04          	addw	sp,#4
 765                     ; 179     display_eight();
 767  028e 4b20          	push	#32
 768  0290 ae500f        	ldw	x,#20495
 769  0293 cd0000        	call	_GPIO_WriteHigh
 771  0296 84            	pop	a
 774  0297 4b04          	push	#4
 775  0299 ae5000        	ldw	x,#20480
 776  029c cd0000        	call	_GPIO_WriteHigh
 778  029f 84            	pop	a
 781  02a0 4b80          	push	#128
 782  02a2 ae500a        	ldw	x,#20490
 783  02a5 cd0000        	call	_GPIO_WriteHigh
 785  02a8 84            	pop	a
 788  02a9 4b08          	push	#8
 789  02ab ae500f        	ldw	x,#20495
 790  02ae cd0000        	call	_GPIO_WriteHigh
 792  02b1 84            	pop	a
 795  02b2 4b02          	push	#2
 796  02b4 ae500f        	ldw	x,#20495
 797  02b7 cd0000        	call	_GPIO_WriteHigh
 799  02ba 84            	pop	a
 802  02bb 4b02          	push	#2
 803  02bd ae5000        	ldw	x,#20480
 804  02c0 cd0000        	call	_GPIO_WriteHigh
 806  02c3 84            	pop	a
 809  02c4 4b40          	push	#64
 810  02c6 ae500a        	ldw	x,#20490
 811  02c9 cd0000        	call	_GPIO_WriteHigh
 813  02cc 84            	pop	a
 814                     ; 180     delay(DELAY_DISPLAY_TEST);
 816  02cd ae00fa        	ldw	x,#250
 817  02d0 89            	pushw	x
 818  02d1 ae0000        	ldw	x,#0
 819  02d4 89            	pushw	x
 820  02d5 cd0000        	call	_delay
 822  02d8 5b04          	addw	sp,#4
 823                     ; 181     display_nine();    
 825  02da 4b20          	push	#32
 826  02dc ae500f        	ldw	x,#20495
 827  02df cd0000        	call	_GPIO_WriteHigh
 829  02e2 84            	pop	a
 832  02e3 4b04          	push	#4
 833  02e5 ae5000        	ldw	x,#20480
 834  02e8 cd0000        	call	_GPIO_WriteHigh
 836  02eb 84            	pop	a
 839  02ec 4b80          	push	#128
 840  02ee ae500a        	ldw	x,#20490
 841  02f1 cd0000        	call	_GPIO_WriteHigh
 843  02f4 84            	pop	a
 846  02f5 4b08          	push	#8
 847  02f7 ae500f        	ldw	x,#20495
 848  02fa cd0000        	call	_GPIO_WriteHigh
 850  02fd 84            	pop	a
 853  02fe 4b02          	push	#2
 854  0300 ae500f        	ldw	x,#20495
 855  0303 cd0000        	call	_GPIO_WriteLow
 857  0306 84            	pop	a
 860  0307 4b02          	push	#2
 861  0309 ae5000        	ldw	x,#20480
 862  030c cd0000        	call	_GPIO_WriteHigh
 864  030f 84            	pop	a
 867  0310 4b40          	push	#64
 868  0312 ae500a        	ldw	x,#20490
 869  0315 cd0000        	call	_GPIO_WriteHigh
 871  0318 84            	pop	a
 872                     ; 182     delay(DELAY_DISPLAY_TEST);
 874  0319 ae00fa        	ldw	x,#250
 875  031c 89            	pushw	x
 876  031d ae0000        	ldw	x,#0
 877  0320 89            	pushw	x
 878  0321 cd0000        	call	_delay
 880  0324 5b04          	addw	sp,#4
 881                     ; 183     display_off();
 883  0326 4b20          	push	#32
 884  0328 ae500f        	ldw	x,#20495
 885  032b cd0000        	call	_GPIO_WriteLow
 887  032e 84            	pop	a
 890  032f 4b04          	push	#4
 891  0331 ae5000        	ldw	x,#20480
 892  0334 cd0000        	call	_GPIO_WriteLow
 894  0337 84            	pop	a
 897  0338 4b80          	push	#128
 898  033a ae500a        	ldw	x,#20490
 899  033d cd0000        	call	_GPIO_WriteLow
 901  0340 84            	pop	a
 904  0341 4b08          	push	#8
 905  0343 ae500f        	ldw	x,#20495
 906  0346 cd0000        	call	_GPIO_WriteLow
 908  0349 84            	pop	a
 911  034a 4b02          	push	#2
 912  034c ae500f        	ldw	x,#20495
 913  034f cd0000        	call	_GPIO_WriteLow
 915  0352 84            	pop	a
 918  0353 4b02          	push	#2
 919  0355 ae5000        	ldw	x,#20480
 920  0358 cd0000        	call	_GPIO_WriteLow
 922  035b 84            	pop	a
 925  035c 4b40          	push	#64
 926  035e ae500a        	ldw	x,#20490
 927  0361 cd0000        	call	_GPIO_WriteLow
 929  0364 84            	pop	a
 932  0365 4b04          	push	#4
 933  0367 ae500f        	ldw	x,#20495
 934  036a cd0000        	call	_GPIO_WriteLow
 936  036d 84            	pop	a
 937                     ; 184     dp_on();
 940  036e 4b04          	push	#4
 941  0370 ae500f        	ldw	x,#20495
 942  0373 cd0000        	call	_GPIO_WriteHigh
 944  0376 84            	pop	a
 945                     ; 185     delay(DELAY_DISPLAY_TEST);
 947  0377 ae00fa        	ldw	x,#250
 948  037a 89            	pushw	x
 949  037b ae0000        	ldw	x,#0
 950  037e 89            	pushw	x
 951  037f cd0000        	call	_delay
 953  0382 5b04          	addw	sp,#4
 954                     ; 186     dp_off();
 956  0384 4b04          	push	#4
 957  0386 ae500f        	ldw	x,#20495
 958  0389 cd0000        	call	_GPIO_WriteLow
 960  038c 84            	pop	a
 961                     ; 187 }
 964  038d 81            	ret
 987                     ; 190 void init_display(void)
 987                     ; 191 {
 988                     	switch	.text
 989  038e               _init_display:
 993                     ; 230 }
 996  038e 81            	ret
1040                     	xdef	_test_display
1041                     	xdef	_wr_digit
1042                     	xdef	_dec2bcd
1043                     	xdef	_dp
1044                     	xdef	_display_num
1045                     	xdef	_display_test
1046                     	xref	_delay
1047                     	xdef	_set_display_option
1048                     	xdef	_set_display_value
1049                     	xdef	_tmr_display
1050                     	xdef	_init_display
1051                     	xref	_GPIO_WriteLow
1052                     	xref	_GPIO_WriteHigh
1071                     	end
