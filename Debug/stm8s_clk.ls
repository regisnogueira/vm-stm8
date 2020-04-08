   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  19                     .const:	section	.text
  20  0000               _HSIDivFactor:
  21  0000 01            	dc.b	1
  22  0001 02            	dc.b	2
  23  0002 04            	dc.b	4
  24  0003 08            	dc.b	8
  25  0004               _CLKPrescTable:
  26  0004 01            	dc.b	1
  27  0005 02            	dc.b	2
  28  0006 04            	dc.b	4
  29  0007 08            	dc.b	8
  30  0008 0a            	dc.b	10
  31  0009 10            	dc.b	16
  32  000a 14            	dc.b	20
  33  000b 28            	dc.b	40
  62                     ; 72 void CLK_DeInit(void)
  62                     ; 73 {
  64                     	switch	.text
  65  0000               _CLK_DeInit:
  69                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  71  0000 350150c0      	mov	20672,#1
  72                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  74  0004 725f50c1      	clr	20673
  75                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  77  0008 35e150c4      	mov	20676,#225
  78                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  80  000c 725f50c5      	clr	20677
  81                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  83  0010 351850c6      	mov	20678,#24
  84                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  86  0014 35ff50c7      	mov	20679,#255
  87                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  89  0018 35ff50ca      	mov	20682,#255
  90                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  92  001c 725f50c8      	clr	20680
  93                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  95  0020 725f50c9      	clr	20681
  97  0024               L52:
  98                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
 100  0024 720050c9fb    	btjt	20681,#0,L52
 101                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 103  0029 725f50c9      	clr	20681
 104                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 106  002d 725f50cc      	clr	20684
 107                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 109  0031 725f50cd      	clr	20685
 110                     ; 88 }
 113  0035 81            	ret	
 169                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 169                     ; 100 {
 170                     	switch	.text
 171  0036               _CLK_FastHaltWakeUpCmd:
 175                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 177                     ; 104   if (NewState != DISABLE)
 179  0036 4d            	tnz	a
 180  0037 2705          	jreq	L75
 181                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 183  0039 721450c0      	bset	20672,#2
 186  003d 81            	ret	
 187  003e               L75:
 188                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 190  003e 721550c0      	bres	20672,#2
 191                     ; 114 }
 194  0042 81            	ret	
 229                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 229                     ; 122 {
 230                     	switch	.text
 231  0043               _CLK_HSECmd:
 235                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 237                     ; 126   if (NewState != DISABLE)
 239  0043 4d            	tnz	a
 240  0044 2705          	jreq	L101
 241                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 243  0046 721050c1      	bset	20673,#0
 246  004a 81            	ret	
 247  004b               L101:
 248                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 250  004b 721150c1      	bres	20673,#0
 251                     ; 136 }
 254  004f 81            	ret	
 289                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 289                     ; 144 {
 290                     	switch	.text
 291  0050               _CLK_HSICmd:
 295                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 297                     ; 148   if (NewState != DISABLE)
 299  0050 4d            	tnz	a
 300  0051 2705          	jreq	L321
 301                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 303  0053 721050c0      	bset	20672,#0
 306  0057 81            	ret	
 307  0058               L321:
 308                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 310  0058 721150c0      	bres	20672,#0
 311                     ; 158 }
 314  005c 81            	ret	
 349                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 349                     ; 167 {
 350                     	switch	.text
 351  005d               _CLK_LSICmd:
 355                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 357                     ; 171   if (NewState != DISABLE)
 359  005d 4d            	tnz	a
 360  005e 2705          	jreq	L541
 361                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 363  0060 721650c0      	bset	20672,#3
 366  0064 81            	ret	
 367  0065               L541:
 368                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 370  0065 721750c0      	bres	20672,#3
 371                     ; 181 }
 374  0069 81            	ret	
 409                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 409                     ; 190 {
 410                     	switch	.text
 411  006a               _CLK_CCOCmd:
 415                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 417                     ; 194   if (NewState != DISABLE)
 419  006a 4d            	tnz	a
 420  006b 2705          	jreq	L761
 421                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 423  006d 721050c9      	bset	20681,#0
 426  0071 81            	ret	
 427  0072               L761:
 428                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 430  0072 721150c9      	bres	20681,#0
 431                     ; 204 }
 434  0076 81            	ret	
 469                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 469                     ; 214 {
 470                     	switch	.text
 471  0077               _CLK_ClockSwitchCmd:
 475                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 477                     ; 218   if (NewState != DISABLE )
 479  0077 4d            	tnz	a
 480  0078 2705          	jreq	L112
 481                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 483  007a 721250c5      	bset	20677,#1
 486  007e 81            	ret	
 487  007f               L112:
 488                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 490  007f 721350c5      	bres	20677,#1
 491                     ; 228 }
 494  0083 81            	ret	
 530                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 530                     ; 239 {
 531                     	switch	.text
 532  0084               _CLK_SlowActiveHaltWakeUpCmd:
 536                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 538                     ; 243   if (NewState != DISABLE)
 540  0084 4d            	tnz	a
 541  0085 2705          	jreq	L332
 542                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 544  0087 721a50c0      	bset	20672,#5
 547  008b 81            	ret	
 548  008c               L332:
 549                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 551  008c 721b50c0      	bres	20672,#5
 552                     ; 253 }
 555  0090 81            	ret	
 714                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 714                     ; 264 {
 715                     	switch	.text
 716  0091               _CLK_PeripheralClockConfig:
 718  0091 89            	pushw	x
 719       00000000      OFST:	set	0
 722                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 724                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 726                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 728  0092 9e            	ld	a,xh
 729  0093 a510          	bcp	a,#16
 730  0095 2626          	jrne	L123
 731                     ; 271     if (NewState != DISABLE)
 733  0097 7b02          	ld	a,(OFST+2,sp)
 734  0099 270f          	jreq	L323
 735                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 737  009b 7b01          	ld	a,(OFST+1,sp)
 738  009d ad44          	call	LC003
 739  009f 2704          	jreq	L62
 740  00a1               L03:
 741  00a1 48            	sll	a
 742  00a2 5a            	decw	x
 743  00a3 26fc          	jrne	L03
 744  00a5               L62:
 745  00a5 ca50c7        	or	a,20679
 747  00a8 200e          	jp	LC002
 748  00aa               L323:
 749                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 751  00aa 7b01          	ld	a,(OFST+1,sp)
 752  00ac ad35          	call	LC003
 753  00ae 2704          	jreq	L23
 754  00b0               L43:
 755  00b0 48            	sll	a
 756  00b1 5a            	decw	x
 757  00b2 26fc          	jrne	L43
 758  00b4               L23:
 759  00b4 43            	cpl	a
 760  00b5 c450c7        	and	a,20679
 761  00b8               LC002:
 762  00b8 c750c7        	ld	20679,a
 763  00bb 2024          	jra	L723
 764  00bd               L123:
 765                     ; 284     if (NewState != DISABLE)
 767  00bd 7b02          	ld	a,(OFST+2,sp)
 768  00bf 270f          	jreq	L133
 769                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 771  00c1 7b01          	ld	a,(OFST+1,sp)
 772  00c3 ad1e          	call	LC003
 773  00c5 2704          	jreq	L63
 774  00c7               L04:
 775  00c7 48            	sll	a
 776  00c8 5a            	decw	x
 777  00c9 26fc          	jrne	L04
 778  00cb               L63:
 779  00cb ca50ca        	or	a,20682
 781  00ce 200e          	jp	LC001
 782  00d0               L133:
 783                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 785  00d0 7b01          	ld	a,(OFST+1,sp)
 786  00d2 ad0f          	call	LC003
 787  00d4 2704          	jreq	L24
 788  00d6               L44:
 789  00d6 48            	sll	a
 790  00d7 5a            	decw	x
 791  00d8 26fc          	jrne	L44
 792  00da               L24:
 793  00da 43            	cpl	a
 794  00db c450ca        	and	a,20682
 795  00de               LC001:
 796  00de c750ca        	ld	20682,a
 797  00e1               L723:
 798                     ; 295 }
 801  00e1 85            	popw	x
 802  00e2 81            	ret	
 803  00e3               LC003:
 804  00e3 a40f          	and	a,#15
 805  00e5 5f            	clrw	x
 806  00e6 97            	ld	xl,a
 807  00e7 a601          	ld	a,#1
 808  00e9 5d            	tnzw	x
 809  00ea 81            	ret	
 997                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
 997                     ; 310 {
 998                     	switch	.text
 999  00eb               _CLK_ClockSwitchConfig:
1001  00eb 89            	pushw	x
1002  00ec 5204          	subw	sp,#4
1003       00000004      OFST:	set	4
1006                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1008  00ee aeffff        	ldw	x,#65535
1009  00f1 1f03          	ldw	(OFST-1,sp),x
1011                     ; 313   ErrorStatus Swif = ERROR;
1013                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1015                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1017                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1019                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1021                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1023  00f3 c650c3        	ld	a,20675
1024  00f6 6b01          	ld	(OFST-3,sp),a
1026                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1028  00f8 7b05          	ld	a,(OFST+1,sp)
1029  00fa 4a            	dec	a
1030  00fb 263d          	jrne	L544
1031                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1033  00fd 721250c5      	bset	20677,#1
1034                     ; 331     if (ITState != DISABLE)
1036  0101 7b09          	ld	a,(OFST+5,sp)
1037  0103 2706          	jreq	L744
1038                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1040  0105 721450c5      	bset	20677,#2
1042  0109 2004          	jra	L154
1043  010b               L744:
1044                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1046  010b 721550c5      	bres	20677,#2
1047  010f               L154:
1048                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1050  010f 7b06          	ld	a,(OFST+2,sp)
1051  0111 c750c4        	ld	20676,a
1053  0114 2003          	jra	L754
1054  0116               L354:
1055                     ; 346       DownCounter--;
1057  0116 5a            	decw	x
1058  0117 1f03          	ldw	(OFST-1,sp),x
1060  0119               L754:
1061                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1063  0119 720150c504    	btjf	20677,#0,L364
1065  011e 1e03          	ldw	x,(OFST-1,sp)
1066  0120 26f4          	jrne	L354
1067  0122               L364:
1068                     ; 349     if(DownCounter != 0)
1070  0122 1e03          	ldw	x,(OFST-1,sp)
1071                     ; 351       Swif = SUCCESS;
1073  0124 263d          	jrne	LC005
1074  0126               L564:
1075                     ; 355       Swif = ERROR;
1078  0126 0f02          	clr	(OFST-2,sp)
1080  0128               L174:
1081                     ; 390   if(Swif != ERROR)
1083  0128 275d          	jreq	L515
1084                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1086  012a 7b0a          	ld	a,(OFST+6,sp)
1087  012c 263b          	jrne	L715
1089  012e 7b01          	ld	a,(OFST-3,sp)
1090  0130 a1e1          	cp	a,#225
1091  0132 2635          	jrne	L715
1092                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1094  0134 721150c0      	bres	20672,#0
1096  0138 204d          	jra	L515
1097  013a               L544:
1098                     ; 361     if (ITState != DISABLE)
1100  013a 7b09          	ld	a,(OFST+5,sp)
1101  013c 2706          	jreq	L374
1102                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1104  013e 721450c5      	bset	20677,#2
1106  0142 2004          	jra	L574
1107  0144               L374:
1108                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1110  0144 721550c5      	bres	20677,#2
1111  0148               L574:
1112                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1114  0148 7b06          	ld	a,(OFST+2,sp)
1115  014a c750c4        	ld	20676,a
1117  014d 2003          	jra	L305
1118  014f               L774:
1119                     ; 376       DownCounter--;
1121  014f 5a            	decw	x
1122  0150 1f03          	ldw	(OFST-1,sp),x
1124  0152               L305:
1125                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1127  0152 720750c504    	btjf	20677,#3,L705
1129  0157 1e03          	ldw	x,(OFST-1,sp)
1130  0159 26f4          	jrne	L774
1131  015b               L705:
1132                     ; 379     if(DownCounter != 0)
1134  015b 1e03          	ldw	x,(OFST-1,sp)
1135  015d 27c7          	jreq	L564
1136                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1138  015f 721250c5      	bset	20677,#1
1139                     ; 383       Swif = SUCCESS;
1141  0163               LC005:
1143  0163 a601          	ld	a,#1
1144  0165 6b02          	ld	(OFST-2,sp),a
1147  0167 20bf          	jra	L174
1148                     ; 387       Swif = ERROR;
1149  0169               L715:
1150                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1152  0169 7b0a          	ld	a,(OFST+6,sp)
1153  016b 260c          	jrne	L325
1155  016d 7b01          	ld	a,(OFST-3,sp)
1156  016f a1d2          	cp	a,#210
1157  0171 2606          	jrne	L325
1158                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1160  0173 721750c0      	bres	20672,#3
1162  0177 200e          	jra	L515
1163  0179               L325:
1164                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1166  0179 7b0a          	ld	a,(OFST+6,sp)
1167  017b 260a          	jrne	L515
1169  017d 7b01          	ld	a,(OFST-3,sp)
1170  017f a1b4          	cp	a,#180
1171  0181 2604          	jrne	L515
1172                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1174  0183 721150c1      	bres	20673,#0
1175  0187               L515:
1176                     ; 406   return(Swif);
1178  0187 7b02          	ld	a,(OFST-2,sp)
1181  0189 5b06          	addw	sp,#6
1182  018b 81            	ret	
1320                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1320                     ; 416 {
1321                     	switch	.text
1322  018c               _CLK_HSIPrescalerConfig:
1324  018c 88            	push	a
1325       00000000      OFST:	set	0
1328                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1330                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1332  018d c650c6        	ld	a,20678
1333  0190 a4e7          	and	a,#231
1334  0192 c750c6        	ld	20678,a
1335                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1337  0195 c650c6        	ld	a,20678
1338  0198 1a01          	or	a,(OFST+1,sp)
1339  019a c750c6        	ld	20678,a
1340                     ; 425 }
1343  019d 84            	pop	a
1344  019e 81            	ret	
1479                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1479                     ; 437 {
1480                     	switch	.text
1481  019f               _CLK_CCOConfig:
1483  019f 88            	push	a
1484       00000000      OFST:	set	0
1487                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1489                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1491  01a0 c650c9        	ld	a,20681
1492  01a3 a4e1          	and	a,#225
1493  01a5 c750c9        	ld	20681,a
1494                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1496  01a8 c650c9        	ld	a,20681
1497  01ab 1a01          	or	a,(OFST+1,sp)
1498  01ad c750c9        	ld	20681,a
1499                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1501  01b0 721050c9      	bset	20681,#0
1502                     ; 449 }
1505  01b4 84            	pop	a
1506  01b5 81            	ret	
1571                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1571                     ; 460 {
1572                     	switch	.text
1573  01b6               _CLK_ITConfig:
1575  01b6 89            	pushw	x
1576       00000000      OFST:	set	0
1579                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1581                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1583                     ; 465   if (NewState != DISABLE)
1585  01b7 9f            	ld	a,xl
1586  01b8 4d            	tnz	a
1587  01b9 2715          	jreq	L527
1588                     ; 467     switch (CLK_IT)
1590  01bb 9e            	ld	a,xh
1592                     ; 475     default:
1592                     ; 476       break;
1593  01bc a00c          	sub	a,#12
1594  01be 270a          	jreq	L166
1595  01c0 a010          	sub	a,#16
1596  01c2 2620          	jrne	L337
1597                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1597                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1599  01c4 721450c5      	bset	20677,#2
1600                     ; 471       break;
1602  01c8 201a          	jra	L337
1603  01ca               L166:
1604                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1604                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1606  01ca 721450c8      	bset	20680,#2
1607                     ; 474       break;
1609  01ce 2014          	jra	L337
1610                     ; 475     default:
1610                     ; 476       break;
1613  01d0               L527:
1614                     ; 481     switch (CLK_IT)
1616  01d0 7b01          	ld	a,(OFST+1,sp)
1618                     ; 489     default:
1618                     ; 490       break;
1619  01d2 a00c          	sub	a,#12
1620  01d4 270a          	jreq	L766
1621  01d6 a010          	sub	a,#16
1622  01d8 260a          	jrne	L337
1623                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1623                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1625  01da 721550c5      	bres	20677,#2
1626                     ; 485       break;
1628  01de 2004          	jra	L337
1629  01e0               L766:
1630                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1630                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1632  01e0 721550c8      	bres	20680,#2
1633                     ; 488       break;
1634  01e4               L337:
1635                     ; 493 }
1638  01e4 85            	popw	x
1639  01e5 81            	ret	
1640                     ; 489     default:
1640                     ; 490       break;
1676                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1676                     ; 501 {
1677                     	switch	.text
1678  01e6               _CLK_SYSCLKConfig:
1680  01e6 88            	push	a
1681       00000000      OFST:	set	0
1684                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1686                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1688  01e7 a580          	bcp	a,#128
1689  01e9 260e          	jrne	L757
1690                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1692  01eb c650c6        	ld	a,20678
1693  01ee a4e7          	and	a,#231
1694  01f0 c750c6        	ld	20678,a
1695                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1697  01f3 7b01          	ld	a,(OFST+1,sp)
1698  01f5 a418          	and	a,#24
1700  01f7 200c          	jra	L167
1701  01f9               L757:
1702                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1704  01f9 c650c6        	ld	a,20678
1705  01fc a4f8          	and	a,#248
1706  01fe c750c6        	ld	20678,a
1707                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1709  0201 7b01          	ld	a,(OFST+1,sp)
1710  0203 a407          	and	a,#7
1711  0205               L167:
1712  0205 ca50c6        	or	a,20678
1713  0208 c750c6        	ld	20678,a
1714                     ; 515 }
1717  020b 84            	pop	a
1718  020c 81            	ret	
1774                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1774                     ; 524 {
1775                     	switch	.text
1776  020d               _CLK_SWIMConfig:
1780                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1782                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1784  020d 4d            	tnz	a
1785  020e 2705          	jreq	L1101
1786                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1788  0210 721050cd      	bset	20685,#0
1791  0214 81            	ret	
1792  0215               L1101:
1793                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1795  0215 721150cd      	bres	20685,#0
1796                     ; 538 }
1799  0219 81            	ret	
1823                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1823                     ; 548 {
1824                     	switch	.text
1825  021a               _CLK_ClockSecuritySystemEnable:
1829                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1831  021a 721050c8      	bset	20680,#0
1832                     ; 551 }
1835  021e 81            	ret	
1860                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1860                     ; 560 {
1861                     	switch	.text
1862  021f               _CLK_GetSYSCLKSource:
1866                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1868  021f c650c3        	ld	a,20675
1871  0222 81            	ret	
1934                     ; 569 uint32_t CLK_GetClockFreq(void)
1934                     ; 570 {
1935                     	switch	.text
1936  0223               _CLK_GetClockFreq:
1938  0223 5209          	subw	sp,#9
1939       00000009      OFST:	set	9
1942                     ; 571   uint32_t clockfrequency = 0;
1944                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1946                     ; 573   uint8_t tmp = 0, presc = 0;
1950                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1952  0225 c650c3        	ld	a,20675
1953  0228 6b09          	ld	(OFST+0,sp),a
1955                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1957  022a a1e1          	cp	a,#225
1958  022c 2634          	jrne	L7601
1959                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1961  022e c650c6        	ld	a,20678
1962  0231 a418          	and	a,#24
1963  0233 44            	srl	a
1964  0234 44            	srl	a
1965  0235 44            	srl	a
1967                     ; 581     tmp = (uint8_t)(tmp >> 3);
1970                     ; 582     presc = HSIDivFactor[tmp];
1972  0236 5f            	clrw	x
1973  0237 97            	ld	xl,a
1974  0238 d60000        	ld	a,(_HSIDivFactor,x)
1975  023b 6b09          	ld	(OFST+0,sp),a
1977                     ; 583     clockfrequency = HSI_VALUE / presc;
1979  023d b703          	ld	c_lreg+3,a
1980  023f 3f02          	clr	c_lreg+2
1981  0241 3f01          	clr	c_lreg+1
1982  0243 3f00          	clr	c_lreg
1983  0245 96            	ldw	x,sp
1984  0246 5c            	incw	x
1985  0247 cd0000        	call	c_rtol
1988  024a ae2400        	ldw	x,#9216
1989  024d bf02          	ldw	c_lreg+2,x
1990  024f ae00f4        	ldw	x,#244
1991  0252 bf00          	ldw	c_lreg,x
1992  0254 96            	ldw	x,sp
1993  0255 5c            	incw	x
1994  0256 cd0000        	call	c_ludv
1996  0259 96            	ldw	x,sp
1997  025a 1c0005        	addw	x,#OFST-4
1998  025d cd0000        	call	c_rtol
2002  0260 2018          	jra	L1701
2003  0262               L7601:
2004                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2006  0262 a1d2          	cp	a,#210
2007  0264 260a          	jrne	L3701
2008                     ; 587     clockfrequency = LSI_VALUE;
2010  0266 aef400        	ldw	x,#62464
2011  0269 1f07          	ldw	(OFST-2,sp),x
2012  026b ae0001        	ldw	x,#1
2014  026e 2008          	jp	LC006
2015  0270               L3701:
2016                     ; 591     clockfrequency = HSE_VALUE;
2018  0270 ae2400        	ldw	x,#9216
2019  0273 1f07          	ldw	(OFST-2,sp),x
2020  0275 ae00f4        	ldw	x,#244
2021  0278               LC006:
2022  0278 1f05          	ldw	(OFST-4,sp),x
2024  027a               L1701:
2025                     ; 594   return((uint32_t)clockfrequency);
2027  027a 96            	ldw	x,sp
2028  027b 1c0005        	addw	x,#OFST-4
2029  027e cd0000        	call	c_ltor
2033  0281 5b09          	addw	sp,#9
2034  0283 81            	ret	
2133                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2133                     ; 605 {
2134                     	switch	.text
2135  0284               _CLK_AdjustHSICalibrationValue:
2137  0284 88            	push	a
2138       00000000      OFST:	set	0
2141                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2143                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2145  0285 c650cc        	ld	a,20684
2146  0288 a4f8          	and	a,#248
2147  028a 1a01          	or	a,(OFST+1,sp)
2148  028c c750cc        	ld	20684,a
2149                     ; 611 }
2152  028f 84            	pop	a
2153  0290 81            	ret	
2177                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2177                     ; 623 {
2178                     	switch	.text
2179  0291               _CLK_SYSCLKEmergencyClear:
2183                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2185  0291 721150c5      	bres	20677,#0
2186                     ; 625 }
2189  0295 81            	ret	
2342                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2342                     ; 635 {
2343                     	switch	.text
2344  0296               _CLK_GetFlagStatus:
2346  0296 89            	pushw	x
2347  0297 5203          	subw	sp,#3
2348       00000003      OFST:	set	3
2351                     ; 636   uint16_t statusreg = 0;
2353                     ; 637   uint8_t tmpreg = 0;
2355                     ; 638   FlagStatus bitstatus = RESET;
2357                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2359                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2361  0299 01            	rrwa	x,a
2362  029a 4f            	clr	a
2363  029b 02            	rlwa	x,a
2364  029c 1f01          	ldw	(OFST-2,sp),x
2366                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2368  029e a30100        	cpw	x,#256
2369  02a1 2605          	jrne	L1421
2370                     ; 649     tmpreg = CLK->ICKR;
2372  02a3 c650c0        	ld	a,20672
2374  02a6 2021          	jra	L3421
2375  02a8               L1421:
2376                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2378  02a8 a30200        	cpw	x,#512
2379  02ab 2605          	jrne	L5421
2380                     ; 653     tmpreg = CLK->ECKR;
2382  02ad c650c1        	ld	a,20673
2384  02b0 2017          	jra	L3421
2385  02b2               L5421:
2386                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2388  02b2 a30300        	cpw	x,#768
2389  02b5 2605          	jrne	L1521
2390                     ; 657     tmpreg = CLK->SWCR;
2392  02b7 c650c5        	ld	a,20677
2394  02ba 200d          	jra	L3421
2395  02bc               L1521:
2396                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2398  02bc a30400        	cpw	x,#1024
2399  02bf 2605          	jrne	L5521
2400                     ; 661     tmpreg = CLK->CSSR;
2402  02c1 c650c8        	ld	a,20680
2404  02c4 2003          	jra	L3421
2405  02c6               L5521:
2406                     ; 665     tmpreg = CLK->CCOR;
2408  02c6 c650c9        	ld	a,20681
2409  02c9               L3421:
2410  02c9 6b03          	ld	(OFST+0,sp),a
2412                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2414  02cb 7b05          	ld	a,(OFST+2,sp)
2415  02cd 1503          	bcp	a,(OFST+0,sp)
2416  02cf 2704          	jreq	L1621
2417                     ; 670     bitstatus = SET;
2419  02d1 a601          	ld	a,#1
2422  02d3 2001          	jra	L3621
2423  02d5               L1621:
2424                     ; 674     bitstatus = RESET;
2426  02d5 4f            	clr	a
2428  02d6               L3621:
2429                     ; 678   return((FlagStatus)bitstatus);
2433  02d6 5b05          	addw	sp,#5
2434  02d8 81            	ret	
2480                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2480                     ; 688 {
2481                     	switch	.text
2482  02d9               _CLK_GetITStatus:
2484  02d9 88            	push	a
2485  02da 88            	push	a
2486       00000001      OFST:	set	1
2489                     ; 689   ITStatus bitstatus = RESET;
2491                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2493                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2495  02db a11c          	cp	a,#28
2496  02dd 2609          	jrne	L7031
2497                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2499  02df c450c5        	and	a,20677
2500  02e2 a10c          	cp	a,#12
2501  02e4 260f          	jrne	L7131
2502                     ; 699       bitstatus = SET;
2504  02e6 2009          	jp	LC008
2505                     ; 703       bitstatus = RESET;
2506  02e8               L7031:
2507                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2509  02e8 c650c8        	ld	a,20680
2510  02eb 1402          	and	a,(OFST+1,sp)
2511  02ed a10c          	cp	a,#12
2512  02ef 2604          	jrne	L7131
2513                     ; 711       bitstatus = SET;
2515  02f1               LC008:
2517  02f1 a601          	ld	a,#1
2520  02f3 2001          	jra	L5131
2521  02f5               L7131:
2522                     ; 715       bitstatus = RESET;
2525  02f5 4f            	clr	a
2527  02f6               L5131:
2528                     ; 720   return bitstatus;
2532  02f6 85            	popw	x
2533  02f7 81            	ret	
2569                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2569                     ; 730 {
2570                     	switch	.text
2571  02f8               _CLK_ClearITPendingBit:
2575                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2577                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2579  02f8 a10c          	cp	a,#12
2580  02fa 2605          	jrne	L1431
2581                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2583  02fc 721750c8      	bres	20680,#3
2586  0300 81            	ret	
2587  0301               L1431:
2588                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2590  0301 721750c5      	bres	20677,#3
2591                     ; 745 }
2594  0305 81            	ret	
2629                     	xdef	_CLKPrescTable
2630                     	xdef	_HSIDivFactor
2631                     	xdef	_CLK_ClearITPendingBit
2632                     	xdef	_CLK_GetITStatus
2633                     	xdef	_CLK_GetFlagStatus
2634                     	xdef	_CLK_GetSYSCLKSource
2635                     	xdef	_CLK_GetClockFreq
2636                     	xdef	_CLK_AdjustHSICalibrationValue
2637                     	xdef	_CLK_SYSCLKEmergencyClear
2638                     	xdef	_CLK_ClockSecuritySystemEnable
2639                     	xdef	_CLK_SWIMConfig
2640                     	xdef	_CLK_SYSCLKConfig
2641                     	xdef	_CLK_ITConfig
2642                     	xdef	_CLK_CCOConfig
2643                     	xdef	_CLK_HSIPrescalerConfig
2644                     	xdef	_CLK_ClockSwitchConfig
2645                     	xdef	_CLK_PeripheralClockConfig
2646                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2647                     	xdef	_CLK_FastHaltWakeUpCmd
2648                     	xdef	_CLK_ClockSwitchCmd
2649                     	xdef	_CLK_CCOCmd
2650                     	xdef	_CLK_LSICmd
2651                     	xdef	_CLK_HSICmd
2652                     	xdef	_CLK_HSECmd
2653                     	xdef	_CLK_DeInit
2654                     	xref.b	c_lreg
2655                     	xref.b	c_x
2674                     	xref	c_ltor
2675                     	xref	c_ludv
2676                     	xref	c_rtol
2677                     	end
