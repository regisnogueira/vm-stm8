   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  14                     	bsct
  15  0000               _tmr_delay:
  16  0000 00000000      	dc.l	0
  17  0004               _timer_tick:
  18  0004 01            	dc.b	1
  49                     ; 21 void pool_tick(void)
  49                     ; 22 {
  51                     	switch	.text
  52  0000               _pool_tick:
  56                     ; 23     tick = timer_tick;
  58  0000 450401        	mov	_tick,_timer_tick
  59                     ; 24     timer_tick = 0;
  61  0003 3f04          	clr	_timer_tick
  62                     ; 25 }
  65  0005 81            	ret
  90                     ; 27 void init_timer(void)
  90                     ; 28 {
  91                     	switch	.text
  92  0006               _init_timer:
  96                     ; 29     CLK_Config();    
  98  0006 ad03          	call	_CLK_Config
 100                     ; 30     TIM4_Config();
 102  0008 ad17          	call	_TIM4_Config
 104                     ; 31 }
 107  000a 81            	ret
 131                     ; 38 void CLK_Config(void)
 131                     ; 39 {
 132                     	switch	.text
 133  000b               _CLK_Config:
 137                     ; 42     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 139  000b 4f            	clr	a
 140  000c cd0000        	call	_CLK_HSIPrescalerConfig
 142                     ; 43 }
 145  000f 81            	ret
 180                     ; 50 void delay(__IO uint32_t nTime)
 180                     ; 51 {
 181                     	switch	.text
 182  0010               _delay:
 184       00000000      OFST:	set	0
 187                     ; 52     tmr_delay = nTime;    
 189  0010 1e05          	ldw	x,(OFST+5,sp)
 190  0012 bf02          	ldw	_tmr_delay+2,x
 191  0014 1e03          	ldw	x,(OFST+3,sp)
 192  0016 bf00          	ldw	_tmr_delay,x
 194  0018               L36:
 195                     ; 53     while (tmr_delay);
 197  0018 ae0000        	ldw	x,#_tmr_delay
 198  001b cd0000        	call	c_lzmp
 200  001e 26f8          	jrne	L36
 201                     ; 54 }
 204  0020 81            	ret
 232                     ; 61 void TIM4_Config(void)
 232                     ; 62 {
 233                     	switch	.text
 234  0021               _TIM4_Config:
 238                     ; 73     TIM4_TimeBaseInit(TIM4_PRESCALER_128, TIM4_PERIOD);
 240  0021 ae077c        	ldw	x,#1916
 241  0024 cd0000        	call	_TIM4_TimeBaseInit
 243                     ; 75     TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 245  0027 a601          	ld	a,#1
 246  0029 cd0000        	call	_TIM4_ClearFlag
 248                     ; 77     TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 250  002c ae0101        	ldw	x,#257
 251  002f cd0000        	call	_TIM4_ITConfig
 253                     ; 80     enableInterrupts();
 256  0032 9a            rim
 258                     ; 83     TIM4_Cmd(ENABLE);
 261  0033 a601          	ld	a,#1
 262  0035 cd0000        	call	_TIM4_Cmd
 264                     ; 84 }
 267  0038 81            	ret
 270                     	switch	.ubsct
 271  0000               L77_tpool:
 272  0000 00            	ds.b	1
 312                     ; 86 void task_timer(void)
 312                     ; 87 {
 313                     	switch	.text
 314  0039               _task_timer:
 318                     ; 90     if (tmr_delay)
 320  0039 ae0000        	ldw	x,#_tmr_delay
 321  003c cd0000        	call	c_lzmp
 323  003f 2708          	jreq	L711
 324                     ; 91         tmr_delay--;
 326  0041 ae0000        	ldw	x,#_tmr_delay
 327  0044 a601          	ld	a,#1
 328  0046 cd0000        	call	c_lgsbc
 330  0049               L711:
 331                     ; 93     tmr_led();
 333  0049 cd0000        	call	_tmr_led
 335                     ; 94     tmr_buzzer();
 337  004c cd0000        	call	_tmr_buzzer
 339                     ; 95     tmr_display();
 341  004f cd0000        	call	_tmr_display
 343                     ; 96     tmr_menu();
 345  0052 cd0000        	call	_tmr_menu
 347                     ; 97     tmr_pressure_sensor();
 349  0055 cd0000        	call	_tmr_pressure_sensor
 351                     ; 98     tmr_motor();
 353  0058 cd0000        	call	_tmr_motor
 355                     ; 100     if (++tpool >= TIMER_POOL) {
 357  005b 3c00          	inc	L77_tpool
 358  005d b600          	ld	a,L77_tpool
 359  005f a164          	cp	a,#100
 360  0061 2506          	jrult	L121
 361                     ; 101         tpool = 0;
 363  0063 3f00          	clr	L77_tpool
 364                     ; 102         timer_tick = 1;
 366  0065 35010004      	mov	_timer_tick,#1
 367  0069               L121:
 368                     ; 104 }
 371  0069 81            	ret
 413                     	xdef	_task_timer
 414                     	xdef	_timer_tick
 415                     	switch	.ubsct
 416  0001               _tick:
 417  0001 00            	ds.b	1
 418                     	xdef	_tick
 419                     	xdef	_tmr_delay
 420                     	xref	_tmr_pressure_sensor
 421                     	xref	_tmr_motor
 422                     	xref	_tmr_menu
 423                     	xref	_tmr_display
 424                     	xref	_tmr_buzzer
 425                     	xref	_tmr_led
 426                     	xdef	_TIM4_Config
 427                     	xdef	_CLK_Config
 428                     	xdef	_delay
 429                     	xdef	_pool_tick
 430                     	xdef	_init_timer
 431                     	xref	_TIM4_ClearFlag
 432                     	xref	_TIM4_ITConfig
 433                     	xref	_TIM4_Cmd
 434                     	xref	_TIM4_TimeBaseInit
 435                     	xref	_CLK_HSIPrescalerConfig
 455                     	xref	c_lgsbc
 456                     	xref	c_lzmp
 457                     	end
