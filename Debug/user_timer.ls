   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  15                     	bsct
  16  0000               _tmr_delay:
  17  0000 00000000      	dc.l	0
  18  0004               _timer_tick:
  19  0004 0001          	dc.w	1
  50                     ; 14 void pool_tick(void)
  50                     ; 15 {
  52                     	switch	.text
  53  0000               _pool_tick:
  57                     ; 16     tick = timer_tick;
  59  0000 be04          	ldw	x,_timer_tick
  60  0002 bf00          	ldw	_tick,x
  61                     ; 17     timer_tick = 0;
  63  0004 5f            	clrw	x
  64  0005 bf04          	ldw	_timer_tick,x
  65                     ; 18 }
  68  0007 81            	ret
  93                     ; 20 void init_timer(void)
  93                     ; 21 {
  94                     	switch	.text
  95  0008               _init_timer:
  99                     ; 22     CLK_Config();    
 101  0008 ad03          	call	_CLK_Config
 103                     ; 23     TIM4_Config();
 105  000a ad17          	call	_TIM4_Config
 107                     ; 24 }
 110  000c 81            	ret
 134                     ; 31 void CLK_Config(void)
 134                     ; 32 {
 135                     	switch	.text
 136  000d               _CLK_Config:
 140                     ; 35     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 142  000d 4f            	clr	a
 143  000e cd0000        	call	_CLK_HSIPrescalerConfig
 145                     ; 36 }
 148  0011 81            	ret
 183                     ; 44 void delay(__IO uint32_t nTime)
 183                     ; 45 {
 184                     	switch	.text
 185  0012               _delay:
 187       00000000      OFST:	set	0
 190                     ; 46     tmr_delay = nTime;    
 192  0012 1e05          	ldw	x,(OFST+5,sp)
 193  0014 bf02          	ldw	_tmr_delay+2,x
 194  0016 1e03          	ldw	x,(OFST+3,sp)
 195  0018 bf00          	ldw	_tmr_delay,x
 197  001a               L36:
 198                     ; 47     while (tmr_delay);
 200  001a ae0000        	ldw	x,#_tmr_delay
 201  001d cd0000        	call	c_lzmp
 203  0020 26f8          	jrne	L36
 204                     ; 48 }
 207  0022 81            	ret
 235                     ; 55 void TIM4_Config(void)
 235                     ; 56 {
 236                     	switch	.text
 237  0023               _TIM4_Config:
 241                     ; 67     TIM4_TimeBaseInit(TIM4_PRESCALER_128, TIM4_PERIOD);
 243  0023 ae077c        	ldw	x,#1916
 244  0026 cd0000        	call	_TIM4_TimeBaseInit
 246                     ; 69     TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 248  0029 a601          	ld	a,#1
 249  002b cd0000        	call	_TIM4_ClearFlag
 251                     ; 71     TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 253  002e ae0101        	ldw	x,#257
 254  0031 cd0000        	call	_TIM4_ITConfig
 256                     ; 74     enableInterrupts();
 259  0034 9a            rim
 261                     ; 77     TIM4_Cmd(ENABLE);
 264  0035 a601          	ld	a,#1
 265  0037 cd0000        	call	_TIM4_Cmd
 267                     ; 78 }
 270  003a 81            	ret
 297                     ; 80 void task_timer(void)
 297                     ; 81 {
 298                     	switch	.text
 299  003b               _task_timer:
 303                     ; 82     if (tmr_delay)
 305  003b ae0000        	ldw	x,#_tmr_delay
 306  003e cd0000        	call	c_lzmp
 308  0041 2708          	jreq	L701
 309                     ; 83         --tmr_delay;
 311  0043 ae0000        	ldw	x,#_tmr_delay
 312  0046 a601          	ld	a,#1
 313  0048 cd0000        	call	c_lgsbc
 315  004b               L701:
 316                     ; 84     task_led();
 318  004b cd0000        	call	_task_led
 320                     ; 85     task_buzzer();
 322  004e cd0000        	call	_task_buzzer
 324                     ; 86     task_display();
 326  0051 cd0000        	call	_task_display
 328                     ; 87 }
 331  0054 81            	ret
 373                     	xdef	_task_timer
 374                     	xdef	_timer_tick
 375                     	switch	.ubsct
 376  0000               _tick:
 377  0000 0000          	ds.b	2
 378                     	xdef	_tick
 379                     	xdef	_tmr_delay
 380                     	xref	_task_display
 381                     	xref	_task_buzzer
 382                     	xref	_task_led
 383                     	xdef	_TIM4_Config
 384                     	xdef	_CLK_Config
 385                     	xdef	_delay
 386                     	xdef	_pool_tick
 387                     	xdef	_init_timer
 388                     	xref	_TIM4_ClearFlag
 389                     	xref	_TIM4_ITConfig
 390                     	xref	_TIM4_Cmd
 391                     	xref	_TIM4_TimeBaseInit
 392                     	xref	_CLK_HSIPrescalerConfig
 412                     	xref	c_lgsbc
 413                     	xref	c_lzmp
 414                     	end
