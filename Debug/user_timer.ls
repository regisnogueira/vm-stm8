   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  15                     	bsct
  16  0000               _tmr_delay:
  17  0000 00000000      	dc.l	0
  18  0004               _timer_tick:
  19  0004 0001          	dc.w	1
  50                     ; 13 void pool_tick(void)
  50                     ; 14 {
  52                     	switch	.text
  53  0000               _pool_tick:
  57                     ; 15     tick = timer_tick;
  59  0000 be04          	ldw	x,_timer_tick
  60  0002 bf00          	ldw	_tick,x
  61                     ; 16     timer_tick = 0;
  63  0004 5f            	clrw	x
  64  0005 bf04          	ldw	_timer_tick,x
  65                     ; 17 }
  68  0007 81            	ret
  93                     ; 19 void init_timer(void)
  93                     ; 20 {
  94                     	switch	.text
  95  0008               _init_timer:
  99                     ; 21     CLK_Config();    
 101  0008 ad03          	call	_CLK_Config
 103                     ; 22     TIM4_Config();
 105  000a ad17          	call	_TIM4_Config
 107                     ; 23 }
 110  000c 81            	ret
 134                     ; 30 void CLK_Config(void)
 134                     ; 31 {
 135                     	switch	.text
 136  000d               _CLK_Config:
 140                     ; 34     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 142  000d 4f            	clr	a
 143  000e cd0000        	call	_CLK_HSIPrescalerConfig
 145                     ; 35 }
 148  0011 81            	ret
 183                     ; 43 void delay(__IO uint32_t nTime)
 183                     ; 44 {
 184                     	switch	.text
 185  0012               _delay:
 187       00000000      OFST:	set	0
 190                     ; 45     tmr_delay = nTime;    
 192  0012 1e05          	ldw	x,(OFST+5,sp)
 193  0014 bf02          	ldw	_tmr_delay+2,x
 194  0016 1e03          	ldw	x,(OFST+3,sp)
 195  0018 bf00          	ldw	_tmr_delay,x
 197  001a               L36:
 198                     ; 46     while (tmr_delay != 0);
 200  001a ae0000        	ldw	x,#_tmr_delay
 201  001d cd0000        	call	c_lzmp
 203  0020 26f8          	jrne	L36
 204                     ; 47 }
 207  0022 81            	ret
 235                     ; 54 void TIM4_Config(void)
 235                     ; 55 {
 236                     	switch	.text
 237  0023               _TIM4_Config:
 241                     ; 66     TIM4_TimeBaseInit(TIM4_PRESCALER_128, TIM4_PERIOD);
 243  0023 ae077c        	ldw	x,#1916
 244  0026 cd0000        	call	_TIM4_TimeBaseInit
 246                     ; 68     TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 248  0029 a601          	ld	a,#1
 249  002b cd0000        	call	_TIM4_ClearFlag
 251                     ; 70     TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 253  002e ae0101        	ldw	x,#257
 254  0031 cd0000        	call	_TIM4_ITConfig
 256                     ; 73     enableInterrupts();
 259  0034 9a            rim
 261                     ; 76     TIM4_Cmd(ENABLE);
 264  0035 a601          	ld	a,#1
 265  0037 cd0000        	call	_TIM4_Cmd
 267                     ; 77 }
 270  003a 81            	ret
 296                     ; 79 void task_timer(void)
 296                     ; 80 {
 297                     	switch	.text
 298  003b               _task_timer:
 302                     ; 81     if (tmr_delay)
 304  003b ae0000        	ldw	x,#_tmr_delay
 305  003e cd0000        	call	c_lzmp
 307  0041 2708          	jreq	L701
 308                     ; 82         --tmr_delay;
 310  0043 ae0000        	ldw	x,#_tmr_delay
 311  0046 a601          	ld	a,#1
 312  0048 cd0000        	call	c_lgsbc
 314  004b               L701:
 315                     ; 83     task_led();
 317  004b cd0000        	call	_task_led
 319                     ; 84     task_buzzer();
 321  004e cd0000        	call	_task_buzzer
 323                     ; 85 }
 326  0051 81            	ret
 368                     	xdef	_task_timer
 369                     	xdef	_timer_tick
 370                     	switch	.ubsct
 371  0000               _tick:
 372  0000 0000          	ds.b	2
 373                     	xdef	_tick
 374                     	xdef	_tmr_delay
 375                     	xref	_task_buzzer
 376                     	xref	_task_led
 377                     	xdef	_TIM4_Config
 378                     	xdef	_CLK_Config
 379                     	xdef	_delay
 380                     	xdef	_pool_tick
 381                     	xdef	_init_timer
 382                     	xref	_TIM4_ClearFlag
 383                     	xref	_TIM4_ITConfig
 384                     	xref	_TIM4_Cmd
 385                     	xref	_TIM4_TimeBaseInit
 386                     	xref	_CLK_HSIPrescalerConfig
 406                     	xref	c_lgsbc
 407                     	xref	c_lzmp
 408                     	end
