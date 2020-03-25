   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  47                     ; 53 void UART1_DeInit(void)
  47                     ; 54 {
  49                     	switch	.text
  50  0000               _UART1_DeInit:
  54                     ; 57   (void)UART1->SR;
  56  0000 c65230        	ld	a,21040
  57                     ; 58   (void)UART1->DR;
  59  0003 c65231        	ld	a,21041
  60                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  62  0006 725f5233      	clr	21043
  63                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  65  000a 725f5232      	clr	21042
  66                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  68  000e 725f5234      	clr	21044
  69                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  71  0012 725f5235      	clr	21045
  72                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  74  0016 725f5236      	clr	21046
  75                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  77  001a 725f5237      	clr	21047
  78                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  80  001e 725f5238      	clr	21048
  81                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  83  0022 725f5239      	clr	21049
  84                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  86  0026 725f523a      	clr	21050
  87                     ; 71 }
  90  002a 81            	ret	
 393                     .const:	section	.text
 394  0000               L41:
 395  0000 00000064      	dc.l	100
 396                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 396                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 396                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 396                     ; 93 {
 397                     	switch	.text
 398  002b               _UART1_Init:
 400  002b 520c          	subw	sp,#12
 401       0000000c      OFST:	set	12
 404                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 408                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 410                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 412                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 414                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 416                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 418                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 420                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 422  002d 72195234      	bres	21044,#4
 423                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 425  0031 c65234        	ld	a,21044
 426  0034 1a13          	or	a,(OFST+7,sp)
 427  0036 c75234        	ld	21044,a
 428                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 430  0039 c65236        	ld	a,21046
 431  003c a4cf          	and	a,#207
 432  003e c75236        	ld	21046,a
 433                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 435  0041 c65236        	ld	a,21046
 436  0044 1a14          	or	a,(OFST+8,sp)
 437  0046 c75236        	ld	21046,a
 438                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 440  0049 c65234        	ld	a,21044
 441  004c a4f9          	and	a,#249
 442  004e c75234        	ld	21044,a
 443                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 445  0051 c65234        	ld	a,21044
 446  0054 1a15          	or	a,(OFST+9,sp)
 447  0056 c75234        	ld	21044,a
 448                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 450  0059 725f5232      	clr	21042
 451                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 453  005d c65233        	ld	a,21043
 454  0060 a40f          	and	a,#15
 455  0062 c75233        	ld	21043,a
 456                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 458  0065 c65233        	ld	a,21043
 459  0068 a4f0          	and	a,#240
 460  006a c75233        	ld	21043,a
 461                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 463  006d 96            	ldw	x,sp
 464  006e cd0147        	call	LC001
 466  0071 96            	ldw	x,sp
 467  0072 5c            	incw	x
 468  0073 cd0000        	call	c_rtol
 471  0076 cd0000        	call	_CLK_GetClockFreq
 473  0079 96            	ldw	x,sp
 474  007a 5c            	incw	x
 475  007b cd0000        	call	c_ludv
 477  007e 96            	ldw	x,sp
 478  007f 1c0009        	addw	x,#OFST-3
 479  0082 cd0000        	call	c_rtol
 482                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 484  0085 96            	ldw	x,sp
 485  0086 cd0147        	call	LC001
 487  0089 96            	ldw	x,sp
 488  008a 5c            	incw	x
 489  008b cd0000        	call	c_rtol
 492  008e cd0000        	call	_CLK_GetClockFreq
 494  0091 a664          	ld	a,#100
 495  0093 cd0000        	call	c_smul
 497  0096 96            	ldw	x,sp
 498  0097 5c            	incw	x
 499  0098 cd0000        	call	c_ludv
 501  009b 96            	ldw	x,sp
 502  009c 1c0005        	addw	x,#OFST-7
 503  009f cd0000        	call	c_rtol
 506                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 508  00a2 96            	ldw	x,sp
 509  00a3 1c0009        	addw	x,#OFST-3
 510  00a6 cd0000        	call	c_ltor
 512  00a9 a664          	ld	a,#100
 513  00ab cd0000        	call	c_smul
 515  00ae 96            	ldw	x,sp
 516  00af 5c            	incw	x
 517  00b0 cd0000        	call	c_rtol
 520  00b3 96            	ldw	x,sp
 521  00b4 1c0005        	addw	x,#OFST-7
 522  00b7 cd0000        	call	c_ltor
 524  00ba 96            	ldw	x,sp
 525  00bb 5c            	incw	x
 526  00bc cd0000        	call	c_lsub
 528  00bf a604          	ld	a,#4
 529  00c1 cd0000        	call	c_llsh
 531  00c4 ae0000        	ldw	x,#L41
 532  00c7 cd0000        	call	c_ludv
 534  00ca b603          	ld	a,c_lreg+3
 535  00cc a40f          	and	a,#15
 536  00ce ca5233        	or	a,21043
 537  00d1 c75233        	ld	21043,a
 538                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 540  00d4 96            	ldw	x,sp
 541  00d5 1c0009        	addw	x,#OFST-3
 542  00d8 cd0000        	call	c_ltor
 544  00db a604          	ld	a,#4
 545  00dd cd0000        	call	c_lursh
 547  00e0 b603          	ld	a,c_lreg+3
 548  00e2 a4f0          	and	a,#240
 549  00e4 b703          	ld	c_lreg+3,a
 550  00e6 3f02          	clr	c_lreg+2
 551  00e8 3f01          	clr	c_lreg+1
 552  00ea 3f00          	clr	c_lreg
 553  00ec ca5233        	or	a,21043
 554  00ef c75233        	ld	21043,a
 555                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 557  00f2 c65232        	ld	a,21042
 558  00f5 1a0c          	or	a,(OFST+0,sp)
 559  00f7 c75232        	ld	21042,a
 560                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 562  00fa c65235        	ld	a,21045
 563  00fd a4f3          	and	a,#243
 564  00ff c75235        	ld	21045,a
 565                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 567  0102 c65236        	ld	a,21046
 568  0105 a4f8          	and	a,#248
 569  0107 c75236        	ld	21046,a
 570                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 570                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 572  010a 7b16          	ld	a,(OFST+10,sp)
 573  010c a407          	and	a,#7
 574  010e ca5236        	or	a,21046
 575  0111 c75236        	ld	21046,a
 576                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 578  0114 7b17          	ld	a,(OFST+11,sp)
 579  0116 a504          	bcp	a,#4
 580  0118 2706          	jreq	L371
 581                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 583  011a 72165235      	bset	21045,#3
 585  011e 2004          	jra	L571
 586  0120               L371:
 587                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 589  0120 72175235      	bres	21045,#3
 590  0124               L571:
 591                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 593  0124 a508          	bcp	a,#8
 594  0126 2706          	jreq	L771
 595                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 597  0128 72145235      	bset	21045,#2
 599  012c 2004          	jra	L102
 600  012e               L771:
 601                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 603  012e 72155235      	bres	21045,#2
 604  0132               L102:
 605                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 607  0132 7b16          	ld	a,(OFST+10,sp)
 608  0134 2a06          	jrpl	L302
 609                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 611  0136 72175236      	bres	21046,#3
 613  013a 2008          	jra	L502
 614  013c               L302:
 615                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 617  013c a408          	and	a,#8
 618  013e ca5236        	or	a,21046
 619  0141 c75236        	ld	21046,a
 620  0144               L502:
 621                     ; 176 }
 624  0144 5b0c          	addw	sp,#12
 625  0146 81            	ret	
 626  0147               LC001:
 627  0147 1c000f        	addw	x,#OFST+3
 628  014a cd0000        	call	c_ltor
 630  014d a604          	ld	a,#4
 631  014f cc0000        	jp	c_llsh
 686                     ; 184 void UART1_Cmd(FunctionalState NewState)
 686                     ; 185 {
 687                     	switch	.text
 688  0152               _UART1_Cmd:
 692                     ; 186   if (NewState != DISABLE)
 694  0152 4d            	tnz	a
 695  0153 2705          	jreq	L532
 696                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 698  0155 721b5234      	bres	21044,#5
 701  0159 81            	ret	
 702  015a               L532:
 703                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 705  015a 721a5234      	bset	21044,#5
 706                     ; 196 }
 709  015e 81            	ret	
 834                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 834                     ; 212 {
 835                     	switch	.text
 836  015f               _UART1_ITConfig:
 838  015f 89            	pushw	x
 839  0160 89            	pushw	x
 840       00000002      OFST:	set	2
 843                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 847                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 849                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 851                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 853  0161 9e            	ld	a,xh
 854  0162 6b01          	ld	(OFST-1,sp),a
 856                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 858  0164 9f            	ld	a,xl
 859  0165 a40f          	and	a,#15
 860  0167 5f            	clrw	x
 861  0168 97            	ld	xl,a
 862  0169 a601          	ld	a,#1
 863  016b 5d            	tnzw	x
 864  016c 2704          	jreq	L22
 865  016e               L42:
 866  016e 48            	sll	a
 867  016f 5a            	decw	x
 868  0170 26fc          	jrne	L42
 869  0172               L22:
 870  0172 6b02          	ld	(OFST+0,sp),a
 872                     ; 224   if (NewState != DISABLE)
 874  0174 7b07          	ld	a,(OFST+5,sp)
 875  0176 271f          	jreq	L713
 876                     ; 227     if (uartreg == 0x01)
 878  0178 7b01          	ld	a,(OFST-1,sp)
 879  017a a101          	cp	a,#1
 880  017c 2607          	jrne	L123
 881                     ; 229       UART1->CR1 |= itpos;
 883  017e c65234        	ld	a,21044
 884  0181 1a02          	or	a,(OFST+0,sp)
 886  0183 201e          	jp	LC003
 887  0185               L123:
 888                     ; 231     else if (uartreg == 0x02)
 890  0185 a102          	cp	a,#2
 891  0187 2607          	jrne	L523
 892                     ; 233       UART1->CR2 |= itpos;
 894  0189 c65235        	ld	a,21045
 895  018c 1a02          	or	a,(OFST+0,sp)
 897  018e 2022          	jp	LC004
 898  0190               L523:
 899                     ; 237       UART1->CR4 |= itpos;
 901  0190 c65237        	ld	a,21047
 902  0193 1a02          	or	a,(OFST+0,sp)
 903  0195 2026          	jp	LC002
 904  0197               L713:
 905                     ; 243     if (uartreg == 0x01)
 907  0197 7b01          	ld	a,(OFST-1,sp)
 908  0199 a101          	cp	a,#1
 909  019b 260b          	jrne	L333
 910                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
 912  019d 7b02          	ld	a,(OFST+0,sp)
 913  019f 43            	cpl	a
 914  01a0 c45234        	and	a,21044
 915  01a3               LC003:
 916  01a3 c75234        	ld	21044,a
 918  01a6 2018          	jra	L133
 919  01a8               L333:
 920                     ; 247     else if (uartreg == 0x02)
 922  01a8 a102          	cp	a,#2
 923  01aa 260b          	jrne	L733
 924                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
 926  01ac 7b02          	ld	a,(OFST+0,sp)
 927  01ae 43            	cpl	a
 928  01af c45235        	and	a,21045
 929  01b2               LC004:
 930  01b2 c75235        	ld	21045,a
 932  01b5 2009          	jra	L133
 933  01b7               L733:
 934                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
 936  01b7 7b02          	ld	a,(OFST+0,sp)
 937  01b9 43            	cpl	a
 938  01ba c45237        	and	a,21047
 939  01bd               LC002:
 940  01bd c75237        	ld	21047,a
 941  01c0               L133:
 942                     ; 257 }
 945  01c0 5b04          	addw	sp,#4
 946  01c2 81            	ret	
 982                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
 982                     ; 266 {
 983                     	switch	.text
 984  01c3               _UART1_HalfDuplexCmd:
 988                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 990                     ; 269   if (NewState != DISABLE)
 992  01c3 4d            	tnz	a
 993  01c4 2705          	jreq	L163
 994                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
 996  01c6 72165238      	bset	21048,#3
 999  01ca 81            	ret	
1000  01cb               L163:
1001                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1003  01cb 72175238      	bres	21048,#3
1004                     ; 277 }
1007  01cf 81            	ret	
1064                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1064                     ; 286 {
1065                     	switch	.text
1066  01d0               _UART1_IrDAConfig:
1070                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1072                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1074  01d0 4d            	tnz	a
1075  01d1 2705          	jreq	L314
1076                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1078  01d3 72145238      	bset	21048,#2
1081  01d7 81            	ret	
1082  01d8               L314:
1083                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1085  01d8 72155238      	bres	21048,#2
1086                     ; 297 }
1089  01dc 81            	ret	
1124                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1124                     ; 306 {
1125                     	switch	.text
1126  01dd               _UART1_IrDACmd:
1130                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1132                     ; 310   if (NewState != DISABLE)
1134  01dd 4d            	tnz	a
1135  01de 2705          	jreq	L534
1136                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1138  01e0 72125238      	bset	21048,#1
1141  01e4 81            	ret	
1142  01e5               L534:
1143                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1145  01e5 72135238      	bres	21048,#1
1146                     ; 320 }
1149  01e9 81            	ret	
1208                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1208                     ; 330 {
1209                     	switch	.text
1210  01ea               _UART1_LINBreakDetectionConfig:
1214                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1216                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1218  01ea 4d            	tnz	a
1219  01eb 2705          	jreq	L764
1220                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1222  01ed 721a5237      	bset	21047,#5
1225  01f1 81            	ret	
1226  01f2               L764:
1227                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1229  01f2 721b5237      	bres	21047,#5
1230                     ; 341 }
1233  01f6 81            	ret	
1268                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1268                     ; 350 {
1269                     	switch	.text
1270  01f7               _UART1_LINCmd:
1274                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1276                     ; 353   if (NewState != DISABLE)
1278  01f7 4d            	tnz	a
1279  01f8 2705          	jreq	L115
1280                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1282  01fa 721c5236      	bset	21046,#6
1285  01fe 81            	ret	
1286  01ff               L115:
1287                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1289  01ff 721d5236      	bres	21046,#6
1290                     ; 363 }
1293  0203 81            	ret	
1328                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1328                     ; 372 {
1329                     	switch	.text
1330  0204               _UART1_SmartCardCmd:
1334                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1336                     ; 375   if (NewState != DISABLE)
1338  0204 4d            	tnz	a
1339  0205 2705          	jreq	L335
1340                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1342  0207 721a5238      	bset	21048,#5
1345  020b 81            	ret	
1346  020c               L335:
1347                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1349  020c 721b5238      	bres	21048,#5
1350                     ; 385 }
1353  0210 81            	ret	
1389                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1389                     ; 395 {
1390                     	switch	.text
1391  0211               _UART1_SmartCardNACKCmd:
1395                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1397                     ; 398   if (NewState != DISABLE)
1399  0211 4d            	tnz	a
1400  0212 2705          	jreq	L555
1401                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1403  0214 72185238      	bset	21048,#4
1406  0218 81            	ret	
1407  0219               L555:
1408                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1410  0219 72195238      	bres	21048,#4
1411                     ; 408 }
1414  021d 81            	ret	
1471                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1471                     ; 417 {
1472                     	switch	.text
1473  021e               _UART1_WakeUpConfig:
1477                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1479                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1481  021e 72175234      	bres	21044,#3
1482                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1484  0222 ca5234        	or	a,21044
1485  0225 c75234        	ld	21044,a
1486                     ; 422 }
1489  0228 81            	ret	
1525                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1525                     ; 431 {
1526                     	switch	.text
1527  0229               _UART1_ReceiverWakeUpCmd:
1531                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1533                     ; 434   if (NewState != DISABLE)
1535  0229 4d            	tnz	a
1536  022a 2705          	jreq	L526
1537                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1539  022c 72125235      	bset	21045,#1
1542  0230 81            	ret	
1543  0231               L526:
1544                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1546  0231 72135235      	bres	21045,#1
1547                     ; 444 }
1550  0235 81            	ret	
1573                     ; 451 uint8_t UART1_ReceiveData8(void)
1573                     ; 452 {
1574                     	switch	.text
1575  0236               _UART1_ReceiveData8:
1579                     ; 453   return ((uint8_t)UART1->DR);
1581  0236 c65231        	ld	a,21041
1584  0239 81            	ret	
1618                     ; 461 uint16_t UART1_ReceiveData9(void)
1618                     ; 462 {
1619                     	switch	.text
1620  023a               _UART1_ReceiveData9:
1622  023a 89            	pushw	x
1623       00000002      OFST:	set	2
1626                     ; 463   uint16_t temp = 0;
1628                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1630  023b c65234        	ld	a,21044
1631  023e a480          	and	a,#128
1632  0240 5f            	clrw	x
1633  0241 02            	rlwa	x,a
1634  0242 58            	sllw	x
1635  0243 1f01          	ldw	(OFST-1,sp),x
1637                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1639  0245 c65231        	ld	a,21041
1640  0248 5f            	clrw	x
1641  0249 97            	ld	xl,a
1642  024a 01            	rrwa	x,a
1643  024b 1a02          	or	a,(OFST+0,sp)
1644  024d 01            	rrwa	x,a
1645  024e 1a01          	or	a,(OFST-1,sp)
1646  0250 a401          	and	a,#1
1647  0252 01            	rrwa	x,a
1650  0253 5b02          	addw	sp,#2
1651  0255 81            	ret	
1685                     ; 474 void UART1_SendData8(uint8_t Data)
1685                     ; 475 {
1686                     	switch	.text
1687  0256               _UART1_SendData8:
1691                     ; 477   UART1->DR = Data;
1693  0256 c75231        	ld	21041,a
1694                     ; 478 }
1697  0259 81            	ret	
1731                     ; 486 void UART1_SendData9(uint16_t Data)
1731                     ; 487 {
1732                     	switch	.text
1733  025a               _UART1_SendData9:
1735  025a 89            	pushw	x
1736       00000000      OFST:	set	0
1739                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1741  025b 721d5234      	bres	21044,#6
1742                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1744  025f 54            	srlw	x
1745  0260 54            	srlw	x
1746  0261 9f            	ld	a,xl
1747  0262 a440          	and	a,#64
1748  0264 ca5234        	or	a,21044
1749  0267 c75234        	ld	21044,a
1750                     ; 493   UART1->DR   = (uint8_t)(Data);
1752  026a 7b02          	ld	a,(OFST+2,sp)
1753  026c c75231        	ld	21041,a
1754                     ; 494 }
1757  026f 85            	popw	x
1758  0270 81            	ret	
1781                     ; 501 void UART1_SendBreak(void)
1781                     ; 502 {
1782                     	switch	.text
1783  0271               _UART1_SendBreak:
1787                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
1789  0271 72105235      	bset	21045,#0
1790                     ; 504 }
1793  0275 81            	ret	
1827                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
1827                     ; 512 {
1828                     	switch	.text
1829  0276               _UART1_SetAddress:
1831  0276 88            	push	a
1832       00000000      OFST:	set	0
1835                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1837                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1839  0277 c65237        	ld	a,21047
1840  027a a4f0          	and	a,#240
1841  027c c75237        	ld	21047,a
1842                     ; 519   UART1->CR4 |= UART1_Address;
1844  027f c65237        	ld	a,21047
1845  0282 1a01          	or	a,(OFST+1,sp)
1846  0284 c75237        	ld	21047,a
1847                     ; 520 }
1850  0287 84            	pop	a
1851  0288 81            	ret	
1885                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1885                     ; 529 {
1886                     	switch	.text
1887  0289               _UART1_SetGuardTime:
1891                     ; 531   UART1->GTR = UART1_GuardTime;
1893  0289 c75239        	ld	21049,a
1894                     ; 532 }
1897  028c 81            	ret	
1931                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1931                     ; 557 {
1932                     	switch	.text
1933  028d               _UART1_SetPrescaler:
1937                     ; 559   UART1->PSCR = UART1_Prescaler;
1939  028d c7523a        	ld	21050,a
1940                     ; 560 }
1943  0290 81            	ret	
2086                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2086                     ; 569 {
2087                     	switch	.text
2088  0291               _UART1_GetFlagStatus:
2090  0291 89            	pushw	x
2091  0292 88            	push	a
2092       00000001      OFST:	set	1
2095                     ; 570   FlagStatus status = RESET;
2097                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2099                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2101  0293 a30210        	cpw	x,#528
2102  0296 2608          	jrne	L7501
2103                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2105  0298 9f            	ld	a,xl
2106  0299 c45237        	and	a,21047
2107  029c 271c          	jreq	L5601
2108                     ; 582       status = SET;
2110  029e 2015          	jp	LC007
2111                     ; 587       status = RESET;
2112  02a0               L7501:
2113                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2115  02a0 a30101        	cpw	x,#257
2116  02a3 2609          	jrne	L7601
2117                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2119  02a5 c65235        	ld	a,21045
2120  02a8 1503          	bcp	a,(OFST+2,sp)
2121  02aa 270d          	jreq	L7701
2122                     ; 595       status = SET;
2124  02ac 2007          	jp	LC007
2125                     ; 600       status = RESET;
2126  02ae               L7601:
2127                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2129  02ae c65230        	ld	a,21040
2130  02b1 1503          	bcp	a,(OFST+2,sp)
2131  02b3 2704          	jreq	L7701
2132                     ; 608       status = SET;
2134  02b5               LC007:
2137  02b5 a601          	ld	a,#1
2141  02b7 2001          	jra	L5601
2142  02b9               L7701:
2143                     ; 613       status = RESET;
2146  02b9 4f            	clr	a
2148  02ba               L5601:
2149                     ; 617   return status;
2153  02ba 5b03          	addw	sp,#3
2154  02bc 81            	ret	
2189                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2189                     ; 647 {
2190                     	switch	.text
2191  02bd               _UART1_ClearFlag:
2195                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2197                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2199  02bd a30020        	cpw	x,#32
2200  02c0 2605          	jrne	L1211
2201                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2203  02c2 35df5230      	mov	21040,#223
2206  02c6 81            	ret	
2207  02c7               L1211:
2208                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2210  02c7 72195237      	bres	21047,#4
2211                     ; 660 }
2214  02cb 81            	ret	
2296                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2296                     ; 676 {
2297                     	switch	.text
2298  02cc               _UART1_GetITStatus:
2300  02cc 89            	pushw	x
2301  02cd 89            	pushw	x
2302       00000002      OFST:	set	2
2305                     ; 677   ITStatus pendingbitstatus = RESET;
2307                     ; 678   uint8_t itpos = 0;
2309                     ; 679   uint8_t itmask1 = 0;
2311                     ; 680   uint8_t itmask2 = 0;
2313                     ; 681   uint8_t enablestatus = 0;
2315                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2317                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2319  02ce 9f            	ld	a,xl
2320  02cf a40f          	and	a,#15
2321  02d1 5f            	clrw	x
2322  02d2 97            	ld	xl,a
2323  02d3 a601          	ld	a,#1
2324  02d5 5d            	tnzw	x
2325  02d6 2704          	jreq	L67
2326  02d8               L001:
2327  02d8 48            	sll	a
2328  02d9 5a            	decw	x
2329  02da 26fc          	jrne	L001
2330  02dc               L67:
2331  02dc 6b01          	ld	(OFST-1,sp),a
2333                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2335  02de 7b04          	ld	a,(OFST+2,sp)
2336  02e0 4e            	swap	a
2337  02e1 a40f          	and	a,#15
2338  02e3 6b02          	ld	(OFST+0,sp),a
2340                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2342  02e5 5f            	clrw	x
2343  02e6 97            	ld	xl,a
2344  02e7 a601          	ld	a,#1
2345  02e9 5d            	tnzw	x
2346  02ea 2704          	jreq	L201
2347  02ec               L401:
2348  02ec 48            	sll	a
2349  02ed 5a            	decw	x
2350  02ee 26fc          	jrne	L401
2351  02f0               L201:
2352  02f0 6b02          	ld	(OFST+0,sp),a
2354                     ; 695   if (UART1_IT == UART1_IT_PE)
2356  02f2 1e03          	ldw	x,(OFST+1,sp)
2357  02f4 a30100        	cpw	x,#256
2358  02f7 260c          	jrne	L7611
2359                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2361  02f9 c65234        	ld	a,21044
2362  02fc 1402          	and	a,(OFST+0,sp)
2363  02fe 6b02          	ld	(OFST+0,sp),a
2365                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2367  0300 c65230        	ld	a,21040
2369                     ; 704       pendingbitstatus = SET;
2371  0303 200f          	jp	LC010
2372                     ; 709       pendingbitstatus = RESET;
2373  0305               L7611:
2374                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2376  0305 a30346        	cpw	x,#838
2377  0308 2616          	jrne	L7711
2378                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2380  030a c65237        	ld	a,21047
2381  030d 1402          	and	a,(OFST+0,sp)
2382  030f 6b02          	ld	(OFST+0,sp),a
2384                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2386  0311 c65237        	ld	a,21047
2388  0314               LC010:
2389  0314 1501          	bcp	a,(OFST-1,sp)
2390  0316 271a          	jreq	L7021
2391  0318 7b02          	ld	a,(OFST+0,sp)
2392  031a 2716          	jreq	L7021
2393                     ; 721       pendingbitstatus = SET;
2395  031c               LC009:
2398  031c a601          	ld	a,#1
2401  031e 2013          	jra	L5711
2402                     ; 726       pendingbitstatus = RESET;
2403  0320               L7711:
2404                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2406  0320 c65235        	ld	a,21045
2407  0323 1402          	and	a,(OFST+0,sp)
2408  0325 6b02          	ld	(OFST+0,sp),a
2410                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2412  0327 c65230        	ld	a,21040
2413  032a 1501          	bcp	a,(OFST-1,sp)
2414  032c 2704          	jreq	L7021
2416  032e 7b02          	ld	a,(OFST+0,sp)
2417                     ; 737       pendingbitstatus = SET;
2419  0330 26ea          	jrne	LC009
2420  0332               L7021:
2421                     ; 742       pendingbitstatus = RESET;
2425  0332 4f            	clr	a
2427  0333               L5711:
2428                     ; 747   return  pendingbitstatus;
2432  0333 5b04          	addw	sp,#4
2433  0335 81            	ret	
2469                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2469                     ; 776 {
2470                     	switch	.text
2471  0336               _UART1_ClearITPendingBit:
2475                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2477                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2479  0336 a30255        	cpw	x,#597
2480  0339 2605          	jrne	L1321
2481                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2483  033b 35df5230      	mov	21040,#223
2486  033f 81            	ret	
2487  0340               L1321:
2488                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2490  0340 72195237      	bres	21047,#4
2491                     ; 789 }
2494  0344 81            	ret	
2507                     	xdef	_UART1_ClearITPendingBit
2508                     	xdef	_UART1_GetITStatus
2509                     	xdef	_UART1_ClearFlag
2510                     	xdef	_UART1_GetFlagStatus
2511                     	xdef	_UART1_SetPrescaler
2512                     	xdef	_UART1_SetGuardTime
2513                     	xdef	_UART1_SetAddress
2514                     	xdef	_UART1_SendBreak
2515                     	xdef	_UART1_SendData9
2516                     	xdef	_UART1_SendData8
2517                     	xdef	_UART1_ReceiveData9
2518                     	xdef	_UART1_ReceiveData8
2519                     	xdef	_UART1_ReceiverWakeUpCmd
2520                     	xdef	_UART1_WakeUpConfig
2521                     	xdef	_UART1_SmartCardNACKCmd
2522                     	xdef	_UART1_SmartCardCmd
2523                     	xdef	_UART1_LINCmd
2524                     	xdef	_UART1_LINBreakDetectionConfig
2525                     	xdef	_UART1_IrDACmd
2526                     	xdef	_UART1_IrDAConfig
2527                     	xdef	_UART1_HalfDuplexCmd
2528                     	xdef	_UART1_ITConfig
2529                     	xdef	_UART1_Cmd
2530                     	xdef	_UART1_Init
2531                     	xdef	_UART1_DeInit
2532                     	xref	_CLK_GetClockFreq
2533                     	xref.b	c_lreg
2534                     	xref.b	c_x
2553                     	xref	c_lursh
2554                     	xref	c_lsub
2555                     	xref	c_smul
2556                     	xref	c_ludv
2557                     	xref	c_rtol
2558                     	xref	c_llsh
2559                     	xref	c_ltor
2560                     	end
