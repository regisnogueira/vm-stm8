   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  79                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  79                     ; 88 {
  81                     	switch	.text
  82  0000               _FLASH_Unlock:
  86                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  88                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
  90  0000 a1fd          	cp	a,#253
  91  0002 2609          	jrne	L73
  92                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
  94  0004 35565062      	mov	20578,#86
  95                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
  97  0008 35ae5062      	mov	20578,#174
 100  000c 81            	ret	
 101  000d               L73:
 102                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 104  000d 35ae5064      	mov	20580,#174
 105                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 107  0011 35565064      	mov	20580,#86
 108                     ; 104 }
 111  0015 81            	ret	
 146                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 146                     ; 113 {
 147                     	switch	.text
 148  0016               _FLASH_Lock:
 152                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 154                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 156  0016 c4505f        	and	a,20575
 157  0019 c7505f        	ld	20575,a
 158                     ; 119 }
 161  001c 81            	ret	
 184                     ; 126 void FLASH_DeInit(void)
 184                     ; 127 {
 185                     	switch	.text
 186  001d               _FLASH_DeInit:
 190                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 192  001d 725f505a      	clr	20570
 193                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 195  0021 725f505b      	clr	20571
 196                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 198  0025 35ff505c      	mov	20572,#255
 199                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 201  0029 7217505f      	bres	20575,#3
 202                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 204  002d 7213505f      	bres	20575,#1
 205                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 207  0031 c6505f        	ld	a,20575
 208                     ; 134 }
 211  0034 81            	ret	
 266                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 266                     ; 143 {
 267                     	switch	.text
 268  0035               _FLASH_ITConfig:
 272                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 274                     ; 147   if(NewState != DISABLE)
 276  0035 4d            	tnz	a
 277  0036 2705          	jreq	L711
 278                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 280  0038 7212505a      	bset	20570,#1
 283  003c 81            	ret	
 284  003d               L711:
 285                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 287  003d 7213505a      	bres	20570,#1
 288                     ; 155 }
 291  0041 81            	ret	
 325                     ; 164 void FLASH_EraseByte(uint32_t Address)
 325                     ; 165 {
 326                     	switch	.text
 327  0042               _FLASH_EraseByte:
 329       00000000      OFST:	set	0
 332                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 334                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 336  0042 1e05          	ldw	x,(OFST+5,sp)
 337  0044 7f            	clr	(x)
 338                     ; 171 }
 341  0045 81            	ret	
 384                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 384                     ; 182 {
 385                     	switch	.text
 386  0046               _FLASH_ProgramByte:
 388       00000000      OFST:	set	0
 391                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 393                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 395  0046 1e05          	ldw	x,(OFST+5,sp)
 396  0048 7b07          	ld	a,(OFST+7,sp)
 397  004a f7            	ld	(x),a
 398                     ; 186 }
 401  004b 81            	ret	
 435                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 435                     ; 196 {
 436                     	switch	.text
 437  004c               _FLASH_ReadByte:
 439       00000000      OFST:	set	0
 442                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 444                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 446  004c 1e05          	ldw	x,(OFST+5,sp)
 447  004e f6            	ld	a,(x)
 450  004f 81            	ret	
 493                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 493                     ; 213 {
 494                     	switch	.text
 495  0050               _FLASH_ProgramWord:
 497       00000000      OFST:	set	0
 500                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 502                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 504  0050 721c505b      	bset	20571,#6
 505                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 507  0054 721d505c      	bres	20572,#6
 508                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 510  0058 1e05          	ldw	x,(OFST+5,sp)
 511  005a 7b07          	ld	a,(OFST+7,sp)
 512  005c f7            	ld	(x),a
 513                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 515  005d 7b08          	ld	a,(OFST+8,sp)
 516  005f e701          	ld	(1,x),a
 517                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 519  0061 7b09          	ld	a,(OFST+9,sp)
 520  0063 e702          	ld	(2,x),a
 521                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 523  0065 7b0a          	ld	a,(OFST+10,sp)
 524  0067 e703          	ld	(3,x),a
 525                     ; 229 }
 528  0069 81            	ret	
 573                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 573                     ; 238 {
 574                     	switch	.text
 575  006a               _FLASH_ProgramOptionByte:
 577  006a 89            	pushw	x
 578       00000000      OFST:	set	0
 581                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 583                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 585  006b 721e505b      	bset	20571,#7
 586                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 588  006f 721f505c      	bres	20572,#7
 589                     ; 247   if(Address == 0x4800)
 591  0073 a34800        	cpw	x,#18432
 592  0076 2605          	jrne	L542
 593                     ; 250     *((NEAR uint8_t*)Address) = Data;
 595  0078 7b05          	ld	a,(OFST+5,sp)
 596  007a f7            	ld	(x),a
 598  007b 2006          	jra	L742
 599  007d               L542:
 600                     ; 255     *((NEAR uint8_t*)Address) = Data;
 602  007d 7b05          	ld	a,(OFST+5,sp)
 603  007f f7            	ld	(x),a
 604                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 606  0080 43            	cpl	a
 607  0081 e701          	ld	(1,x),a
 608  0083               L742:
 609                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 611  0083 a6fd          	ld	a,#253
 612  0085 cd014a        	call	_FLASH_WaitForLastOperation
 614                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 616  0088 721f505b      	bres	20571,#7
 617                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 619  008c 721e505c      	bset	20572,#7
 620                     ; 263 }
 623  0090 85            	popw	x
 624  0091 81            	ret	
 660                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 660                     ; 271 {
 661                     	switch	.text
 662  0092               _FLASH_EraseOptionByte:
 664  0092 89            	pushw	x
 665       00000000      OFST:	set	0
 668                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 670                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 672  0093 721e505b      	bset	20571,#7
 673                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 675  0097 721f505c      	bres	20572,#7
 676                     ; 280   if(Address == 0x4800)
 678  009b a34800        	cpw	x,#18432
 679  009e 2603          	jrne	L762
 680                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 682  00a0 7f            	clr	(x)
 684  00a1 2005          	jra	L172
 685  00a3               L762:
 686                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 688  00a3 7f            	clr	(x)
 689                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 691  00a4 a6ff          	ld	a,#255
 692  00a6 e701          	ld	(1,x),a
 693  00a8               L172:
 694                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 696  00a8 a6fd          	ld	a,#253
 697  00aa cd014a        	call	_FLASH_WaitForLastOperation
 699                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 701  00ad 721f505b      	bres	20571,#7
 702                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 704  00b1 721e505c      	bset	20572,#7
 705                     ; 296 }
 708  00b5 85            	popw	x
 709  00b6 81            	ret	
 772                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 772                     ; 304 {
 773                     	switch	.text
 774  00b7               _FLASH_ReadOptionByte:
 776  00b7 5204          	subw	sp,#4
 777       00000004      OFST:	set	4
 780                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
 782                     ; 306   uint16_t res_value = 0;
 784                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 786                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 788  00b9 f6            	ld	a,(x)
 789  00ba 6b01          	ld	(OFST-3,sp),a
 791                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 793  00bc e601          	ld	a,(1,x)
 794  00be 6b02          	ld	(OFST-2,sp),a
 796                     ; 315   if(Address == 0x4800)	 
 798  00c0 a34800        	cpw	x,#18432
 799  00c3 2606          	jrne	L523
 800                     ; 317     res_value =	 value_optbyte;
 802  00c5 7b01          	ld	a,(OFST-3,sp)
 803  00c7 5f            	clrw	x
 804  00c8 97            	ld	xl,a
 807  00c9 201c          	jra	L723
 808  00cb               L523:
 809                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
 811  00cb 43            	cpl	a
 812  00cc 1101          	cp	a,(OFST-3,sp)
 813  00ce 2614          	jrne	L133
 814                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 816  00d0 7b01          	ld	a,(OFST-3,sp)
 817  00d2 97            	ld	xl,a
 818  00d3 4f            	clr	a
 819  00d4 02            	rlwa	x,a
 820  00d5 1f03          	ldw	(OFST-1,sp),x
 822                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
 824  00d7 5f            	clrw	x
 825  00d8 7b02          	ld	a,(OFST-2,sp)
 826  00da 97            	ld	xl,a
 827  00db 01            	rrwa	x,a
 828  00dc 1a04          	or	a,(OFST+0,sp)
 829  00de 01            	rrwa	x,a
 830  00df 1a03          	or	a,(OFST-1,sp)
 831  00e1 01            	rrwa	x,a
 834  00e2 2003          	jra	L723
 835  00e4               L133:
 836                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
 838  00e4 ae5555        	ldw	x,#21845
 840  00e7               L723:
 841                     ; 331   return(res_value);
 845  00e7 5b04          	addw	sp,#4
 846  00e9 81            	ret	
 920                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 920                     ; 341 {
 921                     	switch	.text
 922  00ea               _FLASH_SetLowPowerMode:
 924  00ea 88            	push	a
 925       00000000      OFST:	set	0
 928                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 930                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 932  00eb c6505a        	ld	a,20570
 933  00ee a4f3          	and	a,#243
 934  00f0 c7505a        	ld	20570,a
 935                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 937  00f3 c6505a        	ld	a,20570
 938  00f6 1a01          	or	a,(OFST+1,sp)
 939  00f8 c7505a        	ld	20570,a
 940                     ; 350 }
 943  00fb 84            	pop	a
 944  00fc 81            	ret	
1002                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1002                     ; 359 {
1003                     	switch	.text
1004  00fd               _FLASH_SetProgrammingTime:
1008                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1010                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1012  00fd 7211505a      	bres	20570,#0
1013                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1015  0101 ca505a        	or	a,20570
1016  0104 c7505a        	ld	20570,a
1017                     ; 365 }
1020  0107 81            	ret	
1045                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1045                     ; 373 {
1046                     	switch	.text
1047  0108               _FLASH_GetLowPowerMode:
1051                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1053  0108 c6505a        	ld	a,20570
1054  010b a40c          	and	a,#12
1057  010d 81            	ret	
1082                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1082                     ; 383 {
1083                     	switch	.text
1084  010e               _FLASH_GetProgrammingTime:
1088                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1090  010e c6505a        	ld	a,20570
1091  0111 a401          	and	a,#1
1094  0113 81            	ret	
1128                     ; 392 uint32_t FLASH_GetBootSize(void)
1128                     ; 393 {
1129                     	switch	.text
1130  0114               _FLASH_GetBootSize:
1132  0114 5204          	subw	sp,#4
1133       00000004      OFST:	set	4
1136                     ; 394   uint32_t temp = 0;
1138                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1140  0116 c6505d        	ld	a,20573
1141  0119 5f            	clrw	x
1142  011a 97            	ld	xl,a
1143  011b 90ae0200      	ldw	y,#512
1144  011f cd0000        	call	c_umul
1146  0122 96            	ldw	x,sp
1147  0123 5c            	incw	x
1148  0124 cd0000        	call	c_rtol
1151                     ; 400   if(FLASH->FPR == 0xFF)
1153  0127 c6505d        	ld	a,20573
1154  012a 4c            	inc	a
1155  012b 260d          	jrne	L354
1156                     ; 402     temp += 512;
1158  012d ae0200        	ldw	x,#512
1159  0130 bf02          	ldw	c_lreg+2,x
1160  0132 5f            	clrw	x
1161  0133 bf00          	ldw	c_lreg,x
1162  0135 96            	ldw	x,sp
1163  0136 5c            	incw	x
1164  0137 cd0000        	call	c_lgadd
1167  013a               L354:
1168                     ; 406   return(temp);
1170  013a 96            	ldw	x,sp
1171  013b 5c            	incw	x
1172  013c cd0000        	call	c_ltor
1176  013f 5b04          	addw	sp,#4
1177  0141 81            	ret	
1279                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1279                     ; 418 {
1280                     	switch	.text
1281  0142               _FLASH_GetFlagStatus:
1283       00000001      OFST:	set	1
1286                     ; 419   FlagStatus status = RESET;
1288                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1290                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1292  0142 c4505f        	and	a,20575
1293  0145 2702          	jreq	L325
1294                     ; 426     status = SET; /* FLASH_FLAG is set */
1296  0147 a601          	ld	a,#1
1299  0149               L325:
1300                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1303                     ; 434   return status;
1307  0149 81            	ret	
1392                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1392                     ; 550 {
1393                     	switch	.text
1394  014a               _FLASH_WaitForLastOperation:
1396  014a 5203          	subw	sp,#3
1397       00000003      OFST:	set	3
1400                     ; 551   uint8_t flagstatus = 0x00;
1402  014c 0f03          	clr	(OFST+0,sp)
1404                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1406  014e aeffff        	ldw	x,#65535
1407                     ; 576   UNUSED(FLASH_MemType);
1410  0151 2008          	jra	L175
1411  0153               L765:
1412                     ; 579     flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1414  0153 c6505f        	ld	a,20575
1415  0156 a405          	and	a,#5
1416  0158 6b03          	ld	(OFST+0,sp),a
1418                     ; 580     timeout--;
1420  015a 5a            	decw	x
1421  015b               L175:
1422  015b 1f01          	ldw	(OFST-2,sp),x
1424                     ; 577   while((flagstatus == 0x00) && (timeout != 0x00))
1426  015d 7b03          	ld	a,(OFST+0,sp)
1427  015f 2604          	jrne	L575
1429  0161 1e01          	ldw	x,(OFST-2,sp)
1430  0163 26ee          	jrne	L765
1431  0165               L575:
1432                     ; 584   if(timeout == 0x00 )
1434  0165 1e01          	ldw	x,(OFST-2,sp)
1435  0167 2602          	jrne	L775
1436                     ; 586     flagstatus = FLASH_STATUS_TIMEOUT;
1438  0169 a602          	ld	a,#2
1440  016b               L775:
1441                     ; 589   return((FLASH_Status_TypeDef)flagstatus);
1445  016b 5b03          	addw	sp,#3
1446  016d 81            	ret	
1509                     ; 599 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1509                     ; 600 {
1510                     	switch	.text
1511  016e               _FLASH_EraseBlock:
1513  016e 89            	pushw	x
1514  016f 5206          	subw	sp,#6
1515       00000006      OFST:	set	6
1518                     ; 601   uint32_t startaddress = 0;
1520                     ; 611   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1522                     ; 612   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1524  0171 7b0b          	ld	a,(OFST+5,sp)
1525  0173 a1fd          	cp	a,#253
1526  0175 2605          	jrne	L336
1527                     ; 614     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1529                     ; 615     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1531  0177 ae8000        	ldw	x,#32768
1533  017a 2003          	jra	L536
1534  017c               L336:
1535                     ; 619     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1537                     ; 620     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1539  017c ae4000        	ldw	x,#16384
1540  017f               L536:
1541  017f 1f05          	ldw	(OFST-1,sp),x
1542  0181 5f            	clrw	x
1543  0182 1f03          	ldw	(OFST-3,sp),x
1545                     ; 628     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1547  0184 a640          	ld	a,#64
1548  0186 1e07          	ldw	x,(OFST+1,sp)
1549  0188 cd0000        	call	c_cmulx
1551  018b 96            	ldw	x,sp
1552  018c 1c0003        	addw	x,#OFST-3
1553  018f cd0000        	call	c_ladd
1555  0192 be02          	ldw	x,c_lreg+2
1556  0194 1f01          	ldw	(OFST-5,sp),x
1558                     ; 632   FLASH->CR2 |= FLASH_CR2_ERASE;
1560  0196 721a505b      	bset	20571,#5
1561                     ; 633   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1563  019a 721b505c      	bres	20572,#5
1564                     ; 637     *pwFlash = (uint32_t)0;
1566  019e 4f            	clr	a
1567  019f e703          	ld	(3,x),a
1568  01a1 e702          	ld	(2,x),a
1569  01a3 e701          	ld	(1,x),a
1570  01a5 f7            	ld	(x),a
1571                     ; 645 }
1574  01a6 5b08          	addw	sp,#8
1575  01a8 81            	ret	
1679                     ; 656 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1679                     ; 657                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1679                     ; 658 {
1680                     	switch	.text
1681  01a9               _FLASH_ProgramBlock:
1683  01a9 89            	pushw	x
1684  01aa 5206          	subw	sp,#6
1685       00000006      OFST:	set	6
1688                     ; 659   uint16_t Count = 0;
1690                     ; 660   uint32_t startaddress = 0;
1692                     ; 663   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1694                     ; 664   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1696                     ; 665   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1698  01ac 7b0b          	ld	a,(OFST+5,sp)
1699  01ae a1fd          	cp	a,#253
1700  01b0 2605          	jrne	L117
1701                     ; 667     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1703                     ; 668     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1705  01b2 ae8000        	ldw	x,#32768
1707  01b5 2003          	jra	L317
1708  01b7               L117:
1709                     ; 672     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1711                     ; 673     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1713  01b7 ae4000        	ldw	x,#16384
1714  01ba               L317:
1715  01ba 1f03          	ldw	(OFST-3,sp),x
1716  01bc 5f            	clrw	x
1717  01bd 1f01          	ldw	(OFST-5,sp),x
1719                     ; 677   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1721  01bf a640          	ld	a,#64
1722  01c1 1e07          	ldw	x,(OFST+1,sp)
1723  01c3 cd0000        	call	c_cmulx
1725  01c6 96            	ldw	x,sp
1726  01c7 5c            	incw	x
1727  01c8 cd0000        	call	c_lgadd
1730                     ; 680   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1732  01cb 7b0c          	ld	a,(OFST+6,sp)
1733  01cd 260a          	jrne	L517
1734                     ; 683     FLASH->CR2 |= FLASH_CR2_PRG;
1736  01cf 7210505b      	bset	20571,#0
1737                     ; 684     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1739  01d3 7211505c      	bres	20572,#0
1741  01d7 2008          	jra	L717
1742  01d9               L517:
1743                     ; 689     FLASH->CR2 |= FLASH_CR2_FPRG;
1745  01d9 7218505b      	bset	20571,#4
1746                     ; 690     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1748  01dd 7219505c      	bres	20572,#4
1749  01e1               L717:
1750                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1752  01e1 5f            	clrw	x
1753  01e2 1f05          	ldw	(OFST-1,sp),x
1755  01e4               L127:
1756                     ; 696     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1758  01e4 1e0d          	ldw	x,(OFST+7,sp)
1759  01e6 72fb05        	addw	x,(OFST-1,sp)
1760  01e9 f6            	ld	a,(x)
1761  01ea 1e03          	ldw	x,(OFST-3,sp)
1762  01ec 72fb05        	addw	x,(OFST-1,sp)
1763  01ef f7            	ld	(x),a
1764                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1766  01f0 1e05          	ldw	x,(OFST-1,sp)
1767  01f2 5c            	incw	x
1768  01f3 1f05          	ldw	(OFST-1,sp),x
1772  01f5 a30040        	cpw	x,#64
1773  01f8 25ea          	jrult	L127
1774                     ; 698 }
1777  01fa 5b08          	addw	sp,#8
1778  01fc 81            	ret	
1791                     	xdef	_FLASH_WaitForLastOperation
1792                     	xdef	_FLASH_ProgramBlock
1793                     	xdef	_FLASH_EraseBlock
1794                     	xdef	_FLASH_GetFlagStatus
1795                     	xdef	_FLASH_GetBootSize
1796                     	xdef	_FLASH_GetProgrammingTime
1797                     	xdef	_FLASH_GetLowPowerMode
1798                     	xdef	_FLASH_SetProgrammingTime
1799                     	xdef	_FLASH_SetLowPowerMode
1800                     	xdef	_FLASH_EraseOptionByte
1801                     	xdef	_FLASH_ProgramOptionByte
1802                     	xdef	_FLASH_ReadOptionByte
1803                     	xdef	_FLASH_ProgramWord
1804                     	xdef	_FLASH_ReadByte
1805                     	xdef	_FLASH_ProgramByte
1806                     	xdef	_FLASH_EraseByte
1807                     	xdef	_FLASH_ITConfig
1808                     	xdef	_FLASH_DeInit
1809                     	xdef	_FLASH_Lock
1810                     	xdef	_FLASH_Unlock
1811                     	xref.b	c_lreg
1812                     	xref.b	c_x
1813                     	xref.b	c_y
1832                     	xref	c_ladd
1833                     	xref	c_cmulx
1834                     	xref	c_ltor
1835                     	xref	c_lgadd
1836                     	xref	c_rtol
1837                     	xref	c_umul
1838                     	end
