   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  15                     	bsct
  16  0000               _tmr_delay:
  17  0000 00000000      	dc.l	0
  18  0004               _timer_tick:
  19  0004 0001          	dc.w	1
  50                     ; 17 void pool_tick(void)
  50                     ; 18 {
  52                     	switch	.text
  53  0000               _pool_tick:
  57                     ; 19     tick = timer_tick;
  59  0000 be04          	ldw	x,_timer_tick
  60  0002 bf00          	ldw	_tick,x
  61                     ; 20     timer_tick = 0;
  63  0004 5f            	clrw	x
  64  0005 bf04          	ldw	_timer_tick,x
  65                     ; 21 }
  68  0007 81            	ret
  93                     ; 23 void init_timer(void)
  93                     ; 24 {
  94                     	switch	.text
  95  0008               _init_timer:
  99                     ; 25     CLK_Config();    
 101  0008 ad03          	call	_CLK_Config
 103                     ; 26     TIM4_Config();
 105  000a ad17          	call	_TIM4_Config
 107                     ; 27 }
 110  000c 81            	ret
 134                     ; 34 void CLK_Config(void)
 134                     ; 35 {
 135                     	switch	.text
 136  000d               _CLK_Config:
 140                     ; 38     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 142  000d 4f            	clr	a
 143  000e cd0000        	call	_CLK_HSIPrescalerConfig
 145                     ; 39 }
 148  0011 81            	ret
 183                     ; 47 void delay(__IO uint32_t nTime)
 183                     ; 48 {
 184                     	switch	.text
 185  0012               _delay:
 187       00000000      OFST:	set	0
 190                     ; 49     tmr_delay = nTime;    
 192  0012 1e05          	ldw	x,(OFST+5,sp)
 193  0014 bf02          	ldw	_tmr_delay+2,x
 194  0016 1e03          	ldw	x,(OFST+3,sp)
 195  0018 bf00          	ldw	_tmr_delay,x
 197  001a               L36:
 198                     ; 50     while (tmr_delay);
 200  001a ae0000        	ldw	x,#_tmr_delay
 201  001d cd0000        	call	c_lzmp
 203  0020 26f8          	jrne	L36
 204                     ; 51 }
 207  0022 81            	ret
 235                     ; 58 void TIM4_Config(void)
 235                     ; 59 {
 236                     	switch	.text
 237  0023               _TIM4_Config:
 241                     ; 70     TIM4_TimeBaseInit(TIM4_PRESCALER_128, TIM4_PERIOD);
 243  0023 ae077c        	ldw	x,#1916
 244  0026 cd0000        	call	_TIM4_TimeBaseInit
 246                     ; 72     TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 248  0029 a601          	ld	a,#1
 249  002b cd0000        	call	_TIM4_ClearFlag
 251                     ; 74     TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 253  002e ae0101        	ldw	x,#257
 254  0031 cd0000        	call	_TIM4_ITConfig
 256                     ; 77     enableInterrupts();
 259  0034 9a            rim
 261                     ; 80     TIM4_Cmd(ENABLE);
 264  0035 a601          	ld	a,#1
 265  0037 cd0000        	call	_TIM4_Cmd
 267                     ; 81 }
 270  003a 81            	ret
 298                     ; 83 void task_timer(void)
 298                     ; 84 {
 299                     	switch	.text
 300  003b               _task_timer:
 304                     ; 85     if (tmr_delay)
 306  003b ae0000        	ldw	x,#_tmr_delay
 307  003e cd0000        	call	c_lzmp
 309  0041 2708          	jreq	L701
 310                     ; 86         tmr_delay--;
 312  0043 ae0000        	ldw	x,#_tmr_delay
 313  0046 a601          	ld	a,#1
 314  0048 cd0000        	call	c_lgsbc
 316  004b               L701:
 317                     ; 87     tmr_led();
 319  004b cd0000        	call	_tmr_led
 321                     ; 88     tmr_buzzer();
 323  004e cd0000        	call	_tmr_buzzer
 325                     ; 89     tmr_display();
 327  0051 cd0000        	call	_tmr_display
 329                     ; 90     tmr_menu();
 331  0054 cd0000        	call	_tmr_menu
 333                     ; 91 }
 336  0057 81            	ret
 378                     	xdef	_task_timer
 379                     	xdef	_timer_tick
 380                     	switch	.ubsct
 381  0000               _tick:
 382  0000 0000          	ds.b	2
 383                     	xdef	_tick
 384                     	xdef	_tmr_delay
 385                     	xref	_tmr_menu
 386                     	xref	_tmr_display
 387                     	xref	_tmr_buzzer
 388                     	xref	_tmr_led
 389                     	xdef	_TIM4_Config
 390                     	xdef	_CLK_Config
 391                     	xdef	_delay
 392                     	xdef	_pool_tick
 393                     	xdef	_init_timer
 394                     	xref	_TIM4_ClearFlag
 395                     	xref	_TIM4_ITConfig
 396                     	xref	_TIM4_Cmd
 397                     	xref	_TIM4_TimeBaseInit
 398                     	xref	_CLK_HSIPrescalerConfig
 418                     	xref	c_lgsbc
 419                     	xref	c_lzmp
 420                     	end
