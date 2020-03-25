   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  47                     ; 49 void TIM4_DeInit(void)
  47                     ; 50 {
  49                     	switch	.text
  50  0000               _TIM4_DeInit:
  54                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  56  0000 725f5340      	clr	21312
  57                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  59  0004 725f5343      	clr	21315
  60                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  62  0008 725f5346      	clr	21318
  63                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  65  000c 725f5347      	clr	21319
  66                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  68  0010 35ff5348      	mov	21320,#255
  69                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  71  0014 725f5344      	clr	21316
  72                     ; 57 }
  75  0018 81            	ret	
 181                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 181                     ; 66 {
 182                     	switch	.text
 183  0019               _TIM4_TimeBaseInit:
 187                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 189                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 191  0019 9e            	ld	a,xh
 192  001a c75347        	ld	21319,a
 193                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 195  001d 9f            	ld	a,xl
 196  001e c75348        	ld	21320,a
 197                     ; 73 }
 200  0021 81            	ret	
 255                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 255                     ; 82 {
 256                     	switch	.text
 257  0022               _TIM4_Cmd:
 261                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 263                     ; 87   if (NewState != DISABLE)
 265  0022 4d            	tnz	a
 266  0023 2705          	jreq	L511
 267                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 269  0025 72105340      	bset	21312,#0
 272  0029 81            	ret	
 273  002a               L511:
 274                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 276  002a 72115340      	bres	21312,#0
 277                     ; 95 }
 280  002e 81            	ret	
 338                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 338                     ; 108 {
 339                     	switch	.text
 340  002f               _TIM4_ITConfig:
 342  002f 89            	pushw	x
 343       00000000      OFST:	set	0
 346                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 348                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 350                     ; 113   if (NewState != DISABLE)
 352  0030 9f            	ld	a,xl
 353  0031 4d            	tnz	a
 354  0032 2706          	jreq	L151
 355                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 357  0034 9e            	ld	a,xh
 358  0035 ca5343        	or	a,21315
 360  0038 2006          	jra	L351
 361  003a               L151:
 362                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 364  003a 7b01          	ld	a,(OFST+1,sp)
 365  003c 43            	cpl	a
 366  003d c45343        	and	a,21315
 367  0040               L351:
 368  0040 c75343        	ld	21315,a
 369                     ; 123 }
 372  0043 85            	popw	x
 373  0044 81            	ret	
 409                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 409                     ; 132 {
 410                     	switch	.text
 411  0045               _TIM4_UpdateDisableConfig:
 415                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 417                     ; 137   if (NewState != DISABLE)
 419  0045 4d            	tnz	a
 420  0046 2705          	jreq	L371
 421                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 423  0048 72125340      	bset	21312,#1
 426  004c 81            	ret	
 427  004d               L371:
 428                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 430  004d 72135340      	bres	21312,#1
 431                     ; 145 }
 434  0051 81            	ret	
 492                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 492                     ; 156 {
 493                     	switch	.text
 494  0052               _TIM4_UpdateRequestConfig:
 498                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 500                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 502  0052 4d            	tnz	a
 503  0053 2705          	jreq	L522
 504                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 506  0055 72145340      	bset	21312,#2
 509  0059 81            	ret	
 510  005a               L522:
 511                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 513  005a 72155340      	bres	21312,#2
 514                     ; 169 }
 517  005e 81            	ret	
 574                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 574                     ; 180 {
 575                     	switch	.text
 576  005f               _TIM4_SelectOnePulseMode:
 580                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 582                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 584  005f 4d            	tnz	a
 585  0060 2705          	jreq	L752
 586                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 588  0062 72165340      	bset	21312,#3
 591  0066 81            	ret	
 592  0067               L752:
 593                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 595  0067 72175340      	bres	21312,#3
 596                     ; 193 }
 599  006b 81            	ret	
 667                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 667                     ; 216 {
 668                     	switch	.text
 669  006c               _TIM4_PrescalerConfig:
 673                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 675                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 677                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 679  006c 9e            	ld	a,xh
 680  006d c75347        	ld	21319,a
 681                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 683  0070 9f            	ld	a,xl
 684  0071 c75345        	ld	21317,a
 685                     ; 226 }
 688  0074 81            	ret	
 724                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 724                     ; 235 {
 725                     	switch	.text
 726  0075               _TIM4_ARRPreloadConfig:
 730                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 732                     ; 240   if (NewState != DISABLE)
 734  0075 4d            	tnz	a
 735  0076 2705          	jreq	L333
 736                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 738  0078 721e5340      	bset	21312,#7
 741  007c 81            	ret	
 742  007d               L333:
 743                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 745  007d 721f5340      	bres	21312,#7
 746                     ; 248 }
 749  0081 81            	ret	
 798                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 798                     ; 258 {
 799                     	switch	.text
 800  0082               _TIM4_GenerateEvent:
 804                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 806                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 808  0082 c75345        	ld	21317,a
 809                     ; 264 }
 812  0085 81            	ret	
 846                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 846                     ; 273 {
 847                     	switch	.text
 848  0086               _TIM4_SetCounter:
 852                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 854  0086 c75346        	ld	21318,a
 855                     ; 276 }
 858  0089 81            	ret	
 892                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 892                     ; 285 {
 893                     	switch	.text
 894  008a               _TIM4_SetAutoreload:
 898                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 900  008a c75348        	ld	21320,a
 901                     ; 288 }
 904  008d 81            	ret	
 927                     ; 295 uint8_t TIM4_GetCounter(void)
 927                     ; 296 {
 928                     	switch	.text
 929  008e               _TIM4_GetCounter:
 933                     ; 298   return (uint8_t)(TIM4->CNTR);
 935  008e c65346        	ld	a,21318
 938  0091 81            	ret	
 962                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 962                     ; 307 {
 963                     	switch	.text
 964  0092               _TIM4_GetPrescaler:
 968                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 970  0092 c65347        	ld	a,21319
 973  0095 81            	ret	
1052                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1052                     ; 320 {
1053                     	switch	.text
1054  0096               _TIM4_GetFlagStatus:
1056       00000001      OFST:	set	1
1059                     ; 321   FlagStatus bitstatus = RESET;
1061                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1063                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1065  0096 c45344        	and	a,21316
1066  0099 2702          	jreq	L774
1067                     ; 328     bitstatus = SET;
1069  009b a601          	ld	a,#1
1072  009d               L774:
1073                     ; 332     bitstatus = RESET;
1076                     ; 334   return ((FlagStatus)bitstatus);
1080  009d 81            	ret	
1115                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1115                     ; 345 {
1116                     	switch	.text
1117  009e               _TIM4_ClearFlag:
1121                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1123                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1125  009e 43            	cpl	a
1126  009f c75344        	ld	21316,a
1127                     ; 351 }
1130  00a2 81            	ret	
1194                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1194                     ; 361 {
1195                     	switch	.text
1196  00a3               _TIM4_GetITStatus:
1198  00a3 88            	push	a
1199  00a4 89            	pushw	x
1200       00000002      OFST:	set	2
1203                     ; 362   ITStatus bitstatus = RESET;
1205                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1209                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1211                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1213  00a5 c45344        	and	a,21316
1214  00a8 6b01          	ld	(OFST-1,sp),a
1216                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1218  00aa c65343        	ld	a,21315
1219  00ad 1403          	and	a,(OFST+1,sp)
1220  00af 6b02          	ld	(OFST+0,sp),a
1222                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1224  00b1 7b01          	ld	a,(OFST-1,sp)
1225  00b3 2708          	jreq	L355
1227  00b5 7b02          	ld	a,(OFST+0,sp)
1228  00b7 2704          	jreq	L355
1229                     ; 375     bitstatus = (ITStatus)SET;
1231  00b9 a601          	ld	a,#1
1234  00bb 2001          	jra	L555
1235  00bd               L355:
1236                     ; 379     bitstatus = (ITStatus)RESET;
1238  00bd 4f            	clr	a
1240  00be               L555:
1241                     ; 381   return ((ITStatus)bitstatus);
1245  00be 5b03          	addw	sp,#3
1246  00c0 81            	ret	
1282                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1282                     ; 392 {
1283                     	switch	.text
1284  00c1               _TIM4_ClearITPendingBit:
1288                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1290                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1292  00c1 43            	cpl	a
1293  00c2 c75344        	ld	21316,a
1294                     ; 398 }
1297  00c5 81            	ret	
1310                     	xdef	_TIM4_ClearITPendingBit
1311                     	xdef	_TIM4_GetITStatus
1312                     	xdef	_TIM4_ClearFlag
1313                     	xdef	_TIM4_GetFlagStatus
1314                     	xdef	_TIM4_GetPrescaler
1315                     	xdef	_TIM4_GetCounter
1316                     	xdef	_TIM4_SetAutoreload
1317                     	xdef	_TIM4_SetCounter
1318                     	xdef	_TIM4_GenerateEvent
1319                     	xdef	_TIM4_ARRPreloadConfig
1320                     	xdef	_TIM4_PrescalerConfig
1321                     	xdef	_TIM4_SelectOnePulseMode
1322                     	xdef	_TIM4_UpdateRequestConfig
1323                     	xdef	_TIM4_UpdateDisableConfig
1324                     	xdef	_TIM4_ITConfig
1325                     	xdef	_TIM4_Cmd
1326                     	xdef	_TIM4_TimeBaseInit
1327                     	xdef	_TIM4_DeInit
1346                     	end
