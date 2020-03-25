   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  19                     	bsct
  20  0000               _tmr_delay:
  21  0000 00000000      	dc.l	0
  22  0004               _timer_tick:
  23  0004 0001          	dc.w	1
  54                     ; 13 void pool_tick(void)
  54                     ; 14 {
  56                     	switch	.text
  57  0000               _pool_tick:
  61                     ; 15     tick = timer_tick;
  63  0000 be04          	ldw	x,_timer_tick
  64  0002 bf00          	ldw	_tick,x
  65                     ; 16     timer_tick = 0;
  67  0004 5f            	clrw	x
  68  0005 bf04          	ldw	_timer_tick,x
  69                     ; 17 }
  72  0007 81            	ret	
  97                     ; 19 void init_timer(void)
  97                     ; 20 {
  98                     	switch	.text
  99  0008               _init_timer:
 103                     ; 21     CLK_Config();    
 105  0008 ad02          	call	_CLK_Config
 107                     ; 22     TIM4_Config();
 110                     ; 23 }
 113  000a 2015          	jp	_TIM4_Config
 137                     ; 30 void CLK_Config(void)
 137                     ; 31 {
 138                     	switch	.text
 139  000c               _CLK_Config:
 143                     ; 34     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 145  000c 4f            	clr	a
 147                     ; 35 }
 150  000d cc0000        	jp	_CLK_HSIPrescalerConfig
 185                     ; 43 void delay(__IO uint32_t nTime)
 185                     ; 44 {
 186                     	switch	.text
 187  0010               _delay:
 189       00000000      OFST:	set	0
 192                     ; 45     tmr_delay = nTime;    
 194  0010 1e05          	ldw	x,(OFST+5,sp)
 195  0012 bf02          	ldw	_tmr_delay+2,x
 196  0014 1e03          	ldw	x,(OFST+3,sp)
 197  0016 bf00          	ldw	_tmr_delay,x
 199  0018 ae0000        	ldw	x,#_tmr_delay
 200  001b               L36:
 201                     ; 46     while (tmr_delay != 0);
 203  001b cd0000        	call	c_lzmp
 205  001e 26fb          	jrne	L36
 206                     ; 47 }
 209  0020 81            	ret	
 237                     ; 54 void TIM4_Config(void)
 237                     ; 55 {
 238                     	switch	.text
 239  0021               _TIM4_Config:
 243                     ; 66     TIM4_TimeBaseInit(TIM4_PRESCALER_128, TIM4_PERIOD);
 245  0021 ae077c        	ldw	x,#1916
 246  0024 cd0000        	call	_TIM4_TimeBaseInit
 248                     ; 68     TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 250  0027 a601          	ld	a,#1
 251  0029 cd0000        	call	_TIM4_ClearFlag
 253                     ; 70     TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 255  002c ae0101        	ldw	x,#257
 256  002f cd0000        	call	_TIM4_ITConfig
 258                     ; 73     enableInterrupts();
 261  0032 9a            	rim	
 263                     ; 76     TIM4_Cmd(ENABLE);
 266  0033 a601          	ld	a,#1
 268                     ; 77 }
 271  0035 cc0000        	jp	_TIM4_Cmd
 297                     ; 79 void task_timer(void)
 297                     ; 80 {
 298                     	switch	.text
 299  0038               _task_timer:
 303                     ; 81     if (tmr_delay)
 305  0038 ae0000        	ldw	x,#_tmr_delay
 306  003b cd0000        	call	c_lzmp
 308  003e 2705          	jreq	L701
 309                     ; 82         --tmr_delay;
 311  0040 a601          	ld	a,#1
 312  0042 cd0000        	call	c_lgsbc
 314  0045               L701:
 315                     ; 83     task_led();
 317  0045 cd0000        	call	_task_led
 319                     ; 84     task_buzzer();
 322                     ; 85 }
 325  0048 cc0000        	jp	_task_buzzer
 367                     	xdef	_task_timer
 368                     	xdef	_timer_tick
 369                     	switch	.ubsct
 370  0000               _tick:
 371  0000 0000          	ds.b	2
 372                     	xdef	_tick
 373                     	xdef	_tmr_delay
 374                     	xref	_task_buzzer
 375                     	xref	_task_led
 376                     	xdef	_TIM4_Config
 377                     	xdef	_CLK_Config
 378                     	xdef	_delay
 379                     	xdef	_pool_tick
 380                     	xdef	_init_timer
 381                     	xref	_TIM4_ClearFlag
 382                     	xref	_TIM4_ITConfig
 383                     	xref	_TIM4_Cmd
 384                     	xref	_TIM4_TimeBaseInit
 385                     	xref	_CLK_HSIPrescalerConfig
 405                     	xref	c_lgsbc
 406                     	xref	c_lzmp
 407                     	end
