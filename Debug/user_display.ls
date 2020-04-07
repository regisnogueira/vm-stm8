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
  61                     ; 20 uint8_t dec2bcd(uint8_t val)
  61                     ; 21 {
  63                     	switch	.text
  64  0000               _dec2bcd:
  66  0000 88            	push	a
  67  0001 88            	push	a
  68       00000001      OFST:	set	1
  71                     ; 22     return (uint8_t)((val/10*16) + (val%10));
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
 150                     ; 25 void set_display(uint8_t option, uint8_t value, uint8_t decimal)
 150                     ; 26 {
 151                     	switch	.text
 152  001d               _set_display:
 154  001d 89            	pushw	x
 155  001e 88            	push	a
 156       00000001      OFST:	set	1
 159                     ; 30     bcd = (uint8_t)dec2bcd(value);
 161  001f 9f            	ld	a,xl
 162  0020 adde          	call	_dec2bcd
 164  0022 6b01          	ld	(OFST+0,sp),a
 166                     ; 34     if (value > MAX_DISPLAY_VALUE)
 168  0024 7b03          	ld	a,(OFST+2,sp)
 169  0026 a164          	cp	a,#100
 170  0028 2504          	jrult	L55
 171                     ; 35         value = MAX_DISPLAY_VALUE;
 173  002a a663          	ld	a,#99
 174  002c 6b03          	ld	(OFST+2,sp),a
 175  002e               L55:
 176                     ; 37     display_num[DIG1_POS] = option;
 178  002e 7b02          	ld	a,(OFST+1,sp)
 179  0030 b701          	ld	_display_num,a
 180                     ; 38     display_num[DIG2_POS] = (uint8_t)(bcd >> 4);
 182  0032 7b01          	ld	a,(OFST+0,sp)
 183  0034 4e            	swap	a
 184  0035 a40f          	and	a,#15
 185  0037 b702          	ld	_display_num+1,a
 186                     ; 39     display_num[DIG3_POS] = (uint8_t)(bcd & 0x0F);
 188  0039 7b01          	ld	a,(OFST+0,sp)
 189  003b a40f          	and	a,#15
 190  003d b703          	ld	_display_num+2,a
 191                     ; 41 }
 194  003f 5b03          	addw	sp,#3
 195  0041 81            	ret
 232                     .const:	section	.text
 233  0000               L41:
 234  0000 009a          	dc.w	L75
 235  0002 00dd          	dc.w	L16
 236  0004 0120          	dc.w	L36
 237  0006 0163          	dc.w	L56
 238  0008 01a6          	dc.w	L76
 239  000a 01e9          	dc.w	L17
 240  000c 022c          	dc.w	L37
 241  000e 026f          	dc.w	L57
 242  0010 02b2          	dc.w	L77
 243  0012 02f5          	dc.w	L101
 244                     ; 43 void wr_digit(uint8_t dig_pos)
 244                     ; 44 {
 245                     	switch	.text
 246  0042               _wr_digit:
 250                     ; 46     switch (display_num[dig_pos]) {
 252  0042 5f            	clrw	x
 253  0043 97            	ld	xl,a
 254  0044 e601          	ld	a,(_display_num,x)
 256                     ; 106         break;
 257  0046 a10a          	cp	a,#10
 258  0048 2407          	jruge	L21
 259  004a 5f            	clrw	x
 260  004b 97            	ld	xl,a
 261  004c 58            	sllw	x
 262  004d de0000        	ldw	x,(L41,x)
 263  0050 fc            	jp	(x)
 264  0051               L21:
 265  0051 a041          	sub	a,#65
 266  0053 2603          	jrne	L61
 267  0055 cc0338        	jp	L301
 268  0058               L61:
 269  0058 a002          	sub	a,#2
 270  005a 2603          	jrne	L02
 271  005c cc03be        	jp	L701
 272  005f               L02:
 273  005f a002          	sub	a,#2
 274  0061 2603          	jrne	L22
 275  0063 cc0444        	jp	L311
 276  0066               L22:
 277  0066 4a            	dec	a
 278  0067 2603          	jrne	L42
 279  0069 cc0487        	jp	L511
 280  006c               L42:
 281  006c a002          	sub	a,#2
 282  006e 2603          	jrne	L62
 283  0070 cc04ca        	jp	L711
 284  0073               L62:
 285  0073 a004          	sub	a,#4
 286  0075 2603          	jrne	L03
 287  0077 cc050d        	jp	L121
 288  007a               L03:
 289  007a a004          	sub	a,#4
 290  007c 2603          	jrne	L23
 291  007e cc054f        	jp	L321
 292  0081               L23:
 293  0081 a005          	sub	a,#5
 294  0083 2603          	jrne	L43
 295  0085 cc0590        	jp	L521
 296  0088               L43:
 297  0088 a00d          	sub	a,#13
 298  008a 2603          	jrne	L63
 299  008c cc037b        	jp	L501
 300  008f               L63:
 301  008f a002          	sub	a,#2
 302  0091 2603          	jrne	L04
 303  0093 cc0401        	jp	L111
 304  0096               L04:
 305  0096 accf05cf      	jpf	L741
 306  009a               L75:
 307                     ; 47     case 0x00:
 307                     ; 48         display_zero();
 309  009a 4b20          	push	#32
 310  009c ae500f        	ldw	x,#20495
 311  009f cd0000        	call	_GPIO_WriteHigh
 313  00a2 84            	pop	a
 316  00a3 4b04          	push	#4
 317  00a5 ae5000        	ldw	x,#20480
 318  00a8 cd0000        	call	_GPIO_WriteHigh
 320  00ab 84            	pop	a
 323  00ac 4b80          	push	#128
 324  00ae ae500a        	ldw	x,#20490
 325  00b1 cd0000        	call	_GPIO_WriteHigh
 327  00b4 84            	pop	a
 330  00b5 4b08          	push	#8
 331  00b7 ae500f        	ldw	x,#20495
 332  00ba cd0000        	call	_GPIO_WriteHigh
 334  00bd 84            	pop	a
 337  00be 4b02          	push	#2
 338  00c0 ae500f        	ldw	x,#20495
 339  00c3 cd0000        	call	_GPIO_WriteHigh
 341  00c6 84            	pop	a
 344  00c7 4b02          	push	#2
 345  00c9 ae5000        	ldw	x,#20480
 346  00cc cd0000        	call	_GPIO_WriteHigh
 348  00cf 84            	pop	a
 351  00d0 4b40          	push	#64
 352  00d2 ae500a        	ldw	x,#20490
 353  00d5 cd0000        	call	_GPIO_WriteLow
 355  00d8 84            	pop	a
 356                     ; 49         break;
 358  00d9 accf05cf      	jpf	L741
 359  00dd               L16:
 360                     ; 50     case 0x01:
 360                     ; 51         display_one();
 362  00dd 4b20          	push	#32
 363  00df ae500f        	ldw	x,#20495
 364  00e2 cd0000        	call	_GPIO_WriteLow
 366  00e5 84            	pop	a
 369  00e6 4b04          	push	#4
 370  00e8 ae5000        	ldw	x,#20480
 371  00eb cd0000        	call	_GPIO_WriteHigh
 373  00ee 84            	pop	a
 376  00ef 4b80          	push	#128
 377  00f1 ae500a        	ldw	x,#20490
 378  00f4 cd0000        	call	_GPIO_WriteHigh
 380  00f7 84            	pop	a
 383  00f8 4b08          	push	#8
 384  00fa ae500f        	ldw	x,#20495
 385  00fd cd0000        	call	_GPIO_WriteLow
 387  0100 84            	pop	a
 390  0101 4b02          	push	#2
 391  0103 ae500f        	ldw	x,#20495
 392  0106 cd0000        	call	_GPIO_WriteLow
 394  0109 84            	pop	a
 397  010a 4b02          	push	#2
 398  010c ae5000        	ldw	x,#20480
 399  010f cd0000        	call	_GPIO_WriteLow
 401  0112 84            	pop	a
 404  0113 4b40          	push	#64
 405  0115 ae500a        	ldw	x,#20490
 406  0118 cd0000        	call	_GPIO_WriteLow
 408  011b 84            	pop	a
 409                     ; 52         break;
 411  011c accf05cf      	jpf	L741
 412  0120               L36:
 413                     ; 53     case 0x02:
 413                     ; 54         display_two();
 415  0120 4b20          	push	#32
 416  0122 ae500f        	ldw	x,#20495
 417  0125 cd0000        	call	_GPIO_WriteHigh
 419  0128 84            	pop	a
 422  0129 4b04          	push	#4
 423  012b ae5000        	ldw	x,#20480
 424  012e cd0000        	call	_GPIO_WriteHigh
 426  0131 84            	pop	a
 429  0132 4b80          	push	#128
 430  0134 ae500a        	ldw	x,#20490
 431  0137 cd0000        	call	_GPIO_WriteLow
 433  013a 84            	pop	a
 436  013b 4b08          	push	#8
 437  013d ae500f        	ldw	x,#20495
 438  0140 cd0000        	call	_GPIO_WriteHigh
 440  0143 84            	pop	a
 443  0144 4b02          	push	#2
 444  0146 ae500f        	ldw	x,#20495
 445  0149 cd0000        	call	_GPIO_WriteHigh
 447  014c 84            	pop	a
 450  014d 4b02          	push	#2
 451  014f ae5000        	ldw	x,#20480
 452  0152 cd0000        	call	_GPIO_WriteLow
 454  0155 84            	pop	a
 457  0156 4b40          	push	#64
 458  0158 ae500a        	ldw	x,#20490
 459  015b cd0000        	call	_GPIO_WriteHigh
 461  015e 84            	pop	a
 462                     ; 55         break;
 464  015f accf05cf      	jpf	L741
 465  0163               L56:
 466                     ; 56     case 0x03:
 466                     ; 57         display_three();
 468  0163 4b20          	push	#32
 469  0165 ae500f        	ldw	x,#20495
 470  0168 cd0000        	call	_GPIO_WriteHigh
 472  016b 84            	pop	a
 475  016c 4b04          	push	#4
 476  016e ae5000        	ldw	x,#20480
 477  0171 cd0000        	call	_GPIO_WriteHigh
 479  0174 84            	pop	a
 482  0175 4b80          	push	#128
 483  0177 ae500a        	ldw	x,#20490
 484  017a cd0000        	call	_GPIO_WriteHigh
 486  017d 84            	pop	a
 489  017e 4b08          	push	#8
 490  0180 ae500f        	ldw	x,#20495
 491  0183 cd0000        	call	_GPIO_WriteHigh
 493  0186 84            	pop	a
 496  0187 4b02          	push	#2
 497  0189 ae500f        	ldw	x,#20495
 498  018c cd0000        	call	_GPIO_WriteLow
 500  018f 84            	pop	a
 503  0190 4b02          	push	#2
 504  0192 ae5000        	ldw	x,#20480
 505  0195 cd0000        	call	_GPIO_WriteLow
 507  0198 84            	pop	a
 510  0199 4b40          	push	#64
 511  019b ae500a        	ldw	x,#20490
 512  019e cd0000        	call	_GPIO_WriteHigh
 514  01a1 84            	pop	a
 515                     ; 58         break;
 517  01a2 accf05cf      	jpf	L741
 518  01a6               L76:
 519                     ; 59     case 0x04:
 519                     ; 60         display_four();
 521  01a6 4b20          	push	#32
 522  01a8 ae500f        	ldw	x,#20495
 523  01ab cd0000        	call	_GPIO_WriteLow
 525  01ae 84            	pop	a
 528  01af 4b04          	push	#4
 529  01b1 ae5000        	ldw	x,#20480
 530  01b4 cd0000        	call	_GPIO_WriteHigh
 532  01b7 84            	pop	a
 535  01b8 4b80          	push	#128
 536  01ba ae500a        	ldw	x,#20490
 537  01bd cd0000        	call	_GPIO_WriteHigh
 539  01c0 84            	pop	a
 542  01c1 4b08          	push	#8
 543  01c3 ae500f        	ldw	x,#20495
 544  01c6 cd0000        	call	_GPIO_WriteLow
 546  01c9 84            	pop	a
 549  01ca 4b02          	push	#2
 550  01cc ae500f        	ldw	x,#20495
 551  01cf cd0000        	call	_GPIO_WriteLow
 553  01d2 84            	pop	a
 556  01d3 4b02          	push	#2
 557  01d5 ae5000        	ldw	x,#20480
 558  01d8 cd0000        	call	_GPIO_WriteHigh
 560  01db 84            	pop	a
 563  01dc 4b40          	push	#64
 564  01de ae500a        	ldw	x,#20490
 565  01e1 cd0000        	call	_GPIO_WriteHigh
 567  01e4 84            	pop	a
 568                     ; 61         break;
 570  01e5 accf05cf      	jpf	L741
 571  01e9               L17:
 572                     ; 62     case 0x05:
 572                     ; 63         display_five();
 574  01e9 4b20          	push	#32
 575  01eb ae500f        	ldw	x,#20495
 576  01ee cd0000        	call	_GPIO_WriteHigh
 578  01f1 84            	pop	a
 581  01f2 4b04          	push	#4
 582  01f4 ae5000        	ldw	x,#20480
 583  01f7 cd0000        	call	_GPIO_WriteLow
 585  01fa 84            	pop	a
 588  01fb 4b80          	push	#128
 589  01fd ae500a        	ldw	x,#20490
 590  0200 cd0000        	call	_GPIO_WriteHigh
 592  0203 84            	pop	a
 595  0204 4b08          	push	#8
 596  0206 ae500f        	ldw	x,#20495
 597  0209 cd0000        	call	_GPIO_WriteHigh
 599  020c 84            	pop	a
 602  020d 4b02          	push	#2
 603  020f ae500f        	ldw	x,#20495
 604  0212 cd0000        	call	_GPIO_WriteLow
 606  0215 84            	pop	a
 609  0216 4b02          	push	#2
 610  0218 ae5000        	ldw	x,#20480
 611  021b cd0000        	call	_GPIO_WriteHigh
 613  021e 84            	pop	a
 616  021f 4b40          	push	#64
 617  0221 ae500a        	ldw	x,#20490
 618  0224 cd0000        	call	_GPIO_WriteHigh
 620  0227 84            	pop	a
 621                     ; 64         break;
 623  0228 accf05cf      	jpf	L741
 624  022c               L37:
 625                     ; 65     case 0x06:
 625                     ; 66         display_six();
 627  022c 4b20          	push	#32
 628  022e ae500f        	ldw	x,#20495
 629  0231 cd0000        	call	_GPIO_WriteHigh
 631  0234 84            	pop	a
 634  0235 4b04          	push	#4
 635  0237 ae5000        	ldw	x,#20480
 636  023a cd0000        	call	_GPIO_WriteLow
 638  023d 84            	pop	a
 641  023e 4b80          	push	#128
 642  0240 ae500a        	ldw	x,#20490
 643  0243 cd0000        	call	_GPIO_WriteHigh
 645  0246 84            	pop	a
 648  0247 4b08          	push	#8
 649  0249 ae500f        	ldw	x,#20495
 650  024c cd0000        	call	_GPIO_WriteHigh
 652  024f 84            	pop	a
 655  0250 4b02          	push	#2
 656  0252 ae500f        	ldw	x,#20495
 657  0255 cd0000        	call	_GPIO_WriteHigh
 659  0258 84            	pop	a
 662  0259 4b02          	push	#2
 663  025b ae5000        	ldw	x,#20480
 664  025e cd0000        	call	_GPIO_WriteHigh
 666  0261 84            	pop	a
 669  0262 4b40          	push	#64
 670  0264 ae500a        	ldw	x,#20490
 671  0267 cd0000        	call	_GPIO_WriteHigh
 673  026a 84            	pop	a
 674                     ; 67         break;
 676  026b accf05cf      	jpf	L741
 677  026f               L57:
 678                     ; 68     case 0x07:
 678                     ; 69         display_seven();
 680  026f 4b20          	push	#32
 681  0271 ae500f        	ldw	x,#20495
 682  0274 cd0000        	call	_GPIO_WriteHigh
 684  0277 84            	pop	a
 687  0278 4b04          	push	#4
 688  027a ae5000        	ldw	x,#20480
 689  027d cd0000        	call	_GPIO_WriteHigh
 691  0280 84            	pop	a
 694  0281 4b80          	push	#128
 695  0283 ae500a        	ldw	x,#20490
 696  0286 cd0000        	call	_GPIO_WriteHigh
 698  0289 84            	pop	a
 701  028a 4b08          	push	#8
 702  028c ae500f        	ldw	x,#20495
 703  028f cd0000        	call	_GPIO_WriteLow
 705  0292 84            	pop	a
 708  0293 4b02          	push	#2
 709  0295 ae500f        	ldw	x,#20495
 710  0298 cd0000        	call	_GPIO_WriteLow
 712  029b 84            	pop	a
 715  029c 4b02          	push	#2
 716  029e ae5000        	ldw	x,#20480
 717  02a1 cd0000        	call	_GPIO_WriteLow
 719  02a4 84            	pop	a
 722  02a5 4b40          	push	#64
 723  02a7 ae500a        	ldw	x,#20490
 724  02aa cd0000        	call	_GPIO_WriteLow
 726  02ad 84            	pop	a
 727                     ; 70         break;
 729  02ae accf05cf      	jpf	L741
 730  02b2               L77:
 731                     ; 71     case 0x08:
 731                     ; 72         display_eight();
 733  02b2 4b20          	push	#32
 734  02b4 ae500f        	ldw	x,#20495
 735  02b7 cd0000        	call	_GPIO_WriteHigh
 737  02ba 84            	pop	a
 740  02bb 4b04          	push	#4
 741  02bd ae5000        	ldw	x,#20480
 742  02c0 cd0000        	call	_GPIO_WriteHigh
 744  02c3 84            	pop	a
 747  02c4 4b80          	push	#128
 748  02c6 ae500a        	ldw	x,#20490
 749  02c9 cd0000        	call	_GPIO_WriteHigh
 751  02cc 84            	pop	a
 754  02cd 4b08          	push	#8
 755  02cf ae500f        	ldw	x,#20495
 756  02d2 cd0000        	call	_GPIO_WriteHigh
 758  02d5 84            	pop	a
 761  02d6 4b02          	push	#2
 762  02d8 ae500f        	ldw	x,#20495
 763  02db cd0000        	call	_GPIO_WriteHigh
 765  02de 84            	pop	a
 768  02df 4b02          	push	#2
 769  02e1 ae5000        	ldw	x,#20480
 770  02e4 cd0000        	call	_GPIO_WriteHigh
 772  02e7 84            	pop	a
 775  02e8 4b40          	push	#64
 776  02ea ae500a        	ldw	x,#20490
 777  02ed cd0000        	call	_GPIO_WriteHigh
 779  02f0 84            	pop	a
 780                     ; 73         break;
 782  02f1 accf05cf      	jpf	L741
 783  02f5               L101:
 784                     ; 74     case 0x09:
 784                     ; 75         display_nine();
 786  02f5 4b20          	push	#32
 787  02f7 ae500f        	ldw	x,#20495
 788  02fa cd0000        	call	_GPIO_WriteHigh
 790  02fd 84            	pop	a
 793  02fe 4b04          	push	#4
 794  0300 ae5000        	ldw	x,#20480
 795  0303 cd0000        	call	_GPIO_WriteHigh
 797  0306 84            	pop	a
 800  0307 4b80          	push	#128
 801  0309 ae500a        	ldw	x,#20490
 802  030c cd0000        	call	_GPIO_WriteHigh
 804  030f 84            	pop	a
 807  0310 4b08          	push	#8
 808  0312 ae500f        	ldw	x,#20495
 809  0315 cd0000        	call	_GPIO_WriteHigh
 811  0318 84            	pop	a
 814  0319 4b02          	push	#2
 815  031b ae500f        	ldw	x,#20495
 816  031e cd0000        	call	_GPIO_WriteLow
 818  0321 84            	pop	a
 821  0322 4b02          	push	#2
 822  0324 ae5000        	ldw	x,#20480
 823  0327 cd0000        	call	_GPIO_WriteHigh
 825  032a 84            	pop	a
 828  032b 4b40          	push	#64
 829  032d ae500a        	ldw	x,#20490
 830  0330 cd0000        	call	_GPIO_WriteHigh
 832  0333 84            	pop	a
 833                     ; 76         break;
 835  0334 accf05cf      	jpf	L741
 836  0338               L301:
 837                     ; 77     case 'A':
 837                     ; 78         display_a();
 839  0338 4b20          	push	#32
 840  033a ae500f        	ldw	x,#20495
 841  033d cd0000        	call	_GPIO_WriteHigh
 843  0340 84            	pop	a
 846  0341 4b04          	push	#4
 847  0343 ae5000        	ldw	x,#20480
 848  0346 cd0000        	call	_GPIO_WriteHigh
 850  0349 84            	pop	a
 853  034a 4b80          	push	#128
 854  034c ae500a        	ldw	x,#20490
 855  034f cd0000        	call	_GPIO_WriteHigh
 857  0352 84            	pop	a
 860  0353 4b08          	push	#8
 861  0355 ae500f        	ldw	x,#20495
 862  0358 cd0000        	call	_GPIO_WriteLow
 864  035b 84            	pop	a
 867  035c 4b02          	push	#2
 868  035e ae500f        	ldw	x,#20495
 869  0361 cd0000        	call	_GPIO_WriteHigh
 871  0364 84            	pop	a
 874  0365 4b02          	push	#2
 875  0367 ae5000        	ldw	x,#20480
 876  036a cd0000        	call	_GPIO_WriteHigh
 878  036d 84            	pop	a
 881  036e 4b40          	push	#64
 882  0370 ae500a        	ldw	x,#20490
 883  0373 cd0000        	call	_GPIO_WriteHigh
 885  0376 84            	pop	a
 886                     ; 79         break;
 888  0377 accf05cf      	jpf	L741
 889  037b               L501:
 890                     ; 80     case 'b':
 890                     ; 81         display_b();
 892  037b 4b20          	push	#32
 893  037d ae500f        	ldw	x,#20495
 894  0380 cd0000        	call	_GPIO_WriteLow
 896  0383 84            	pop	a
 899  0384 4b04          	push	#4
 900  0386 ae5000        	ldw	x,#20480
 901  0389 cd0000        	call	_GPIO_WriteLow
 903  038c 84            	pop	a
 906  038d 4b80          	push	#128
 907  038f ae500a        	ldw	x,#20490
 908  0392 cd0000        	call	_GPIO_WriteHigh
 910  0395 84            	pop	a
 913  0396 4b08          	push	#8
 914  0398 ae500f        	ldw	x,#20495
 915  039b cd0000        	call	_GPIO_WriteHigh
 917  039e 84            	pop	a
 920  039f 4b02          	push	#2
 921  03a1 ae500f        	ldw	x,#20495
 922  03a4 cd0000        	call	_GPIO_WriteHigh
 924  03a7 84            	pop	a
 927  03a8 4b02          	push	#2
 928  03aa ae5000        	ldw	x,#20480
 929  03ad cd0000        	call	_GPIO_WriteHigh
 931  03b0 84            	pop	a
 934  03b1 4b40          	push	#64
 935  03b3 ae500a        	ldw	x,#20490
 936  03b6 cd0000        	call	_GPIO_WriteHigh
 938  03b9 84            	pop	a
 939                     ; 82         break;
 941  03ba accf05cf      	jpf	L741
 942  03be               L701:
 943                     ; 83     case 'C':
 943                     ; 84         display_c();
 945  03be 4b20          	push	#32
 946  03c0 ae500f        	ldw	x,#20495
 947  03c3 cd0000        	call	_GPIO_WriteHigh
 949  03c6 84            	pop	a
 952  03c7 4b04          	push	#4
 953  03c9 ae5000        	ldw	x,#20480
 954  03cc cd0000        	call	_GPIO_WriteLow
 956  03cf 84            	pop	a
 959  03d0 4b80          	push	#128
 960  03d2 ae500a        	ldw	x,#20490
 961  03d5 cd0000        	call	_GPIO_WriteLow
 963  03d8 84            	pop	a
 966  03d9 4b08          	push	#8
 967  03db ae500f        	ldw	x,#20495
 968  03de cd0000        	call	_GPIO_WriteHigh
 970  03e1 84            	pop	a
 973  03e2 4b02          	push	#2
 974  03e4 ae500f        	ldw	x,#20495
 975  03e7 cd0000        	call	_GPIO_WriteHigh
 977  03ea 84            	pop	a
 980  03eb 4b02          	push	#2
 981  03ed ae5000        	ldw	x,#20480
 982  03f0 cd0000        	call	_GPIO_WriteHigh
 984  03f3 84            	pop	a
 987  03f4 4b40          	push	#64
 988  03f6 ae500a        	ldw	x,#20490
 989  03f9 cd0000        	call	_GPIO_WriteLow
 991  03fc 84            	pop	a
 992                     ; 85         break;
 994  03fd accf05cf      	jpf	L741
 995  0401               L111:
 996                     ; 86     case 'd':
 996                     ; 87         display_d();
 998  0401 4b20          	push	#32
 999  0403 ae500f        	ldw	x,#20495
1000  0406 cd0000        	call	_GPIO_WriteLow
1002  0409 84            	pop	a
1005  040a 4b04          	push	#4
1006  040c ae5000        	ldw	x,#20480
1007  040f cd0000        	call	_GPIO_WriteHigh
1009  0412 84            	pop	a
1012  0413 4b80          	push	#128
1013  0415 ae500a        	ldw	x,#20490
1014  0418 cd0000        	call	_GPIO_WriteHigh
1016  041b 84            	pop	a
1019  041c 4b08          	push	#8
1020  041e ae500f        	ldw	x,#20495
1021  0421 cd0000        	call	_GPIO_WriteHigh
1023  0424 84            	pop	a
1026  0425 4b02          	push	#2
1027  0427 ae500f        	ldw	x,#20495
1028  042a cd0000        	call	_GPIO_WriteHigh
1030  042d 84            	pop	a
1033  042e 4b02          	push	#2
1034  0430 ae5000        	ldw	x,#20480
1035  0433 cd0000        	call	_GPIO_WriteLow
1037  0436 84            	pop	a
1040  0437 4b40          	push	#64
1041  0439 ae500a        	ldw	x,#20490
1042  043c cd0000        	call	_GPIO_WriteHigh
1044  043f 84            	pop	a
1045                     ; 88         break;
1047  0440 accf05cf      	jpf	L741
1048  0444               L311:
1049                     ; 89     case 'E':
1049                     ; 90         display_e();
1051  0444 4b20          	push	#32
1052  0446 ae500f        	ldw	x,#20495
1053  0449 cd0000        	call	_GPIO_WriteHigh
1055  044c 84            	pop	a
1058  044d 4b04          	push	#4
1059  044f ae5000        	ldw	x,#20480
1060  0452 cd0000        	call	_GPIO_WriteLow
1062  0455 84            	pop	a
1065  0456 4b80          	push	#128
1066  0458 ae500a        	ldw	x,#20490
1067  045b cd0000        	call	_GPIO_WriteLow
1069  045e 84            	pop	a
1072  045f 4b08          	push	#8
1073  0461 ae500f        	ldw	x,#20495
1074  0464 cd0000        	call	_GPIO_WriteHigh
1076  0467 84            	pop	a
1079  0468 4b02          	push	#2
1080  046a ae500f        	ldw	x,#20495
1081  046d cd0000        	call	_GPIO_WriteHigh
1083  0470 84            	pop	a
1086  0471 4b02          	push	#2
1087  0473 ae5000        	ldw	x,#20480
1088  0476 cd0000        	call	_GPIO_WriteHigh
1090  0479 84            	pop	a
1093  047a 4b40          	push	#64
1094  047c ae500a        	ldw	x,#20490
1095  047f cd0000        	call	_GPIO_WriteHigh
1097  0482 84            	pop	a
1098                     ; 91         break;
1100  0483 accf05cf      	jpf	L741
1101  0487               L511:
1102                     ; 92     case 'F':
1102                     ; 93         display_f();
1104  0487 4b20          	push	#32
1105  0489 ae500f        	ldw	x,#20495
1106  048c cd0000        	call	_GPIO_WriteHigh
1108  048f 84            	pop	a
1111  0490 4b04          	push	#4
1112  0492 ae5000        	ldw	x,#20480
1113  0495 cd0000        	call	_GPIO_WriteLow
1115  0498 84            	pop	a
1118  0499 4b80          	push	#128
1119  049b ae500a        	ldw	x,#20490
1120  049e cd0000        	call	_GPIO_WriteLow
1122  04a1 84            	pop	a
1125  04a2 4b08          	push	#8
1126  04a4 ae500f        	ldw	x,#20495
1127  04a7 cd0000        	call	_GPIO_WriteLow
1129  04aa 84            	pop	a
1132  04ab 4b02          	push	#2
1133  04ad ae500f        	ldw	x,#20495
1134  04b0 cd0000        	call	_GPIO_WriteHigh
1136  04b3 84            	pop	a
1139  04b4 4b02          	push	#2
1140  04b6 ae5000        	ldw	x,#20480
1141  04b9 cd0000        	call	_GPIO_WriteHigh
1143  04bc 84            	pop	a
1146  04bd 4b40          	push	#64
1147  04bf ae500a        	ldw	x,#20490
1148  04c2 cd0000        	call	_GPIO_WriteHigh
1150  04c5 84            	pop	a
1151                     ; 94         break;
1153  04c6 accf05cf      	jpf	L741
1154  04ca               L711:
1155                     ; 95     case 'H':
1155                     ; 96         display_h();
1157  04ca 4b20          	push	#32
1158  04cc ae500f        	ldw	x,#20495
1159  04cf cd0000        	call	_GPIO_WriteLow
1161  04d2 84            	pop	a
1164  04d3 4b04          	push	#4
1165  04d5 ae5000        	ldw	x,#20480
1166  04d8 cd0000        	call	_GPIO_WriteHigh
1168  04db 84            	pop	a
1171  04dc 4b80          	push	#128
1172  04de ae500a        	ldw	x,#20490
1173  04e1 cd0000        	call	_GPIO_WriteHigh
1175  04e4 84            	pop	a
1178  04e5 4b08          	push	#8
1179  04e7 ae500f        	ldw	x,#20495
1180  04ea cd0000        	call	_GPIO_WriteLow
1182  04ed 84            	pop	a
1185  04ee 4b02          	push	#2
1186  04f0 ae500f        	ldw	x,#20495
1187  04f3 cd0000        	call	_GPIO_WriteHigh
1189  04f6 84            	pop	a
1192  04f7 4b02          	push	#2
1193  04f9 ae5000        	ldw	x,#20480
1194  04fc cd0000        	call	_GPIO_WriteHigh
1196  04ff 84            	pop	a
1199  0500 4b40          	push	#64
1200  0502 ae500a        	ldw	x,#20490
1201  0505 cd0000        	call	_GPIO_WriteHigh
1203  0508 84            	pop	a
1204                     ; 97         break;
1206  0509 accf05cf      	jpf	L741
1207  050d               L121:
1208                     ; 98     case 'L':
1208                     ; 99         display_l();
1210  050d 4b20          	push	#32
1211  050f ae500f        	ldw	x,#20495
1212  0512 cd0000        	call	_GPIO_WriteLow
1214  0515 84            	pop	a
1217  0516 4b04          	push	#4
1218  0518 ae5000        	ldw	x,#20480
1219  051b cd0000        	call	_GPIO_WriteLow
1221  051e 84            	pop	a
1224  051f 4b80          	push	#128
1225  0521 ae500a        	ldw	x,#20490
1226  0524 cd0000        	call	_GPIO_WriteLow
1228  0527 84            	pop	a
1231  0528 4b08          	push	#8
1232  052a ae500f        	ldw	x,#20495
1233  052d cd0000        	call	_GPIO_WriteHigh
1235  0530 84            	pop	a
1238  0531 4b02          	push	#2
1239  0533 ae500f        	ldw	x,#20495
1240  0536 cd0000        	call	_GPIO_WriteHigh
1242  0539 84            	pop	a
1245  053a 4b02          	push	#2
1246  053c ae5000        	ldw	x,#20480
1247  053f cd0000        	call	_GPIO_WriteHigh
1249  0542 84            	pop	a
1252  0543 4b40          	push	#64
1253  0545 ae500a        	ldw	x,#20490
1254  0548 cd0000        	call	_GPIO_WriteLow
1256  054b 84            	pop	a
1257                     ; 100         break;
1259  054c cc05cf        	jra	L741
1260  054f               L321:
1261                     ; 101     case 'P':
1261                     ; 102         display_p();
1263  054f 4b20          	push	#32
1264  0551 ae500f        	ldw	x,#20495
1265  0554 cd0000        	call	_GPIO_WriteHigh
1267  0557 84            	pop	a
1270  0558 4b04          	push	#4
1271  055a ae5000        	ldw	x,#20480
1272  055d cd0000        	call	_GPIO_WriteHigh
1274  0560 84            	pop	a
1277  0561 4b80          	push	#128
1278  0563 ae500a        	ldw	x,#20490
1279  0566 cd0000        	call	_GPIO_WriteLow
1281  0569 84            	pop	a
1284  056a 4b08          	push	#8
1285  056c ae500f        	ldw	x,#20495
1286  056f cd0000        	call	_GPIO_WriteLow
1288  0572 84            	pop	a
1291  0573 4b02          	push	#2
1292  0575 ae500f        	ldw	x,#20495
1293  0578 cd0000        	call	_GPIO_WriteHigh
1295  057b 84            	pop	a
1298  057c 4b02          	push	#2
1299  057e ae5000        	ldw	x,#20480
1300  0581 cd0000        	call	_GPIO_WriteHigh
1302  0584 84            	pop	a
1305  0585 4b40          	push	#64
1306  0587 ae500a        	ldw	x,#20490
1307  058a cd0000        	call	_GPIO_WriteHigh
1309  058d 84            	pop	a
1310                     ; 103         break;
1312  058e 203f          	jra	L741
1313  0590               L521:
1314                     ; 104     case 'U':
1314                     ; 105         display_u();
1316  0590 4b20          	push	#32
1317  0592 ae500f        	ldw	x,#20495
1318  0595 cd0000        	call	_GPIO_WriteLow
1320  0598 84            	pop	a
1323  0599 4b04          	push	#4
1324  059b ae5000        	ldw	x,#20480
1325  059e cd0000        	call	_GPIO_WriteHigh
1327  05a1 84            	pop	a
1330  05a2 4b80          	push	#128
1331  05a4 ae500a        	ldw	x,#20490
1332  05a7 cd0000        	call	_GPIO_WriteHigh
1334  05aa 84            	pop	a
1337  05ab 4b08          	push	#8
1338  05ad ae500f        	ldw	x,#20495
1339  05b0 cd0000        	call	_GPIO_WriteHigh
1341  05b3 84            	pop	a
1344  05b4 4b02          	push	#2
1345  05b6 ae500f        	ldw	x,#20495
1346  05b9 cd0000        	call	_GPIO_WriteHigh
1348  05bc 84            	pop	a
1351  05bd 4b02          	push	#2
1352  05bf ae5000        	ldw	x,#20480
1353  05c2 cd0000        	call	_GPIO_WriteHigh
1355  05c5 84            	pop	a
1358  05c6 4b40          	push	#64
1359  05c8 ae500a        	ldw	x,#20490
1360  05cb cd0000        	call	_GPIO_WriteLow
1362  05ce 84            	pop	a
1363                     ; 106         break;
1365  05cf               L741:
1366                     ; 109 }
1369  05cf 81            	ret
1393                     ; 111 void task_display(void)
1393                     ; 112 {
1394                     	switch	.text
1395  05d0               _task_display:
1399                     ; 114     if (!tick)
1401  05d0 3d00          	tnz	_tick
1402  05d2 2601          	jrne	L161
1403                     ; 115         return;
1406  05d4 81            	ret
1407  05d5               L161:
1408                     ; 118 }
1411  05d5 81            	ret
1414                     	bsct
1415  0004               L361_dig_pos:
1416  0004 00            	dc.b	0
1452                     ; 120 void tmr_display(void)
1452                     ; 121 {
1453                     	switch	.text
1454  05d6               _tmr_display:
1458                     ; 126     if (display_test)
1460  05d6 3d00          	tnz	_display_test
1461  05d8 2701          	jreq	L112
1462                     ; 127         return;
1465  05da 81            	ret
1466  05db               L112:
1467                     ; 130     if (dig_pos > MAX_DIG_POS)
1469  05db b604          	ld	a,L361_dig_pos
1470  05dd a104          	cp	a,#4
1471  05df 2502          	jrult	L312
1472                     ; 131         dig_pos = DIG1_POS;
1474  05e1 3f04          	clr	L361_dig_pos
1475  05e3               L312:
1476                     ; 133     dig1_off();
1478  05e3 4b10          	push	#16
1479  05e5 ae500f        	ldw	x,#20495
1480  05e8 cd0000        	call	_GPIO_WriteHigh
1482  05eb 84            	pop	a
1483                     ; 134     dig2_off();
1485  05ec 4b20          	push	#32
1486  05ee ae5005        	ldw	x,#20485
1487  05f1 cd0000        	call	_GPIO_WriteHigh
1489  05f4 84            	pop	a
1490                     ; 135     dig3_off();
1492  05f5 4b10          	push	#16
1493  05f7 ae5005        	ldw	x,#20485
1494  05fa cd0000        	call	_GPIO_WriteHigh
1496  05fd 84            	pop	a
1497                     ; 137     switch (dig_pos) {
1499  05fe b604          	ld	a,L361_dig_pos
1501                     ; 146         break;
1502  0600 4d            	tnz	a
1503  0601 2708          	jreq	L561
1504  0603 4a            	dec	a
1505  0604 2710          	jreq	L761
1506  0606 4a            	dec	a
1507  0607 2718          	jreq	L171
1508  0609 201f          	jra	L712
1509  060b               L561:
1510                     ; 138     case DIG1_POS:
1510                     ; 139         dig1_on();
1512  060b 4b10          	push	#16
1513  060d ae500f        	ldw	x,#20495
1514  0610 cd0000        	call	_GPIO_WriteLow
1516  0613 84            	pop	a
1517                     ; 140         break;
1519  0614 2014          	jra	L712
1520  0616               L761:
1521                     ; 141     case DIG2_POS:
1521                     ; 142         dig2_on();
1523  0616 4b20          	push	#32
1524  0618 ae5005        	ldw	x,#20485
1525  061b cd0000        	call	_GPIO_WriteLow
1527  061e 84            	pop	a
1528                     ; 143         break;
1530  061f 2009          	jra	L712
1531  0621               L171:
1532                     ; 144     case DIG3_POS:
1532                     ; 145         dig3_on();
1534  0621 4b10          	push	#16
1535  0623 ae5005        	ldw	x,#20485
1536  0626 cd0000        	call	_GPIO_WriteLow
1538  0629 84            	pop	a
1539                     ; 146         break;
1541  062a               L712:
1542                     ; 149     wr_digit(dig_pos);
1544  062a b604          	ld	a,L361_dig_pos
1545  062c cd0042        	call	_wr_digit
1547                     ; 150     dig_pos++;
1549  062f 3c04          	inc	L361_dig_pos
1550                     ; 152 }
1553  0631 81            	ret
1579                     ; 155 void test_display(void)
1579                     ; 156 {
1580                     	switch	.text
1581  0632               _test_display:
1585                     ; 157     delay(DELAY_DISPLAY_TEST);
1587  0632 ae01f4        	ldw	x,#500
1588  0635 89            	pushw	x
1589  0636 ae0000        	ldw	x,#0
1590  0639 89            	pushw	x
1591  063a cd0000        	call	_delay
1593  063d 5b04          	addw	sp,#4
1594                     ; 158     display_zero();
1596  063f 4b20          	push	#32
1597  0641 ae500f        	ldw	x,#20495
1598  0644 cd0000        	call	_GPIO_WriteHigh
1600  0647 84            	pop	a
1603  0648 4b04          	push	#4
1604  064a ae5000        	ldw	x,#20480
1605  064d cd0000        	call	_GPIO_WriteHigh
1607  0650 84            	pop	a
1610  0651 4b80          	push	#128
1611  0653 ae500a        	ldw	x,#20490
1612  0656 cd0000        	call	_GPIO_WriteHigh
1614  0659 84            	pop	a
1617  065a 4b08          	push	#8
1618  065c ae500f        	ldw	x,#20495
1619  065f cd0000        	call	_GPIO_WriteHigh
1621  0662 84            	pop	a
1624  0663 4b02          	push	#2
1625  0665 ae500f        	ldw	x,#20495
1626  0668 cd0000        	call	_GPIO_WriteHigh
1628  066b 84            	pop	a
1631  066c 4b02          	push	#2
1632  066e ae5000        	ldw	x,#20480
1633  0671 cd0000        	call	_GPIO_WriteHigh
1635  0674 84            	pop	a
1638  0675 4b40          	push	#64
1639  0677 ae500a        	ldw	x,#20490
1640  067a cd0000        	call	_GPIO_WriteLow
1642  067d 84            	pop	a
1643                     ; 159     delay(DELAY_DISPLAY_TEST);
1645  067e ae01f4        	ldw	x,#500
1646  0681 89            	pushw	x
1647  0682 ae0000        	ldw	x,#0
1648  0685 89            	pushw	x
1649  0686 cd0000        	call	_delay
1651  0689 5b04          	addw	sp,#4
1652                     ; 160     display_one();
1654  068b 4b20          	push	#32
1655  068d ae500f        	ldw	x,#20495
1656  0690 cd0000        	call	_GPIO_WriteLow
1658  0693 84            	pop	a
1661  0694 4b04          	push	#4
1662  0696 ae5000        	ldw	x,#20480
1663  0699 cd0000        	call	_GPIO_WriteHigh
1665  069c 84            	pop	a
1668  069d 4b80          	push	#128
1669  069f ae500a        	ldw	x,#20490
1670  06a2 cd0000        	call	_GPIO_WriteHigh
1672  06a5 84            	pop	a
1675  06a6 4b08          	push	#8
1676  06a8 ae500f        	ldw	x,#20495
1677  06ab cd0000        	call	_GPIO_WriteLow
1679  06ae 84            	pop	a
1682  06af 4b02          	push	#2
1683  06b1 ae500f        	ldw	x,#20495
1684  06b4 cd0000        	call	_GPIO_WriteLow
1686  06b7 84            	pop	a
1689  06b8 4b02          	push	#2
1690  06ba ae5000        	ldw	x,#20480
1691  06bd cd0000        	call	_GPIO_WriteLow
1693  06c0 84            	pop	a
1696  06c1 4b40          	push	#64
1697  06c3 ae500a        	ldw	x,#20490
1698  06c6 cd0000        	call	_GPIO_WriteLow
1700  06c9 84            	pop	a
1701                     ; 161     delay(DELAY_DISPLAY_TEST);
1703  06ca ae01f4        	ldw	x,#500
1704  06cd 89            	pushw	x
1705  06ce ae0000        	ldw	x,#0
1706  06d1 89            	pushw	x
1707  06d2 cd0000        	call	_delay
1709  06d5 5b04          	addw	sp,#4
1710                     ; 162     display_two();
1712  06d7 4b20          	push	#32
1713  06d9 ae500f        	ldw	x,#20495
1714  06dc cd0000        	call	_GPIO_WriteHigh
1716  06df 84            	pop	a
1719  06e0 4b04          	push	#4
1720  06e2 ae5000        	ldw	x,#20480
1721  06e5 cd0000        	call	_GPIO_WriteHigh
1723  06e8 84            	pop	a
1726  06e9 4b80          	push	#128
1727  06eb ae500a        	ldw	x,#20490
1728  06ee cd0000        	call	_GPIO_WriteLow
1730  06f1 84            	pop	a
1733  06f2 4b08          	push	#8
1734  06f4 ae500f        	ldw	x,#20495
1735  06f7 cd0000        	call	_GPIO_WriteHigh
1737  06fa 84            	pop	a
1740  06fb 4b02          	push	#2
1741  06fd ae500f        	ldw	x,#20495
1742  0700 cd0000        	call	_GPIO_WriteHigh
1744  0703 84            	pop	a
1747  0704 4b02          	push	#2
1748  0706 ae5000        	ldw	x,#20480
1749  0709 cd0000        	call	_GPIO_WriteLow
1751  070c 84            	pop	a
1754  070d 4b40          	push	#64
1755  070f ae500a        	ldw	x,#20490
1756  0712 cd0000        	call	_GPIO_WriteHigh
1758  0715 84            	pop	a
1759                     ; 163     delay(DELAY_DISPLAY_TEST);
1761  0716 ae01f4        	ldw	x,#500
1762  0719 89            	pushw	x
1763  071a ae0000        	ldw	x,#0
1764  071d 89            	pushw	x
1765  071e cd0000        	call	_delay
1767  0721 5b04          	addw	sp,#4
1768                     ; 164     display_three();
1770  0723 4b20          	push	#32
1771  0725 ae500f        	ldw	x,#20495
1772  0728 cd0000        	call	_GPIO_WriteHigh
1774  072b 84            	pop	a
1777  072c 4b04          	push	#4
1778  072e ae5000        	ldw	x,#20480
1779  0731 cd0000        	call	_GPIO_WriteHigh
1781  0734 84            	pop	a
1784  0735 4b80          	push	#128
1785  0737 ae500a        	ldw	x,#20490
1786  073a cd0000        	call	_GPIO_WriteHigh
1788  073d 84            	pop	a
1791  073e 4b08          	push	#8
1792  0740 ae500f        	ldw	x,#20495
1793  0743 cd0000        	call	_GPIO_WriteHigh
1795  0746 84            	pop	a
1798  0747 4b02          	push	#2
1799  0749 ae500f        	ldw	x,#20495
1800  074c cd0000        	call	_GPIO_WriteLow
1802  074f 84            	pop	a
1805  0750 4b02          	push	#2
1806  0752 ae5000        	ldw	x,#20480
1807  0755 cd0000        	call	_GPIO_WriteLow
1809  0758 84            	pop	a
1812  0759 4b40          	push	#64
1813  075b ae500a        	ldw	x,#20490
1814  075e cd0000        	call	_GPIO_WriteHigh
1816  0761 84            	pop	a
1817                     ; 165     delay(DELAY_DISPLAY_TEST);
1819  0762 ae01f4        	ldw	x,#500
1820  0765 89            	pushw	x
1821  0766 ae0000        	ldw	x,#0
1822  0769 89            	pushw	x
1823  076a cd0000        	call	_delay
1825  076d 5b04          	addw	sp,#4
1826                     ; 166     display_four();
1828  076f 4b20          	push	#32
1829  0771 ae500f        	ldw	x,#20495
1830  0774 cd0000        	call	_GPIO_WriteLow
1832  0777 84            	pop	a
1835  0778 4b04          	push	#4
1836  077a ae5000        	ldw	x,#20480
1837  077d cd0000        	call	_GPIO_WriteHigh
1839  0780 84            	pop	a
1842  0781 4b80          	push	#128
1843  0783 ae500a        	ldw	x,#20490
1844  0786 cd0000        	call	_GPIO_WriteHigh
1846  0789 84            	pop	a
1849  078a 4b08          	push	#8
1850  078c ae500f        	ldw	x,#20495
1851  078f cd0000        	call	_GPIO_WriteLow
1853  0792 84            	pop	a
1856  0793 4b02          	push	#2
1857  0795 ae500f        	ldw	x,#20495
1858  0798 cd0000        	call	_GPIO_WriteLow
1860  079b 84            	pop	a
1863  079c 4b02          	push	#2
1864  079e ae5000        	ldw	x,#20480
1865  07a1 cd0000        	call	_GPIO_WriteHigh
1867  07a4 84            	pop	a
1870  07a5 4b40          	push	#64
1871  07a7 ae500a        	ldw	x,#20490
1872  07aa cd0000        	call	_GPIO_WriteHigh
1874  07ad 84            	pop	a
1875                     ; 167     delay(DELAY_DISPLAY_TEST);
1877  07ae ae01f4        	ldw	x,#500
1878  07b1 89            	pushw	x
1879  07b2 ae0000        	ldw	x,#0
1880  07b5 89            	pushw	x
1881  07b6 cd0000        	call	_delay
1883  07b9 5b04          	addw	sp,#4
1884                     ; 168     display_five();
1886  07bb 4b20          	push	#32
1887  07bd ae500f        	ldw	x,#20495
1888  07c0 cd0000        	call	_GPIO_WriteHigh
1890  07c3 84            	pop	a
1893  07c4 4b04          	push	#4
1894  07c6 ae5000        	ldw	x,#20480
1895  07c9 cd0000        	call	_GPIO_WriteLow
1897  07cc 84            	pop	a
1900  07cd 4b80          	push	#128
1901  07cf ae500a        	ldw	x,#20490
1902  07d2 cd0000        	call	_GPIO_WriteHigh
1904  07d5 84            	pop	a
1907  07d6 4b08          	push	#8
1908  07d8 ae500f        	ldw	x,#20495
1909  07db cd0000        	call	_GPIO_WriteHigh
1911  07de 84            	pop	a
1914  07df 4b02          	push	#2
1915  07e1 ae500f        	ldw	x,#20495
1916  07e4 cd0000        	call	_GPIO_WriteLow
1918  07e7 84            	pop	a
1921  07e8 4b02          	push	#2
1922  07ea ae5000        	ldw	x,#20480
1923  07ed cd0000        	call	_GPIO_WriteHigh
1925  07f0 84            	pop	a
1928  07f1 4b40          	push	#64
1929  07f3 ae500a        	ldw	x,#20490
1930  07f6 cd0000        	call	_GPIO_WriteHigh
1932  07f9 84            	pop	a
1933                     ; 169     delay(DELAY_DISPLAY_TEST);
1935  07fa ae01f4        	ldw	x,#500
1936  07fd 89            	pushw	x
1937  07fe ae0000        	ldw	x,#0
1938  0801 89            	pushw	x
1939  0802 cd0000        	call	_delay
1941  0805 5b04          	addw	sp,#4
1942                     ; 170     display_six();
1944  0807 4b20          	push	#32
1945  0809 ae500f        	ldw	x,#20495
1946  080c cd0000        	call	_GPIO_WriteHigh
1948  080f 84            	pop	a
1951  0810 4b04          	push	#4
1952  0812 ae5000        	ldw	x,#20480
1953  0815 cd0000        	call	_GPIO_WriteLow
1955  0818 84            	pop	a
1958  0819 4b80          	push	#128
1959  081b ae500a        	ldw	x,#20490
1960  081e cd0000        	call	_GPIO_WriteHigh
1962  0821 84            	pop	a
1965  0822 4b08          	push	#8
1966  0824 ae500f        	ldw	x,#20495
1967  0827 cd0000        	call	_GPIO_WriteHigh
1969  082a 84            	pop	a
1972  082b 4b02          	push	#2
1973  082d ae500f        	ldw	x,#20495
1974  0830 cd0000        	call	_GPIO_WriteHigh
1976  0833 84            	pop	a
1979  0834 4b02          	push	#2
1980  0836 ae5000        	ldw	x,#20480
1981  0839 cd0000        	call	_GPIO_WriteHigh
1983  083c 84            	pop	a
1986  083d 4b40          	push	#64
1987  083f ae500a        	ldw	x,#20490
1988  0842 cd0000        	call	_GPIO_WriteHigh
1990  0845 84            	pop	a
1991                     ; 171     delay(DELAY_DISPLAY_TEST);
1993  0846 ae01f4        	ldw	x,#500
1994  0849 89            	pushw	x
1995  084a ae0000        	ldw	x,#0
1996  084d 89            	pushw	x
1997  084e cd0000        	call	_delay
1999  0851 5b04          	addw	sp,#4
2000                     ; 172     display_seven();
2002  0853 4b20          	push	#32
2003  0855 ae500f        	ldw	x,#20495
2004  0858 cd0000        	call	_GPIO_WriteHigh
2006  085b 84            	pop	a
2009  085c 4b04          	push	#4
2010  085e ae5000        	ldw	x,#20480
2011  0861 cd0000        	call	_GPIO_WriteHigh
2013  0864 84            	pop	a
2016  0865 4b80          	push	#128
2017  0867 ae500a        	ldw	x,#20490
2018  086a cd0000        	call	_GPIO_WriteHigh
2020  086d 84            	pop	a
2023  086e 4b08          	push	#8
2024  0870 ae500f        	ldw	x,#20495
2025  0873 cd0000        	call	_GPIO_WriteLow
2027  0876 84            	pop	a
2030  0877 4b02          	push	#2
2031  0879 ae500f        	ldw	x,#20495
2032  087c cd0000        	call	_GPIO_WriteLow
2034  087f 84            	pop	a
2037  0880 4b02          	push	#2
2038  0882 ae5000        	ldw	x,#20480
2039  0885 cd0000        	call	_GPIO_WriteLow
2041  0888 84            	pop	a
2044  0889 4b40          	push	#64
2045  088b ae500a        	ldw	x,#20490
2046  088e cd0000        	call	_GPIO_WriteLow
2048  0891 84            	pop	a
2049                     ; 173     delay(DELAY_DISPLAY_TEST);
2051  0892 ae01f4        	ldw	x,#500
2052  0895 89            	pushw	x
2053  0896 ae0000        	ldw	x,#0
2054  0899 89            	pushw	x
2055  089a cd0000        	call	_delay
2057  089d 5b04          	addw	sp,#4
2058                     ; 174     display_eight();
2060  089f 4b20          	push	#32
2061  08a1 ae500f        	ldw	x,#20495
2062  08a4 cd0000        	call	_GPIO_WriteHigh
2064  08a7 84            	pop	a
2067  08a8 4b04          	push	#4
2068  08aa ae5000        	ldw	x,#20480
2069  08ad cd0000        	call	_GPIO_WriteHigh
2071  08b0 84            	pop	a
2074  08b1 4b80          	push	#128
2075  08b3 ae500a        	ldw	x,#20490
2076  08b6 cd0000        	call	_GPIO_WriteHigh
2078  08b9 84            	pop	a
2081  08ba 4b08          	push	#8
2082  08bc ae500f        	ldw	x,#20495
2083  08bf cd0000        	call	_GPIO_WriteHigh
2085  08c2 84            	pop	a
2088  08c3 4b02          	push	#2
2089  08c5 ae500f        	ldw	x,#20495
2090  08c8 cd0000        	call	_GPIO_WriteHigh
2092  08cb 84            	pop	a
2095  08cc 4b02          	push	#2
2096  08ce ae5000        	ldw	x,#20480
2097  08d1 cd0000        	call	_GPIO_WriteHigh
2099  08d4 84            	pop	a
2102  08d5 4b40          	push	#64
2103  08d7 ae500a        	ldw	x,#20490
2104  08da cd0000        	call	_GPIO_WriteHigh
2106  08dd 84            	pop	a
2107                     ; 175     delay(DELAY_DISPLAY_TEST);
2109  08de ae01f4        	ldw	x,#500
2110  08e1 89            	pushw	x
2111  08e2 ae0000        	ldw	x,#0
2112  08e5 89            	pushw	x
2113  08e6 cd0000        	call	_delay
2115  08e9 5b04          	addw	sp,#4
2116                     ; 176     display_nine();    
2118  08eb 4b20          	push	#32
2119  08ed ae500f        	ldw	x,#20495
2120  08f0 cd0000        	call	_GPIO_WriteHigh
2122  08f3 84            	pop	a
2125  08f4 4b04          	push	#4
2126  08f6 ae5000        	ldw	x,#20480
2127  08f9 cd0000        	call	_GPIO_WriteHigh
2129  08fc 84            	pop	a
2132  08fd 4b80          	push	#128
2133  08ff ae500a        	ldw	x,#20490
2134  0902 cd0000        	call	_GPIO_WriteHigh
2136  0905 84            	pop	a
2139  0906 4b08          	push	#8
2140  0908 ae500f        	ldw	x,#20495
2141  090b cd0000        	call	_GPIO_WriteHigh
2143  090e 84            	pop	a
2146  090f 4b02          	push	#2
2147  0911 ae500f        	ldw	x,#20495
2148  0914 cd0000        	call	_GPIO_WriteLow
2150  0917 84            	pop	a
2153  0918 4b02          	push	#2
2154  091a ae5000        	ldw	x,#20480
2155  091d cd0000        	call	_GPIO_WriteHigh
2157  0920 84            	pop	a
2160  0921 4b40          	push	#64
2161  0923 ae500a        	ldw	x,#20490
2162  0926 cd0000        	call	_GPIO_WriteHigh
2164  0929 84            	pop	a
2165                     ; 177     delay(DELAY_DISPLAY_TEST);
2167  092a ae01f4        	ldw	x,#500
2168  092d 89            	pushw	x
2169  092e ae0000        	ldw	x,#0
2170  0931 89            	pushw	x
2171  0932 cd0000        	call	_delay
2173  0935 5b04          	addw	sp,#4
2174                     ; 178     display_off();
2176  0937 4b20          	push	#32
2177  0939 ae500f        	ldw	x,#20495
2178  093c cd0000        	call	_GPIO_WriteLow
2180  093f 84            	pop	a
2183  0940 4b04          	push	#4
2184  0942 ae5000        	ldw	x,#20480
2185  0945 cd0000        	call	_GPIO_WriteLow
2187  0948 84            	pop	a
2190  0949 4b80          	push	#128
2191  094b ae500a        	ldw	x,#20490
2192  094e cd0000        	call	_GPIO_WriteLow
2194  0951 84            	pop	a
2197  0952 4b08          	push	#8
2198  0954 ae500f        	ldw	x,#20495
2199  0957 cd0000        	call	_GPIO_WriteLow
2201  095a 84            	pop	a
2204  095b 4b02          	push	#2
2205  095d ae500f        	ldw	x,#20495
2206  0960 cd0000        	call	_GPIO_WriteLow
2208  0963 84            	pop	a
2211  0964 4b02          	push	#2
2212  0966 ae5000        	ldw	x,#20480
2213  0969 cd0000        	call	_GPIO_WriteLow
2215  096c 84            	pop	a
2218  096d 4b40          	push	#64
2219  096f ae500a        	ldw	x,#20490
2220  0972 cd0000        	call	_GPIO_WriteLow
2222  0975 84            	pop	a
2225  0976 4b04          	push	#4
2226  0978 ae500f        	ldw	x,#20495
2227  097b cd0000        	call	_GPIO_WriteLow
2229  097e 84            	pop	a
2230                     ; 179     dp_on();
2233  097f 4b04          	push	#4
2234  0981 ae500f        	ldw	x,#20495
2235  0984 cd0000        	call	_GPIO_WriteHigh
2237  0987 84            	pop	a
2238                     ; 180     delay(DELAY_DISPLAY_TEST);
2240  0988 ae01f4        	ldw	x,#500
2241  098b 89            	pushw	x
2242  098c ae0000        	ldw	x,#0
2243  098f 89            	pushw	x
2244  0990 cd0000        	call	_delay
2246  0993 5b04          	addw	sp,#4
2247                     ; 181     dp_off();
2249  0995 4b04          	push	#4
2250  0997 ae500f        	ldw	x,#20495
2251  099a cd0000        	call	_GPIO_WriteLow
2253  099d 84            	pop	a
2254                     ; 182 }
2257  099e 81            	ret
2285                     ; 185 void init_display(void)
2285                     ; 186 {
2286                     	switch	.text
2287  099f               _init_display:
2291                     ; 190     seg_a_dir();
2293  099f 4be0          	push	#224
2294  09a1 4b20          	push	#32
2295  09a3 ae500f        	ldw	x,#20495
2296  09a6 cd0000        	call	_GPIO_Init
2298  09a9 85            	popw	x
2299                     ; 191     seg_b_dir();
2302  09aa 4be0          	push	#224
2303  09ac 4b04          	push	#4
2304  09ae ae5000        	ldw	x,#20480
2305  09b1 cd0000        	call	_GPIO_Init
2307  09b4 85            	popw	x
2308                     ; 192     seg_c_dir();
2311  09b5 4be0          	push	#224
2312  09b7 4b80          	push	#128
2313  09b9 ae500a        	ldw	x,#20490
2314  09bc cd0000        	call	_GPIO_Init
2316  09bf 85            	popw	x
2317                     ; 193     seg_d_dir();
2320  09c0 4be0          	push	#224
2321  09c2 4b08          	push	#8
2322  09c4 ae500f        	ldw	x,#20495
2323  09c7 cd0000        	call	_GPIO_Init
2325  09ca 85            	popw	x
2326                     ; 194     seg_e_dir();
2329  09cb 4be0          	push	#224
2330  09cd 4b02          	push	#2
2331  09cf ae500f        	ldw	x,#20495
2332  09d2 cd0000        	call	_GPIO_Init
2334  09d5 85            	popw	x
2335                     ; 195     seg_f_dir();
2338  09d6 4be0          	push	#224
2339  09d8 4b02          	push	#2
2340  09da ae5000        	ldw	x,#20480
2341  09dd cd0000        	call	_GPIO_Init
2343  09e0 85            	popw	x
2344                     ; 196     seg_g_dir();
2347  09e1 4be0          	push	#224
2348  09e3 4b40          	push	#64
2349  09e5 ae500a        	ldw	x,#20490
2350  09e8 cd0000        	call	_GPIO_Init
2352  09eb 85            	popw	x
2353                     ; 197     dp_dir();
2356  09ec 4be0          	push	#224
2357  09ee 4b04          	push	#4
2358  09f0 ae500f        	ldw	x,#20495
2359  09f3 cd0000        	call	_GPIO_Init
2361  09f6 85            	popw	x
2362                     ; 198     dig1_dir();
2365  09f7 4be0          	push	#224
2366  09f9 4b10          	push	#16
2367  09fb ae500f        	ldw	x,#20495
2368  09fe cd0000        	call	_GPIO_Init
2370  0a01 85            	popw	x
2371                     ; 199     dig2_dir();
2374  0a02 4be0          	push	#224
2375  0a04 4b20          	push	#32
2376  0a06 ae5005        	ldw	x,#20485
2377  0a09 cd0000        	call	_GPIO_Init
2379  0a0c 85            	popw	x
2380                     ; 200     dig3_dir();
2383  0a0d 4be0          	push	#224
2384  0a0f 4b10          	push	#16
2385  0a11 ae5005        	ldw	x,#20485
2386  0a14 cd0000        	call	_GPIO_Init
2388  0a17 85            	popw	x
2389                     ; 203     dig1_on();
2392  0a18 4b10          	push	#16
2393  0a1a ae500f        	ldw	x,#20495
2394  0a1d cd0000        	call	_GPIO_WriteLow
2396  0a20 84            	pop	a
2397                     ; 204     dig2_on();
2399  0a21 4b20          	push	#32
2400  0a23 ae5005        	ldw	x,#20485
2401  0a26 cd0000        	call	_GPIO_WriteLow
2403  0a29 84            	pop	a
2404                     ; 205     dig3_on();
2406  0a2a 4b10          	push	#16
2407  0a2c ae5005        	ldw	x,#20485
2408  0a2f cd0000        	call	_GPIO_WriteLow
2410  0a32 84            	pop	a
2411                     ; 207     display_all();
2413  0a33 4b20          	push	#32
2414  0a35 ae500f        	ldw	x,#20495
2415  0a38 cd0000        	call	_GPIO_WriteHigh
2417  0a3b 84            	pop	a
2420  0a3c 4b04          	push	#4
2421  0a3e ae5000        	ldw	x,#20480
2422  0a41 cd0000        	call	_GPIO_WriteHigh
2424  0a44 84            	pop	a
2427  0a45 4b80          	push	#128
2428  0a47 ae500a        	ldw	x,#20490
2429  0a4a cd0000        	call	_GPIO_WriteHigh
2431  0a4d 84            	pop	a
2434  0a4e 4b08          	push	#8
2435  0a50 ae500f        	ldw	x,#20495
2436  0a53 cd0000        	call	_GPIO_WriteHigh
2438  0a56 84            	pop	a
2441  0a57 4b02          	push	#2
2442  0a59 ae500f        	ldw	x,#20495
2443  0a5c cd0000        	call	_GPIO_WriteHigh
2445  0a5f 84            	pop	a
2448  0a60 4b02          	push	#2
2449  0a62 ae5000        	ldw	x,#20480
2450  0a65 cd0000        	call	_GPIO_WriteHigh
2452  0a68 84            	pop	a
2455  0a69 4b40          	push	#64
2456  0a6b ae500a        	ldw	x,#20490
2457  0a6e cd0000        	call	_GPIO_WriteHigh
2459  0a71 84            	pop	a
2462  0a72 4b04          	push	#4
2463  0a74 ae500f        	ldw	x,#20495
2464  0a77 cd0000        	call	_GPIO_WriteHigh
2466  0a7a 84            	pop	a
2467                     ; 208     delay(2*DELAY_DISPLAY_TEST);
2470  0a7b ae03e8        	ldw	x,#1000
2471  0a7e 89            	pushw	x
2472  0a7f ae0000        	ldw	x,#0
2473  0a82 89            	pushw	x
2474  0a83 cd0000        	call	_delay
2476  0a86 5b04          	addw	sp,#4
2477                     ; 209     display_off();
2479  0a88 4b20          	push	#32
2480  0a8a ae500f        	ldw	x,#20495
2481  0a8d cd0000        	call	_GPIO_WriteLow
2483  0a90 84            	pop	a
2486  0a91 4b04          	push	#4
2487  0a93 ae5000        	ldw	x,#20480
2488  0a96 cd0000        	call	_GPIO_WriteLow
2490  0a99 84            	pop	a
2493  0a9a 4b80          	push	#128
2494  0a9c ae500a        	ldw	x,#20490
2495  0a9f cd0000        	call	_GPIO_WriteLow
2497  0aa2 84            	pop	a
2500  0aa3 4b08          	push	#8
2501  0aa5 ae500f        	ldw	x,#20495
2502  0aa8 cd0000        	call	_GPIO_WriteLow
2504  0aab 84            	pop	a
2507  0aac 4b02          	push	#2
2508  0aae ae500f        	ldw	x,#20495
2509  0ab1 cd0000        	call	_GPIO_WriteLow
2511  0ab4 84            	pop	a
2514  0ab5 4b02          	push	#2
2515  0ab7 ae5000        	ldw	x,#20480
2516  0aba cd0000        	call	_GPIO_WriteLow
2518  0abd 84            	pop	a
2521  0abe 4b40          	push	#64
2522  0ac0 ae500a        	ldw	x,#20490
2523  0ac3 cd0000        	call	_GPIO_WriteLow
2525  0ac6 84            	pop	a
2528  0ac7 4b04          	push	#4
2529  0ac9 ae500f        	ldw	x,#20495
2530  0acc cd0000        	call	_GPIO_WriteLow
2532  0acf 84            	pop	a
2533                     ; 210     delay(DELAY_DISPLAY_TEST);
2536  0ad0 ae01f4        	ldw	x,#500
2537  0ad3 89            	pushw	x
2538  0ad4 ae0000        	ldw	x,#0
2539  0ad7 89            	pushw	x
2540  0ad8 cd0000        	call	_delay
2542  0adb 5b04          	addw	sp,#4
2543                     ; 211     display_all();
2545  0add 4b20          	push	#32
2546  0adf ae500f        	ldw	x,#20495
2547  0ae2 cd0000        	call	_GPIO_WriteHigh
2549  0ae5 84            	pop	a
2552  0ae6 4b04          	push	#4
2553  0ae8 ae5000        	ldw	x,#20480
2554  0aeb cd0000        	call	_GPIO_WriteHigh
2556  0aee 84            	pop	a
2559  0aef 4b80          	push	#128
2560  0af1 ae500a        	ldw	x,#20490
2561  0af4 cd0000        	call	_GPIO_WriteHigh
2563  0af7 84            	pop	a
2566  0af8 4b08          	push	#8
2567  0afa ae500f        	ldw	x,#20495
2568  0afd cd0000        	call	_GPIO_WriteHigh
2570  0b00 84            	pop	a
2573  0b01 4b02          	push	#2
2574  0b03 ae500f        	ldw	x,#20495
2575  0b06 cd0000        	call	_GPIO_WriteHigh
2577  0b09 84            	pop	a
2580  0b0a 4b02          	push	#2
2581  0b0c ae5000        	ldw	x,#20480
2582  0b0f cd0000        	call	_GPIO_WriteHigh
2584  0b12 84            	pop	a
2587  0b13 4b40          	push	#64
2588  0b15 ae500a        	ldw	x,#20490
2589  0b18 cd0000        	call	_GPIO_WriteHigh
2591  0b1b 84            	pop	a
2594  0b1c 4b04          	push	#4
2595  0b1e ae500f        	ldw	x,#20495
2596  0b21 cd0000        	call	_GPIO_WriteHigh
2598  0b24 84            	pop	a
2599                     ; 212     delay(2*DELAY_DISPLAY_TEST);
2602  0b25 ae03e8        	ldw	x,#1000
2603  0b28 89            	pushw	x
2604  0b29 ae0000        	ldw	x,#0
2605  0b2c 89            	pushw	x
2606  0b2d cd0000        	call	_delay
2608  0b30 5b04          	addw	sp,#4
2609                     ; 213     display_off();
2611  0b32 4b20          	push	#32
2612  0b34 ae500f        	ldw	x,#20495
2613  0b37 cd0000        	call	_GPIO_WriteLow
2615  0b3a 84            	pop	a
2618  0b3b 4b04          	push	#4
2619  0b3d ae5000        	ldw	x,#20480
2620  0b40 cd0000        	call	_GPIO_WriteLow
2622  0b43 84            	pop	a
2625  0b44 4b80          	push	#128
2626  0b46 ae500a        	ldw	x,#20490
2627  0b49 cd0000        	call	_GPIO_WriteLow
2629  0b4c 84            	pop	a
2632  0b4d 4b08          	push	#8
2633  0b4f ae500f        	ldw	x,#20495
2634  0b52 cd0000        	call	_GPIO_WriteLow
2636  0b55 84            	pop	a
2639  0b56 4b02          	push	#2
2640  0b58 ae500f        	ldw	x,#20495
2641  0b5b cd0000        	call	_GPIO_WriteLow
2643  0b5e 84            	pop	a
2646  0b5f 4b02          	push	#2
2647  0b61 ae5000        	ldw	x,#20480
2648  0b64 cd0000        	call	_GPIO_WriteLow
2650  0b67 84            	pop	a
2653  0b68 4b40          	push	#64
2654  0b6a ae500a        	ldw	x,#20490
2655  0b6d cd0000        	call	_GPIO_WriteLow
2657  0b70 84            	pop	a
2660  0b71 4b04          	push	#4
2661  0b73 ae500f        	ldw	x,#20495
2662  0b76 cd0000        	call	_GPIO_WriteLow
2664  0b79 84            	pop	a
2665                     ; 214     delay(DELAY_DISPLAY_TEST);
2668  0b7a ae01f4        	ldw	x,#500
2669  0b7d 89            	pushw	x
2670  0b7e ae0000        	ldw	x,#0
2671  0b81 89            	pushw	x
2672  0b82 cd0000        	call	_delay
2674  0b85 5b04          	addw	sp,#4
2675                     ; 215     display_all();
2677  0b87 4b20          	push	#32
2678  0b89 ae500f        	ldw	x,#20495
2679  0b8c cd0000        	call	_GPIO_WriteHigh
2681  0b8f 84            	pop	a
2684  0b90 4b04          	push	#4
2685  0b92 ae5000        	ldw	x,#20480
2686  0b95 cd0000        	call	_GPIO_WriteHigh
2688  0b98 84            	pop	a
2691  0b99 4b80          	push	#128
2692  0b9b ae500a        	ldw	x,#20490
2693  0b9e cd0000        	call	_GPIO_WriteHigh
2695  0ba1 84            	pop	a
2698  0ba2 4b08          	push	#8
2699  0ba4 ae500f        	ldw	x,#20495
2700  0ba7 cd0000        	call	_GPIO_WriteHigh
2702  0baa 84            	pop	a
2705  0bab 4b02          	push	#2
2706  0bad ae500f        	ldw	x,#20495
2707  0bb0 cd0000        	call	_GPIO_WriteHigh
2709  0bb3 84            	pop	a
2712  0bb4 4b02          	push	#2
2713  0bb6 ae5000        	ldw	x,#20480
2714  0bb9 cd0000        	call	_GPIO_WriteHigh
2716  0bbc 84            	pop	a
2719  0bbd 4b40          	push	#64
2720  0bbf ae500a        	ldw	x,#20490
2721  0bc2 cd0000        	call	_GPIO_WriteHigh
2723  0bc5 84            	pop	a
2726  0bc6 4b04          	push	#4
2727  0bc8 ae500f        	ldw	x,#20495
2728  0bcb cd0000        	call	_GPIO_WriteHigh
2730  0bce 84            	pop	a
2731                     ; 216     delay(2*DELAY_DISPLAY_TEST);
2734  0bcf ae03e8        	ldw	x,#1000
2735  0bd2 89            	pushw	x
2736  0bd3 ae0000        	ldw	x,#0
2737  0bd6 89            	pushw	x
2738  0bd7 cd0000        	call	_delay
2740  0bda 5b04          	addw	sp,#4
2741                     ; 217     display_off();
2743  0bdc 4b20          	push	#32
2744  0bde ae500f        	ldw	x,#20495
2745  0be1 cd0000        	call	_GPIO_WriteLow
2747  0be4 84            	pop	a
2750  0be5 4b04          	push	#4
2751  0be7 ae5000        	ldw	x,#20480
2752  0bea cd0000        	call	_GPIO_WriteLow
2754  0bed 84            	pop	a
2757  0bee 4b80          	push	#128
2758  0bf0 ae500a        	ldw	x,#20490
2759  0bf3 cd0000        	call	_GPIO_WriteLow
2761  0bf6 84            	pop	a
2764  0bf7 4b08          	push	#8
2765  0bf9 ae500f        	ldw	x,#20495
2766  0bfc cd0000        	call	_GPIO_WriteLow
2768  0bff 84            	pop	a
2771  0c00 4b02          	push	#2
2772  0c02 ae500f        	ldw	x,#20495
2773  0c05 cd0000        	call	_GPIO_WriteLow
2775  0c08 84            	pop	a
2778  0c09 4b02          	push	#2
2779  0c0b ae5000        	ldw	x,#20480
2780  0c0e cd0000        	call	_GPIO_WriteLow
2782  0c11 84            	pop	a
2785  0c12 4b40          	push	#64
2786  0c14 ae500a        	ldw	x,#20490
2787  0c17 cd0000        	call	_GPIO_WriteLow
2789  0c1a 84            	pop	a
2792  0c1b 4b04          	push	#4
2793  0c1d ae500f        	ldw	x,#20495
2794  0c20 cd0000        	call	_GPIO_WriteLow
2796  0c23 84            	pop	a
2797                     ; 219     display_test = 0;
2800  0c24 3f00          	clr	_display_test
2801                     ; 222     dig1_off();
2803  0c26 4b10          	push	#16
2804  0c28 ae500f        	ldw	x,#20495
2805  0c2b cd0000        	call	_GPIO_WriteHigh
2807  0c2e 84            	pop	a
2808                     ; 223     dig2_off();
2810  0c2f 4b20          	push	#32
2811  0c31 ae5005        	ldw	x,#20485
2812  0c34 cd0000        	call	_GPIO_WriteHigh
2814  0c37 84            	pop	a
2815                     ; 224     dig3_off();
2817  0c38 4b10          	push	#16
2818  0c3a ae5005        	ldw	x,#20485
2819  0c3d cd0000        	call	_GPIO_WriteHigh
2821  0c40 84            	pop	a
2822                     ; 227 }
2825  0c41 81            	ret
2859                     	xdef	_test_display
2860                     	xdef	_wr_digit
2861                     	xdef	_dec2bcd
2862                     	xdef	_display_num
2863                     	xdef	_display_test
2864                     	xref.b	_tick
2865                     	xref	_delay
2866                     	xdef	_set_display
2867                     	xdef	_tmr_display
2868                     	xdef	_task_display
2869                     	xdef	_init_display
2870                     	xref	_GPIO_WriteLow
2871                     	xref	_GPIO_WriteHigh
2872                     	xref	_GPIO_Init
2891                     	end
