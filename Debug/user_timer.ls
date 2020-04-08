   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  19                     	bsct
  20  0000               _tmr_delay:
  21  0000 00000000      	dc.l	0
  22  0004               _timer_tick:
  23  0004 01            	dc.b	1
  54                     ; 21 void pool_tick(void)
  54                     ; 22 {
  56                     	switch	.text
  57  0000               _pool_tick:
  61                     ; 23     tick = timer_tick;
  63  0000 450401        	mov	_tick,_timer_tick
  64                     ; 24     timer_tick = 0;
  66  0003 3f04          	clr	_timer_tick
  67                     ; 25 }
  70  0005 81            	ret	
  95                     ; 27 void init_timer(void)
  95                     ; 28 {
  96                     	switch	.text
  97  0006               _init_timer:
 101                     ; 29     CLK_Config();    
 103  0006 ad02          	call	_CLK_Config
 105                     ; 30     TIM4_Config();
 108                     ; 31 }
 111  0008 2015          	jp	_TIM4_Config
 135                     ; 38 void CLK_Config(void)
 135                     ; 39 {
 136                     	switch	.text
 137  000a               _CLK_Config:
 141                     ; 42     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 143  000a 4f            	clr	a
 145                     ; 43 }
 148  000b cc0000        	jp	_CLK_HSIPrescalerConfig
 183                     ; 50 void delay(__IO uint32_t nTime)
 183                     ; 51 {
 184                     	switch	.text
 185  000e               _delay:
 187       00000000      OFST:	set	0
 190                     ; 52     tmr_delay = nTime;    
 192  000e 1e05          	ldw	x,(OFST+5,sp)
 193  0010 bf02          	ldw	_tmr_delay+2,x
 194  0012 1e03          	ldw	x,(OFST+3,sp)
 195  0014 bf00          	ldw	_tmr_delay,x
 197  0016 ae0000        	ldw	x,#_tmr_delay
 198  0019               L36:
 199                     ; 53     while (tmr_delay);
 201  0019 cd0000        	call	c_lzmp
 203  001c 26fb          	jrne	L36
 204                     ; 54 }
 207  001e 81            	ret	
 235                     ; 61 void TIM4_Config(void)
 235                     ; 62 {
 236                     	switch	.text
 237  001f               _TIM4_Config:
 241                     ; 73     TIM4_TimeBaseInit(TIM4_PRESCALER_128, TIM4_PERIOD);
 243  001f ae077c        	ldw	x,#1916
 244  0022 cd0000        	call	_TIM4_TimeBaseInit
 246                     ; 75     TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 248  0025 a601          	ld	a,#1
 249  0027 cd0000        	call	_TIM4_ClearFlag
 251                     ; 77     TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 253  002a ae0101        	ldw	x,#257
 254  002d cd0000        	call	_TIM4_ITConfig
 256                     ; 80     enableInterrupts();
 259  0030 9a            	rim	
 261                     ; 83     TIM4_Cmd(ENABLE);
 264  0031 a601          	ld	a,#1
 266                     ; 84 }
 269  0033 cc0000        	jp	_TIM4_Cmd
 272                     	switch	.ubsct
 273  0000               L77_tpool:
 274  0000 00            	ds.b	1
 314                     ; 86 void task_timer(void)
 314                     ; 87 {
 315                     	switch	.text
 316  0036               _task_timer:
 320                     ; 90     if (tmr_delay)
 322  0036 ae0000        	ldw	x,#_tmr_delay
 323  0039 cd0000        	call	c_lzmp
 325  003c 2705          	jreq	L711
 326                     ; 91         tmr_delay--;
 328  003e a601          	ld	a,#1
 329  0040 cd0000        	call	c_lgsbc
 331  0043               L711:
 332                     ; 93     tmr_led();
 334  0043 cd0000        	call	_tmr_led
 336                     ; 94     tmr_buzzer();
 338  0046 cd0000        	call	_tmr_buzzer
 340                     ; 95     tmr_display();
 342  0049 cd0000        	call	_tmr_display
 344                     ; 96     tmr_menu();
 346  004c cd0000        	call	_tmr_menu
 348                     ; 97     tmr_pressure_sensor();
 350  004f cd0000        	call	_tmr_pressure_sensor
 352                     ; 98     tmr_motor();
 354  0052 cd0000        	call	_tmr_motor
 356                     ; 100     if (++tpool >= TIMER_POOL) {
 358  0055 3c00          	inc	L77_tpool
 359  0057 b600          	ld	a,L77_tpool
 360  0059 a164          	cp	a,#100
 361  005b 2506          	jrult	L121
 362                     ; 101         tpool = 0;
 364  005d 3f00          	clr	L77_tpool
 365                     ; 102         timer_tick = 1;
 367  005f 35010004      	mov	_timer_tick,#1
 368  0063               L121:
 369                     ; 104 }
 372  0063 81            	ret	
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
