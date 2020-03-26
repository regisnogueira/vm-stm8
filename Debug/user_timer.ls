   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  14                     	bsct
  15  0000               _tmr_delay:
  16  0000 00000000      	dc.l	0
  17  0004               _timer_tick:
  18  0004 0001          	dc.w	1
  49                     ; 13 void pool_tick(void)
  49                     ; 14 {
  51                     	switch	.text
  52  0000               _pool_tick:
  56                     ; 15     tick = timer_tick;
  58  0000 be04          	ldw	x,_timer_tick
  59  0002 bf00          	ldw	_tick,x
  60                     ; 16     timer_tick = 0;
  62  0004 5f            	clrw	x
  63  0005 bf04          	ldw	_timer_tick,x
  64                     ; 17 }
  67  0007 81            	ret
  92                     ; 19 void init_timer(void)
  92                     ; 20 {
  93                     	switch	.text
  94  0008               _init_timer:
  98                     ; 21     CLK_Config();    
 100  0008 ad03          	call	_CLK_Config
 102                     ; 22     TIM4_Config();
 104  000a ad17          	call	_TIM4_Config
 106                     ; 23 }
 109  000c 81            	ret
 133                     ; 30 void CLK_Config(void)
 133                     ; 31 {
 134                     	switch	.text
 135  000d               _CLK_Config:
 139                     ; 34     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 141  000d 4f            	clr	a
 142  000e cd0000        	call	_CLK_HSIPrescalerConfig
 144                     ; 35 }
 147  0011 81            	ret
 182                     ; 43 void delay(__IO uint32_t nTime)
 182                     ; 44 {
 183                     	switch	.text
 184  0012               _delay:
 186       00000000      OFST:	set	0
 189                     ; 45     tmr_delay = nTime;    
 191  0012 1e05          	ldw	x,(OFST+5,sp)
 192  0014 bf02          	ldw	_tmr_delay+2,x
 193  0016 1e03          	ldw	x,(OFST+3,sp)
 194  0018 bf00          	ldw	_tmr_delay,x
 196  001a               L36:
 197                     ; 46     while (tmr_delay != 0);
 199  001a ae0000        	ldw	x,#_tmr_delay
 200  001d cd0000        	call	c_lzmp
 202  0020 26f8          	jrne	L36
 203                     ; 47 }
 206  0022 81            	ret
 234                     ; 54 void TIM4_Config(void)
 234                     ; 55 {
 235                     	switch	.text
 236  0023               _TIM4_Config:
 240                     ; 66     TIM4_TimeBaseInit(TIM4_PRESCALER_128, TIM4_PERIOD);
 242  0023 ae077c        	ldw	x,#1916
 243  0026 cd0000        	call	_TIM4_TimeBaseInit
 245                     ; 68     TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 247  0029 a601          	ld	a,#1
 248  002b cd0000        	call	_TIM4_ClearFlag
 250                     ; 70     TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 252  002e ae0101        	ldw	x,#257
 253  0031 cd0000        	call	_TIM4_ITConfig
 255                     ; 73     enableInterrupts();
 258  0034 9a            rim
 260                     ; 76     TIM4_Cmd(ENABLE);
 263  0035 a601          	ld	a,#1
 264  0037 cd0000        	call	_TIM4_Cmd
 266                     ; 77 }
 269  003a 81            	ret
 295                     ; 79 void task_timer(void)
 295                     ; 80 {
 296                     	switch	.text
 297  003b               _task_timer:
 301                     ; 81     if (tmr_delay)
 303  003b ae0000        	ldw	x,#_tmr_delay
 304  003e cd0000        	call	c_lzmp
 306  0041 2708          	jreq	L701
 307                     ; 82         --tmr_delay;
 309  0043 ae0000        	ldw	x,#_tmr_delay
 310  0046 a601          	ld	a,#1
 311  0048 cd0000        	call	c_lgsbc
 313  004b               L701:
 314                     ; 83     task_led();
 316  004b cd0000        	call	_task_led
 318                     ; 84     task_buzzer();
 320  004e cd0000        	call	_task_buzzer
 322                     ; 85 }
 325  0051 81            	ret
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
