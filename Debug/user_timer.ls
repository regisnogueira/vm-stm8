   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  15                     	bsct
  16  0000               _tmr_delay:
  17  0000 00000000      	dc.l	0
  18  0004               _timer_tick:
  19  0004 01            	dc.b	1
  50                     ; 21 void pool_tick(void)
  50                     ; 22 {
  52                     	switch	.text
  53  0000               _pool_tick:
  57                     ; 23     tick = timer_tick;
  59  0000 450401        	mov	_tick,_timer_tick
  60                     ; 24     timer_tick = 0;
  62  0003 3f04          	clr	_timer_tick
  63                     ; 25 }
  66  0005 81            	ret
  91                     ; 27 void init_timer(void)
  91                     ; 28 {
  92                     	switch	.text
  93  0006               _init_timer:
  97                     ; 29     CLK_Config();    
  99  0006 ad03          	call	_CLK_Config
 101                     ; 30     TIM4_Config();
 103  0008 ad17          	call	_TIM4_Config
 105                     ; 31 }
 108  000a 81            	ret
 132                     ; 38 void CLK_Config(void)
 132                     ; 39 {
 133                     	switch	.text
 134  000b               _CLK_Config:
 138                     ; 42     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 140  000b 4f            	clr	a
 141  000c cd0000        	call	_CLK_HSIPrescalerConfig
 143                     ; 43 }
 146  000f 81            	ret
 181                     ; 50 void delay(__IO uint32_t nTime)
 181                     ; 51 {
 182                     	switch	.text
 183  0010               _delay:
 185       00000000      OFST:	set	0
 188                     ; 52     tmr_delay = nTime;    
 190  0010 1e05          	ldw	x,(OFST+5,sp)
 191  0012 bf02          	ldw	_tmr_delay+2,x
 192  0014 1e03          	ldw	x,(OFST+3,sp)
 193  0016 bf00          	ldw	_tmr_delay,x
 195  0018               L36:
 196                     ; 53     while (tmr_delay);
 198  0018 ae0000        	ldw	x,#_tmr_delay
 199  001b cd0000        	call	c_lzmp
 201  001e 26f8          	jrne	L36
 202                     ; 54 }
 205  0020 81            	ret
 233                     ; 61 void TIM4_Config(void)
 233                     ; 62 {
 234                     	switch	.text
 235  0021               _TIM4_Config:
 239                     ; 73     TIM4_TimeBaseInit(TIM4_PRESCALER_128, TIM4_PERIOD);
 241  0021 ae077c        	ldw	x,#1916
 242  0024 cd0000        	call	_TIM4_TimeBaseInit
 244                     ; 75     TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 246  0027 a601          	ld	a,#1
 247  0029 cd0000        	call	_TIM4_ClearFlag
 249                     ; 77     TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 251  002c ae0101        	ldw	x,#257
 252  002f cd0000        	call	_TIM4_ITConfig
 254                     ; 80     enableInterrupts();
 257  0032 9a            rim
 259                     ; 83     TIM4_Cmd(ENABLE);
 262  0033 a601          	ld	a,#1
 263  0035 cd0000        	call	_TIM4_Cmd
 265                     ; 84 }
 268  0038 81            	ret
 271                     	switch	.ubsct
 272  0000               L77_tpool:
 273  0000 00            	ds.b	1
 313                     ; 86 void task_timer(void)
 313                     ; 87 {
 314                     	switch	.text
 315  0039               _task_timer:
 319                     ; 90     if (tmr_delay)
 321  0039 ae0000        	ldw	x,#_tmr_delay
 322  003c cd0000        	call	c_lzmp
 324  003f 2708          	jreq	L711
 325                     ; 91         tmr_delay--;
 327  0041 ae0000        	ldw	x,#_tmr_delay
 328  0044 a601          	ld	a,#1
 329  0046 cd0000        	call	c_lgsbc
 331  0049               L711:
 332                     ; 93     tmr_led();
 334  0049 cd0000        	call	_tmr_led
 336                     ; 94     tmr_buzzer();
 338  004c cd0000        	call	_tmr_buzzer
 340                     ; 95     tmr_display();
 342  004f cd0000        	call	_tmr_display
 344                     ; 96     tmr_menu();
 346  0052 cd0000        	call	_tmr_menu
 348                     ; 97     tmr_pressure_sensor();
 350  0055 cd0000        	call	_tmr_pressure_sensor
 352                     ; 98     tmr_motor();
 354  0058 cd0000        	call	_tmr_motor
 356                     ; 100     if (++tpool >= TIMER_POOL) {
 358  005b 3c00          	inc	L77_tpool
 359  005d b600          	ld	a,L77_tpool
 360  005f a164          	cp	a,#100
 361  0061 2506          	jrult	L121
 362                     ; 101         tpool = 0;
 364  0063 3f00          	clr	L77_tpool
 365                     ; 102         timer_tick = 1;
 367  0065 35010004      	mov	_timer_tick,#1
 368  0069               L121:
 369                     ; 104 }
 372  0069 81            	ret
 414                     	xdef	_task_timer
 415                     	xdef	_timer_tick
 416                     	switch	.ubsct
 417  0001               _tick:
 418  0001 00            	ds.b	1
 419                     	xdef	_tick
 420                     	xdef	_tmr_delay
 421                     	xref	_tmr_pressure_sensor
 422                     	xref	_tmr_motor
 423                     	xref	_tmr_menu
 424                     	xref	_tmr_display
 425                     	xref	_tmr_buzzer
 426                     	xref	_tmr_led
 427                     	xdef	_TIM4_Config
 428                     	xdef	_CLK_Config
 429                     	xdef	_delay
 430                     	xdef	_pool_tick
 431                     	xdef	_init_timer
 432                     	xref	_TIM4_ClearFlag
 433                     	xref	_TIM4_ITConfig
 434                     	xref	_TIM4_Cmd
 435                     	xref	_TIM4_TimeBaseInit
 436                     	xref	_CLK_HSIPrescalerConfig
 456                     	xref	c_lgsbc
 457                     	xref	c_lzmp
 458                     	end
