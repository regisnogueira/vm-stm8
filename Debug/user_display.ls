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
 251                     ; 123 void task_display(void)
 251                     ; 124 {
 252                     	switch	.text
 253  0020               _task_display:
 257                     ; 130 }
 260  0020 81            	ret
 283                     ; 132 void tmr_display(void)
 283                     ; 133 {
 284                     	switch	.text
 285  0021               _tmr_display:
 289                     ; 166 }
 292  0021 81            	ret
 318                     ; 169 void test_display(void)
 318                     ; 170 {
 319                     	switch	.text
 320  0022               _test_display:
 324                     ; 171     delay(DELAY_DISPLAY_TEST);
 326  0022 ae00fa        	ldw	x,#250
 327  0025 89            	pushw	x
 328  0026 ae0000        	ldw	x,#0
 329  0029 89            	pushw	x
 330  002a cd0000        	call	_delay
 332  002d 5b04          	addw	sp,#4
 333                     ; 172     display_zero();
 335  002f 4b20          	push	#32
 336  0031 ae500f        	ldw	x,#20495
 337  0034 cd0000        	call	_GPIO_WriteHigh
 339  0037 84            	pop	a
 342  0038 4b04          	push	#4
 343  003a ae5000        	ldw	x,#20480
 344  003d cd0000        	call	_GPIO_WriteHigh
 346  0040 84            	pop	a
 349  0041 4b80          	push	#128
 350  0043 ae500a        	ldw	x,#20490
 351  0046 cd0000        	call	_GPIO_WriteHigh
 353  0049 84            	pop	a
 356  004a 4b08          	push	#8
 357  004c ae500f        	ldw	x,#20495
 358  004f cd0000        	call	_GPIO_WriteHigh
 360  0052 84            	pop	a
 363  0053 4b02          	push	#2
 364  0055 ae500f        	ldw	x,#20495
 365  0058 cd0000        	call	_GPIO_WriteHigh
 367  005b 84            	pop	a
 370  005c 4b02          	push	#2
 371  005e ae5000        	ldw	x,#20480
 372  0061 cd0000        	call	_GPIO_WriteHigh
 374  0064 84            	pop	a
 377  0065 4b40          	push	#64
 378  0067 ae500a        	ldw	x,#20490
 379  006a cd0000        	call	_GPIO_WriteLow
 381  006d 84            	pop	a
 382                     ; 173     delay(DELAY_DISPLAY_TEST);
 384  006e ae00fa        	ldw	x,#250
 385  0071 89            	pushw	x
 386  0072 ae0000        	ldw	x,#0
 387  0075 89            	pushw	x
 388  0076 cd0000        	call	_delay
 390  0079 5b04          	addw	sp,#4
 391                     ; 174     display_one();
 393  007b 4b20          	push	#32
 394  007d ae500f        	ldw	x,#20495
 395  0080 cd0000        	call	_GPIO_WriteLow
 397  0083 84            	pop	a
 400  0084 4b04          	push	#4
 401  0086 ae5000        	ldw	x,#20480
 402  0089 cd0000        	call	_GPIO_WriteHigh
 404  008c 84            	pop	a
 407  008d 4b80          	push	#128
 408  008f ae500a        	ldw	x,#20490
 409  0092 cd0000        	call	_GPIO_WriteHigh
 411  0095 84            	pop	a
 414  0096 4b08          	push	#8
 415  0098 ae500f        	ldw	x,#20495
 416  009b cd0000        	call	_GPIO_WriteLow
 418  009e 84            	pop	a
 421  009f 4b02          	push	#2
 422  00a1 ae500f        	ldw	x,#20495
 423  00a4 cd0000        	call	_GPIO_WriteLow
 425  00a7 84            	pop	a
 428  00a8 4b02          	push	#2
 429  00aa ae5000        	ldw	x,#20480
 430  00ad cd0000        	call	_GPIO_WriteLow
 432  00b0 84            	pop	a
 435  00b1 4b40          	push	#64
 436  00b3 ae500a        	ldw	x,#20490
 437  00b6 cd0000        	call	_GPIO_WriteLow
 439  00b9 84            	pop	a
 440                     ; 175     delay(DELAY_DISPLAY_TEST);
 442  00ba ae00fa        	ldw	x,#250
 443  00bd 89            	pushw	x
 444  00be ae0000        	ldw	x,#0
 445  00c1 89            	pushw	x
 446  00c2 cd0000        	call	_delay
 448  00c5 5b04          	addw	sp,#4
 449                     ; 176     display_two();
 451  00c7 4b20          	push	#32
 452  00c9 ae500f        	ldw	x,#20495
 453  00cc cd0000        	call	_GPIO_WriteHigh
 455  00cf 84            	pop	a
 458  00d0 4b04          	push	#4
 459  00d2 ae5000        	ldw	x,#20480
 460  00d5 cd0000        	call	_GPIO_WriteHigh
 462  00d8 84            	pop	a
 465  00d9 4b80          	push	#128
 466  00db ae500a        	ldw	x,#20490
 467  00de cd0000        	call	_GPIO_WriteLow
 469  00e1 84            	pop	a
 472  00e2 4b08          	push	#8
 473  00e4 ae500f        	ldw	x,#20495
 474  00e7 cd0000        	call	_GPIO_WriteHigh
 476  00ea 84            	pop	a
 479  00eb 4b02          	push	#2
 480  00ed ae500f        	ldw	x,#20495
 481  00f0 cd0000        	call	_GPIO_WriteHigh
 483  00f3 84            	pop	a
 486  00f4 4b02          	push	#2
 487  00f6 ae5000        	ldw	x,#20480
 488  00f9 cd0000        	call	_GPIO_WriteLow
 490  00fc 84            	pop	a
 493  00fd 4b40          	push	#64
 494  00ff ae500a        	ldw	x,#20490
 495  0102 cd0000        	call	_GPIO_WriteHigh
 497  0105 84            	pop	a
 498                     ; 177     delay(DELAY_DISPLAY_TEST);
 500  0106 ae00fa        	ldw	x,#250
 501  0109 89            	pushw	x
 502  010a ae0000        	ldw	x,#0
 503  010d 89            	pushw	x
 504  010e cd0000        	call	_delay
 506  0111 5b04          	addw	sp,#4
 507                     ; 178     display_three();
 509  0113 4b20          	push	#32
 510  0115 ae500f        	ldw	x,#20495
 511  0118 cd0000        	call	_GPIO_WriteHigh
 513  011b 84            	pop	a
 516  011c 4b04          	push	#4
 517  011e ae5000        	ldw	x,#20480
 518  0121 cd0000        	call	_GPIO_WriteHigh
 520  0124 84            	pop	a
 523  0125 4b80          	push	#128
 524  0127 ae500a        	ldw	x,#20490
 525  012a cd0000        	call	_GPIO_WriteHigh
 527  012d 84            	pop	a
 530  012e 4b08          	push	#8
 531  0130 ae500f        	ldw	x,#20495
 532  0133 cd0000        	call	_GPIO_WriteHigh
 534  0136 84            	pop	a
 537  0137 4b02          	push	#2
 538  0139 ae500f        	ldw	x,#20495
 539  013c cd0000        	call	_GPIO_WriteLow
 541  013f 84            	pop	a
 544  0140 4b02          	push	#2
 545  0142 ae5000        	ldw	x,#20480
 546  0145 cd0000        	call	_GPIO_WriteLow
 548  0148 84            	pop	a
 551  0149 4b40          	push	#64
 552  014b ae500a        	ldw	x,#20490
 553  014e cd0000        	call	_GPIO_WriteHigh
 555  0151 84            	pop	a
 556                     ; 179     delay(DELAY_DISPLAY_TEST);
 558  0152 ae00fa        	ldw	x,#250
 559  0155 89            	pushw	x
 560  0156 ae0000        	ldw	x,#0
 561  0159 89            	pushw	x
 562  015a cd0000        	call	_delay
 564  015d 5b04          	addw	sp,#4
 565                     ; 180     display_four();
 567  015f 4b20          	push	#32
 568  0161 ae500f        	ldw	x,#20495
 569  0164 cd0000        	call	_GPIO_WriteLow
 571  0167 84            	pop	a
 574  0168 4b04          	push	#4
 575  016a ae5000        	ldw	x,#20480
 576  016d cd0000        	call	_GPIO_WriteHigh
 578  0170 84            	pop	a
 581  0171 4b80          	push	#128
 582  0173 ae500a        	ldw	x,#20490
 583  0176 cd0000        	call	_GPIO_WriteHigh
 585  0179 84            	pop	a
 588  017a 4b08          	push	#8
 589  017c ae500f        	ldw	x,#20495
 590  017f cd0000        	call	_GPIO_WriteLow
 592  0182 84            	pop	a
 595  0183 4b02          	push	#2
 596  0185 ae500f        	ldw	x,#20495
 597  0188 cd0000        	call	_GPIO_WriteLow
 599  018b 84            	pop	a
 602  018c 4b02          	push	#2
 603  018e ae5000        	ldw	x,#20480
 604  0191 cd0000        	call	_GPIO_WriteHigh
 606  0194 84            	pop	a
 609  0195 4b40          	push	#64
 610  0197 ae500a        	ldw	x,#20490
 611  019a cd0000        	call	_GPIO_WriteHigh
 613  019d 84            	pop	a
 614                     ; 181     delay(DELAY_DISPLAY_TEST);
 616  019e ae00fa        	ldw	x,#250
 617  01a1 89            	pushw	x
 618  01a2 ae0000        	ldw	x,#0
 619  01a5 89            	pushw	x
 620  01a6 cd0000        	call	_delay
 622  01a9 5b04          	addw	sp,#4
 623                     ; 182     display_five();
 625  01ab 4b20          	push	#32
 626  01ad ae500f        	ldw	x,#20495
 627  01b0 cd0000        	call	_GPIO_WriteHigh
 629  01b3 84            	pop	a
 632  01b4 4b04          	push	#4
 633  01b6 ae5000        	ldw	x,#20480
 634  01b9 cd0000        	call	_GPIO_WriteLow
 636  01bc 84            	pop	a
 639  01bd 4b80          	push	#128
 640  01bf ae500a        	ldw	x,#20490
 641  01c2 cd0000        	call	_GPIO_WriteHigh
 643  01c5 84            	pop	a
 646  01c6 4b08          	push	#8
 647  01c8 ae500f        	ldw	x,#20495
 648  01cb cd0000        	call	_GPIO_WriteHigh
 650  01ce 84            	pop	a
 653  01cf 4b02          	push	#2
 654  01d1 ae500f        	ldw	x,#20495
 655  01d4 cd0000        	call	_GPIO_WriteLow
 657  01d7 84            	pop	a
 660  01d8 4b02          	push	#2
 661  01da ae5000        	ldw	x,#20480
 662  01dd cd0000        	call	_GPIO_WriteHigh
 664  01e0 84            	pop	a
 667  01e1 4b40          	push	#64
 668  01e3 ae500a        	ldw	x,#20490
 669  01e6 cd0000        	call	_GPIO_WriteHigh
 671  01e9 84            	pop	a
 672                     ; 183     delay(DELAY_DISPLAY_TEST);
 674  01ea ae00fa        	ldw	x,#250
 675  01ed 89            	pushw	x
 676  01ee ae0000        	ldw	x,#0
 677  01f1 89            	pushw	x
 678  01f2 cd0000        	call	_delay
 680  01f5 5b04          	addw	sp,#4
 681                     ; 184     display_six();
 683  01f7 4b20          	push	#32
 684  01f9 ae500f        	ldw	x,#20495
 685  01fc cd0000        	call	_GPIO_WriteHigh
 687  01ff 84            	pop	a
 690  0200 4b04          	push	#4
 691  0202 ae5000        	ldw	x,#20480
 692  0205 cd0000        	call	_GPIO_WriteLow
 694  0208 84            	pop	a
 697  0209 4b80          	push	#128
 698  020b ae500a        	ldw	x,#20490
 699  020e cd0000        	call	_GPIO_WriteHigh
 701  0211 84            	pop	a
 704  0212 4b08          	push	#8
 705  0214 ae500f        	ldw	x,#20495
 706  0217 cd0000        	call	_GPIO_WriteHigh
 708  021a 84            	pop	a
 711  021b 4b02          	push	#2
 712  021d ae500f        	ldw	x,#20495
 713  0220 cd0000        	call	_GPIO_WriteHigh
 715  0223 84            	pop	a
 718  0224 4b02          	push	#2
 719  0226 ae5000        	ldw	x,#20480
 720  0229 cd0000        	call	_GPIO_WriteHigh
 722  022c 84            	pop	a
 725  022d 4b40          	push	#64
 726  022f ae500a        	ldw	x,#20490
 727  0232 cd0000        	call	_GPIO_WriteHigh
 729  0235 84            	pop	a
 730                     ; 185     delay(DELAY_DISPLAY_TEST);
 732  0236 ae00fa        	ldw	x,#250
 733  0239 89            	pushw	x
 734  023a ae0000        	ldw	x,#0
 735  023d 89            	pushw	x
 736  023e cd0000        	call	_delay
 738  0241 5b04          	addw	sp,#4
 739                     ; 186     display_seven();
 741  0243 4b20          	push	#32
 742  0245 ae500f        	ldw	x,#20495
 743  0248 cd0000        	call	_GPIO_WriteHigh
 745  024b 84            	pop	a
 748  024c 4b04          	push	#4
 749  024e ae5000        	ldw	x,#20480
 750  0251 cd0000        	call	_GPIO_WriteHigh
 752  0254 84            	pop	a
 755  0255 4b80          	push	#128
 756  0257 ae500a        	ldw	x,#20490
 757  025a cd0000        	call	_GPIO_WriteHigh
 759  025d 84            	pop	a
 762  025e 4b08          	push	#8
 763  0260 ae500f        	ldw	x,#20495
 764  0263 cd0000        	call	_GPIO_WriteLow
 766  0266 84            	pop	a
 769  0267 4b02          	push	#2
 770  0269 ae500f        	ldw	x,#20495
 771  026c cd0000        	call	_GPIO_WriteLow
 773  026f 84            	pop	a
 776  0270 4b02          	push	#2
 777  0272 ae5000        	ldw	x,#20480
 778  0275 cd0000        	call	_GPIO_WriteLow
 780  0278 84            	pop	a
 783  0279 4b40          	push	#64
 784  027b ae500a        	ldw	x,#20490
 785  027e cd0000        	call	_GPIO_WriteLow
 787  0281 84            	pop	a
 788                     ; 187     delay(DELAY_DISPLAY_TEST);
 790  0282 ae00fa        	ldw	x,#250
 791  0285 89            	pushw	x
 792  0286 ae0000        	ldw	x,#0
 793  0289 89            	pushw	x
 794  028a cd0000        	call	_delay
 796  028d 5b04          	addw	sp,#4
 797                     ; 188     display_eight();
 799  028f 4b20          	push	#32
 800  0291 ae500f        	ldw	x,#20495
 801  0294 cd0000        	call	_GPIO_WriteHigh
 803  0297 84            	pop	a
 806  0298 4b04          	push	#4
 807  029a ae5000        	ldw	x,#20480
 808  029d cd0000        	call	_GPIO_WriteHigh
 810  02a0 84            	pop	a
 813  02a1 4b80          	push	#128
 814  02a3 ae500a        	ldw	x,#20490
 815  02a6 cd0000        	call	_GPIO_WriteHigh
 817  02a9 84            	pop	a
 820  02aa 4b08          	push	#8
 821  02ac ae500f        	ldw	x,#20495
 822  02af cd0000        	call	_GPIO_WriteHigh
 824  02b2 84            	pop	a
 827  02b3 4b02          	push	#2
 828  02b5 ae500f        	ldw	x,#20495
 829  02b8 cd0000        	call	_GPIO_WriteHigh
 831  02bb 84            	pop	a
 834  02bc 4b02          	push	#2
 835  02be ae5000        	ldw	x,#20480
 836  02c1 cd0000        	call	_GPIO_WriteHigh
 838  02c4 84            	pop	a
 841  02c5 4b40          	push	#64
 842  02c7 ae500a        	ldw	x,#20490
 843  02ca cd0000        	call	_GPIO_WriteHigh
 845  02cd 84            	pop	a
 846                     ; 189     delay(DELAY_DISPLAY_TEST);
 848  02ce ae00fa        	ldw	x,#250
 849  02d1 89            	pushw	x
 850  02d2 ae0000        	ldw	x,#0
 851  02d5 89            	pushw	x
 852  02d6 cd0000        	call	_delay
 854  02d9 5b04          	addw	sp,#4
 855                     ; 190     display_nine();    
 857  02db 4b20          	push	#32
 858  02dd ae500f        	ldw	x,#20495
 859  02e0 cd0000        	call	_GPIO_WriteHigh
 861  02e3 84            	pop	a
 864  02e4 4b04          	push	#4
 865  02e6 ae5000        	ldw	x,#20480
 866  02e9 cd0000        	call	_GPIO_WriteHigh
 868  02ec 84            	pop	a
 871  02ed 4b80          	push	#128
 872  02ef ae500a        	ldw	x,#20490
 873  02f2 cd0000        	call	_GPIO_WriteHigh
 875  02f5 84            	pop	a
 878  02f6 4b08          	push	#8
 879  02f8 ae500f        	ldw	x,#20495
 880  02fb cd0000        	call	_GPIO_WriteHigh
 882  02fe 84            	pop	a
 885  02ff 4b02          	push	#2
 886  0301 ae500f        	ldw	x,#20495
 887  0304 cd0000        	call	_GPIO_WriteLow
 889  0307 84            	pop	a
 892  0308 4b02          	push	#2
 893  030a ae5000        	ldw	x,#20480
 894  030d cd0000        	call	_GPIO_WriteHigh
 896  0310 84            	pop	a
 899  0311 4b40          	push	#64
 900  0313 ae500a        	ldw	x,#20490
 901  0316 cd0000        	call	_GPIO_WriteHigh
 903  0319 84            	pop	a
 904                     ; 191     delay(DELAY_DISPLAY_TEST);
 906  031a ae00fa        	ldw	x,#250
 907  031d 89            	pushw	x
 908  031e ae0000        	ldw	x,#0
 909  0321 89            	pushw	x
 910  0322 cd0000        	call	_delay
 912  0325 5b04          	addw	sp,#4
 913                     ; 192     display_off();
 915  0327 4b20          	push	#32
 916  0329 ae500f        	ldw	x,#20495
 917  032c cd0000        	call	_GPIO_WriteLow
 919  032f 84            	pop	a
 922  0330 4b04          	push	#4
 923  0332 ae5000        	ldw	x,#20480
 924  0335 cd0000        	call	_GPIO_WriteLow
 926  0338 84            	pop	a
 929  0339 4b80          	push	#128
 930  033b ae500a        	ldw	x,#20490
 931  033e cd0000        	call	_GPIO_WriteLow
 933  0341 84            	pop	a
 936  0342 4b08          	push	#8
 937  0344 ae500f        	ldw	x,#20495
 938  0347 cd0000        	call	_GPIO_WriteLow
 940  034a 84            	pop	a
 943  034b 4b02          	push	#2
 944  034d ae500f        	ldw	x,#20495
 945  0350 cd0000        	call	_GPIO_WriteLow
 947  0353 84            	pop	a
 950  0354 4b02          	push	#2
 951  0356 ae5000        	ldw	x,#20480
 952  0359 cd0000        	call	_GPIO_WriteLow
 954  035c 84            	pop	a
 957  035d 4b40          	push	#64
 958  035f ae500a        	ldw	x,#20490
 959  0362 cd0000        	call	_GPIO_WriteLow
 961  0365 84            	pop	a
 964  0366 4b04          	push	#4
 965  0368 ae500f        	ldw	x,#20495
 966  036b cd0000        	call	_GPIO_WriteLow
 968  036e 84            	pop	a
 969                     ; 193     dp_on();
 972  036f 4b04          	push	#4
 973  0371 ae500f        	ldw	x,#20495
 974  0374 cd0000        	call	_GPIO_WriteHigh
 976  0377 84            	pop	a
 977                     ; 194     delay(DELAY_DISPLAY_TEST);
 979  0378 ae00fa        	ldw	x,#250
 980  037b 89            	pushw	x
 981  037c ae0000        	ldw	x,#0
 982  037f 89            	pushw	x
 983  0380 cd0000        	call	_delay
 985  0383 5b04          	addw	sp,#4
 986                     ; 195     dp_off();
 988  0385 4b04          	push	#4
 989  0387 ae500f        	ldw	x,#20495
 990  038a cd0000        	call	_GPIO_WriteLow
 992  038d 84            	pop	a
 993                     ; 196 }
 996  038e 81            	ret
1019                     ; 199 void init_display(void)
1019                     ; 200 {
1020                     	switch	.text
1021  038f               _init_display:
1025                     ; 239 }
1028  038f 81            	ret
1072                     	xdef	_test_display
1073                     	xdef	_wr_digit
1074                     	xdef	_dec2bcd
1075                     	xdef	_dp
1076                     	xdef	_display_num
1077                     	xdef	_display_test
1078                     	xref	_delay
1079                     	xdef	_set_display_option
1080                     	xdef	_set_display_value
1081                     	xdef	_tmr_display
1082                     	xdef	_task_display
1083                     	xdef	_init_display
1084                     	xref	_GPIO_WriteLow
1085                     	xref	_GPIO_WriteHigh
1104                     	end
