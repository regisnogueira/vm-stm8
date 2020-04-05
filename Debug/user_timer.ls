   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  15                     	bsct
  16  0000               _tmr_delay:
  17  0000 00000000      	dc.l	0
  18  0004               _timer_tick:
  19  0004 0001          	dc.w	1
  50                     ; 18 void pool_tick(void)
  50                     ; 19 {
  52                     	switch	.text
  53  0000               _pool_tick:
  57                     ; 20     tick = timer_tick;
  59  0000 be04          	ldw	x,_timer_tick
  60  0002 bf01          	ldw	_tick,x
  61                     ; 21     timer_tick = 0;
  63  0004 5f            	clrw	x
  64  0005 bf04          	ldw	_timer_tick,x
  65                     ; 22 }
  68  0007 81            	ret
  93                     ; 24 void init_timer(void)
  93                     ; 25 {
  94                     	switch	.text
  95  0008               _init_timer:
  99                     ; 26     CLK_Config();    
 101  0008 ad03          	call	_CLK_Config
 103                     ; 27     TIM4_Config();
 105  000a ad17          	call	_TIM4_Config
 107                     ; 28 }
 110  000c 81            	ret
 134                     ; 35 void CLK_Config(void)
 134                     ; 36 {
 135                     	switch	.text
 136  000d               _CLK_Config:
 140                     ; 39     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 142  000d 4f            	clr	a
 143  000e cd0000        	call	_CLK_HSIPrescalerConfig
 145                     ; 40 }
 148  0011 81            	ret
 183                     ; 48 void delay(__IO uint32_t nTime)
 183                     ; 49 {
 184                     	switch	.text
 185  0012               _delay:
 187       00000000      OFST:	set	0
 190                     ; 50     tmr_delay = nTime;    
 192  0012 1e05          	ldw	x,(OFST+5,sp)
 193  0014 bf02          	ldw	_tmr_delay+2,x
 194  0016 1e03          	ldw	x,(OFST+3,sp)
 195  0018 bf00          	ldw	_tmr_delay,x
 197  001a               L36:
 198                     ; 51     while (tmr_delay);
 200  001a ae0000        	ldw	x,#_tmr_delay
 201  001d cd0000        	call	c_lzmp
 203  0020 26f8          	jrne	L36
 204                     ; 52 }
 207  0022 81            	ret
 235                     ; 59 void TIM4_Config(void)
 235                     ; 60 {
 236                     	switch	.text
 237  0023               _TIM4_Config:
 241                     ; 71     TIM4_TimeBaseInit(TIM4_PRESCALER_128, TIM4_PERIOD);
 243  0023 ae077c        	ldw	x,#1916
 244  0026 cd0000        	call	_TIM4_TimeBaseInit
 246                     ; 73     TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 248  0029 a601          	ld	a,#1
 249  002b cd0000        	call	_TIM4_ClearFlag
 251                     ; 75     TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 253  002e ae0101        	ldw	x,#257
 254  0031 cd0000        	call	_TIM4_ITConfig
 256                     ; 78     enableInterrupts();
 259  0034 9a            rim
 261                     ; 81     TIM4_Cmd(ENABLE);
 264  0035 a601          	ld	a,#1
 265  0037 cd0000        	call	_TIM4_Cmd
 267                     ; 82 }
 270  003a 81            	ret
 273                     	switch	.ubsct
 274  0000               L77_tpool:
 275  0000 00            	ds.b	1
 314                     ; 84 void task_timer(void)
 314                     ; 85 {
 315                     	switch	.text
 316  003b               _task_timer:
 320                     ; 88     if (tmr_delay)
 322  003b ae0000        	ldw	x,#_tmr_delay
 323  003e cd0000        	call	c_lzmp
 325  0041 2708          	jreq	L711
 326                     ; 89         tmr_delay--;
 328  0043 ae0000        	ldw	x,#_tmr_delay
 329  0046 a601          	ld	a,#1
 330  0048 cd0000        	call	c_lgsbc
 332  004b               L711:
 333                     ; 90     tmr_led();
 335  004b cd0000        	call	_tmr_led
 337                     ; 91     tmr_buzzer();
 339  004e cd0000        	call	_tmr_buzzer
 341                     ; 92     tmr_display();
 343  0051 cd0000        	call	_tmr_display
 345                     ; 93     tmr_menu();
 347  0054 cd0000        	call	_tmr_menu
 349                     ; 94     tmr_pressure_sensor();
 351  0057 cd0000        	call	_tmr_pressure_sensor
 353                     ; 95     if (++tpool >= 100) {
 355  005a 3c00          	inc	L77_tpool
 356  005c b600          	ld	a,L77_tpool
 357  005e a164          	cp	a,#100
 358  0060 2507          	jrult	L121
 359                     ; 96         tpool = 0;
 361  0062 3f00          	clr	L77_tpool
 362                     ; 97         timer_tick = 1;
 364  0064 ae0001        	ldw	x,#1
 365  0067 bf04          	ldw	_timer_tick,x
 366  0069               L121:
 367                     ; 99 }
 370  0069 81            	ret
 412                     	xdef	_task_timer
 413                     	xdef	_timer_tick
 414                     	switch	.ubsct
 415  0001               _tick:
 416  0001 0000          	ds.b	2
 417                     	xdef	_tick
 418                     	xdef	_tmr_delay
 419                     	xref	_tmr_pressure_sensor
 420                     	xref	_tmr_menu
 421                     	xref	_tmr_display
 422                     	xref	_tmr_buzzer
 423                     	xref	_tmr_led
 424                     	xdef	_TIM4_Config
 425                     	xdef	_CLK_Config
 426                     	xdef	_delay
 427                     	xdef	_pool_tick
 428                     	xdef	_init_timer
 429                     	xref	_TIM4_ClearFlag
 430                     	xref	_TIM4_ITConfig
 431                     	xref	_TIM4_Cmd
 432                     	xref	_TIM4_TimeBaseInit
 433                     	xref	_CLK_HSIPrescalerConfig
 453                     	xref	c_lgsbc
 454                     	xref	c_lzmp
 455                     	end
