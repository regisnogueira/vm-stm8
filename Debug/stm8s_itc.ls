   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  47                     ; 50 uint8_t ITC_GetCPUCC(void)
  47                     ; 51 {
  49                     	switch	.text
  50  0000               _ITC_GetCPUCC:
  54                     ; 53   _asm("push cc");
  57  0000 8a            	push	cc
  59                     ; 54   _asm("pop a");
  62  0001 84            	pop	a
  64                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  67  0002 81            	ret	
  90                     ; 80 void ITC_DeInit(void)
  90                     ; 81 {
  91                     	switch	.text
  92  0003               _ITC_DeInit:
  96                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  98  0003 35ff7f70      	mov	32624,#255
  99                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 101  0007 35ff7f71      	mov	32625,#255
 102                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 104  000b 35ff7f72      	mov	32626,#255
 105                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 107  000f 35ff7f73      	mov	32627,#255
 108                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 110  0013 35ff7f74      	mov	32628,#255
 111                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 113  0017 35ff7f75      	mov	32629,#255
 114                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 116  001b 35ff7f76      	mov	32630,#255
 117                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 119  001f 35ff7f77      	mov	32631,#255
 120                     ; 90 }
 123  0023 81            	ret	
 148                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 148                     ; 98 {
 149                     	switch	.text
 150  0024               _ITC_GetSoftIntStatus:
 154                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 156  0024 adda          	call	_ITC_GetCPUCC
 158  0026 a428          	and	a,#40
 161  0028 81            	ret	
 410                     .const:	section	.text
 411  0000               L42:
 412  0000 004a          	dc.w	L14
 413  0002 004a          	dc.w	L14
 414  0004 004a          	dc.w	L14
 415  0006 004a          	dc.w	L14
 416  0008 004f          	dc.w	L34
 417  000a 004f          	dc.w	L34
 418  000c 004f          	dc.w	L34
 419  000e 004f          	dc.w	L34
 420  0010 006f          	dc.w	L302
 421  0012 006f          	dc.w	L302
 422  0014 0054          	dc.w	L54
 423  0016 0054          	dc.w	L54
 424  0018 0059          	dc.w	L74
 425  001a 0059          	dc.w	L74
 426  001c 0059          	dc.w	L74
 427  001e 0059          	dc.w	L74
 428  0020 005e          	dc.w	L15
 429  0022 005e          	dc.w	L15
 430  0024 005e          	dc.w	L15
 431  0026 005e          	dc.w	L15
 432  0028 006f          	dc.w	L302
 433  002a 006f          	dc.w	L302
 434  002c 0063          	dc.w	L35
 435  002e 0063          	dc.w	L35
 436  0030 0068          	dc.w	L55
 437                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 437                     ; 108 {
 438                     	switch	.text
 439  0029               _ITC_GetSoftwarePriority:
 441  0029 88            	push	a
 442  002a 89            	pushw	x
 443       00000002      OFST:	set	2
 446                     ; 109   uint8_t Value = 0;
 448  002b 0f02          	clr	(OFST+0,sp)
 450                     ; 110   uint8_t Mask = 0;
 452                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 454                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 456  002d a403          	and	a,#3
 457  002f 48            	sll	a
 458  0030 5f            	clrw	x
 459  0031 97            	ld	xl,a
 460  0032 a603          	ld	a,#3
 461  0034 5d            	tnzw	x
 462  0035 2704          	jreq	L61
 463  0037               L02:
 464  0037 48            	sll	a
 465  0038 5a            	decw	x
 466  0039 26fc          	jrne	L02
 467  003b               L61:
 468  003b 6b01          	ld	(OFST-1,sp),a
 470                     ; 118   switch (IrqNum)
 472  003d 7b03          	ld	a,(OFST+1,sp)
 474                     ; 198   default:
 474                     ; 199     break;
 475  003f a119          	cp	a,#25
 476  0041 242c          	jruge	L302
 477  0043 5f            	clrw	x
 478  0044 97            	ld	xl,a
 479  0045 58            	sllw	x
 480  0046 de0000        	ldw	x,(L42,x)
 481  0049 fc            	jp	(x)
 482  004a               L14:
 483                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 483                     ; 121   case ITC_IRQ_AWU:
 483                     ; 122   case ITC_IRQ_CLK:
 483                     ; 123   case ITC_IRQ_PORTA:
 483                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 485  004a c67f70        	ld	a,32624
 486                     ; 125     break;
 488  004d 201c          	jp	LC001
 489  004f               L34:
 490                     ; 127   case ITC_IRQ_PORTB:
 490                     ; 128   case ITC_IRQ_PORTC:
 490                     ; 129   case ITC_IRQ_PORTD:
 490                     ; 130   case ITC_IRQ_PORTE:
 490                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 492  004f c67f71        	ld	a,32625
 493                     ; 132     break;
 495  0052 2017          	jp	LC001
 496  0054               L54:
 497                     ; 141   case ITC_IRQ_SPI:
 497                     ; 142   case ITC_IRQ_TIM1_OVF:
 497                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 499  0054 c67f72        	ld	a,32626
 500                     ; 144     break;
 502  0057 2012          	jp	LC001
 503  0059               L74:
 504                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 504                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 504                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 504                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 504                     ; 150 #else
 504                     ; 151   case ITC_IRQ_TIM2_OVF:
 504                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 504                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 504                     ; 154   case ITC_IRQ_TIM3_OVF:
 504                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 506  0059 c67f73        	ld	a,32627
 507                     ; 156     break;
 509  005c 200d          	jp	LC001
 510  005e               L15:
 511                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 511                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 511                     ; 160     defined(STM8S003) ||defined(STM8S001) || defined (STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 511                     ; 161   case ITC_IRQ_UART1_TX:
 511                     ; 162   case ITC_IRQ_UART1_RX:
 511                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 511                     ; 164 #if defined(STM8AF622x)
 511                     ; 165   case ITC_IRQ_UART4_TX:
 511                     ; 166   case ITC_IRQ_UART4_RX:
 511                     ; 167 #endif /*STM8AF622x */
 511                     ; 168   case ITC_IRQ_I2C:
 511                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 513  005e c67f74        	ld	a,32628
 514                     ; 170     break;
 516  0061 2008          	jp	LC001
 517  0063               L35:
 518                     ; 184   case ITC_IRQ_ADC1:
 518                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 518                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 518                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 518                     ; 188 #else
 518                     ; 189   case ITC_IRQ_TIM4_OVF:
 518                     ; 190 #endif /*STM8S903 or STM8AF622x */
 518                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 520  0063 c67f75        	ld	a,32629
 521                     ; 192     break;
 523  0066 2003          	jp	LC001
 524  0068               L55:
 525                     ; 194   case ITC_IRQ_EEPROM_EEC:
 525                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 527  0068 c67f76        	ld	a,32630
 528  006b               LC001:
 529  006b 1401          	and	a,(OFST-1,sp)
 530  006d 6b02          	ld	(OFST+0,sp),a
 532                     ; 196     break;
 534                     ; 198   default:
 534                     ; 199     break;
 536  006f               L302:
 537                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 539  006f 7b03          	ld	a,(OFST+1,sp)
 540  0071 a403          	and	a,#3
 541  0073 48            	sll	a
 542  0074 5f            	clrw	x
 543  0075 97            	ld	xl,a
 544  0076 7b02          	ld	a,(OFST+0,sp)
 545  0078 5d            	tnzw	x
 546  0079 2704          	jreq	L62
 547  007b               L03:
 548  007b 44            	srl	a
 549  007c 5a            	decw	x
 550  007d 26fc          	jrne	L03
 551  007f               L62:
 553                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 557  007f 5b03          	addw	sp,#3
 558  0081 81            	ret	
 622                     	switch	.const
 623  0032               L64:
 624  0032 00b8          	dc.w	L502
 625  0034 00b8          	dc.w	L502
 626  0036 00b8          	dc.w	L502
 627  0038 00b8          	dc.w	L502
 628  003a 00ca          	dc.w	L702
 629  003c 00ca          	dc.w	L702
 630  003e 00ca          	dc.w	L702
 631  0040 00ca          	dc.w	L702
 632  0042 0134          	dc.w	L162
 633  0044 0134          	dc.w	L162
 634  0046 00dc          	dc.w	L112
 635  0048 00dc          	dc.w	L112
 636  004a 00ee          	dc.w	L312
 637  004c 00ee          	dc.w	L312
 638  004e 00ee          	dc.w	L312
 639  0050 00ee          	dc.w	L312
 640  0052 0100          	dc.w	L512
 641  0054 0100          	dc.w	L512
 642  0056 0100          	dc.w	L512
 643  0058 0100          	dc.w	L512
 644  005a 0134          	dc.w	L162
 645  005c 0134          	dc.w	L162
 646  005e 0112          	dc.w	L712
 647  0060 0112          	dc.w	L712
 648  0062 0124          	dc.w	L122
 649                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 649                     ; 221 {
 650                     	switch	.text
 651  0082               _ITC_SetSoftwarePriority:
 653  0082 89            	pushw	x
 654  0083 89            	pushw	x
 655       00000002      OFST:	set	2
 658                     ; 222   uint8_t Mask = 0;
 660                     ; 223   uint8_t NewPriority = 0;
 662                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 664                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 666                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 668                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 670  0084 9e            	ld	a,xh
 671  0085 a403          	and	a,#3
 672  0087 48            	sll	a
 673  0088 5f            	clrw	x
 674  0089 97            	ld	xl,a
 675  008a a603          	ld	a,#3
 676  008c 5d            	tnzw	x
 677  008d 2704          	jreq	L43
 678  008f               L63:
 679  008f 48            	sll	a
 680  0090 5a            	decw	x
 681  0091 26fc          	jrne	L63
 682  0093               L43:
 683  0093 43            	cpl	a
 684  0094 6b01          	ld	(OFST-1,sp),a
 686                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 688  0096 7b03          	ld	a,(OFST+1,sp)
 689  0098 a403          	and	a,#3
 690  009a 48            	sll	a
 691  009b 5f            	clrw	x
 692  009c 97            	ld	xl,a
 693  009d 7b04          	ld	a,(OFST+2,sp)
 694  009f 5d            	tnzw	x
 695  00a0 2704          	jreq	L04
 696  00a2               L24:
 697  00a2 48            	sll	a
 698  00a3 5a            	decw	x
 699  00a4 26fc          	jrne	L24
 700  00a6               L04:
 701  00a6 6b02          	ld	(OFST+0,sp),a
 703                     ; 239   switch (IrqNum)
 705  00a8 7b03          	ld	a,(OFST+1,sp)
 707                     ; 329   default:
 707                     ; 330     break;
 708  00aa a119          	cp	a,#25
 709  00ac 2503cc0134    	jruge	L162
 710  00b1 5f            	clrw	x
 711  00b2 97            	ld	xl,a
 712  00b3 58            	sllw	x
 713  00b4 de0032        	ldw	x,(L64,x)
 714  00b7 fc            	jp	(x)
 715  00b8               L502:
 716                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 716                     ; 242   case ITC_IRQ_AWU:
 716                     ; 243   case ITC_IRQ_CLK:
 716                     ; 244   case ITC_IRQ_PORTA:
 716                     ; 245     ITC->ISPR1 &= Mask;
 718  00b8 c67f70        	ld	a,32624
 719  00bb 1401          	and	a,(OFST-1,sp)
 720  00bd c77f70        	ld	32624,a
 721                     ; 246     ITC->ISPR1 |= NewPriority;
 723  00c0 c67f70        	ld	a,32624
 724  00c3 1a02          	or	a,(OFST+0,sp)
 725  00c5 c77f70        	ld	32624,a
 726                     ; 247     break;
 728  00c8 206a          	jra	L162
 729  00ca               L702:
 730                     ; 249   case ITC_IRQ_PORTB:
 730                     ; 250   case ITC_IRQ_PORTC:
 730                     ; 251   case ITC_IRQ_PORTD:
 730                     ; 252   case ITC_IRQ_PORTE:
 730                     ; 253     ITC->ISPR2 &= Mask;
 732  00ca c67f71        	ld	a,32625
 733  00cd 1401          	and	a,(OFST-1,sp)
 734  00cf c77f71        	ld	32625,a
 735                     ; 254     ITC->ISPR2 |= NewPriority;
 737  00d2 c67f71        	ld	a,32625
 738  00d5 1a02          	or	a,(OFST+0,sp)
 739  00d7 c77f71        	ld	32625,a
 740                     ; 255     break;
 742  00da 2058          	jra	L162
 743  00dc               L112:
 744                     ; 264   case ITC_IRQ_SPI:
 744                     ; 265   case ITC_IRQ_TIM1_OVF:
 744                     ; 266     ITC->ISPR3 &= Mask;
 746  00dc c67f72        	ld	a,32626
 747  00df 1401          	and	a,(OFST-1,sp)
 748  00e1 c77f72        	ld	32626,a
 749                     ; 267     ITC->ISPR3 |= NewPriority;
 751  00e4 c67f72        	ld	a,32626
 752  00e7 1a02          	or	a,(OFST+0,sp)
 753  00e9 c77f72        	ld	32626,a
 754                     ; 268     break;
 756  00ec 2046          	jra	L162
 757  00ee               L312:
 758                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 758                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 758                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 758                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 758                     ; 274 #else
 758                     ; 275   case ITC_IRQ_TIM2_OVF:
 758                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 758                     ; 277 #endif /*STM8S903 or STM8AF622x */
 758                     ; 278   case ITC_IRQ_TIM3_OVF:
 758                     ; 279     ITC->ISPR4 &= Mask;
 760  00ee c67f73        	ld	a,32627
 761  00f1 1401          	and	a,(OFST-1,sp)
 762  00f3 c77f73        	ld	32627,a
 763                     ; 280     ITC->ISPR4 |= NewPriority;
 765  00f6 c67f73        	ld	a,32627
 766  00f9 1a02          	or	a,(OFST+0,sp)
 767  00fb c77f73        	ld	32627,a
 768                     ; 281     break;
 770  00fe 2034          	jra	L162
 771  0100               L512:
 772                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 772                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 772                     ; 285     defined(STM8S001) ||defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 772                     ; 286   case ITC_IRQ_UART1_TX:
 772                     ; 287   case ITC_IRQ_UART1_RX:
 772                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 772                     ; 289 #if defined(STM8AF622x)
 772                     ; 290   case ITC_IRQ_UART4_TX:
 772                     ; 291   case ITC_IRQ_UART4_RX:
 772                     ; 292 #endif /*STM8AF622x */
 772                     ; 293   case ITC_IRQ_I2C:
 772                     ; 294     ITC->ISPR5 &= Mask;
 774  0100 c67f74        	ld	a,32628
 775  0103 1401          	and	a,(OFST-1,sp)
 776  0105 c77f74        	ld	32628,a
 777                     ; 295     ITC->ISPR5 |= NewPriority;
 779  0108 c67f74        	ld	a,32628
 780  010b 1a02          	or	a,(OFST+0,sp)
 781  010d c77f74        	ld	32628,a
 782                     ; 296     break;
 784  0110 2022          	jra	L162
 785  0112               L712:
 786                     ; 312   case ITC_IRQ_ADC1:
 786                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 786                     ; 314     
 786                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 786                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 786                     ; 317 #else
 786                     ; 318   case ITC_IRQ_TIM4_OVF:
 786                     ; 319 #endif /* STM8S903 or STM8AF622x */
 786                     ; 320     ITC->ISPR6 &= Mask;
 788  0112 c67f75        	ld	a,32629
 789  0115 1401          	and	a,(OFST-1,sp)
 790  0117 c77f75        	ld	32629,a
 791                     ; 321     ITC->ISPR6 |= NewPriority;
 793  011a c67f75        	ld	a,32629
 794  011d 1a02          	or	a,(OFST+0,sp)
 795  011f c77f75        	ld	32629,a
 796                     ; 322     break;
 798  0122 2010          	jra	L162
 799  0124               L122:
 800                     ; 324   case ITC_IRQ_EEPROM_EEC:
 800                     ; 325     ITC->ISPR7 &= Mask;
 802  0124 c67f76        	ld	a,32630
 803  0127 1401          	and	a,(OFST-1,sp)
 804  0129 c77f76        	ld	32630,a
 805                     ; 326     ITC->ISPR7 |= NewPriority;
 807  012c c67f76        	ld	a,32630
 808  012f 1a02          	or	a,(OFST+0,sp)
 809  0131 c77f76        	ld	32630,a
 810                     ; 327     break;
 812                     ; 329   default:
 812                     ; 330     break;
 814  0134               L162:
 815                     ; 332 }
 818  0134 5b04          	addw	sp,#4
 819  0136 81            	ret	
 832                     	xdef	_ITC_GetSoftwarePriority
 833                     	xdef	_ITC_SetSoftwarePriority
 834                     	xdef	_ITC_GetSoftIntStatus
 835                     	xdef	_ITC_DeInit
 836                     	xdef	_ITC_GetCPUCC
 855                     	end
